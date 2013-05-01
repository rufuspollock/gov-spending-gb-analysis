Analyzing UK Government Spending from and for OpenSpending. See:

* This OpenSpending things-to-do issue: <https://github.com/openspending/thingstodo/issues/5>
* This post <http://okfnlabs.org/blog/2013/04/11/quick-and-dirty-analysis-on-large-csv.html>
* [Scratchpad google doc](https://docs.google.com/a/okfn.org/document/d/1LOWlROCSBEP2VmR8NsNum0zL7t8-EN2g9QjSfC5f7cM/edit#)

## Roadmap

* Pull a sample of data (and push to s3)
* Load scripts
* Identify initial questions / analyses
  * Biggest recipients
  * Department spending over time (can we see the spending cuts?)
  * Extract entities with counts

## Data

* The Data Package for UK Spending: <https://raw.github.com/openspending/dpkg-uk25k/master/datapackage.json>
* The all in one CSV file (3.7Gb): <http://data.etl.openspending.org/uk25k/spending-latest.csv>

### Summary

* Size: ~3.8Gb, 5.5m records
  * 2010 ends around line 535280
* Essential fields

## Analysis

### Preparation

1. Grab the data into the cache subdirectory
2. Create a Postgresql database named gbspend (you could use any name but you'll need to change names in scripts).
3. Prep a load script using [data package tools load-postgresql script](http://github.com/okfn/dptools):

      python bin/load-postgresql.py cache/datapackage.sample.json > scripts/create.sql

4. Use this to create table ("sample") and load sample data into it:

      psql gbspend -f scripts/create.sql

Note: load of sample is ~12s (535k rows). Load of full dataset and sample ~2m35s (5.480m rows)

### Running Some SQL

We have various sql scripts in the scripts directory.

As an example, the analysis script calculates various aggregate totals. You can run it by doing:

    psql gbspend -f scripts/analysis.sql

By default the scripts run on the sample table. If we want to change we can
just pipe the script through find and replace (sed) before running it:

    cat scripts/analysis.sql | sed "s/sample/latest/g" > psql gbspend

Warning: running this prior to creating relevant indexes will be *slow*!

### Quick and Dirty Techniques

#### Looking at specific rows

As part of preparing a sample we needed to search through the data quickly.
Specifically, data is approx date ordered and we wanted to try pulling out all
of 2010. This required a search for last row containing 2010 data. However, the
technique we use is general and very fast.

Easiest way is printing out a specific line and checking the date. This is a
big files (millions of lines) so we can't open in a spreadsheet. We use some
simple unix tools to do this quickly.

   # print line 100,000 and then pull out 60th "column"
   # NB: cut splits on ',' not on CSV columns.
   # Usually the same but not if ',' in one of the column contents
   sed '100000q;d' latest.csv | cut -d, -f 60

