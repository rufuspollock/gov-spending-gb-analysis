cat scripts/simple.sql | sed "s/sample/latest/g" | psql gbspend > out/simple-latest.csv
