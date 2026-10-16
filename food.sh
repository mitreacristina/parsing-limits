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
