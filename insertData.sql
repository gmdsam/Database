INSERT INTO Match_Details (ODI_NO, Stadium, Match_Date, Wickets_Left, Balls_Left)
VALUES (3725, "Melbourne", "17/01/2016", 3, 7);

INSERT INTO Match_Umpires (ODI_NO, Umpire_Name, Ground, TV, Refree, Reserve) VALUES
(3725, "SD Fry", 1, 0, 0, 0),
(3725, "RA Kettleborough", 1, 0, 0, 0),
(3725, "MD Martell", 0, 1, 0, 0),
(3725, "JJ Crowe", 0, 0, 1, 0),
(3725, "AJ Barrow", 0, 0, 0, 1);

INSERT INTO Team(ODI_NO, Team_Name, Against, Minutes, Toss) VALUES
(3725, "India", "2", 211, 0),
(3725, "Australia", "1", 207, 1);

INSERT INTO Player (TID, Player_Name, Debute, Bat, Bowl) VALUES
(1, "RG Sharma", 0, 1, 0),
(1, "S Dhawan", 0, 1, 0),
(1, "V Kohli", 0, 1, 0),
(1, "AM Rahane", 0, 1, 0),
(1, "MS Dhoni*†", 0, 1, 0),
(1, "Gurkeerat Singh", 1, 1, 1),
(1, "RA Jadeja", 0, 1, 1),
(1, "R Dhawan", 1, 1, 1),
(1, "I Sharma", 0, 0, 1),
(1, "UT Yadav", 0, 0, 1),
(1, "BB Sran", 0, 0, 1),
(2, "SE Marsh", 0, 1, 0),
(2, "AJ Finch", 0, 1, 0),
(2, "SPD Smith*", 0, 1, 0),
(2, "GJ Bailey", 0, 1, 0),
(2, "GJ Maxwell^", 0, 1, 1),
(2, "MR Marsh", 0, 1, 1),
(2, "MS Wade†", 0, 1, 0),
(2, "JP Faulkner", 0, 1, 1),
(2, "JW Hastings", 0, 1, 1),
(2, "KW Richardson", 0, 0, 1),
(2, "SM Boland", 0, 0, 1);
