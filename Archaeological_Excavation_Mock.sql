/*
===========================================================
SET 2: ARCHAEOLOGICAL EXCAVATION DATABASE
SQL PRACTICE WITH ANSWERS AND EXPLANATIONS
Database: Oracle SQL
===========================================================

Q1. Display Excavation Name, Site Name, Civilization,
and Start Date for all excavations.
Sort from oldest to newest.
*/

SELECT e.Excavation_Name,
       s.Site_Name,
       s.Civilization,
       e.Start_Date
FROM Excavations e
JOIN Sites s
  ON e.Site_ID = s.Site_ID
ORDER BY e.Start_Date ASC;

/*
EXPLANATION:
1. EXCAVATIONS contains excavation names and start dates.
2. SITES contains site names and civilizations.
3. Site_ID connects the two tables.
4. ORDER BY Start_Date ASC sorts the earliest dates first.

JOIN returns excavations that have a matching site.
*/


/*
Q2. Display Civilization and total number of artifacts
for each civilization. Show only civilizations with
more than 8 artifacts.
*/

SELECT s.Civilization,
       COUNT(a.Artifact_ID) AS Total_Artifacts
FROM Sites s
JOIN Excavations e
  ON s.Site_ID = e.Site_ID
JOIN Artifacts a
  ON e.Excavation_ID = a.Excavation_ID
GROUP BY s.Civilization
HAVING COUNT(a.Artifact_ID) > 8
ORDER BY Total_Artifacts DESC;

/*
EXPLANATION:
1. SITES identifies each civilization.
2. EXCAVATIONS connects sites to excavations.
3. ARTIFACTS connects excavations to discovered artifacts.
4. GROUP BY Civilization groups artifacts by civilization.
5. COUNT counts the artifacts in each group.
6. HAVING keeps only civilizations with more than 8 artifacts.
7. ORDER BY shows the largest artifact counts first.

Note: This counts artifacts across all excavations belonging
to each civilization.
*/


/*
Q3. Display Archaeologist Name, Excavation Name, and Team Role
for archaeologists participating in excavations ending
after 01-Jan-2026.
*/

SELECT a.Archaeologist_Name,
       e.Excavation_Name,
       t.Team_Role
FROM Archaeologists a
JOIN Excavation_Team t
  ON a.Archaeologist_ID = t.Archaeologist_ID
JOIN Excavations e
  ON t.Excavation_ID = e.Excavation_ID
WHERE e.End_Date > DATE '2026-01-01'
ORDER BY e.End_Date ASC;

/*
EXPLANATION:
1. ARCHAEOLOGISTS contains archaeologist names.
2. EXCAVATION_TEAM links archaeologists to excavations
   and stores their team roles.
3. EXCAVATIONS contains the end dates.
4. WHERE selects excavations ending after 1 January 2026.
5. ORDER BY sorts the selected excavations by end date.

The condition excludes 1 January 2026 itself.
*/


/*
Q4. Display Excavation ID, Excavation Name, and the highest
Estimated_Value of artifacts found in each excavation.
Sort highest value first.
*/

SELECT e.Excavation_ID,
       e.Excavation_Name,
       MAX(a.Estimated_Value) AS Highest_Artifact_Value
FROM Excavations e
JOIN Artifacts a
  ON e.Excavation_ID = a.Excavation_ID
GROUP BY e.Excavation_ID,
         e.Excavation_Name
ORDER BY Highest_Artifact_Value DESC;

/*
EXPLANATION:
1. JOIN connects each excavation to its artifacts.
2. MAX(Estimated_Value) finds the most valuable artifact
   in each excavation.
3. GROUP BY returns one result per excavation.
4. ORDER BY DESC puts excavations with the highest-valued
   artifacts at the top.

Note: INNER JOIN excludes excavations with no artifacts.
Use LEFT JOIN if those excavations must also appear.
===========================================================
*/