
SELECT A.player_name, A.position
FROM Athlete A
JOIN Team T ON A.team_ID = T.team_ID
WHERE T.team_name = Parks Ltd;

SELECT A.player_name, S.points
FROM Athlete A
JOIN Statistic S ON A.player_ID = S.player_ID
WHERE S.points = (SELECT MAX(points) FROM Statistic);

SELECT T.team_name
FROM Team T
WHERE EXISTS (
    SELECT 1
    FROM Team_Award TA
    WHERE T.team_ID = TA.team_ID
);

SELECT A.player_name, I.injury_type, T.team_name
FROM Athlete A
JOIN Injury I ON A.player_ID = I.player_ID
JOIN Team T ON A.team_ID = T.team_ID;

SELECT T.team_name, COUNT(I.injury_ID) AS total_injuries
FROM Team T
JOIN Athlete A ON T.team_ID = A.team_ID
JOIN Injury I ON A.player_ID = I.player_ID
GROUP BY T.team_name;

SELECT A.player_name, T.team_name
FROM Athlete A
JOIN Team T ON A.team_ID = T.team_ID
WHERE T.wins > T.losses;

SELECT A.player_name, AVG(S.points) AS avg_points
FROM Athlete A
JOIN Statistic S ON A.player_ID = S.player_ID
GROUP BY A.player_name
HAVING COUNT(S.match_ID) > 3;
