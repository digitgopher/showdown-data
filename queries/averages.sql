SELECT 

GROUP_CONCAT(DISTINCT yearID) AS `Years Included`,
CASE yearID 
	WHEN 2001 THEN 2000
	WHEN 2003 THEN 2002
	WHEN 2004 THEN 2002
	WHEN 2005 THEN 2002
	else yearID
END AS `Card Era`,
AVG(points) AS Points,
AVG(speed) AS Speed,
AVG(onbase) AS OB,
AVG(SO) AS SO,
AVG(GB) AS GB,
AVG(FB) AS FB,
AVG(SO + GB + FB) AS `Outs`,
AVG(BB) AS BB,
AVG(1B) AS `1B`,
AVG(1Bplus) AS `1B Plus`,
AVG(CASE WHEN 2B < 20 THEN 2B ELSE 0 END) AS `2B`,
AVG(CASE WHEN 3B < 20 THEN 3B ELSE 0 END) AS `3B`,
AVG(CASE WHEN HR < 20 THEN HR ELSE 0 END) AS `HR`,
AVG(CASE WHEN startingPos1 = 'C' THEN fielding1 WHEN startingPos2 = 'C' THEN fielding2 WHEN startingPos3 = 'C' THEN fielding3 WHEN startingPos4 = 'C' THEN fielding4 END) AS `Catcher Throwing`,
AVG(CASE WHEN startingPos1 = '1B' THEN fielding1 WHEN startingPos2 = '1B' THEN fielding2 WHEN startingPos3 = '1B' THEN fielding3 WHEN startingPos4 = '1B' THEN fielding4 END) AS `1B Fielding`,
AVG(CASE WHEN startingPos1 = '2B' THEN fielding1 WHEN startingPos2 = '2B' THEN fielding2 WHEN startingPos3 = '2B' THEN fielding3 WHEN startingPos4 = '2B' THEN fielding4 END) AS `2B Fielding`,
AVG(CASE WHEN startingPos1 = 'SS' THEN fielding1 WHEN startingPos2 = 'SS' THEN fielding2 WHEN startingPos3 = 'SS' THEN fielding3 WHEN startingPos4 = 'SS' THEN fielding4 END) AS `SS Fielding`,
AVG(CASE WHEN startingPos1 = '3B' THEN fielding1 WHEN startingPos2 = '3B' THEN fielding2 WHEN startingPos3 = '3B' THEN fielding3 WHEN startingPos4 = '3B' THEN fielding4 END) AS `3B Fielding`,
AVG(CASE WHEN startingPos1 = 'LFRF' OR startingPos1 = 'OF' OR startingPos1 = 'CF' THEN fielding1 WHEN startingPos2 = 'LFRF' OR startingPos2 = 'OF' OR startingPos2 = 'CF'THEN fielding2 WHEN startingPos3 = 'LFRF' OR startingPos3 = 'OF' OR startingPos3 = 'CF'THEN fielding3 WHEN startingPos4 = 'LFRF' OR startingPos4 = 'OF' OR startingPos4 = 'CF'THEN fielding4 END) AS `All Outfielders' Fielding`


FROM `batter-cards` GROUP BY `Card Era`;