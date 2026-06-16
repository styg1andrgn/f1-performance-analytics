-- Validation queries used during development to confirm data quality.

-- Confirm vw_RaceResults preserves all 7,600 rows from results.csv
SELECT COUNT(*) FROM vw_RaceResults;

-- Confirm vw_DriverStandingsHistory preserves all 3,131 rows from driver_standings.csv
SELECT COUNT(*) FROM vw_DriverStandingsHistory;

-- Identify driver_ids in driver_standings missing from drivers 
-- (used to diagnose the row-drop issue fixed via LEFT JOIN above)
SELECT DISTINCT ds.driver_id
FROM driver_standings ds
LEFT JOIN drivers d ON ds.driver_id = d.driver_id
WHERE d.driver_id IS NULL;