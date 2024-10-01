--Renaming columns
EXEC sp_rename 'stress_levels.id','ID'
EXEC sp_rename 'stress_levels.first_name','First Name'
EXEC sp_rename 'stress_levels.last_name','Last Name'
EXEC sp_rename 'stress_levels.gender','Gender'
EXEC sp_rename 'stress_levels.dob','Date of Birth'
EXEC sp_rename 'stress_levels.test_date','Date'
EXEC sp_rename 'stress_levels.test_time','Time'
EXEC sp_rename 'stress_levels.stress_source','Stress Source'
EXEC sp_rename 'stress_levels.physical_symptoms','Physical Symptoms'
EXEC sp_rename 'stress_levels.emotional_symptoms','Emotional Symptoms'
EXEC sp_rename 'stress_levels.coping_mechanism','Coping Mechanisms'
EXEC sp_rename 'stress_levels.stress_duration','Duration of Stress (days)'
EXEC sp_rename 'stress_levels.severity','Severity'
EXEC sp_rename 'stress_levels.sleep_quality','Sleep Quality'
EXEC sp_rename 'stress_levels.mood','Mood'
EXEC sp_rename 'stress_levels.heart_rate','Heart Rate'
EXEC sp_rename 'stress_levels.cortisol_level','Cortisol Level'
EXEC sp_rename 'stress_levels.stress_level_score','Self-Reported Stress Score'


--Updating Gender Values
Update [stress_levels]
Set Gender = Case
When Gender = 'M' Then 'Male'
When Gender = 'F' Then 'Female'
End

--Removing Duplicate Values
With Duplicates As (
Select *, ROW_NUMBER() over (Partition by ID,[First Name],[Last Name] ,Gender ,"Date of Birth" ,"Date"
,[Time],[Stress Source] ,[Physical Symptoms],[Emotional Symptoms],[Coping Mechanisms],[Duration of Stress (days)]
,[Severity],[Sleep Quality],[Mood],[Heart Rate],[Cortisol Level],[Self-Reported Stress Score]
order by (Select Null)) As RowNum 
From stress_levels)
Delete From Duplicates 
Where RowNum > 1

--Handling Misssing Values
Update [Stress_levels]
Set [Self-Reported Stress Score] = (Select AVG([Self-Reported Stress Score]) From Stress_levels)
Where ID = 'FSXMV4'

--Deleting Null values
Delete From Stress_levels
Where ID is null or [First Name]is null or [Last Name] is null or Gender is null or "Date of Birth" is null or
"Date" is null or [Time] is null or [Stress Source]is null or [Physical Symptoms]is null or 
[Emotional Symptoms] is null or [Coping Mechanisms] is null or [Duration of Stress (days)] is null or
[Severity] is null or [Sleep Quality] is null or [Mood] is null or [Heart Rate] is null or [Cortisol Level] is null or
[Self-Reported Stress Score]is null

--Creating Views for Analysis
CREATE VIEW Stress_level AS
(SELECT ID, CONCAT([Last Name],' ', [First Name]) AS [Full Name],[Gender], [Date of Birth], [Date], [Time], [Stress Source], [Physical Symptoms],
[Emotional Symptoms],[Coping Mechanisms],[Duration of Stress (days)],[Severity],[Sleep Quality], [Mood], [Heart Rate],[Cortisol Level],[Self-Reported Stress Score]
From [stress_levels])


--Addition of Age, Age Group, Stress Duration(In Months)
 ALTER VIEW [Stress_level] AS
SELECT 
    [ID],
    CONCAT([Last Name],' ', [First Name]) AS [Full Name],
    [Gender],
	[Date of Birth],
    [Date],
      -- Calculate Age
    DATEDIFF(YEAR, [Date of Birth], Date) - CASE 
        WHEN MONTH(Date) < MONTH([Date of Birth]) 
            OR (MONTH(Date) = MONTH([Date of Birth]) AND DAY(Date) < DAY([Date of Birth])) 
        THEN 1 ELSE 0 END AS Age,Case 
when DATEDIFF(Year, "Date of Birth", "Date") - Case
When DATEADD(YEAR, DATEDIFF(Year, "Date of Birth", "Date"),
"Date of Birth")> "Date"
Then 1
Else 0
End Between 17 and 25 Then '17 - 25'
when DATEDIFF(Year, "Date of Birth", "Date") - Case
When DATEADD(YEAR, DATEDIFF(Year, "Date of Birth", "Date"),
"Date of Birth")> "Date"
Then 1
Else 0
End Between 26 and 35 Then '26 - 35'
when DATEDIFF(Year, "Date of Birth", "Date") - Case
When DATEADD(YEAR, DATEDIFF(Year, "Date of Birth", "Date"),
"Date of Birth")> "Date"
Then 1
Else 0
End Between 36 and 45 Then '36 - 45'
when DATEDIFF(Year, "Date of Birth", "Date") - Case
When DATEADD(YEAR, DATEDIFF(Year, "Date of Birth", "Date"),
"Date of Birth")> "Date"
Then 1
Else 0
End Between 46 and 55 Then '46 - 55'
when DATEDIFF(Year, "Date of Birth", "Date") - Case
When DATEADD(YEAR, DATEDIFF(Year, "Date of Birth", "Date"),
"Date of Birth")> "Date"
Then 1
Else 0
End Between 56 and 65 Then '56 - 65'
when DATEDIFF(Year, "Date of Birth", "Date") - Case
When DATEADD(YEAR, DATEDIFF(Year, "Date of Birth", "Date"),
"Date of Birth")> "Date"
Then 1
Else 0
End Between 66 and 75 Then '66 - 75'
when DATEDIFF(Year, "Date of Birth", "Date") - Case
When DATEADD(YEAR, DATEDIFF(Year, "Date of Birth", "Date"),
"Date of Birth")> "Date"
Then 1
Else 0
End Between 76 and 79 Then '76 - 79'
End AS [Age Group],
	[Time],
    [Self-Reported Stress Score],     CASE 
        WHEN ROUND([Self-Reported Stress Score], 2) BETWEEN 0 AND 0.99 THEN 'Low stress'
        WHEN ROUND([Self-Reported Stress Score], 2) BETWEEN 1 AND 1.9 THEN 'Normal stress'
        WHEN ROUND([Self-Reported Stress Score], 2) BETWEEN 1.91 AND 2.25 THEN 'Mild stress'
        ELSE 'Out of range'
    END AS StressCategory,
    [Stress Source],
    [Physical Symptoms],
    [Emotional Symptoms],
    [Coping Mechanisms],
    [Duration of Stress (days)],
    [Severity],
    [Heart Rate],
    [Cortisol Level],
    [Sleep Quality],
    [Mood]
FROM stress_levels
    ;
 