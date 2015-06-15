SELECT
COUNT(*) AS Count,
a.yearID AS `Card Year`,

-- Points
Points_avg,
Points_sd,
SUM((points-Points_avg)*(points-Points_avg)*(points-Points_avg))/(N*Points_sd*Points_sd*Points_sd) AS Points_skew,
SUM((points-Points_avg)*(points-Points_avg)*(points-Points_avg)*(points-Points_avg)/(N*Points_sd*Points_sd*Points_sd*Points_sd))-3 AS Points_kurt,

-- Speed
Speed_avg,
Speed_sd,
SUM((speed-Speed_avg)*(speed-Speed_avg)*(speed-Speed_avg))/(N*Speed_sd*Speed_sd*Speed_sd) AS Speed_skew,
SUM((speed-Speed_avg)*(speed-Speed_avg)*(speed-Speed_avg)*(speed-Speed_avg)/(N*Speed_sd*Speed_sd*Speed_sd*Speed_sd))-3 AS Speed_kurt,

-- OB
OB_avg,
OB_sd,
SUM((onbase-OB_avg)*(onbase-OB_avg)*(onbase-OB_avg))/(N*OB_sd*OB_sd*OB_sd) AS OB_skew,
SUM((onbase-OB_avg)*(onbase-OB_avg)*(onbase-OB_avg)*(onbase-OB_avg)/(N*OB_sd*OB_sd*OB_sd*OB_sd))-3 AS OB_kurt,

-- SO
SO_avg,
SO_sd,
SUM((SO-SO_avg)*(SO-SO_avg)*(SO-SO_avg))/(N*SO_sd*SO_sd*SO_sd) AS SO_skew,
SUM((SO-SO_avg)*(SO-SO_avg)*(SO-SO_avg)*(SO-SO_avg)/(N*SO_sd*SO_sd*SO_sd*SO_sd))-3 AS SO_kurt,

-- GB
GB_avg,
GB_sd,
SUM((GB-GB_avg)*(GB-GB_avg)*(GB-GB_avg))/(N*GB_sd*GB_sd*GB_sd) AS GB_skew,
SUM((GB-GB_avg)*(GB-GB_avg)*(GB-GB_avg)*(GB-GB_avg)/(N*GB_sd*GB_sd*GB_sd*GB_sd))-3 AS GB_kurt,

-- FB
FB_avg,
FB_sd,
SUM((FB-FB_avg)*(FB-FB_avg)*(FB-FB_avg))/(N*FB_sd*FB_sd*FB_sd) AS FB_skew,
SUM((FB-FB_avg)*(FB-FB_avg)*(FB-FB_avg)*(FB-FB_avg)/(N*FB_sd*FB_sd*FB_sd*FB_sd))-3 AS FB_kurt,

-- Outs
Outs_avg,
Outs_sd,
SUM((SO + GB + FB-Outs_avg)*(SO + GB + FB-Outs_avg)*(SO + GB + FB-Outs_avg))/(N*Outs_sd*Outs_sd*Outs_sd) AS Outs_skew,
SUM((SO + GB + FB-Outs_avg)*(SO + GB + FB-Outs_avg)*(SO + GB + FB-Outs_avg)*(SO + GB + FB-Outs_avg)/(N*Outs_sd*Outs_sd*Outs_sd*Outs_sd))-3 AS Outs_kurt,

-- BB
BB_avg,
BB_sd,
SUM((BB-BB_avg)*(BB-BB_avg)*(BB-BB_avg))/(N*BB_sd*BB_sd*BB_sd) AS BB_skew,
SUM((BB-BB_avg)*(BB-BB_avg)*(BB-BB_avg)*(BB-BB_avg)/(N*BB_sd*BB_sd*BB_sd*BB_sd))-3 AS BB_kurt,

-- 1B
1B_avg,
1B_sd,
SUM((1B-1B_avg)*(1B-1B_avg)*(1B-1B_avg))/(N*1B_sd*1B_sd*1B_sd) AS 1B_skew,
SUM((1B-1B_avg)*(1B-1B_avg)*(1B-1B_avg)*(1B-1B_avg)/(N*1B_sd*1B_sd*1B_sd*1B_sd))-3 AS 1B_kurt,

-- 2B
2B_avg,
2B_sd,
SUM((CASE WHEN 2B < 20 THEN 2B ELSE 0 END-2B_avg)*(CASE WHEN 2B < 20 THEN 2B ELSE 0 END-2B_avg)*(CASE WHEN 2B < 20 THEN 2B ELSE 0 END-2B_avg))/(N*2B_sd*2B_sd*2B_sd) AS 2B_skew,
SUM((CASE WHEN 2B < 20 THEN 2B ELSE 0 END-2B_avg)*(CASE WHEN 2B < 20 THEN 2B ELSE 0 END-2B_avg)*(CASE WHEN 2B < 20 THEN 2B ELSE 0 END-2B_avg)*(CASE WHEN 2B < 20 THEN 2B ELSE 0 END-2B_avg)/(N*2B_sd*2B_sd*2B_sd*2B_sd))-3 AS 2B_kurt,

-- 3B
3B_avg,
3B_sd,
SUM((CASE WHEN 3B < 20 THEN 3B ELSE 0 END-3B_avg)*(CASE WHEN 3B < 20 THEN 3B ELSE 0 END-3B_avg)*(CASE WHEN 3B < 20 THEN 3B ELSE 0 END-3B_avg))/(N*3B_sd*3B_sd*3B_sd) AS 3B_skew,
SUM((CASE WHEN 3B < 20 THEN 3B ELSE 0 END-3B_avg)*(CASE WHEN 3B < 20 THEN 3B ELSE 0 END-3B_avg)*(CASE WHEN 3B < 20 THEN 3B ELSE 0 END-3B_avg)*(CASE WHEN 3B < 20 THEN 3B ELSE 0 END-3B_avg)/(N*3B_sd*3B_sd*3B_sd*3B_sd))-3 AS 3B_kurt,

-- HR
HR_avg,
HR_sd,
SUM((CASE WHEN HR < 20 THEN HR ELSE 0 END-HR_avg)*(CASE WHEN HR < 20 THEN HR ELSE 0 END-HR_avg)*(CASE WHEN HR < 20 THEN HR ELSE 0 END-HR_avg))/(N*HR_sd*HR_sd*HR_sd) AS HR_skew,
SUM((CASE WHEN HR < 20 THEN HR ELSE 0 END-HR_avg)*(CASE WHEN HR < 20 THEN HR ELSE 0 END-HR_avg)*(CASE WHEN HR < 20 THEN HR ELSE 0 END-HR_avg)*(CASE WHEN HR < 20 THEN HR ELSE 0 END-HR_avg)/(N*HR_sd*HR_sd*HR_sd*HR_sd))-3 AS HR_kurt,

-- Catcher Throwing
`Catcher Throwing_avg`,
`Catcher Throwing_sd`,
SUM((CASE WHEN startingPos1 = 'C' THEN fielding1 WHEN startingPos2 = 'C' THEN fielding2 WHEN startingPos3 = 'C' THEN fielding3 WHEN startingPos4 = 'C' THEN fielding4 END-`Catcher Throwing_avg`)*(CASE WHEN startingPos1 = 'C' THEN fielding1 WHEN startingPos2 = 'C' THEN fielding2 WHEN startingPos3 = 'C' THEN fielding3 WHEN startingPos4 = 'C' THEN fielding4 END-`Catcher Throwing_avg`)*(CASE WHEN startingPos1 = 'C' THEN fielding1 WHEN startingPos2 = 'C' THEN fielding2 WHEN startingPos3 = 'C' THEN fielding3 WHEN startingPos4 = 'C' THEN fielding4 END-`Catcher Throwing_avg`))/(N*`Catcher Throwing_sd`*`Catcher Throwing_sd`*`Catcher Throwing_sd`) AS `Catcher Throwing_skew`,
SUM((CASE WHEN startingPos1 = 'C' THEN fielding1 WHEN startingPos2 = 'C' THEN fielding2 WHEN startingPos3 = 'C' THEN fielding3 WHEN startingPos4 = 'C' THEN fielding4 END-`Catcher Throwing_avg`)*(CASE WHEN startingPos1 = 'C' THEN fielding1 WHEN startingPos2 = 'C' THEN fielding2 WHEN startingPos3 = 'C' THEN fielding3 WHEN startingPos4 = 'C' THEN fielding4 END-`Catcher Throwing_avg`)*(CASE WHEN startingPos1 = 'C' THEN fielding1 WHEN startingPos2 = 'C' THEN fielding2 WHEN startingPos3 = 'C' THEN fielding3 WHEN startingPos4 = 'C' THEN fielding4 END-`Catcher Throwing_avg`)*(CASE WHEN startingPos1 = 'C' THEN fielding1 WHEN startingPos2 = 'C' THEN fielding2 WHEN startingPos3 = 'C' THEN fielding3 WHEN startingPos4 = 'C' THEN fielding4 END-`Catcher Throwing_avg`)/(N*`Catcher Throwing_sd`*`Catcher Throwing_sd`*`Catcher Throwing_sd`*`Catcher Throwing_sd`))-3 AS `Catcher Throwing_kurt`,

-- 1B Fielding
`1B Fielding_avg`,
`1B Fielding_sd`,
SUM((CASE WHEN startingPos1 = '1B' THEN fielding1 WHEN startingPos2 = '1B' THEN fielding2 WHEN startingPos3 = '1B' THEN fielding3 WHEN startingPos4 = '1B' THEN fielding4 END-`1B Fielding_avg`)*(CASE WHEN startingPos1 = '1B' THEN fielding1 WHEN startingPos2 = '1B' THEN fielding2 WHEN startingPos3 = '1B' THEN fielding3 WHEN startingPos4 = '1B' THEN fielding4 END-`1B Fielding_avg`)*(CASE WHEN startingPos1 = '1B' THEN fielding1 WHEN startingPos2 = '1B' THEN fielding2 WHEN startingPos3 = '1B' THEN fielding3 WHEN startingPos4 = '1B' THEN fielding4 END-`1B Fielding_avg`))/(N*`1B Fielding_sd`*`1B Fielding_sd`*`1B Fielding_sd`) AS `1B Fielding_skew`,
SUM((CASE WHEN startingPos1 = '1B' THEN fielding1 WHEN startingPos2 = '1B' THEN fielding2 WHEN startingPos3 = '1B' THEN fielding3 WHEN startingPos4 = '1B' THEN fielding4 END-`1B Fielding_avg`)*(CASE WHEN startingPos1 = '1B' THEN fielding1 WHEN startingPos2 = '1B' THEN fielding2 WHEN startingPos3 = '1B' THEN fielding3 WHEN startingPos4 = '1B' THEN fielding4 END-`1B Fielding_avg`)*(CASE WHEN startingPos1 = '1B' THEN fielding1 WHEN startingPos2 = '1B' THEN fielding2 WHEN startingPos3 = '1B' THEN fielding3 WHEN startingPos4 = '1B' THEN fielding4 END-`1B Fielding_avg`)*(CASE WHEN startingPos1 = '1B' THEN fielding1 WHEN startingPos2 = '1B' THEN fielding2 WHEN startingPos3 = '1B' THEN fielding3 WHEN startingPos4 = '1B' THEN fielding4 END-`1B Fielding_avg`)/(N*`1B Fielding_sd`*`1B Fielding_sd`*`1B Fielding_sd`*`1B Fielding_sd`))-3 AS `1B Fielding_kurt`,

-- 2B Fielding
`2B Fielding_avg`,
`2B Fielding_sd`,
SUM((CASE WHEN startingPos1 = '2B' THEN fielding1 WHEN startingPos2 = '2B' THEN fielding2 WHEN startingPos3 = '2B' THEN fielding3 WHEN startingPos4 = '2B' THEN fielding4 END-`2B Fielding_avg`)*(CASE WHEN startingPos1 = '2B' THEN fielding1 WHEN startingPos2 = '2B' THEN fielding2 WHEN startingPos3 = '2B' THEN fielding3 WHEN startingPos4 = '2B' THEN fielding4 END-`2B Fielding_avg`)*(CASE WHEN startingPos1 = '2B' THEN fielding1 WHEN startingPos2 = '2B' THEN fielding2 WHEN startingPos3 = '2B' THEN fielding3 WHEN startingPos4 = '2B' THEN fielding4 END-`2B Fielding_avg`))/(N*`2B Fielding_sd`*`2B Fielding_sd`*`2B Fielding_sd`) AS `2B Fielding_skew`,
SUM((CASE WHEN startingPos1 = '2B' THEN fielding1 WHEN startingPos2 = '2B' THEN fielding2 WHEN startingPos3 = '2B' THEN fielding3 WHEN startingPos4 = '2B' THEN fielding4 END-`2B Fielding_avg`)*(CASE WHEN startingPos1 = '2B' THEN fielding1 WHEN startingPos2 = '2B' THEN fielding2 WHEN startingPos3 = '2B' THEN fielding3 WHEN startingPos4 = '2B' THEN fielding4 END-`2B Fielding_avg`)*(CASE WHEN startingPos1 = '2B' THEN fielding1 WHEN startingPos2 = '2B' THEN fielding2 WHEN startingPos3 = '2B' THEN fielding3 WHEN startingPos4 = '2B' THEN fielding4 END-`2B Fielding_avg`)*(CASE WHEN startingPos1 = '2B' THEN fielding1 WHEN startingPos2 = '2B' THEN fielding2 WHEN startingPos3 = '2B' THEN fielding3 WHEN startingPos4 = '2B' THEN fielding4 END-`2B Fielding_avg`)/(N*`2B Fielding_sd`*`2B Fielding_sd`*`2B Fielding_sd`*`2B Fielding_sd`))-3 AS `2B Fielding_kurt`,

-- `SS Fielding`
`SS Fielding_avg`,
`SS Fielding_sd`,
SUM((CASE WHEN startingPos1 = 'SS' THEN fielding1 WHEN startingPos2 = 'SS' THEN fielding2 WHEN startingPos3 = 'SS' THEN fielding3 WHEN startingPos4 = 'SS' THEN fielding4 END-`SS Fielding_avg`)*(CASE WHEN startingPos1 = 'SS' THEN fielding1 WHEN startingPos2 = 'SS' THEN fielding2 WHEN startingPos3 = 'SS' THEN fielding3 WHEN startingPos4 = 'SS' THEN fielding4 END-`SS Fielding_avg`)*(CASE WHEN startingPos1 = 'SS' THEN fielding1 WHEN startingPos2 = 'SS' THEN fielding2 WHEN startingPos3 = 'SS' THEN fielding3 WHEN startingPos4 = 'SS' THEN fielding4 END-`SS Fielding_avg`))/(N*`SS Fielding_sd`*`SS Fielding_sd`*`SS Fielding_sd`) AS `SS Fielding_skew`,
SUM((CASE WHEN startingPos1 = 'SS' THEN fielding1 WHEN startingPos2 = 'SS' THEN fielding2 WHEN startingPos3 = 'SS' THEN fielding3 WHEN startingPos4 = 'SS' THEN fielding4 END-`SS Fielding_avg`)*(CASE WHEN startingPos1 = 'SS' THEN fielding1 WHEN startingPos2 = 'SS' THEN fielding2 WHEN startingPos3 = 'SS' THEN fielding3 WHEN startingPos4 = 'SS' THEN fielding4 END-`SS Fielding_avg`)*(CASE WHEN startingPos1 = 'SS' THEN fielding1 WHEN startingPos2 = 'SS' THEN fielding2 WHEN startingPos3 = 'SS' THEN fielding3 WHEN startingPos4 = 'SS' THEN fielding4 END-`SS Fielding_avg`)*(CASE WHEN startingPos1 = 'SS' THEN fielding1 WHEN startingPos2 = 'SS' THEN fielding2 WHEN startingPos3 = 'SS' THEN fielding3 WHEN startingPos4 = 'SS' THEN fielding4 END-`SS Fielding_avg`)/(N*`SS Fielding_sd`*`SS Fielding_sd`*`SS Fielding_sd`*`SS Fielding_sd`))-3 AS `SS Fielding_kurt`,

-- `3B Fielding_sd`
`3B Fielding_avg`,
`3B Fielding_sd`,
SUM((CASE WHEN startingPos1 = '3B' THEN fielding1 WHEN startingPos2 = '3B' THEN fielding2 WHEN startingPos3 = '3B' THEN fielding3 WHEN startingPos4 = '3B' THEN fielding4 END-`3B Fielding_avg`)*(CASE WHEN startingPos1 = '3B' THEN fielding1 WHEN startingPos2 = '3B' THEN fielding2 WHEN startingPos3 = '3B' THEN fielding3 WHEN startingPos4 = '3B' THEN fielding4 END-`3B Fielding_avg`)*(CASE WHEN startingPos1 = '3B' THEN fielding1 WHEN startingPos2 = '3B' THEN fielding2 WHEN startingPos3 = '3B' THEN fielding3 WHEN startingPos4 = '3B' THEN fielding4 END-`3B Fielding_avg`))/(N*`3B Fielding_sd`*`3B Fielding_sd`*`3B Fielding_sd`) AS `3B Fielding_skew`,
SUM((CASE WHEN startingPos1 = '3B' THEN fielding1 WHEN startingPos2 = '3B' THEN fielding2 WHEN startingPos3 = '3B' THEN fielding3 WHEN startingPos4 = '3B' THEN fielding4 END-`3B Fielding_avg`)*(CASE WHEN startingPos1 = '3B' THEN fielding1 WHEN startingPos2 = '3B' THEN fielding2 WHEN startingPos3 = '3B' THEN fielding3 WHEN startingPos4 = '3B' THEN fielding4 END-`3B Fielding_avg`)*(CASE WHEN startingPos1 = '3B' THEN fielding1 WHEN startingPos2 = '3B' THEN fielding2 WHEN startingPos3 = '3B' THEN fielding3 WHEN startingPos4 = '3B' THEN fielding4 END-`3B Fielding_avg`)*(CASE WHEN startingPos1 = '3B' THEN fielding1 WHEN startingPos2 = '3B' THEN fielding2 WHEN startingPos3 = '3B' THEN fielding3 WHEN startingPos4 = '3B' THEN fielding4 END-`3B Fielding_avg`)/(N*`3B Fielding_sd`*`3B Fielding_sd`*`3B Fielding_sd`*`3B Fielding_sd`))-3 AS `3B Fielding_kurt`,

-- `All Outfielders' Fielding_sd`
`All Outfielders' Fielding_avg`,
`All Outfielders' Fielding_sd`,
SUM((CASE WHEN startingPos1 = 'LFRF' OR startingPos1 = 'OF' OR startingPos1 = 'CF' THEN fielding1 WHEN startingPos2 = 'LFRF' OR startingPos2 = 'OF' OR startingPos2 = 'CF'THEN fielding2 WHEN startingPos3 = 'LFRF' OR startingPos3 = 'OF' OR startingPos3 = 'CF'THEN fielding3 WHEN startingPos4 = 'LFRF' OR startingPos4 = 'OF' OR startingPos4 = 'CF'THEN fielding4 END-`All Outfielders' Fielding_avg`)*(CASE WHEN startingPos1 = 'LFRF' OR startingPos1 = 'OF' OR startingPos1 = 'CF' THEN fielding1 WHEN startingPos2 = 'LFRF' OR startingPos2 = 'OF' OR startingPos2 = 'CF'THEN fielding2 WHEN startingPos3 = 'LFRF' OR startingPos3 = 'OF' OR startingPos3 = 'CF'THEN fielding3 WHEN startingPos4 = 'LFRF' OR startingPos4 = 'OF' OR startingPos4 = 'CF'THEN fielding4 END-`All Outfielders' Fielding_avg`)*(CASE WHEN startingPos1 = 'LFRF' OR startingPos1 = 'OF' OR startingPos1 = 'CF' THEN fielding1 WHEN startingPos2 = 'LFRF' OR startingPos2 = 'OF' OR startingPos2 = 'CF'THEN fielding2 WHEN startingPos3 = 'LFRF' OR startingPos3 = 'OF' OR startingPos3 = 'CF'THEN fielding3 WHEN startingPos4 = 'LFRF' OR startingPos4 = 'OF' OR startingPos4 = 'CF'THEN fielding4 END-`All Outfielders' Fielding_avg`))/(N*`All Outfielders' Fielding_sd`*`All Outfielders' Fielding_sd`*`All Outfielders' Fielding_sd`) AS `All Outfielders' Fielding_skew`,
SUM((CASE WHEN startingPos1 = 'LFRF' OR startingPos1 = 'OF' OR startingPos1 = 'CF' THEN fielding1 WHEN startingPos2 = 'LFRF' OR startingPos2 = 'OF' OR startingPos2 = 'CF'THEN fielding2 WHEN startingPos3 = 'LFRF' OR startingPos3 = 'OF' OR startingPos3 = 'CF'THEN fielding3 WHEN startingPos4 = 'LFRF' OR startingPos4 = 'OF' OR startingPos4 = 'CF'THEN fielding4 END-`All Outfielders' Fielding_avg`)*(CASE WHEN startingPos1 = 'LFRF' OR startingPos1 = 'OF' OR startingPos1 = 'CF' THEN fielding1 WHEN startingPos2 = 'LFRF' OR startingPos2 = 'OF' OR startingPos2 = 'CF'THEN fielding2 WHEN startingPos3 = 'LFRF' OR startingPos3 = 'OF' OR startingPos3 = 'CF'THEN fielding3 WHEN startingPos4 = 'LFRF' OR startingPos4 = 'OF' OR startingPos4 = 'CF'THEN fielding4 END-`All Outfielders' Fielding_avg`)*(CASE WHEN startingPos1 = 'LFRF' OR startingPos1 = 'OF' OR startingPos1 = 'CF' THEN fielding1 WHEN startingPos2 = 'LFRF' OR startingPos2 = 'OF' OR startingPos2 = 'CF'THEN fielding2 WHEN startingPos3 = 'LFRF' OR startingPos3 = 'OF' OR startingPos3 = 'CF'THEN fielding3 WHEN startingPos4 = 'LFRF' OR startingPos4 = 'OF' OR startingPos4 = 'CF'THEN fielding4 END-`All Outfielders' Fielding_avg`)*(CASE WHEN startingPos1 = 'LFRF' OR startingPos1 = 'OF' OR startingPos1 = 'CF' THEN fielding1 WHEN startingPos2 = 'LFRF' OR startingPos2 = 'OF' OR startingPos2 = 'CF'THEN fielding2 WHEN startingPos3 = 'LFRF' OR startingPos3 = 'OF' OR startingPos3 = 'CF'THEN fielding3 WHEN startingPos4 = 'LFRF' OR startingPos4 = 'OF' OR startingPos4 = 'CF'THEN fielding4 END-`All Outfielders' Fielding_avg`)/(N*`All Outfielders' Fielding_sd`*`All Outfielders' Fielding_sd`*`All Outfielders' Fielding_sd`*`All Outfielders' Fielding_sd`))-3 AS `All Outfielders' Fielding_kurt`

FROM `batter-cards` a 
LEFT JOIN
	(
	SELECT
		yearID,
		AVG(points) AS Points_avg,
		AVG(speed) AS Speed_avg,
		AVG(onbase) AS OB_avg,
		AVG(SO) AS SO_avg,
		AVG(GB) AS GB_avg,
		AVG(FB) AS FB_avg,
		AVG(SO + GB + FB) AS `Outs_avg`,
		AVG(BB) AS BB_avg,
		AVG(1B) AS `1B_avg`,
		AVG(1Bplus) AS `1B Plus_avg`,
		AVG(CASE WHEN 2B < 20 THEN 2B ELSE 0 END) AS `2B_avg`,
		AVG(CASE WHEN 3B < 20 THEN 3B ELSE 0 END) AS `3B_avg`,
		AVG(CASE WHEN HR < 20 THEN HR ELSE 0 END) AS `HR_avg`,
		AVG(CASE WHEN startingPos1 = 'C' THEN fielding1 WHEN startingPos2 = 'C' THEN fielding2 WHEN startingPos3 = 'C' THEN fielding3 WHEN startingPos4 = 'C' THEN fielding4 END) AS `Catcher Throwing_avg`,
		AVG(CASE WHEN startingPos1 = '1B' THEN fielding1 WHEN startingPos2 = '1B' THEN fielding2 WHEN startingPos3 = '1B' THEN fielding3 WHEN startingPos4 = '1B' THEN fielding4 END) AS `1B Fielding_avg`,
		AVG(CASE WHEN startingPos1 = '2B' THEN fielding1 WHEN startingPos2 = '2B' THEN fielding2 WHEN startingPos3 = '2B' THEN fielding3 WHEN startingPos4 = '2B' THEN fielding4 END) AS `2B Fielding_avg`,
		AVG(CASE WHEN startingPos1 = 'SS' THEN fielding1 WHEN startingPos2 = 'SS' THEN fielding2 WHEN startingPos3 = 'SS' THEN fielding3 WHEN startingPos4 = 'SS' THEN fielding4 END) AS `SS Fielding_avg`,
		AVG(CASE WHEN startingPos1 = '3B' THEN fielding1 WHEN startingPos2 = '3B' THEN fielding2 WHEN startingPos3 = '3B' THEN fielding3 WHEN startingPos4 = '3B' THEN fielding4 END) AS `3B Fielding_avg`,
		AVG(CASE WHEN startingPos1 = 'LFRF' OR startingPos1 = 'OF' OR startingPos1 = 'CF' THEN fielding1 WHEN startingPos2 = 'LFRF' OR startingPos2 = 'OF' OR startingPos2 = 'CF'THEN fielding2 WHEN startingPos3 = 'LFRF' OR startingPos3 = 'OF' OR startingPos3 = 'CF'THEN fielding3 WHEN startingPos4 = 'LFRF' OR startingPos4 = 'OF' OR startingPos4 = 'CF'THEN fielding4 END) AS `All Outfielders' Fielding_avg`,
		STDDEV(points) AS Points_sd,
		STDDEV(speed) AS Speed_sd,
		STDDEV(onbase) AS OB_sd,
		STDDEV(SO) AS SO_sd,
		STDDEV(GB) AS GB_sd,
		STDDEV(FB) AS FB_sd,
		STDDEV(SO + GB + FB) AS `Outs_sd`,
		STDDEV(BB) AS BB_sd,
		STDDEV(1B) AS `1B_sd`,
		STDDEV(1Bplus) AS `1B Plus_sd`,
		STDDEV(CASE WHEN 2B < 20 THEN 2B ELSE 0 END) AS `2B_sd`,
		STDDEV(CASE WHEN 3B < 20 THEN 3B ELSE 0 END) AS `3B_sd`,
		STDDEV(CASE WHEN HR < 20 THEN HR ELSE 0 END) AS `HR_sd`,
		STDDEV(CASE WHEN startingPos1 = 'C' THEN fielding1 WHEN startingPos2 = 'C' THEN fielding2 WHEN startingPos3 = 'C' THEN fielding3 WHEN startingPos4 = 'C' THEN fielding4 END) AS `Catcher Throwing_sd`,
		STDDEV(CASE WHEN startingPos1 = '1B' THEN fielding1 WHEN startingPos2 = '1B' THEN fielding2 WHEN startingPos3 = '1B' THEN fielding3 WHEN startingPos4 = '1B' THEN fielding4 END) AS `1B Fielding_sd`,
		STDDEV(CASE WHEN startingPos1 = '2B' THEN fielding1 WHEN startingPos2 = '2B' THEN fielding2 WHEN startingPos3 = '2B' THEN fielding3 WHEN startingPos4 = '2B' THEN fielding4 END) AS `2B Fielding_sd`,
		STDDEV(CASE WHEN startingPos1 = 'SS' THEN fielding1 WHEN startingPos2 = 'SS' THEN fielding2 WHEN startingPos3 = 'SS' THEN fielding3 WHEN startingPos4 = 'SS' THEN fielding4 END) AS `SS Fielding_sd`,
		STDDEV(CASE WHEN startingPos1 = '3B' THEN fielding1 WHEN startingPos2 = '3B' THEN fielding2 WHEN startingPos3 = '3B' THEN fielding3 WHEN startingPos4 = '3B' THEN fielding4 END) AS `3B Fielding_sd`,
		STDDEV(CASE WHEN startingPos1 = 'LFRF' OR startingPos1 = 'OF' OR startingPos1 = 'CF' THEN fielding1 WHEN startingPos2 = 'LFRF' OR startingPos2 = 'OF' OR startingPos2 = 'CF'THEN fielding2 WHEN startingPos3 = 'LFRF' OR startingPos3 = 'OF' OR startingPos3 = 'CF'THEN fielding3 WHEN startingPos4 = 'LFRF' OR startingPos4 = 'OF' OR startingPos4 = 'CF'THEN fielding4 END) AS `All Outfielders' Fielding_sd`,
		
		COUNT(*) AS N
	FROM `batter-cards` b
	GROUP BY yearID
	) S 
ON a.yearID = S.yearID 
GROUP BY a.yearID
;