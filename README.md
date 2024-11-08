# Sports Database

This repository contains the schema for a sports management database built in MySQL. The database tracks various aspects of a sports organization, including player information, matches, stadiums, sponsorships, and financial terms. It is designed to help manage records related to teams, matches, player statistics, and sponsorships.

## Table of Contents

- [Getting Started](#getting-started)
- [Database Schema](#database-schema)
  - [Achievements](#achievements)
  - [Financial Terms](#financial-terms)
  - [Location](#location)
  - [Matches](#matches)
  - [Player](#player)
  - [Role](#role)
  - [Sponsoring](#sponsoring)
  - [Sponsor](#sponsor)
  - [Sponsoring Team in Match](#sponsoring-team-in-match)
  - [Stadium](#stadium)
  - [Staff](#staff)
  - [Stats](#stats)
- [Data Insertion](#data-insertion)
- [License](#license)

## Getting Started

To set up this database locally:

1. Install MySQL and ensure it's running.
2. Clone this repository to your local machine.
3. Open the SQL dump file (`sports_database.sql`) in a MySQL client.
4. Execute the SQL file to create the database structure and insert the initial data.

### Prerequisites

- MySQL Server 5.7 or higher

### Importing the Database

Run the following command in your terminal to import the database:
```bash
mysql -u username -p database_name < sports_database.sql


## Database Schema
Achievements

Stores achievements and awards related to players.

    Columns:
        Achievement_ID: Unique ID for each achievement.
        Name: Name of the achievement (e.g., "Most Economical Bowler").
        Year: Year the achievement was awarded.

Financial Terms

Defines the financial terms for sponsors.

    Columns:
        TermsID: Unique ID for each term.
        Type: Type of term (e.g., "Accounting").
        Amount: Financial amount associated with the term.

Location

Tracks cities and regions where matches take place.

    Columns:
        City: Name of the city (primary key).
        RegionState: State or region of the city.

Matches

Stores details about matches, including the teams involved, staff assigned, and match details.

    Columns:
        Stadium_ID, Team_ID, Staff_ID: Foreign keys linking to Stadium, Team, and Staff tables.
        MatchDate, MatchTime: Date and time of the match.
        Toss_Winner, Toss_Call: Information on toss results.

Player

Contains information on players within the organization.

    Columns:
        Player_ID: Unique ID for each player.
        Name: Player's name.
        Date_Of_Birth: Player's date of birth.
        Nationality: Player's nationality.
        Team_ID: Foreign key linking to the Team table.

Role

Defines the role (position) of each player in their respective teams.

    Columns:
        Player_ID: Unique ID of the player.
        Name: Role of the player (e.g., "Batsman", "Bowler").

Sponsoring

Tracks sponsorships related to teams.

    Columns:
        Sponsoring_ID: Unique ID for each sponsoring event.
        Sponsor_ID: Foreign key linking to the Sponsor table.
        Team_ID: Foreign key linking to the Team table.

Sponsor

Contains details of sponsors for teams and players.

    Columns:
        Sponsor_ID: Unique ID for each sponsor.
        Name: Name of the sponsor.
        Contact: Contact information of the sponsor.
        City: Foreign key linking to the Location table.
        Terms_ID: Foreign key linking to the Financial_Terms table.

Sponsoring Team in Match

Records sponsorships during specific matches.

    Columns:
        Sponsor_ID, Team_ID, Stadium_ID, Staff_ID: Foreign keys linking to other tables.
        MatchDate, MatchTime: Date and time when the match took place.

Stadium

Defines stadiums where matches are held.

    Columns:
        Stadium_ID: Unique ID for each stadium.
        Name: Name of the stadium.
        Capacity: Seating capacity of the stadium.
        City: Foreign key linking to the Location table.

Staff

Stores information on the staff assigned to stadiums and teams.

    Columns:
        Staff_ID: Unique ID for each staff member.
        Name: Name of the staff member.
        Age, Department: Age and department of the staff member.
        Stadium_ID: Foreign key linking to the Stadium table.

Stats

Keeps records of player statistics.

    Columns:
        Player_ID: Unique ID for the player.
        Total_Runs, Total_Wickets: Performance stats of the player.
        Achievement_ID: Foreign key linking to the Achievements table.
