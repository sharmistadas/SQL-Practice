/*
========================================================
SET 1: SPACE MISSION CONTROL DATABASE
Oracle SQL - Answers with explanations
========================================================

Q1. Mission, spacecraft, launch site, country, launch date
and return date for sites operating since before 2000.
Sort by launch date descending.
*/

SELECT m.Mission_Name,
       s.Spacecraft_Name,
       l.Launch_Site_Name,
       l.Country,
       m.Launch_Date,
       m.Return_Date
FROM MISSIONS m
JOIN SPACECRAFT s
  ON m.Spacecraft_ID = s.Spacecraft_ID
JOIN LAUNCH_SITES l
  ON m.Launch_Site_ID = l.Launch_Site_ID
WHERE l.Operating_Since < DATE '2000-01-01'
ORDER BY m.Launch_Date DESC;


/*
EXPLANATION:
1. MISSIONS provides mission details and dates.
2. SPACECRAFT supplies the spacecraft name.
3. LAUNCH_SITES supplies the launch site and country.
4. WHERE filters sites that started operating before 2000.
5. ORDER BY ... DESC puts the newest launch dates first.

If OPERATING_SINCE stores a year as a NUMBER, use:
WHERE l.Operating_Since < 2000
*/


/*
Q2. Astronaut name, country, mission name, mission role,
spacecraft name for missions with success rate > 80%.
Sort by success rate descending.
*/

SELECT a.Astronaut_Name,
       a.Country,
       m.Mission_Name,
       mc.Mission_Role,
       s.Spacecraft_Name,
       r.Success_Rate
FROM ASTRONAUTS a
JOIN MISSION_CREW mc
  ON a.Astronaut_ID = mc.Astronaut_ID
JOIN MISSIONS m
  ON mc.Mission_ID = m.Mission_ID
JOIN SPACECRAFT s
  ON m.Spacecraft_ID = s.Spacecraft_ID
JOIN MISSION_RESULTS r
  ON m.Mission_ID = r.Mission_ID
WHERE r.Success_Rate > 80
ORDER BY r.Success_Rate DESC;


/*
EXPLANATION:
1. ASTRONAUTS gives the astronaut's name and country.
2. MISSION_CREW links astronauts to missions and their roles.
3. MISSIONS gives the mission name and spacecraft ID.
4. SPACECRAFT gives the spacecraft name.
5. MISSION_RESULTS provides the success rate.
6. WHERE keeps success rates greater than 80.
7. ORDER BY DESC ranks higher success rates first.

If your schema uses ASTRONAUTS as the crew-link table instead
of MISSION_CREW, adjust the joins to match your actual schema.
*/


/*
Q3. Mission name, mission type, launch site name and total
equipment cost for missions with total cost > 500000.
*/

SELECT m.Mission_Name,
       m.Mission_Type,
       l.Launch_Site_Name,
       SUM(e.Equipment_Cost) AS Total_Equipment_Cost
FROM MISSIONS m
JOIN LAUNCH_SITES l
  ON m.Launch_Site_ID = l.Launch_Site_ID
JOIN MISSION_EQUIPMENT e
  ON m.Mission_ID = e.Mission_ID
GROUP BY m.Mission_ID,
         m.Mission_Name,
         m.Mission_Type,
         l.Launch_Site_Name
HAVING SUM(e.Equipment_Cost) > 500000;


/*
EXPLANATION:
1. JOIN connects missions, launch sites and equipment.
2. SUM(Equipment_Cost) adds equipment costs for each mission.
3. GROUP BY creates one group per mission and launch site.
4. HAVING filters groups whose total cost exceeds 500000.

This assumes Equipment_Cost is the total cost per equipment
record. If it is a per-unit cost, use:
SUM(e.Equipment_Cost * e.Quantity)
*/


/*
Q4. Mission name, spacecraft name, experiment count,
total equipment quantity and success rate.
Show missions with more than 3 experiments and success rate > 75%.
*/

SELECT m.Mission_Name,
       s.Spacecraft_Name,
       x.Total_Experiments,
       q.Total_Equipment_Quantity,
       r.Success_Rate
FROM MISSIONS m
JOIN SPACECRAFT s
  ON m.Spacecraft_ID = s.Spacecraft_ID
JOIN (
    SELECT Mission_ID,
           COUNT(*) AS Total_Experiments
    FROM EXPERIMENTS
    GROUP BY Mission_ID
) x
  ON m.Mission_ID = x.Mission_ID
JOIN (
    SELECT Mission_ID,
           SUM(Quantity) AS Total_Equipment_Quantity
    FROM MISSION_EQUIPMENT
    GROUP BY Mission_ID
) q
  ON m.Mission_ID = q.Mission_ID
JOIN MISSION_RESULTS r
  ON m.Mission_ID = r.Mission_ID
WHERE x.Total_Experiments > 3
  AND r.Success_Rate > 75;


/*
EXPLANATION:
1. SPACECRAFT provides the spacecraft name.
2. The first subquery counts experiments for each mission.
3. The second subquery totals equipment quantities by mission.
4. MISSION_RESULTS provides the success rate.
5. WHERE filters missions with more than 3 experiments
   and success rate greater than 75.

The subqueries are important: joining experiments and equipment
directly can multiply rows and inflate counts or sums.
========================================================
*/