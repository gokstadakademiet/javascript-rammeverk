#!/bin/bash

CURRENT_DIR="$(dirname "$0")"
SOURCE_DIR="$CURRENT_DIR/md/veiledet-oppgave" 
TARGET_FILE="ukesoppgaver.md"

echo "Generating markdown file from files in $SOURCE_DIR"

echo "# Oppgavesett: Interaktiv Online CV Webapplikasjon" > "$TARGET_FILE"

echo "# Innholdsfortegnelse

1. [Oppgavesett: Interaktiv Online CV Webapplikasjon](#oppgavesett-interaktiv-online-cv-webapplikasjon)
    1. [Introduksjon til \`useEffect\`](#introduksjon-til-useeffect)
        1. [Oppgave 1: Enkel sideinnlasting](#oppgave-1-enkel-sideinnlasting)
        2. [Oppgave 2: Sporing av visninger](#oppgave-2-sporing-av-visninger)
        3. [Oppgave 3: \`StrictMode\` og \`useEffect\`](#oppgave-3-strictmode-og-useeffect)
        4. [Oppgave 4: Overvåkning av endringer](#oppgave-4-overvåkning-av-endringer)
        5. [Oppgave 5: Dynamisk tittel](#oppgave-5-dynamisk-tittel)
        6. [Oppgave 6: API-kall ved lasting](#oppgave-6-api-kall-ved-lasting)
        7. [Oppgave 7: Avhengigheter i \`useEffect\`](#oppgave-7-avhengigheter-i-useeffect)
        8. [Oppgave 8: Avhengigheter med komplekse objekter](#oppgave-8-avhengigheter-med-komplekse-objekter)
        9. [Oppgave 9: Avhengigheter med flere effekter](#oppgave-9-avhengigheter-med-flere-effekter)
2. [Feilsøkingsoppgaver](#feilsøkingsoppgaver)
    1. [Feilsøkingsoppgave 1](#feilsøkingsoppgave-1)
    2. [Feilsøkingsoppgave 2](#feilsøkingsoppgave-2)
    3. [Feilsøkingsoppgave 3](#feilsøkingsoppgave-3)
    4. [Feilsøkingsoppgave 4](#feilsøkingsoppgave-4)
    5. [Feilsøkingsoppgave 5](#feilsøkingsoppgave-5)
    6. [Feilsøkingsoppgave 6](#feilsøkingsoppgave-6)
3. [Utfordringsoppgaver](#utfordringsoppgaver)
    1. [Oppgave 1: Tidsbasert oppdatering](#oppgave-1-tidsbasert-oppdatering)
    2. [Oppgave 2: Formhåndtering](#oppgave-2-formhåndtering)
    3. [Oppgave 3: Avbryte API-kall](#oppgave-3-avbryte-api-kall)
    4. [Oppgave 4: Debouncing med \`useEffect\`](#oppgave-4-debouncing-med-useeffect)
    5. [Oppgave 5: Dynamisk bakgrunnsfarge](#oppgave-5-dynamisk-bakgrunnsfarge)
    6. [Oppgave 6: Synkronisere tilstand med URL-parametere](#oppgave-6-synkronisere-tilstand-med-url-parametere)
" >> "$TARGET_FILE"

for md_file in $(ls "$SOURCE_DIR"/*.md | sort); do
    sed 's/^[[:space:]]*>/>/' "$md_file" >> "$TARGET_FILE"
    # echo "\n\n" >> "$TARGET_FILE"
done