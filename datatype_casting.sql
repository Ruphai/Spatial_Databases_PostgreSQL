--SELECT 123456667875432.2477889999590
--SELECT 123456667875432.24778899995903::real
--SELECT 123456667875432.24778899995903::double precision
--SELECT 123456667875432.24778899995903::real/1000 --real numbers are not necessarily precise
--You can always use the numeric datatype if precision is very important to the work you are doing.
-- But it occupies more storage space. 

/*DATE VARIABLES */
--SELECT '2015-10-23'::date
--SELECT '2015-10-23'::timestamp
--SELECT '2015-10-23 13:02:12'::timestamp::date
--SELECT '2015-10-23 13:02:12'::timestamp - '2015-12-25'::timestamp --returns a time interval

/*TEXT AND STRINGS AND NUMERIC TYPES*/
--SELECT 1234567890::text
--SELECT 1234567890::varchar(5) --varchar of length 5
--SELECT '1234567890'::bigint
SELECT '1234567.8901'::numeric::integer