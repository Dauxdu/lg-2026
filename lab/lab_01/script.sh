#!/usr/bin/env bash
echo "-----------------------------------"

echo "1. Ensuring analysis directory exists..."
mkdir -p analysis

echo "2. Creating big_groups.txt..."
cut -d',' -f3 faculty.csv | tr '+' '\n' | sed 's/^ *//; s/ *$//' | \
sort | uniq -c | awk '$1 > 10 {print $2}' > analysis/big_groups.txt

echo "3. Creating ai_cs_join.csv..."
grep 'Artificial Intelligence'  faculty.csv | grep 'Computer Systems' | \
cut -d',' -f1,2 > analysis/ai_cs_join.csv

echo "4. Creating sorted_names.txt..."
cut -d',' -f1 faculty.csv | sort | nl > analysis/sorted_names.txt
