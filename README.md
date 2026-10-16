# parsing-limits

BIOINF 575 Homework 2 and 3: parsing real data files with bash, on Git branches.

## Findings

GTF: column 9 holds key "value" pairs, so keys are not at fixed positions, some keys are missing and some repeat; text search, cut and a single sed capture all miss or mangle values.
