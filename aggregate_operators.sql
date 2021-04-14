-- SELECT COUNT(*), AVG(NEST), MAX(DATE) FROM raptor_surveys;
-- SELECT r.nest, COUNT(*) FROM raptor_surveys WHERE result = 'ACTIVE NEST' GROUP BY nest ORDER BY nest;
SELECT r.nest, r.result, COUNT(*), MAX(date) FROM raptor_surveys r GROUP BY r.nest, r.result ORDER BY r.nest, r.result;