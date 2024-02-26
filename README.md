HR PowerBI Project Insights

Overview
This Power BI project provides insights into various aspects of HR management, including working preferences, attendance, and sick leave patterns of employees. Additionally, it automates data updating processes to streamline data management tasks.

Insights Covered
Working Preferences: Analyzes the preferred working arrangements of employees.
Attendance: Tracks employee attendance data.
Sick Leave Analysis: Identifies reasons for sick leave and analyzes sick leave patterns over different periods.
Automation of Data Updating
Some of the following transformations are applied:

Filtering rows
Removing unnecessary columns
Promoting headers
Changing data types
Removing top rows
Renaming columns
Unpivoting columns
Handling errors
DAX Formulas in PowerBI
The project utilizes DAX (Data Analysis Expressions) to create custom measures for analysis. Some key DAX measures include:

Total Working Days
DAX
Total Working Days = 
VAR totaldays = COUNT('Final Data'[Value])
VAR nonworkdays = CALCULATE( COUNT('Final Data'[Value]), 'Final Data'[Value] IN {"WO", "HO"})
RETURN totaldays - nonworkdays
WFH Count

DAX
WFH Count = 
SWITCH(TRUE(),
    'Final Data'[Value] = "WFH", 1,
    'Final Data'[Value] = "HWFH", 0.5,
    0
)
Presence Percentage

DAX
Copy code
Presence % = DIVIDE([Present Days], 'Measure Table'[Total Working Days], 0)
Present Days
DAX
Copy code
Present Days = 
VAR Presentdays = CALCULATE(COUNT('Final Data'[Value]), 'Final Data'[Value] = "P")
RETURN Presentdays + [WFH Count]
