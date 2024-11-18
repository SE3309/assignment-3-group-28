-- insert statements from Item 3; 
INSERT INTO Award (award_name, officiating_body, award_date) 
VALUES ('MVP Award', 'NCAA', '2024-06-15');

INSERT INTO Team Values ('Lions', 'Eastern League', 10, 5, 0.667, 1, 'New York');

INSERT INTO Injury (player_ID, injury_type, injury_date, return_date, total_days_injured, status)
SELECT player_ID, 'Hamstring Tear', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 20 DAY), 20, 'In Progress'
FROM Athlete
WHERE player_ID IN (1, 2);

INSERT INTO Injury (player_ID, injury_type, injury_date, return_date, total_days_injured, status)
VALUES
    (5, 'Wrist Fracture', '2023-09-01', '2023-09-15', 14, 'Recovered'),
    (6, 'Elbow Injury', '2023-10-01', '2023-10-20', 19, 'In Progress'),
    (7, 'Concussion', '2023-11-01', NULL, NULL, 'Ongoing');

INSERT INTO Injury (player_ID, injury_type, injury_date, return_date, total_days_injured, status)
SELECT 
    player_ID, 
    'Fatigue', 
    CURDATE(), 
    NULL, 
    NULL, 
    'Rest Needed'
FROM Statistic
WHERE points = (SELECT MAX(points) FROM Statistic);
