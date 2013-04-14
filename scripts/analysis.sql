SELECT sum("AmountFormatted"), "DepartmentFamilyNameCanonical" FROM "sample" GROUP BY "DepartmentFamilyNameCanonical" limit 10;
SELECT sum("AmountFormatted"), "ExpenseArea" FROM "sample" GROUP BY "ExpenseArea" limit 10;
SELECT sum("AmountFormatted"), "SupplierName" FROM "sample" GROUP BY "SupplierName" ORDER BY sum("AmountFormatted") DESC limit 10;

