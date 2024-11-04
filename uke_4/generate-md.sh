#!/bin/bash

CURRENT_DIR="$(dirname "$0")"
SOURCE_DIR="$CURRENT_DIR/md/veiledet-oppgave" 
TARGET_FILE="ukesoppgaver.md"

echo "Generating markdown file from files in $SOURCE_DIR"

echo "# Oppgavesett: Interaktiv Online CV Webapplikasjon: Debugging & Testing" > "$TARGET_FILE"

echo "# Innholdsfortegnelse 

" >> "$TARGET_FILE"


for md_file in $(ls "$SOURCE_DIR"/*.md | sort); do
    sed 's/^[[:space:]]*>/>/' "$md_file" >> "$TARGET_FILE"
    echo -e "\n\n" >> "$TARGET_FILE"
done
