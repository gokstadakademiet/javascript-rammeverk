#!/bin/bash

CURRENT_DIR="$(dirname "$0")"
SOURCE_DIR="$CURRENT_DIR/md/veiledet-oppgave" 
TARGET_FILE="ukesoppgaver.md"

echo "Generating markdown file from files in $SOURCE_DIR"

echo "# Oppgavesett: Interaktiv Online CV Webapplikasjon: Debugging & Testing" > "$TARGET_FILE"

echo "# Innholdsfortegnelse

1. [Innføring i \`Jest\` og \`Debugging\` teknikker](#innføring-i-jest-og-debugging-teknikker)
    - [Oppgave 1: Basic Logging](#oppgave-1-basic-logging)
    - [Oppgave 2: Jest Grunnleggende - Testing av Funksjoner](#oppgave-2-jest-grunnleggende---testing-av-funksjoner)
    - [Oppgave 3: Testing av Data Manipulering](#oppgave-3-testing-av-data-manipulering)
    - [Oppgave 4: Testing av UI-komponenter med Jest](#oppgave-4-testing-av-ui-komponenter-med-jest)
    - [Oppgave 5: Feilsøking av Kode](#oppgave-5-feilsøking-av-kode)
    - [Oppgave 6: Snapshot Testing](#oppgave-6-snapshot-testing)
2. [Innføring i \`PropTypes\` & \`TypeScript\`](#innføring-i-proptypes--typescript)
    - [Oppgave 1: Intro til PropTypes](#oppgave-1-intro-til-proptypes)
    - [Oppgave 2: Integrering av TypeScript i et eksisterende React-prosjekt](#oppgave-2-integrering-av-typescript-i-et-eksisterende-react-prosjekt)
    - [Oppgave 3: Feilsøking i React-komponenter](#oppgave-3-feilsøking-i-react-komponenter)
    - [Oppgave 4: Feilsøking i TypeScript](#oppgave-4-feilsøking-i-typescript)
    - [Oppgave 5: Bruk av Type Assertions](#oppgave-5-bruk-av-type-assertions)
    - [Oppgave 6: Union Typer og Literal Typer](#oppgave-6-union-typer-og-literal-typer)
    - [Oppgave 7: Generiske Typer](#oppgave-7-generiske-typer)
" >> "$TARGET_FILE"

for md_file in $(ls "$SOURCE_DIR"/*.md | sort); do
    sed 's/^[[:space:]]*>/>/' "$md_file" >> "$TARGET_FILE"
    echo -e "\n\n" >> "$TARGET_FILE"
done
