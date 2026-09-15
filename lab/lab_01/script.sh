#!/usr/bin/env bash
DIR="data_analysis"

echo "-----------------------------------"

echo "1. Ensuring data_analysis directory exists..."
mkdir -p "$DIR"

echo "2. Creating research_themes.txt..."


echo "3. Creating medium_groups.txt..."
cut -d',' -f3 faculty.csv | tr '+' '\n' | sed 's/^ *//; s/ *$//' | \
sort | uniq -c | awk '$1 >= 6 && $1 <= 10 {print $2}' > "$DIR/medium_groups.txt"


echo "4. Creating joined.csv..."
grep -E 'Computer Security|Philosophy|Biomedicine' faculty.csv | \
cut -d',' -f1,2 > "$DIR/joined.csv"

echo "5. Creating sorted_names.txt..."
cut -d',' -f1 faculty.csv | sort | nl > "$DIR/sorted_names.txt"
