# Batting Averages Backend Exercise

Batting average is simple and a common way to measure batter’s performance.
Create an app that will ingest a raw CSV file with player statistics and
provide will provide player rankings based on their batting performance.

## Input

The application should take an input in form of a CSV file. The file will be
comma separated CSV with headers. The headers that interest you are: “playerID”,
“yearID”, “stint”, teamID”, “AB”, and “H”.

The application should also accept filter options:
- Year
- Team name
- Year and Team name

When filter are present, the output should include only players that match
the filter, sorted according to their batting average.


## Expected output

Batting Average is calculated as: BA = H/AB (Hits / At Bats).

If the player has more stints in the season, calculate batting average for the
whole season (across all stints), team names are comma separated in that case.
Format the batting average to 3 decimals.

You can write a standalone command line app, or you can write a web API along
with simple client.

The output should be like a following table:

```
+----------+--------+--------------+-----------------+
| playerID | yearId | Team name(s) | Batting Average |
+----------+--------+--------------+-----------------+
| ...                                                |
+----------------------------------------------------+
```


## CSV files

The input CSV file is `Batting.csv`. This file includes "teamID", use the
file `Teams.csv` to map "teamID" to a team's real name. You can process the
teams file and have the data ready in your app to map out "teamID" to team
names, it doesn't need to be uploaded from the user.


## Guidelines

* Use any of the major languages that can be run on OSX
* The app can be command line or provide an API over HTTP with command line
  client
* Do not fork this repo, create a clean one for a solution
* Feel free to ask for any clarification


## Installation

Ruby 2.6.6

> bundle install
> chmod +x ./bin/bat.rb

## User Guide

 > bin/bat.rb -h
```bash
Usage: bat [options]
    -y, --year YEAR                  Filter by Year
    -t, --team NAME                  Filter by the Team name
```

filter by Year
> bin/bat.rb -y 2019

filter by Team name
>bin/bat.rb -t "San Diego Padres"

or use both
> bin/bat.rb -y 2019 -t "San Diego Padres"
```bash
+-----------+--------+------------------+-----------------+
| playerID  | yearId | Team name(s)     | Batting Average |
+-----------+--------+------------------+-----------------+
| cordefr02 | 2019   | San Diego Padres | 0.333           |
| tatisfe02 | 2019   | San Diego Padres | 0.317           |
| strahma01 | 2019   | San Diego Padres | 0.286           |
| mejiafr01 | 2019   | San Diego Padres | 0.265           |
| hosmeer01 | 2019   | San Diego Padres | 0.265           |
| machama01 | 2019   | San Diego Padres | 0.256           |
| reyesfr01 | 2019   | San Diego Padres | 0.255           |
| matonph01 | 2019   | San Diego Padres | 0.25            |
| allenlo01 | 2019   | San Diego Padres | 0.25            |
| naylojo01 | 2019   | San Diego Padres | 0.249           |
| garcigr01 | 2019   | San Diego Padres | 0.248           |
| martini02 | 2019   | San Diego Padres | 0.244           |
| myerswi01 | 2019   | San Diego Padres | 0.239           |
| margoma01 | 2019   | San Diego Padres | 0.234           |
| francty01 | 2019   | San Diego Padres | 0.234           |
| mejiase01 | 2019   | San Diego Padres | 0.233           |
| uriaslu01 | 2019   | San Diego Padres | 0.223           |
```

save to file
> bin/bat.rb -y 2019 > batting2019.txt

