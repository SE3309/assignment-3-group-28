-- create table statements from Item 2; 
CREATE TABLE Team (
    team_ID INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL,
    league VARCHAR(50),
    wins INT DEFAULT 0,
    losses INT DEFAULT 0,
    record FLOAT,
    standing INT,
    location VARCHAR(100)
);

CREATE TABLE Award (
    award_ID INT AUTO_INCREMENT PRIMARY KEY,
    award_name VARCHAR(100) NOT NULL,
    officiating_body VARCHAR(100),
    award_date DATE
);

CREATE TABLE Team_Award (
    team_ID INT NOT NULL,
    award_ID INT NOT NULL,
    PRIMARY KEY (team_ID, award_ID),
    FOREIGN KEY (team_ID) REFERENCES Team(team_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (award_ID) REFERENCES Award(award_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Athlete (
    player_ID INT AUTO_INCREMENT PRIMARY KEY,
    player_name VARCHAR(100) NOT NULL,
    player_number INT,
    height FLOAT,
    weight FLOAT,
    age INT,
    position VARCHAR(50),
    year INT,
    hometown VARCHAR(100),
    highschool VARCHAR(100),
    team_ID INT NOT NULL,
    FOREIGN KEY (team_ID) REFERENCES Team(team_ID)
    
);

CREATE TABLE Athlete_Award (
    athlete_ID INT NOT NULL, 
    award_ID INT NOT NULL,   
    PRIMARY KEY (athlete_ID, award_ID), 
    FOREIGN KEY (athlete_ID) REFERENCES Athlete(player_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (award_ID) REFERENCES Award(award_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Match (
    match_ID INT AUTO_INCREMENT PRIMARY KEY,
    home_team_ID INT NOT NULL,
    away_team_ID INT NOT NULL,
    home_team_score INT,
    away_team_score INT,
    date DATE,
    league VARCHAR(50),
    match_type VARCHAR(50),
    FOREIGN KEY (home_team_ID) REFERENCES Team(team_ID),
    FOREIGN KEY (away_team_ID) REFERENCES Team(team_ID)
);

CREATE TABLE Statistic (
    player_ID INT NOT NULL,
    match_ID INT NOT NULL,
    minutes_played INT,
    field_goals_made INT,
    field_goals_attempted INT,
    field_goal_percentage FLOAT,
    three_point_goals_made INT,
    three_point_goals_attempted INT,
    three_point_percentage FLOAT,
    free_throws_attempted INT,
    free_throws_made INT,
    free_throws_percentage FLOAT,
    total_rebounds INT,
    assists INT,
    steals INT,
    blocks INT,
    turnovers INT,
    fouls INT,
    points INT,
    player_rating_per_minute FLOAT,
    player_efficiency FLOAT,
    effective_field_goal_percentage FLOAT,
    true_shooting_percentage FLOAT,
    PRIMARY KEY (player_ID, match_ID),
    FOREIGN KEY (player_ID) REFERENCES Athlete(player_ID),
    FOREIGN KEY (match_ID) REFERENCES Match(match_ID)
);

CREATE TABLE Injury (
    injury_ID INT AUTO_INCREMENT PRIMARY KEY,
    player_ID INT NOT NULL,
    injury_type VARCHAR(100),
    injury_date DATE,
    return_date DATE,
    total_days_injured INT,
    status VARCHAR(50),
    FOREIGN KEY (player_ID) REFERENCES Athlete(player_ID)
);
