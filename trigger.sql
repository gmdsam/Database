DROP TRIGGER tblInsert;

DELIMITER //

CREATE TRIGGER tblInsert AFTER INSERT ON India
	FOR EACH ROW BEGIN
		SET @batName = NEW.Batsman;
		SET @bowlName = NEW.Bowler;
		SET @bat_id = (SELECT PID FROM Player WHERE Player_Name=@batName);
		SET @bowl_id = (SELECT PID FROM Player WHERE Player_Name=@bowlName);
		IF(SELECT COUNT(*) FROM Batting WHERE PID=@bat_id) = 0 THEN
			INSERT INTO Batting(Pid, R, B, SR) VALUES (@bat_id, NEW.Runs, 1, R*100);
			
			IF(NEW.Wicket=1) THEN
				UPDATE Batting SET BB = @bowlName;
				UPDATE Batting SET Out_Over = B/6 + (B%6)/10;
			END IF;
			
			IF(NEW.Runs=4) THEN
            	UPDATE Batting SET 4s=1 WHERE PID = @bat_id;
       		END IF;
           	IF(NEW.Runs=6) THEN
            	UPDATE Batting SET 6s=1 WHERE PID = @bat_id;
        	END IF;
            	
        ELSE
       		UPDATE Batting SET R=R+NEW.Runs WHERE PID=@bat_id;
			UPDATE Batting SET B = B+1 WHERE PID=@bat_id;
			UPDATE Batting SET SR = (R*100)/B WHERE PID=@bat_id;
			
			IF(NEW.Wicket=1) THEN
				UPDATE Batting SET BB = @bowlName;
				UPDATE Batting SET Out_Over = B/6 + (B%6)/10;
			END IF;
			
       		IF(NEW.Runs=4) THEN
        		UPDATE Batting SET 4s=4s+1 WHERE PID=@bat_id;
       		END IF;
       		IF(NEW.Runs=6)THEN
        		UPDATE Batting SET 6s=6s+1 WHERE PID=@bat_id;
        	END IF;
        END IF;
         
        IF(SELECT COUNT(*) FROM Bowling WHERE PID=@bowl_id) = 0 THEN
         	INSERT INTO Bowling(PID, R, O) VALUES (@bowl_id, NEW.Runs, 1);
         	UPDATE Bowling SET Econ = (R/O)*6 WHERE PID = @bowl_id;
         	
         	IF(NEW.Runs=0) THEN
         		UPDATE Bowling SET 0s=1 WHERE PID = @bowl_id;
         	END IF;
         	IF(NEW.Runs=4) THEN
         		UPDATE Bowling SET 4s=1 WHERE PID = @bowl_id;
         	END IF;
         	IF(NEW.Runs=6) THEN
         		UPDATE Bowling SET 6s=1 WHERE PID = @bowl_id;
         	END IF;
         		
         	IF(NEW.Wide=1) THEN
         		UPDATE Bowling SET Wide=1 WHERE PID = @bowl_id;
         	END IF;
         	IF(NEW.No_Ball=1) THEN
         		UPDATE Bowling SET nb=1 WHERE PID = @bowl_id;
			END IF;
         	IF(NEW.Leg_Bye=1) THEN
         		UPDATE Bowling SET lb=1 WHERE PID = @bowl_id;
			END IF;
			
		ELSE
			UPDATE Bowling SET R = R+NEW.Runs WHERE PID = @bowl_id;
			UPDATE Bowling SET O = O+1 WHERE PID = @bowl_id;
			UPDATE Bowling SET Econ = (R/O)*6 WHERE PID = @bowl_id;
			
			IF(NEW.Runs=0) THEN
				UPDATE Bowling SET 0s=0s+1 WHERE PID = @bowl_id;
			END IF;
			IF(NEW.Runs=4) THEN
				UPDATE Bowling SET 4s=4s+1 WHERE PID = @bowl_id;
			END IF;
			IF(NEW.Runs=6) THEN
				UPDATE Bowling SET 6s=6s+1 WHERE PID = @bowl_id;
			END IF;
			
			IF(NEW.Wide=1) THEN
				UPDATE Bowling SET Wide=Wide+1 WHERE PID = @bowl_id;
			END IF;
			IF(NEW.No_Ball=1) THEN
         		UPDATE Bowling SET nb=nb+1 WHERE PID = @bowl_id;
			END IF;
         	IF(NEW.Leg_Bye=1) THEN
         		UPDATE Bowling SET lb=lb+1 WHERE PID = @bowl_id;
			END IF;
		END IF;
			
     END
//
DELIMITER ;
