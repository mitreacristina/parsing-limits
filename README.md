# parsing-limits

BIOINF 575 Homework 2 and 3: parsing real data files with bash, on Git branches.

## Findings

Food.csv: one food can span several lines and quoted values contain commas, so cut on the comma gives wrong columns; removing quoted text fixes the food groups but also erases names that contain commas.
