#!/bin/bash

# Leetspeak Simple für Termux mit Groß-/Kleinschreibung
# Encoder und Decoder in einem

# Farben für die Ausgabe
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Encoder-Funktion mit Groß-/Kleinschreibung
encode_text() {
    local text="$1"
    # Zuerst Kleinbuchstaben ersetzen
    text=$(echo "$text" | sed \
        -e 's/a/4/g' \
        -e 's/e/3/g' \
        -e 's/l/1/g' \
        -e 's/o/0/g' \
        -e 's/t/7/g' \
        -e 's/s/5/g' \
        -e 's/z/2/g' \
        -e 's/h/#/g' \
        -e 's/i/!/g' \
        -e 's/g/6/g' \
        -e 's/q/9/g' \
        -e 's/c/(/g' \
        -e 's/x/*/g')
    
    # Dann Großbuchstaben ersetzen
    text=$(echo "$text" | sed \
        -e 's/A/4/g' \
        -e 's/E/3/g' \
        -e 's/L/1/g' \
        -e 's/O/0/g' \
        -e 's/T/7/g' \
        -e 's/S/5/g' \
        -e 's/Z/2/g' \
        -e 's/H/#/g' \
        -e 's/I/!/g' \
        -e 's/G/6/g' \
        -e 's/Q/9/g' \
        -e 's/C/(/g' \
        -e 's/X/*/g')
    
    echo "$text"
}

# Decoder-Funktion mit Groß-/Kleinschreibung
decode_text() {
    local text="$1"
    # Leetspeak zu Kleinbuchstaben
    text=$(echo "$text" | sed \
        -e 's/4/a/g' \
        -e 's/3/e/g' \
        -e 's/1/l/g' \
        -e 's/0/o/g' \
        -e 's/7/t/g' \
        -e 's/5/s/g' \
        -e 's/2/z/g' \
        -e 's/#/h/g' \
        -e 's/!/i/g' \
        -e 's/6/g/g' \
        -e 's/9/q/g' \
        -e 's/(/c/g' \
        -e 's/*/x/g')
    
    # Leetspeak zu Großbuchstaben
    text=$(echo "$text" | sed \
        -e 's/4/A/g' \
        -e 's/3/E/g' \
        -e 's/1/L/g' \
        -e 's/0/O/g' \
        -e 's/7/T/g' \
        -e 's/5/S/g' \
        -e 's/2/Z/g' \
        -e 's/#/H/g' \
        -e 's/!/I/g' \
        -e 's/6/G/g' \
        -e 's/9/Q/g' \
        -e 's/(/C/g' \
        -e 's/*/X/g')
    
    echo "$text"
}

show_header() {
    clear
    echo -e "${GREEN}"
    echo "╔══════════════════════════════════╗"
    echo "║     LEETSPEAK CONVERTER         ║"
    echo "║  mit Groß-/Kleinschreibung      ║"
    echo "╚══════════════════════════════════╝"
    echo -e "${NC}"
}

# Hauptmenü
while true; do
    show_header
    echo -e "${YELLOW}Wähle einen Modus:${NC}"
    echo "1) Text zu Leetspeak kodieren"
    echo "2) Leetspeak zu Text dekodieren"
    echo "3) Beenden"
    echo
    echo -e "${BLUE}Leetspeak-Tabelle:${NC}"
    echo "a/A=4  e/E=3  l/L=1  o/O=0  t/T=7"
    echo "s/S=5  z/Z=2  h/H=#  i/I=!  g/G=6"
    echo "q/Q=9  c/C=(  x/X=*"
    echo
    read -p "Auswahl (1-3): " choice
    
    case $choice in
        1)
            while true; do
                show_header
                echo -e "${BLUE}===== KODIERMODUS =====${NC}"
                echo "Gib Text ein (leere Zeile für Menü):"
                echo
                read -r input
                
                if [ -z "$input" ]; then
                    break
                fi
                
                result=$(encode_text "$input")
                echo -e "${GREEN}Kodiert: $result${NC}"
                echo
                read -p "Drücke Enter für nächste Eingabe..."
            done
            ;;
        2)
            while true; do
                show_header
                echo -e "${BLUE}===== DEKODIERMODUS =====${NC}"
                echo "Gib Leetspeak ein (leere Zeile für Menü):"
                echo
                read -r input
                
                if [ -z "$input" ]; then
                    break
                fi
                
                result=$(decode_text "$input")
                echo -e "${GREEN}Dekodiert: $result${NC}"
                echo
                read -p "Drücke Enter für nächste Eingabe..."
            done
            ;;
        3)
            echo -e "${YELLOW}Auf Wiedersehen!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Ungültige Auswahl!${NC}"
            sleep 2
            ;;
    esac
done