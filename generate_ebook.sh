#!/bin/bash
set -e
set -o pipefail

# --- Configuration ---
# This script generates EPUB and PDF files from a collection of markdown files
# in a Grav CMS structure.
#
# To use this script:
# 1. Make sure you have pandoc and a LaTeX distribution installed.
#    On Debian/Ubuntu: sudo apt-get install pandoc texlive-latex-base texlive-latex-extra texlive-xetex
# 2. Run this script from the root of your repository: ./generate_ebook.sh
#
# The script will create an 'output' directory with 'fbr.epub' and 'fbr.pdf'.

# The directory where the markdown pages are located.
PAGES_DIR="sites/is.efeefe.me/pages/03.stuff/fbr"
# The directory where the final EPUB and PDF files will be saved.
OUT_DIR="output"
# The name of the combined markdown file that will be generated.
COMBINED_MD="combined.md"
# The name of the metadata file used by pandoc.
METADATA_FILE="metadata.yml"

# --- Script ---

# Create the output directory if it doesn't exist.
mkdir -p "$OUT_DIR"

# Create a metadata file for pandoc. This will be used to set the title
# and author of the generated EPUB and PDF files.
cat > "$METADATA_FILE" << EOL
---
title: 'Future Beyond Repair'
author: 'Felipe Schmidt Fonseca'
---
EOL

# Use a temporary file to build the content to avoid issues with pipes.
TMP_COMBINED_MD=$(mktemp)

# Add the metadata to the top of the temporary file.
cat "$METADATA_FILE" > "$TMP_COMBINED_MD"
echo "" >> "$TMP_COMBINED_MD"

# Find all item.md files, sort them, and process them one by one.
find "$PAGES_DIR" -type f -name "item.md" | sort | while read -r filepath; do
    dir=$(dirname "$filepath")

    # Process each file inside a subshell and append to the temporary file.
    (
        # Extract the title from the frontmatter. If no title is found,
        # use "Untitled". The '|| true' prevents the script from exiting if grep
        # doesn't find a match.
        title_line=$(grep -m 1 "^title:" "$filepath" || true)
        if [ -n "$title_line" ]; then
            title=$(echo "$title_line" | sed 's/^title: //;s/\"//g;s/'"'"'//g')
        else
            title="Untitled"
        fi
        echo -e "\n# $title\n"

        # Extract the hero image from the frontmatter, if it exists.
        hero_image_line=$(grep -m 1 "^hero_image:" "$filepath" || true)
        if [ -n "$hero_image_line" ]; then
            hero_image=$(echo "$hero_image_line" | sed 's/^hero_image: //')
            # Remove any query strings from the image path (e.g., ?lightbox=1024)
            hero_image_clean=$(echo "$hero_image" | cut -d'?' -f1)
            echo -e "![Hero Image]($dir/$hero_image_clean)\n"
        fi

        # Process the content of the markdown file.
        sed '1,/^---$/d' "$filepath" |
        # Fix relative image paths. This perl command finds all markdown image
        # links that are not absolute URLs and prepends the directory path.
        perl -pe 's#!\[(.*?)\]\((?!https?://|/)(.*?)\)#!\[\1\]('"$dir"'/\2)!#g' |
        # Remove query strings from any other image paths in the content.
        perl -pe 's/(\.(?:jpg|png|gif|jpeg|mp4))\?[^)]+/\1/g'

        # Add a page break for PDF output.
        echo -e '\n\\newpage\n'
    ) >> "$TMP_COMBINED_MD"
done

# Move the completed temporary file to its final destination.
mv "$TMP_COMBINED_MD" "$COMBINED_MD"

# Set the file permissions to be readable by all users.
chmod 644 "$COMBINED_MD"

echo "Combined markdown file created at $COMBINED_MD"

# Generate the EPUB and PDF files using pandoc.
echo "Generating EPUB file..."
pandoc "$COMBINED_MD" -o "$OUT_DIR/fbr.epub"

echo "Generating PDF file..."
pandoc "$COMBINED_MD" --pdf-engine=xelatex -o "$OUT_DIR/fbr.pdf"

echo "EPUB and PDF files created in the '$OUT_DIR' directory."