SELECT sum("AmountFormatted"), "DepartmentFamilyNameCanonical"
  FROM "sample"
  GROUP BY "DepartmentFamilyNameCanonical"
  ORDER BY sum("AmountFormatted") DESC
  LIMIT 10
  ;
SELECT sum("AmountFormatted"), "ExpenseArea" FROM "sample"
  GROUP BY "ExpenseArea"
  ORDER BY sum("AmountFormatted") DESC
  LIMIT 10;
  ;
SELECT sum("AmountFormatted"), "SupplierName" FROM "sample"
  GROUP BY "SupplierName"
  ORDER BY sum("AmountFormatted") DESC
  LIMIT 10
  ;

