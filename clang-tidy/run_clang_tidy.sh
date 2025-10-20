#!/usr/bin/bash
# Skripta za pokretanje Clang-Tidy analize projekta MatfTunes

set -e

echo "Pokrećem Clang-Tidy analizu projekta MatfTunes..."

PROJECT_DIR="../matftunes/MatfTunes/src"
BUILD_DIR="./build"
REPORT_DIR="./results"

mkdir -p "$BUILD_DIR"
mkdir -p "$REPORT_DIR"

# Ako nema CMake build fajlova, generiši ih
if [ ! -f "$BUILD_DIR/compile_commands.json" ]; then
  echo "Generišem compile_commands.json..."
  cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -S "$PROJECT_DIR/.." -B "$BUILD_DIR"
  cp "$BUILD_DIR/compile_commands.json" "$PROJECT_DIR/"
fi

# Pokreni Clang-Tidy na celom src direktorijumu
clang-tidy "$PROJECT_DIR"/*.cpp \
  --warnings-as-errors=* \
  --export-fixes="$REPORT_DIR/clang_tidy_fixes.yaml" \
  -p "$BUILD_DIR" > "$REPORT_DIR/clang_tidy_report.txt" 2>&1 || true

echo "Analiza završena."
echo "Rezultati su u folderu: $REPORT_DIR/"

