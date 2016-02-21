DROP TRIGGER tblInsert;

DELIMITER //

CREATE TRIGGER tblInsert AFTER INSERT ON India
	FOR EACH ROW BEGIN
		SET @name = NEW.Batsman;
		SET @id = (SELECT PID FROM Player WHERE Player_Name=@name);
		IF(SELECT COUNT(*) FROM TEMP WHERE PID=@id) = 0 THEN
			INSERT INTO TEMP(PN, PID, R, B, 4S, 6S) values(@name, @id, NEW.Runs, 0, 0, 0);
			UPDATE TEMP SET R=R+NEW.Runs WHERE PID=@id;
			UPDATE TEMP SET B = B+1 WHERE PID=@id;
			
			IF(NEW.Runs=4) THEN
            		UPDATE TEMP SET 4S=4S+1 WHERE PID=@id;
       		end if;
           	IF(NEW.Runs=6)THEN
            		UPDATE TEMP SET 6S=6S+1 WHERE PID=@id;
        	end if;
            	
         ELSE
       		UPDATE TEMP SET R=R+NEW.Runs WHERE PID=@id;
			UPDATE TEMP SET B = B+1 WHERE PID=@id;
       		IF(NEW.Runs=4) THEN
        		UPDATE TEMP SET 4S=4S+1 WHERE PID=@id;
       		end if;
       		IF(NEW.Runs=6)THEN
        		UPDATE TEMP SET 6S=6S+1 WHERE PID=@id;
        	end if;
         END IF;

     END
//
DELIMITER ;
