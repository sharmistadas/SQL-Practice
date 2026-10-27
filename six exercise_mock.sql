/* =====================================================================
   SET 1 - SPACE MISSION CONTROL DATABASE
   ===================================================================== */

-- Q1: Mission Name, Type, Spacecraft Name, Launch Date (latest first)
-- Explanation: Missions holds Spacecraft_ID (FK), so JOIN Spacecraft on that
-- key to get the name. ORDER BY ... DESC puts the newest launch first.
SELECT m.Mission_Name, m.Mission_Type, s.Spacecraft_Name, m.Launch_Date
FROM Missions m
JOIN Spacecraft s ON m.Spacecraft_ID = s.Spacecraft_ID
ORDER BY m.Launch_Date DESC;

-- Q2: Mission Type with total experiments, only if more than 5
-- Explanation: Experiments links to Missions via Mission_ID. GROUP BY mission
-- type, COUNT the experiments, and filter groups with HAVING (not WHERE,
-- because the condition is on an aggregate).
SELECT m.Mission_Type, COUNT(e.Experiment_ID) AS Total_Experiments
FROM Missions m
JOIN Experiments e ON m.Mission_ID = e.Mission_ID
GROUP BY m.Mission_Type
HAVING COUNT(e.Experiment_ID) > 5;

-- Q3: Astronaut, Mission, Role for missions returning after 01-Jan-2026
-- Explanation: Many-to-many, so go through the bridge table Mission_Crew:
-- Astronauts -> Mission_Crew -> Missions. WHERE filters on Return_Date.
SELECT a.Astronaut_Name, m.Mission_Name, mc.Mission_Role
FROM Astronauts a
JOIN Mission_Crew mc ON a.Astronaut_ID = mc.Astronaut_ID
JOIN Missions m ON mc.Mission_ID = m.Mission_ID
WHERE m.Return_Date > DATE '2026-01-01';

-- Q4: Mission ID, Name, max experiment duration (greatest first)
-- Explanation: MAX() per mission needs GROUP BY. Every non-aggregated column
-- in SELECT (ID and name) must appear in GROUP BY.
SELECT m.Mission_ID, m.Mission_Name, MAX(e.Duration_Days) AS Max_Duration
FROM Missions m
JOIN Experiments e ON m.Mission_ID = e.Mission_ID
GROUP BY m.Mission_ID, m.Mission_Name
ORDER BY Max_Duration DESC;


/* =====================================================================
   SET 2 - ARCHAEOLOGICAL EXCAVATION DATABASE
   ===================================================================== */

-- Q1: Excavation, Site, Civilization, Start Date (oldest first)
-- Explanation: Excavations has Site_ID (FK) -> JOIN Sites. ASC (default) gives
-- oldest to newest.
SELECT e.Excavation_Name, s.Site_Name, s.Civilization, e.Start_Date
FROM Excavations e
JOIN Sites s ON e.Site_ID = s.Site_ID
ORDER BY e.Start_Date ASC;

-- Q2: Civilization with artifact count, only more than 8
-- Explanation: Artifacts don't link to Sites directly. Path is
-- Sites -> Excavations -> Artifacts. GROUP BY civilization, HAVING on count.
SELECT s.Civilization, COUNT(a.Artifact_ID) AS Total_Artifacts
FROM Sites s
JOIN Excavations e ON s.Site_ID = e.Site_ID
JOIN Artifacts a ON e.Excavation_ID = a.Excavation_ID
GROUP BY s.Civilization
HAVING COUNT(a.Artifact_ID) > 8;

-- Q3: Archaeologist, Excavation, Role for excavations ending after 01-Jan-2026
-- Explanation: Bridge table Excavation_Team connects the many-to-many
-- relationship. WHERE filters on End_Date.
SELECT ar.Archaeologist_Name, e.Excavation_Name, et.Team_Role
FROM Archaeologists ar
JOIN Excavation_Team et ON ar.Archaeologist_ID = et.Archaeologist_ID
JOIN Excavations e ON et.Excavation_ID = e.Excavation_ID
WHERE e.End_Date > DATE '2026-01-01';

-- Q4: Excavation ID, Name, highest artifact value (highest first)
-- Explanation: MAX(Estimated_Value) per excavation, grouped by ID and name.
SELECT e.Excavation_ID, e.Excavation_Name, MAX(a.Estimated_Value) AS Highest_Value
FROM Excavations e
JOIN Artifacts a ON e.Excavation_ID = a.Excavation_ID
GROUP BY e.Excavation_ID, e.Excavation_Name
ORDER BY Highest_Value DESC;


/* =====================================================================
   SET 3 - WILDLIFE TRACKING DATABASE
   ===================================================================== */

-- Q1: Reserve, Species, Gender, Birth Year (ascending by birth year)
-- Explanation: Animals has Reserve_ID (FK) -> JOIN Reserves.
SELECT r.Reserve_Name, a.Species_Name, a.Gender, a.Birth_Year
FROM Animals a
JOIN Reserves r ON a.Reserve_ID = r.Reserve_ID
ORDER BY a.Birth_Year ASC;

-- Q2: Species with total tracking records, only more than 10
-- Explanation: Tracking_Records links to Animals; species is in Animals.
-- Group by species and count records; HAVING filters the groups.
SELECT a.Species_Name, COUNT(t.Record_ID) AS Total_Records
FROM Animals a
JOIN Tracking_Records t ON a.Animal_ID = t.Animal_ID
GROUP BY a.Species_Name
HAVING COUNT(t.Record_ID) > 10;

-- Q3: Researcher, Reserve, Role for reserves larger than 500 sq km
-- Explanation: Bridge table Research_Assignments links Researchers and
-- Reserves. WHERE filters on Area_SqKm (a normal column condition).
SELECT rs.Researcher_Name, r.Reserve_Name, ra.Assignment_Role
FROM Researchers rs
JOIN Research_Assignments ra ON rs.Researcher_ID = ra.Researcher_ID
JOIN Reserves r ON ra.Reserve_ID = r.Reserve_ID
WHERE r.Area_SqKm > 500;

-- Q4: Animal ID, Species, max distance (greatest first)
-- Explanation: MAX(Distance_Km) per animal; group by ID and species.
SELECT a.Animal_ID, a.Species_Name, MAX(t.Distance_Km) AS Max_Distance
FROM Animals a
JOIN Tracking_Records t ON a.Animal_ID = t.Animal_ID
GROUP BY a.Animal_ID, a.Species_Name
ORDER BY Max_Distance DESC;


/* =====================================================================
   SET 4 - UNDERGROUND CAVE EXPLORATION DATABASE
   ===================================================================== */

-- Q1: Expedition, Cave, Location, Difficulty (sorted by difficulty)
-- Explanation: Expeditions has Cave_ID (FK) -> JOIN Caves. ORDER BY sorts
-- ascending by default.
SELECT e.Expedition_Name, c.Cave_Name, c.Location, e.Difficulty_Level
FROM Expeditions e
JOIN Caves c ON e.Cave_ID = c.Cave_ID
ORDER BY e.Difficulty_Level;

-- Q2: Cave Type with total discoveries, only more than 6
-- Explanation: Path is Caves -> Expeditions -> Discoveries. Group by cave
-- type, count discoveries, HAVING > 6.
SELECT c.Cave_Type, COUNT(d.Discovery_ID) AS Total_Discoveries
FROM Caves c
JOIN Expeditions e ON c.Cave_ID = e.Cave_ID
JOIN Discoveries d ON e.Expedition_ID = d.Expedition_ID
GROUP BY c.Cave_Type
HAVING COUNT(d.Discovery_ID) > 6;

-- Q3: Explorer, Expedition, Role for expeditions ending after 01-Jan-2026
-- Explanation: Bridge table Expedition_Team; WHERE filters End_Date.
SELECT ex.Explorer_Name, e.Expedition_Name, et.Team_Role
FROM Explorers ex
JOIN Expedition_Team et ON ex.Explorer_ID = et.Explorer_ID
JOIN Expeditions e ON et.Expedition_ID = e.Expedition_ID
WHERE e.End_Date > DATE '2026-01-01';

-- Q4: Expedition ID, Name, max depth found for EVERY expedition (deepest first)
-- Explanation: "Every expedition" means include ones with no discoveries too,
-- so use LEFT JOIN (those show NULL). MAX per expedition via GROUP BY.
-- Note: in Oracle, add NULLS LAST after DESC to push NULLs to the bottom.
SELECT e.Expedition_ID, e.Expedition_Name, MAX(d.Depth_Found) AS Max_Depth
FROM Expeditions e
LEFT JOIN Discoveries d ON e.Expedition_ID = d.Expedition_ID
GROUP BY e.Expedition_ID, e.Expedition_Name
ORDER BY Max_Depth DESC;


/* =====================================================================
   SET 5 - RAILWAY HERITAGE DATABASE
   ===================================================================== */

-- Q1: Journey, Train, Route, Departure Date (latest first)
-- Explanation: Journeys has Train_ID (FK) -> JOIN Trains. DESC = newest first.
SELECT j.Journey_Name, t.Train_Name, j.Route_Name, j.Departure_Date
FROM Journeys j
JOIN Trains t ON j.Train_ID = t.Train_ID
ORDER BY j.Departure_Date DESC;

-- Q2: Train Type with total journeys, only more than 4
-- Explanation: Join Trains to Journeys, group by train type, count journeys,
-- HAVING > 4.
SELECT t.Train_Type, COUNT(j.Journey_ID) AS Total_Journeys
FROM Trains t
JOIN Journeys j ON t.Train_ID = j.Train_ID
GROUP BY t.Train_Type
HAVING COUNT(j.Journey_ID) > 4;

-- Q3: Operator, Journey, Crew Role for journeys arriving after 01-Jan-2026
-- Explanation: Bridge table Journey_Crew; WHERE filters Arrival_Date.
SELECT o.Operator_Name, j.Journey_Name, jc.Crew_Role
FROM Operators o
JOIN Journey_Crew jc ON o.Operator_ID = jc.Operator_ID
JOIN Journeys j ON jc.Journey_ID = j.Journey_ID
WHERE j.Arrival_Date > DATE '2026-01-01';

-- Q4: Journey ID, Name, max distance from start (greatest first)
-- Explanation: MAX(Distance_From_Start) over the stations of each journey.
SELECT j.Journey_ID, j.Journey_Name, MAX(s.Distance_From_Start) AS Max_Distance
FROM Journeys j
JOIN Stations_Visited s ON j.Journey_ID = s.Journey_ID
GROUP BY j.Journey_ID, j.Journey_Name
ORDER BY Max_Distance DESC;


/* =====================================================================
   SET 6 - VOLCANIC RESEARCH DATABASE
   ===================================================================== */

-- Q1: Mission, Volcano, Volcano Type, Start Date (latest first)
-- Explanation: Research_Missions has Volcano_ID (FK) -> JOIN Volcanoes.
SELECT rm.Mission_Name, v.Volcano_Name, v.Volcano_Type, rm.Start_Date
FROM Research_Missions rm
JOIN Volcanoes v ON rm.Volcano_ID = v.Volcano_ID
ORDER BY rm.Start_Date DESC;

-- Q2: Volcano Type with total observations, only more than 10
-- Explanation: Path is Volcanoes -> Research_Missions -> Observations.
-- Group by type, count observations, HAVING > 10.
SELECT v.Volcano_Type, COUNT(o.Observation_ID) AS Total_Observations
FROM Volcanoes v
JOIN Research_Missions rm ON v.Volcano_ID = rm.Volcano_ID
JOIN Observations o ON rm.Mission_ID = o.Mission_ID
GROUP BY v.Volcano_Type
HAVING COUNT(o.Observation_ID) > 10;

-- Q3: Geologist, Mission, Role for missions ending after 01-Jan-2026
-- Explanation: Bridge table Mission_Team; WHERE filters End_Date.
SELECT g.Geologist_Name, rm.Mission_Name, mt.Team_Role
FROM Geologists g
JOIN Mission_Team mt ON g.Geologist_ID = mt.Geologist_ID
JOIN Research_Missions rm ON mt.Mission_ID = rm.Mission_ID
WHERE rm.End_Date > DATE '2026-01-01';

-- Q4: Mission ID, Name, max temperature (highest first)
-- Explanation: MAX(Temperature_C) per mission from Observations.
SELECT rm.Mission_ID, rm.Mission_Name, MAX(o.Temperature_C) AS Max_Temperature
FROM Research_Missions rm
JOIN Observations o ON rm.Mission_ID = o.Mission_ID
GROUP BY rm.Mission_ID, rm.Mission_Name
ORDER BY Max_Temperature DESC;