#!/usr/bin/env bash
DIR="data_analysis"
INPUT="faculty.csv"

TRIM_SPACE='s/^[[:space:]]*//; s/[[:space:]]*$//'

themes() {
    cut -d',' -f3 "$INPUT" | tr '+' '\n' | sed "$TRIM_SPACE" | grep -v '^$'
}

names() {
    cut -d',' -f1 "$INPUT" | sed "$TRIM_SPACE" | grep -v '^$'
}

echo "-----------------------------------"
echo "1. Ensuring data_analysis directory exists..."
rm -rf "$DIR" && mkdir "$DIR"

echo "2. Creating research_themes.txt..."
themes | sort -u > "$DIR/research_themes.txt"
wc -l < "$DIR/research_themes.txt" >> "$DIR/research_themes.txt"

echo "3. Creating medium_groups.txt..."
themes | sort | uniq -c | awk '$1 > 6 && $1 < 10 { $1 = ""; print }' | sed 's/^ //' > "$DIR/medium_groups.txt"

echo "4. Creating joined.csv..."
grep 'Computer Security' "$INPUT" | grep 'Philosophy' | grep 'Biomedicine' > "$DIR/joined.csv"

echo "5. Creating sorted_names.txt..."
names | sort -k 2,2 -k 1,1 > "$DIR/sorted_names.txt"

echo "-----------------------------------"
echo "Done"
