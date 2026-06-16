-- View: vw_RaceResults
-- Purpose: One row per driver per race, joining race results with 
-- driver, constructor, and circuit details for downstream analysis.

CREATE VIEW vw_RaceResults AS
SELECT
    r.race_id,
    r.season,
    r.round,
    r.race_name,
    r.date,
    c.name AS circuit_name,
    c.country,
    c.lat,
    c.long,
    d.driver_id,
    d.givenName + ' ' + d.familyName AS driver_name,
    co.constructor_id,
    co.name AS constructor_name,
    res.grid,
    res.position_order,
    res.points,
    res.laps,
    res.status
FROM results res
JOIN races r 
    ON res.race_id = r.race_id
JOIN drivers d 
    ON res.driver_id = d.driver_id
JOIN constructors co 
    ON res.constructor_id = co.constructor_id
LEFT JOIN circuits c 
    ON r.circuit_id = c.circuit_id;