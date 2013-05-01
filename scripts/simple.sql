COPY (
SELECT count(*), sum("AmountFormatted"), "DepartmentFamilyNameCanonical"
  FROM "sample"
  GROUP BY "DepartmentFamilyNameCanonical"
  ORDER BY sum("AmountFormatted") DESC
) TO STDOUT WITH CSV HEADER
  ;
