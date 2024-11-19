--  create view statements from Item 7; 
CREATE VIEW TopTeamStatistics AS
SELECT 
    team_ID,
    team_name,
    league,
    wins,
    losses,
    record,
    standing
FROM Team
WHERE record > 0.75;

CREATE VIEW PlayerInjuryDetails AS
SELECT 
    A.player_ID,
    A.player_name,
    T.team_name,
    I.injury_type,
    I.injury_date,
    I.return_date,
    I.total_days_injured,
    I.status
FROM Athlete A
JOIN Team T ON A.team_ID = T.team_ID
JOIN Injury I ON A.player_ID = I.player_ID;


INSERT INTO TopTeamStatistics (team_ID, team_name, league, wins, losses, record, standing)
VALUES (10, 'Western Warriors', 'Western League', 10, 2, 0.83, 5);