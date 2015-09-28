# Showdown Data
MLB Showdown card data - finally a comprehensive reference!

Developed for MySQL relational database.

[**Latest data set**](https://github.com/digitgopher/showdown-data/releases/latest) (CSV and JSON files available)

## Quality
When you find errors in the data please contact Daniel Tixier.

## Attribution
Data set created and compiled by Daniel Tixier.

- Modern cards from Colby Tallafus [[blog](http://mlbshowdowncards.blogspot.com/)]
- WOTC data originally compiled by [ShowdownCards.com](http://www.showdowncards.com)
- Baseball season data from [Baseball-Reference](http://www.baseball-reference.com/)

## Showdown Schema

Common to pitchers and batters:
- `nameFirst`: First name
- `nameLast`: Last name
- `nameFull`: Full name
- `yearID`: Card year
- `setID`: BS = Base Set, TD = Trading Deadling, PR = Pennant Run, GU = Cards created by the Guru Colby Tallafuss
- `cardNo`: Card number
- `team`: Team
- `SO`: Number of SO values on chart
- `GB`: Number of GB values on chart
- `FB`: Number of FB values on chart
- `BB`: Number of BB values on chart
- `1B`: Number of 1B values on chart
- `2B`: Number of 2B values on chart; or if printed result range starts at > 20, minimum value to obtain a 2B result
- `HR`: Number of HR values on chart; or if printed result range starts at > 20, minimum value to obtain a HR result
- `points`: Points
- `hand`: Handed-ness of the player

TABLE `batter-cards` specific:
- `onbase`: On-Base value
- `1Bplus`: Number of Single+ values on chart
- `3B`: Number of 3B values on chart; or if printed result range starts at > 20, minimum value to obtain a 3B result
- `speed`: Speed, as a number
- `startingPos1`: A position the batter plays
- `fielding1`: The fielding (or throwing) value for startingPos1
- `startingPos2`: Another position the batter plays, if applicable
- `fielding2`: The fielding (or throwing) value for startingPos2
- `startingPos3`: Another position the batter plays, if applicable
- `fielding3`: The fielding (or throwing) value for startingPos3
- `startingPos4`: Another position the batter plays, if applicable
- `fielding4`: The fielding (or throwing) value for startingPos4
- `TO`: Total outs; sum of SO, GB, and FB.
- `xbh`: Extra base hits; sum of 1Bplus, 2B, 3B, and HR.
- `numPos`: Number of positions played, as printed on card, e.g. OF is one position, etc; Count of `startingPos#` attributes

TABLE `pitcher-cards` specific:
- `control`: Control
- `PU`: Number of PU values on chart
- `IP`: IP (1/3 IP Relievers encoded as integer `13`)
- `Pos`: Position; Starter, Reliever, or Closer


## Season Data
Additionally, there are collected MLB season data optimized for Showdown statistics in the `br` directory.
