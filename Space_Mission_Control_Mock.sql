-- # SET 1 — SPACE MISSION CONTROL DATABASE
-- # SQL Questions with Answers and Explanations
-- # SQL: Oracle

-- ==================================================
-- QUESTION 1
-- Display Mission Name, Mission Type, Spacecraft Name,
-- and Launch Date for all missions.
-- Sort by Launch Date in descending order.
-- ==================================================

SELECT
    m.Mission_Name,
    m.Mission_Type,
    s.Spacecraft_Name,
    m.Launch_Date
FROM Missions m
JOIN Spacecraft s
    ON m.Spacecraft_ID = s.Spacecraft_ID
ORDER BY m.Launch_Date DESC;

-- EXPLANATION:
-- 1. Missions table contains mission details.
-- 2. Spacecraft table contains spacecraft names.
-- 3. JOIN connects both tables using Spacecraft_ID.
-- 4. ORDER BY Launch_Date DESC displays the newest
--    launch dates first.


-- ==================================================
-- QUESTION 2
-- Display Mission Type and total number of experiments
-- for each mission type.
-- Show only mission types having more than 5 experiments.
-- ==================================================

SELECT
    m.Mission_Type,
    COUNT(e.Experiment_ID) AS Total_Experiments
FROM Missions m
JOIN Experiments e
    ON m.Mission_ID = e.Mission_ID
GROUP BY m.Mission_Type
HAVING COUNT(e.Experiment_ID) > 5
ORDER BY Total_Experiments DESC;

-- EXPLANATION:
-- 1. JOIN connects Missions and Experiments.
-- 2. COUNT() counts the experiments.
-- 3. GROUP BY groups missions by Mission_Type.
-- 4. HAVING filters grouped results.
-- 5. Only mission types with more than 5 experiments
--    are displayed.
-- 6. ORDER BY displays the highest count first.


-- ==================================================
-- QUESTION 3
-- Display Astronaut Name, Mission Name, and Mission Role
-- for astronauts who participated in missions returning
-- after 01-Jan-2026.
-- ==================================================

SELECT
    a.Astronaut_Name,
    m.Mission_Name,
    mc.Mission_Role
FROM Astronauts a
JOIN Mission_Crew mc
    ON a.Astronaut_ID = mc.Astronaut_ID
JOIN Missions m
    ON mc.Mission_ID = m.Mission_ID
WHERE m.Return_Date > DATE '2026-01-01'
ORDER BY m.Return_Date ASC;

-- EXPLANATION:
-- 1. Astronauts contains astronaut names.
-- 2. Mission_Crew connects astronauts with missions
--    and stores their roles.
-- 3. Missions contains mission names and return dates.
-- 4. JOIN connects all three tables.
-- 5. WHERE selects missions returning after
--    1 January 2026.
-- 6. DATE '2026-01-01' is an Oracle date literal.
-- 7. The condition > excludes 1 January itself.


-- ==================================================
-- QUESTION 4
-- Display Mission ID, Mission Name, and maximum
-- Duration_Days of experiments for each mission.
-- Sort maximum duration from greatest to least.
-- ==================================================

SELECT
    m.Mission_ID,
    m.Mission_Name,
    MAX(e.Duration_Days) AS Maximum_Duration
FROM Missions m
JOIN Experiments e
    ON m.Mission_ID = e.Mission_ID
GROUP BY
    m.Mission_ID,
    m.Mission_Name
ORDER BY Maximum_Duration DESC;

-- EXPLANATION:
-- 1. JOIN connects Missions and Experiments.
-- 2. MAX() finds the longest experiment duration
--    for each mission.
-- 3. GROUP BY creates one result per mission.
-- 4. Mission_ID and Mission_Name are included in
--    GROUP BY because they are selected with MAX().
-- 5. ORDER BY Maximum_Duration DESC displays the
--    longest duration first.

