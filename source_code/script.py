import subprocess as sp
import pymysql
import pymysql.cursors


def addplayer():
    print("Enter the details of the player to be added:")
    name=input("Name: ")
    doby=input("Year of Birth: ")
    dobm=input("Month of Birth: ")
    dobd=input("Day of Birth: ")
    team=input("Team: ")
    nat=input("Nationality: ")
    salary=input("Salary: ")
    role=input("Role: ")
    query1=f"SELECT Team_ID FROM Team WHERE Name='{team}';"
    cur.execute(query1)
    result1=cur.fetchall()
    if(len(result1)==0):
        print("Team does not exist")
        return
    teamid=result1[0]['Team_ID']
    query=f"SELECT Player_ID FROM Player ORDER BY Player_ID DESC;"
    cur.execute(query)
    result=cur.fetchall()
    playerid=result[0]['Player_ID']+1
    query=f"INSERT INTO Player(Player_ID,Name,Year_of_Birth,Month_of_Birth,Day_of_Birth,Base_Salary,Nationality,Team_ID) VALUES ({playerid},'{name}',{doby},{dobm},{dobd},{salary},'{nat}',{teamid});"
    cur.execute(query)
    con.commit()
    # print("Player inserted successfully")
    
    print("Enter Player Statistics:")
    truns=input("Total Runs: ")
    twickets=input("Total Wickets: ")
    tmatches=input("Total Matches: ")
    acheivements=input("Acheivements: ")
    #write query to insert into player statistics
    queryach=f"SELECT Achievement_ID FROM Achievements WHERE Name='{acheivements}';"
    cur.execute(queryach)
    resultach=cur.fetchall()
    if(len(resultach)==0):
        print("Achievement does not exist")
        return
    acheivementid=resultach[0]['Achievement_ID']
    queryaddstat=f"INSERT INTO Stats VALUES ({playerid},{teamid},{truns},{twickets},{tmatches},{acheivementid});"
    if(cur.execute(queryaddstat)):
        print("Player inserted successfully")
    con.commit()
    return
    
    
def addsponsor():
    print("Enter the details of the sponsor to be added:")
    spname=input("Sponsor name: ")
    spemail=input("Sponsor email: ")
    spcity=input("Sponsor city: ")
    termtype=input("Enter Financial Term Type: ")
    amount=input("Enter Amount: ")        
    clausetype=input("Enter Clause Type: ")
    dur=input("Enter duration(in years): ")
    teamname=input("Enter Team Name: ")
    query=f"SELECT Team_ID FROM Team WHERE Name ='{teamname}';"
    cur.execute(query)
    result=cur.fetchall()
    if(len(result)==0):
        print("Entered Wrong Team")
        return
    
    query=f"SELECT TermsID FROM Financial_Terms ORDER BY TermsID DESC;"
    cur.execute(query)
    result=cur.fetchall()
    ntid=result[0]['TermsID']+1
    query=f"INSERT INTO Financial_Terms VALUES ({ntid},'{termtype}',{amount});"
    cur.execute(query)
    con.commit()
    latestfinanid=ntid
    query=f"SELECT ClausesID FROM Termination_Clauses ORDER BY ClausesID DESC;"
    cur.execute(query)
    result=cur.fetchall()
    ctid=result[0]['ClausesID']+1
    query=f"INSERT INTO Termination_Clauses VALUES ({ctid},'{clausetype}',{dur});"
    cur.execute(query)
    con.commit()
    lastestclauseid=ctid
    query=f"SELECT Sponsor_ID FROM Sponsor ORDER BY Sponsor_ID DESC;"
    cur.execute(query)
    result=cur.fetchall()
    nsid=result[0]['Sponsor_ID']+1
    query=f"INSERT INTO Sponsor VALUES ({nsid},'{spname}','{spemail}','{spcity}',{latestfinanid},{lastestclauseid});"
    cur.execute(query)
    con.commit()
    query=f"SELECT Team_ID FROM Team WHERE Name='{teamname}';"
    cur.execute(query)
    teamids=cur.fetchall()
    teamid=int(teamids[0]['Team_ID'])
    query=f"SELECT Sponsoring_ID FROM SPONSORING ORDER BY Sponsoring_ID DESC;"
    cur.execute(query)
    result=cur.fetchall()
    nspid=result[0]['Sponsoring_ID']+1
    query=f"INSERT INTO SPONSORING VALUES ({nspid},{nsid},{teamid});"
    cur.execute(query)
    con.commit()


def deleteplayer():
     pname=input("Enter Player Name to delete: ")
     query=f"SELECT * FROM Player WHERE Name='{pname}';"
     cur.execute(query)
     result=cur.fetchall()
     if(len(result)==0):
        print("Invalid player name!")
        return
     query=f"DELETE FROM Player WHERE Name='{pname}'"
     cur.execute(query)
     con.commit()
     print("Deleted successfully")

def deletesponsor():
     sname=input("Enter Sponsor Name to delete: ")
     query=f"SELECT * FROM Sponsor WHERE Name='{sname}';"
     cur.execute(query)
     result=cur.fetchall()
     if(len(result)==0):
        print("Invalid sponsor name!")
        return
     query=f"DELETE FROM Sponsor WHERE Name='{sname}';"
     cur.execute(query)
     con.commit()
     print("Deleted successfully")

def updatestats():
     pname=input("Enter Player Name to update his stats: ")
     query=f"SELECT * FROM Player WHERE Name='{pname}';"
     cur.execute(query)
     result=cur.fetchall()
     if(len(result)==0):
        print("Invalid player name!")
        return
     playerid=result[0]['Player_ID']
     runs=input("Enter runs scored in the match: ")
     wickets=input("Enter wickets taken in the match: ")
     query=f"SELECT Total_Runs,Total_Wickets,Total_Matches FROM Stats WHERE Player_ID={playerid};"
     cur.execute(query)
     result=cur.fetchall()
     total_runs= int( result[0]['Total_Runs']) + int(runs)
     total_wickets=int(result[0]['Total_Wickets']) + int(wickets)
     total_matches=int(result[0]['Total_Matches']) + 1
     query=f"UPDATE Stats SET Total_Runs={total_runs},Total_Wickets={total_wickets},Total_Matches={total_matches} WHERE Player_ID={playerid};"
     cur.execute(query)
     con.commit()
     print("Update player's stats successfully")
     
def updatemanager():
     tname=input("Enter Team Name: ")
     query=f"SELECT Team.Team_ID FROM Team WHERE Team.Name='{tname}';"
     cur.execute(query)
     result=cur.fetchall()
     if(len(result)==0):
            print("team name are invalid!")
            return
     teamid=result[0]['Team_ID']
     nmanager=input("Enter Manager Name: ")
     query=f"SELECT Team_Manager.Manager_ID FROM Team_Manager WHERE Team_Manager.Name='{nmanager}' AND Team_Manager.Team_ID={teamid};"
     cur.execute(query)
     result=cur.fetchall()
     if(len(result)==0):
            print("manager name are invalid!")
            return
     query=f"UPDATE Team_Manager SET Team_Manager.Team_ID=NULL WHERE Team_Manager.Name='{nmanager}';"
     cur.execute(query)
     con.commit()
     print("Enter New Manager Details")
     newm=input("Enter the name of the new manager to be added:")
     newmemail=input("Enter the email of the new manager to be added:")
     query=f"SELECT Team_Manager.Manager_ID FROM Team_Manager ORDER BY Team_Manager.Manager_ID DESC;"
     cur.execute(query)
     result=cur.fetchall()
     nmid=result[0]['Manager_ID']+1
     query=f"INSERT INTO Team_Manager (Manager_ID,Name,Email,Team_ID) VALUES ({nmid},'{newm}','{newmemail}',{teamid});"
     cur.execute(query)
     con.commit()
     print("Updated successfully")



def showsponsors():
     teamname=input("Enter Name of Team :")
     query=f"SELECT Sponsor.Name,Sponsor.Email FROM Team JOIN SPONSORING ON Team.Team_ID = SPONSORING.Team_ID JOIN Sponsor ON Sponsor.Sponsor_ID = SPONSORING.Sponsor_ID WHERE Team.Name = '{teamname}';"
     cur.execute(query)
     result=cur.fetchall()
     if(len(result)==0):
          print("NO Sponsor Founds for this Team")
     for r in result:
          print(f"Sponsor Name : {r['Name']}, Sponsor Email ID :  {r['Email']}")
     return 

def showplayerswithcentury():
     query="SELECT Player.Name FROM Player JOIN Stats ON Player.Player_ID=Stats.Player_ID JOIN Achievements on Stats.Achievement_ID=Achievements.Achievement_ID WHERE Achievements.Name='Century';"
     cur.execute(query)
     result=cur.fetchall()
     if(len(result)==0):
       print("No player with century found")
       return
     for i in result:
          print(f"{i['Name']} has made a Century")

def showplayer():
     print("dceiceicie")
     teamname=input("Enter Name of Team :")
     query=f"SELECT Player.Name AS Nameofplayer FROM Player,Team WHERE Player.Team_ID = Team.Team_ID AND Team.Name = '{teamname}';"
     cur.execute(query)
     result=cur.fetchall()
     if(len(result)==0):
          print("No Player plays in this Team")
     for i in result:
          print(f"Player Name : {i['Nameofplayer']}")


def showhatrickplayers():
     # Verify query
     query="SELECT Player.Name FROM Player JOIN Stats ON Player.Player_ID=Stats.Player_ID JOIN Achievements on Stats.Achievement_ID=Achievements.Achievement_ID WHERE Achievements.Name='3-Wicket Haul';"
     cur.execute(query)
     result=cur.fetchall()
     if(len(result)==0):
       print("No player with 3 wicket haul found")
     for i in result:
          print(f"{i['Name']} has a 3 wicket Haul")

def showmaxrunplayer():
     query="SELECT Player.Name,Stats.Total_Runs FROM Player JOIN Stats ON Player.Player_ID=Stats.Player_ID WHERE Stats.Total_RUNS IN (SELECT MAX(Total_Runs) FROM Stats) LIMIT 1;"
     cur.execute(query)
     result=cur.fetchall()
    #  for i in result[1]:
        #   print(i)
     if(len(result)==0):
          print("No player found")
          return
     print(f"Max Runs are scored by {result[0]['Name']} having total runs {result[0]['Total_Runs']}")


def showplayerswith():
     str=input("Enter Player Starting Name")
     query=f"SELECT Player.Player_ID,Player.Name FROM Player WHERE Player.Name LIKE '{str}%';"
     cur.execute(query)
     result=cur.fetchall()
     if(len(result)==0):
          print("No Player Name starts with %s",str)
     for i in result:
          print(f"Player ID : {i['Player_ID']}  Player Name : {i['Name']}")
     return 

def showteamwithmostruns():
     query=f"SELECT Team.Name,SUM(Stats.Total_Runs) AS Total FROM Team JOIN Player on Player.Team_ID=Team.Team_ID JOIN Stats on Player.Player_ID=Stats.Player_ID GROUP BY Team.Team_ID ORDER BY Total DESC LIMIT 1;"
     cur.execute(query)
     result=cur.fetchall()
     for i in result:
          print(f"Team Name : {i['Name']}  Total Runs : {i['Total']}")     
     return
 


def showteamwithmaxsponsors():
     query=f"SELECT Team.Name,Count(*) AS NumberofSponsors FROM Team JOIN SPONSORING ON Team.Team_ID = SPONSORING.Team_ID JOIN Sponsor ON Sponsor.Sponsor_ID = SPONSORING.Sponsor_ID GROUP BY Team.Team_ID ORDER BY NumberofSponsors DESC LIMIT 1 ;"
     cur.execute(query)
     result=cur.fetchall()
     if(len(result)==0):
          print("No Sponsors of Teams Found")
          return
     for i in result:
          print(f"Team with highest Sponsor: {i['Name']}, with total {i['NumberofSponsors']} Sponsors")


def showmaxsixes():
     query="SELECT Player.Name FROM Player JOIN Stats ON Player.Player_ID=Stats.Player_ID JOIN Achievements on Stats.Achievement_ID=Achievements.Achievement_ID WHERE Achievements.Name='Maximum Sixes' LIMIT 1;"
     cur.execute(query)
     result=cur.fetchall()
     if(len(result)==0):
       print("No player with century found")
    #  for i in result['Player.Name']:
        #   print(i)
     print(f"{result[0]['Name']} has highest number of Sixes")

def dispatch_audience(ch):
    if(ch==1):
        showsponsors()
    elif(ch==2):
        showplayer()
    elif(ch==3):
        showplayerswithcentury()
    elif(ch==4):
        showhatrickplayers()
    elif(ch==5):
        showmaxrunplayer()
    elif(ch==6):
        showmaxsixes()
    elif(ch==7):
        showplayerswith()
    elif(ch==8):
        showteamwithmostruns()
    else:
        print("Invalid option!") 

def dispatch_team(ch):
    if(ch==1):
        addplayer()
    elif(ch==2):
        showplayer()
    elif(ch==3):
        showplayerswithcentury()
    elif(ch==4):
        showhatrickplayers()
    elif(ch==5):
        showmaxrunplayer()
    elif(ch==6):
        showmaxsixes()
    elif(ch==7):
        showteamwithmostruns()
    else:
        print("Invalid option!") 

def dispatch(ch):
    if (ch == 1):
        addplayer()
    elif (ch == 2):
        addsponsor()
    elif (ch == 3):
        deleteplayer()
    elif (ch == 4):
        deletesponsor()
    elif (ch == 5):
        updatestats()
    elif (ch == 6):
        updatemanager()
    elif (ch == 7):
        showsponsors()
    elif (ch == 8):
        showplayer()
    elif (ch == 9):
        showplayerswithcentury()
    elif (ch == 10):
        showhatrickplayers()
    elif (ch == 11):
        showmaxrunplayer()
    elif (ch == 12):
        showmaxsixes()
    elif (ch == 13):
        showplayerswith()
    elif (ch == 14):
        showteamwithmostruns()
    elif (ch == 15):
        showteamwithmaxsponsors()
    else:
        print("Error: Invalid Option")



def choice_main():
    print("Options are listed below as:")
    print("1) Insert a Player into a team")
    print("2) Add an Sponsor with the team")
    print("3) Delete a specified Player")
    print("4) Delete a Sponsor from team")
    print("5) Update records of a Player after the match")
    print("6) Update records of a Manager")
    print("7) Show Sponsors of a team")
    print("8) Show players of a team")
    print("9) Display players who scored a century")
    print("10) Display players who had a 3-wicket haul")
    print("11) Show Max. Runs Scored by a Player")
    print("12) Show Max. sixes achieved by a player")
    print("13) Search players whose name starts with")
    print("14) Show team with most number of runs ")
    print("15) Show team with most sponsors")
    print("16) Exit")
    ch = int(input("Enter choice> "))
    tmp = sp.call('clear', shell=True)
    if ch == 16:
        exit()
    else:
        dispatch(ch)
     #    tmp = input("Enter any key to CONTINUE")
 
while(1):
    tmp = sp.call('clear', shell=True)
    con = pymysql.connect(host='localhost',
                          user='root',
                          password='9xpkc3d2uS',
                          db='final',
                          cursorclass=pymysql.cursors.DictCursor)
    tmp = sp.call('clear', shell=True)
    if(con.open):
        print("Connected")
    else:
        print("Failed to connect")
    tmp = input("Enter any key to CONTINUE>")
    with con.cursor() as cur:
        while(1):
            tmp = sp.call('clear', shell=True)
            choice_main()
            tmp = input("Enter any key to CONTINUE>")