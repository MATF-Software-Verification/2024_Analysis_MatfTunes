#!/usr/bin/bash
# Skripta za pokretanje Cppcheck statičke analize MatfTunes projekta

set -e

echo "Pokrećem Cppcheck analizu projekta MatfTunes..."

PROJECT_DIR="../matftunes/MatfTunes/src"
REPORT_DIR="./results"
BUILD_DIR="./cppcheck_build"
HTML_DIR="./html-report"

# Kreiraj potrebne foldere
mkdir -p "$REPORT_DIR"
mkdir -p "$BUILD_DIR"
mkdir -p "$HTML_DIR"

TIMESTAMP=$(date +%Y-%m-%d_%H-%M)
OUTPUT_FILE_TXT="$REPORT_DIR/cppcheck_${TIMESTAMP}.txt"
OUTPUT_FILE_XML="$REPORT_DIR/cppcheck_${TIMESTAMP}.xml"

# Pokretanje Cppcheck sa punim proverama
cppcheck --enable=all --inconclusive --std=c++17 --force \
  --cppcheck-build-dir="$BUILD_DIR" "$PROJECT_DIR" 2>"$OUTPUT_FILE_TXT"

echo "Generisan TXT izveštaj: $OUTPUT_FILE_TXT"

# Generiši i XML fajl (za HTML izveštaj)
cppcheck --enable=all --inconclusive --std=c++17 --force \
  --cppcheck-build-dir="$BUILD_DIR" --xml "$PROJECT_DIR" 2>"$OUTPUT_FILE_XML"

echo "Generisan XML izveštaj: $OUTPUT_FILE_XML"

# Generiši HTML izveštaj
cppcheck-htmlreport --file="$OUTPUT_FILE_XML" --report-dir="$HTML_DIR"
echo "Generisan HTML izveštaj: $HTML_DIR/index.html"

# Automatsko otvaranje izveštaja
if command -v firefox >/dev/null; then
  firefox "$HTML_DIR/index.html" &
fi

echo "Analiza završena. Rezultati su u: $REPORT_DIR/"


