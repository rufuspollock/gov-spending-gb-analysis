-- null frac etc
select * from pg_stats where tablename = 'sample' and attname = 'CompanyCode';
select * from pg_stats where tablename = 'sample' and attname = 'DepartmentFamilyName';

-- histogram of transactions over time for a given department
-- https://gist.github.com/mariokonschake/4259408
