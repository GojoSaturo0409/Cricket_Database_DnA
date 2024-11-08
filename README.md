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

1. Install MySQL and ensure it’s running.
2. Clone this repository to your local machine.
3. Open the SQL dump file (`sports_database.sql`) in a MySQL client.
4. Execute the SQL file to create the database structure and insert the initial data.

### Prerequisites

- MySQL Server 5.7 or higher

### Importing the Database

Run the following command in your terminal to import the database:

```bash
mysql -u username -p database_name < sports_database.sql
