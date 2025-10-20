#!/usr/bin/bash

# Script for running Valgrind Memcheck analysis on MatfTunes project

set -e
echo "Pokrecem Valgrind Memcheck na MatfTunes..."

PROJECT_PATH="../../matftunes/MatfTunes/build/Desktop-Debug/MatfTunes"
OUTPUT_DIR="./results"
mkdir -p "$OUTPUT_DIR"

TIMESTAMP=$(date +%Y-%m-%d_%H-%M)
LOG_FILE="$OUTPUT_DIR/memcheck_${TIMESTAMP}.log"

# Runujem Valgrind sa detailed leak i invalid memory access proverom
valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all \
         --track-origins=yes --verbose \
         --log-file="$LOG_FILE" "$PROJECT_PATH"

echo "Analiza gotova. Log sacuvan: $LOG_FILE"

