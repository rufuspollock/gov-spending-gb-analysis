#!/bin/bash
curl http://data.etl.openspending.org/uk25k/spending-latest.csv > cache/latest.csv
# estimate end of 2010 is around linke 535280 (see README)
head -n 535280 cache/latest.csv > cache/sample-2010.csv
ln -s cache/sample-2010.csv cache/sample.csv
