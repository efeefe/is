#!/bin/bash

# Setup a temporary location for the test
TMP_DIR="/tmp/grav-test"
rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR"

# Download and setup Grav
wget https://getgrav.org/download/core/grav/latest -O grav.zip
unzip -q grav.zip
mv grav grav-app
cd grav-app

# Copy site contents
rm -rf user
cp -r /app/sites/is.efeefe.me user

# Fix autoloaders for test (simulating CI)
rm -f user/plugins/tntsearch/vendor/composer/platform_check.php || true
rm -f user/plugins/tntsearch/vendor/composer/autoload_real.php || true

for plugin in user/plugins/*; do
    if [ -d "$plugin/vendor" ]; then
        plugin_name=$(basename "$plugin")
        rm -rf "$plugin"
        echo "y" | bin/gpm install "$plugin_name" || true
    fi
done

# Install Blackhole
echo "y" | bin/gpm install blackhole

# Create dependencies workaround
touch user/.dependencies
bin/grav install || true

# Generate site
php -S localhost:8000 system/router.php > /dev/null 2>&1 &
sleep 5
bin/plugin blackhole generate http://localhost:8000 --output-path=../public --assets

# Check output
kill $(lsof -t -i :8000) 2>/dev/null || true
echo "Generated files:"
ls -la ../public
