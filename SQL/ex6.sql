-- select statements from Item 5;
DELETE FROM Injury
WHERE total_days_injured < 15
AND player_ID IN (
    SELECT A.player_ID
    FROM Athlete A
    JOIN Team T ON A.team_ID = T.team_ID
    WHERE T.location IN ('Curtisstad', 'Reedport')
);


UPDATE Team
SET wins = wins + (
    SELECT COUNT(*) 
    FROM Statistic S
    JOIN Athlete A ON S.player_ID = A.player_ID
    WHERE A.team_ID = Team.team_ID AND S.points > 20
)
WHERE team_ID = 1;




INSERT INTO Injury (player_ID, injury_type, injury_date, return_date, total_days_injured, status)
SELECT 
    A.player_ID, 
    'Fatigue', 
    CURDATE(), 
    DATE_ADD(CURDATE(), INTERVAL 10 DAY), 
    10, 
    'Recovering'
FROM Athlete A
JOIN Team T ON A.team_ID = T.team_ID
WHERE T.record > 0.8;