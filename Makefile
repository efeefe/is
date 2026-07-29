.PHONY: setup serve build deploy clean publish

GRAV_LOCAL_DIR = .grav-local
PORT = 8000
SITE_NAME = is.efeefe.me

setup:
	@echo "Setting up local Grav environment..."
	@mkdir -p $(GRAV_LOCAL_DIR)
	@if [ ! -f $(GRAV_LOCAL_DIR)/index.php ]; then \
		echo "Downloading Grav core (v1.7.46)..."; \
		wget https://github.com/getgrav/grav/releases/download/1.7.46/grav-v1.7.46.zip -O grav.zip; \
		unzip -q grav.zip; \
		rm -rf $(GRAV_LOCAL_DIR); \
		mv grav $(GRAV_LOCAL_DIR); \
		rm grav.zip; \
	fi
	@echo "Symlinking user directory..."
	@rm -rf $(GRAV_LOCAL_DIR)/user
	@ln -sf ../sites/$(SITE_NAME) $(GRAV_LOCAL_DIR)/user
	@echo "Creating dependencies bypass file..."
	@touch $(GRAV_LOCAL_DIR)/user/.dependencies
	@echo "Fixing platform check files and autoloader..."
	@rm -f $(GRAV_LOCAL_DIR)/user/plugins/tntsearch/vendor/composer/platform_check.php || true
	@rm -f $(GRAV_LOCAL_DIR)/user/plugins/tntsearch/vendor/composer/autoload_real.php || true
	@echo "Installing blackhole plugin for SSG generation..."
	@cd $(GRAV_LOCAL_DIR) && echo "y" | bin/gpm install blackhole || true
	@echo "Reinstalling form and login plugins to restore vendor files..."
	@cd $(GRAV_LOCAL_DIR) && echo "y" | bin/gpm install form --force || true
	@cd $(GRAV_LOCAL_DIR) && echo "y" | bin/gpm install login --force || true
	@echo "Running bin/grav install..."
	@cd $(GRAV_LOCAL_DIR) && bin/grav install || true
	@echo "Checking/creating local admin user..."
	@if [ ! -d $(GRAV_LOCAL_DIR)/user/accounts ] || [ -z "$$(ls -A $(GRAV_LOCAL_DIR)/user/accounts 2>/dev/null)" ]; then \
		echo "Creating default admin user (admin / SecurePassword123)..."; \
		cd $(GRAV_LOCAL_DIR) && echo "en" | bin/plugin login new-user -u admin -p SecurePassword123 -e admin@example.com -P b -N "Admin" -t "Admin" || true; \
	fi
	@echo "Setup complete! Run 'make serve' to start Grav locally."

serve:
	@echo "Starting local Grav server at http://localhost:$(PORT)..."
	@cd $(GRAV_LOCAL_DIR) && php -S localhost:$(PORT) system/router.php

build:
	@echo "Building static site into _site/..."
	@rm -rf _site
	@cd $(GRAV_LOCAL_DIR) && \
	(php -S localhost:$(PORT) system/router.php > /dev/null 2>&1 & \
	PID=$$!; \
	echo "Waiting for PHP server to start (PID: $$PID)..."; \
	sleep 4; \
	bin/plugin blackhole generate http://localhost:$(PORT) --output-path=../_site --assets; \
	STATUS=$$?; \
	echo "Stopping PHP server (PID: $$PID)..."; \
	kill $$PID; \
	exit $$STATUS)
	@echo "Static build complete in _site/ directory."

deploy: build
	@echo "Deploying to GitHub Pages..."
	@./bin/deploy-static.sh

publish:
	@echo "Staging modifications in sites/is.efeefe.me/..."
	git add sites/is.efeefe.me/
	@read -p "Enter commit message: " msg; \
	if [ -z "$$msg" ]; then msg="Update content"; fi; \
	git commit -m "$$msg"
	@echo "Pushing to GitHub master branch..."
	git push origin master
	@echo "Push complete! GitHub Actions will now build and deploy the static site."

clean:
	@echo "Cleaning up generated static files..."
	@rm -rf _site
