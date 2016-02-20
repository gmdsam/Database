fo = open("australia_commentary.txt", "rw+")

print ("CREATE TABLE Australia(ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,\
Bowler VARCHAR(50) NOT NULL,\
Batsman VARCHAR(50) NOT NULL,\
Runs INT NOT NULL,\
Wide TINYINT(1),\
No_Ball TINYINT(1),\
Leg_Bye TINYINT(1),\
Wicket TINYINT(1));")

for i in range(0, 361):
	line = fo.readline()
	if not line.strip():
		continue
	string = line.split()
	j=3
	if(string[2]=="to"):
		bowler = string[1]
	else:
		bowler = string[1] + " " + string[2]
		j=4
	if(string[j].endswith(',')):
		batsman = string[j][:-1]
		j += 1
	else:
		batsman = string[j] + " " + string[j+1][:-1]
		j += 2
	runs=0
	flag=0
	if(string[j]=="(no"):
		x = string[j+2]
		flag=2
	else:
		x = string[j]
	if(x=="no"):
		runs=0
	elif x=="1" and string[j+1]=="run,":
		runs=1
	elif(x=="2"):
		runs=2
	elif(x=="3"):
		runs=3
	elif(x=="FOUR,"):
		runs=4
	elif(x=="SIX,"):
		runs=6
	elif(x=="OUT,"):
		runs=0
		flag=3
	elif x=="1" and string[j+1]=="wide,":
		runs=1
		flag=1
	elif x=="1" and string[j+1]=="leg":
		runs=1
		flag=4
	wide=0
	noBall=0
	out=0
	legBye=0
	if(flag==1):
		wide = 1
	elif(flag==2):
		noBall = 1
	elif(flag==3):
		out = 1
	elif(flag==4):
		legBye = 1
	print ("INSERT INTO Australia(Bowler, Batsman, Runs, Wide, No_Ball, Leg_Bye, Wicket)\
		VALUES (" + "\"" + bowler + "\"" + ", " + "\"" + batsman + "\"" + ", " + str(runs) + ", " + str(wide) + ", " + str(noBall) + ", " + str(legBye) + ", " + str(out) + ");")
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
