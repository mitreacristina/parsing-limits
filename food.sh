# food.sh - Homework 2 and 3, Part III: Food.csv with bash
# Run: bash food.sh > food_results.txt

# A) header with my letter
echo "# A) FOOD.CSV - letter m"

# B) number of lines in the file, then number of foods.
# Every food has exactly one public_id (FOOD + 5 digits); grep -o prints each
# match on its own line, so counting the matches counts the foods.
echo "# B) LINES IN THE FILE / FOODS"
wc -l < data/Food.csv
grep -o 'FOOD[0-9]\{5\}' data/Food.csv | wc -l

# C) top 5 food groups using cut on the comma (column 12), header skipped.
# Commas inside quoted values and descriptions spread over several lines
# shift the columns, so this result is expected to be wrong.
echo "# C) TOP 5 FOOD GROUPS - cut"
tail -n +2 data/Food.csv | cut -d, -f12 | sort | uniq -c | sort -nr | head -5

# D) same question after removing quoted text:
#   tr joins all lines into one (newline -> ~), sed deletes every "..." value,
#   tr splits the text back into lines (~ -> newline).
echo "# D) TOP 5 FOOD GROUPS - AFTER REMOVING QUOTED TEXT"
tr "\n" "~" < data/Food.csv | sed 's/"[^"]*"//g' | tr "~" "\n" | tail -n +2 | cut -d, -f12 | sort | uniq -c | sort -nr | head -5

# E) on the cleaned text: foods whose name (column 2) starts with my letter
# (grep -i: upper or lower case), then their top 5 food groups (column 12).
echo "# E) FOODS STARTING WITH m: COUNT AND TOP 5 FOOD GROUPS"
tr "\n" "~" < data/Food.csv | sed 's/"[^"]*"//g' | tr "~" "\n" | tail -n +2 | cut -d, -f2 | grep -ic "^m"
tr "\n" "~" < data/Food.csv | sed 's/"[^"]*"//g' | tr "~" "\n" | tail -n +2 | cut -d, -f2,12 | grep -i "^m" | cut -d, -f2 | sort | uniq -c | sort -nr | head -5
