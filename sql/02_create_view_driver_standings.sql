-- View: vw_DriverStandingsHistory
-- Purpose: Cumulative championship standings (points, position, wins) 
-- for each driver after each round. Uses LEFT JOIN to drivers because 
-- a small number of historical driver_ids (pre-1960s) in driver_standings 
-- have no matching entry in drivers.csv -- LEFT JOIN preserves these rows 
-- (with driver_name as NULL) rather than silently dropping them.

CREATE VIEW vw_DriverStandingsHistory AS
SELECT
    ds.season,
    ds.round,
    ds.driver_id,
    d.givenName + ' ' + d.familyName AS driver_name,
    ds.position AS standings_position,
    ds.points AS cumulative_points,
    ds.wins AS cumulative_wins
FROM driver_standings ds
LEFT JOIN drivers d 
    ON ds.driver_id = d.driver_id;