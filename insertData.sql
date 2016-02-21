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
((SELECT TID FROM Team WHERE Team_Name = 'India'), "RG Sharma", 0, 1, 0),
((SELECT TID FROM Team WHERE Team_Name = 'India'), "S Dhawan", 0, 1, 0),
((SELECT TID FROM Team WHERE Team_Name = 'India'), "V Kohli", 0, 1, 0),
((SELECT TID FROM Team WHERE Team_Name = 'India'), "AM Rahane", 0, 1, 0),
((SELECT TID FROM Team WHERE Team_Name = 'India'), "MS Dhoni", 0, 1, 0),
((SELECT TID FROM Team WHERE Team_Name = 'India'), "Gurkeerat Singh", 1, 1, 1),
((SELECT TID FROM Team WHERE Team_Name = 'India'), "RA Jadeja", 0, 1, 1),
((SELECT TID FROM Team WHERE Team_Name = 'India'), "R Dhawan", 1, 1, 1),
((SELECT TID FROM Team WHERE Team_Name = 'India'), "I Sharma", 0, 0, 1),
((SELECT TID FROM Team WHERE Team_Name = 'India'), "UT Yadav", 0, 0, 1),
((SELECT TID FROM Team WHERE Team_Name = 'India'), "BB Sran", 0, 0, 1),
((SELECT TID FROM Team WHERE Team_Name = 'Australia'), "SE Marsh", 0, 1, 0),
((SELECT TID FROM Team WHERE Team_Name = 'Australia'), "AJ Finch", 0, 1, 0),
((SELECT TID FROM Team WHERE Team_Name = 'Australia'), "SPD Smith", 0, 1, 0),
((SELECT TID FROM Team WHERE Team_Name = 'Australia'), "GJ Bailey", 0, 1, 0),
((SELECT TID FROM Team WHERE Team_Name = 'Australia'), "GJ Maxwell", 0, 1, 1),
((SELECT TID FROM Team WHERE Team_Name = 'Australia'), "MR Marsh", 0, 1, 1),
((SELECT TID FROM Team WHERE Team_Name = 'Australia'), "MS Wade", 0, 1, 0),
((SELECT TID FROM Team WHERE Team_Name = 'Australia'), "JP Faulkner", 0, 1, 1),
((SELECT TID FROM Team WHERE Team_Name = 'Australia'), "JW Hastings", 0, 1, 1),
((SELECT TID FROM Team WHERE Team_Name = 'Australia'), "KW Richardson", 0, 0, 1),
((SELECT TID FROM Team WHERE Team_Name = 'Australia'), "SM Boland", 0, 0, 1);
