#!/usr/bin/bash
# Massif skripta

set -e
echo "Pokrecem Valgrind Massif na MatfTunes..."

PROJECT_PATH="../../matftunes/MatfTunes/build/Desktop-Debug/MatfTunes"
OUTPUT_DIR="./results"
mkdir -p "$OUTPUT_DIR"

TIMESTAMP=$(date +%Y-%m-%d_%H-%M)
OUTPUT_FILE="$OUTPUT_DIR/massif_${TIMESTAMP}.out"

# Run Valgrind Massif
valgrind --tool=massif --time-unit=B --stacks=yes \
         --massif-out-file="$OUTPUT_FILE" "$PROJECT_PATH"

echo "Analiza zavrsena. Rezultati: $OUTPUT_FILE"
echo "Za vizualizaciju:"
echo "   ms_print $OUTPUT_FILE | less"

