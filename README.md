# Stress-Management

### Project Overview

This project focuses on the development of a Stress Management Dashboard for Wellbeing Corp, a health and wellness company dedicated to helping organizations manage employee stress levels. The primary goal of this dashboard is to provide actionable insights into the stress factors affecting employees, enabling HR and management teams to make informed decisions for improving workplace well-being.

### Problem Statement

Stress is a significant issue impacting employee well-being and productivity. This analysis aims to identify the key factors contributing to stress, including prevalent stressors and their associated physical and emotional symptoms. By understanding these elements, Wellbeing Corp can develop targeted strategies to effectively manage and reduce stress, ultimately promoting a healthier work environment.

### Project Objectives:

1. Analyze the Relationship Between Emotional Symptoms and Average Heart Rate
- Investigate how various emotional symptoms correlate with fluctuations in average heart rate to understand their impact on physiological stress responses.

2. Identify Key Stress Triggers by Gender
- Explore and compare the primary sources of stress among different gender groups to uncover potential patterns and tailor stress management solutions accordingly.

3. Calculate and Analyze Average Cortisol Levels by Hour
- Examine hourly fluctuations in cortisol levels to identify peak stress periods and provide insights for stress-reducing interventions at critical times.

4. Evaluate the Impact of Stress Duration on Sleep Quality
- Assess how prolonged periods of stress affect sleep quality, focusing on identifying trends that can inform wellness and recovery programs.

5. Examine the Influence of Stress Levels on Mood
- Analyze how varying stress levels impact mood changes, offering insights into emotional well-being and potential areas for intervention.

## Data Description

### Data Sources

The dataset for this project is sourced from Wellbeing Corp, a health and wellness company that collects employee stress-related data through comprehensive surveys and monitoring systems. The data includes various dimensions of employee well-being, including emotional symptoms, physiological measures (such as heart rate and cortisol levels), and demographic information.

### Data Collection

Data was collected using a multi-faceted approach, which included:

- Surveys: Employees completed standardized questionnaires that assessed their emotional symptoms, stress triggers, and overall mental well-being. These surveys included quantitative ratings on various stress-related factors.

- Monitoring Systems: Wearable devices were used to capture real-time physiological data, including heart rate and cortisol levels. This data was logged continuously to provide accurate insights into employees’ stress responses throughout their daily activities.

- Health Records: Historical health records, which included information on physical symptoms related to stress (such as insomnia, fatigue, and high blood pressure), were incorporated to analyze trends over time.


### Data Characteristics

The dataset includes the following variables:

- ID: Unique identifier for each employee
  
- Full Name: Employee's full name
- Gender: Gender of the employee
- Date of Birth: Employee's birth date
- Test Date: Date when the stress test was conducted
- Test Time: Time when the stress test was conducted
- Age: Employee’s age
- Age Group: Categorized age group of the employee
- Stress Source: Main source of stress (e.g., work, financial issues)
- Physical Symptoms: Types of physical symptoms reported (e.g., fatigue, back pain)
- Emotional Symptoms: Types of emotional symptoms reported (e.g., anxiety, depression)
- Coping Mechanism: Methods used to cope with stress (e.g., exercise, meditation)
- Stress Duration (in days): Duration of stress experienced, measured in days


- Stress Duration (in months): Duration of stress experienced, measured in months
- Severity: Severity of stress (e.g., mild, moderate, severe)
- Sleep Quality: Quality of sleep reported (e.g., poor, fair, good)
- Mood: Mood reported by the employee
- Heart Rate: Heart rate measurement (bpm)
- Cortisol Level: Cortisol level measurement (µg/dL)
- Stress Level Score: Calculated score representing the level of stress

#### Data Types:
The dataset includes both categorical (e.g., gender, stress sources) and numerical data (e.g., heart rate, cortisol levels).

## Methodology

The methodology for this project encompasses several key stages: data cleaning, exploratory data analysis (EDA), and statistical analysis. The tools utilized throughout the project include SQL Server for data manipulation and analysis, Excel for data visualization and dashboard creation, and Microsoft Word for documentation.

### Data Cleaning

Data cleaning is a critical step in data analysis that ensures the dataset is accurate, complete, and ready for insightful analysis. Below is a comprehensive outline of the data cleaning processes implemented in the Stress Management Project, detailing each step along with SQL queries where applicable.

1. Renaming Columns for Clarity
   -  Objective: Enhance the readability and interpretability of the dataset by using clear and descriptive column names.
   -  Description: Column names were modified to reflect the content accurately, which aids in understanding and reduces confusion during analysis.

2. Updating Gender Values
   - Objective: Improve data consistency by standardizing gender representations.
   - Description: Gender values originally represented as 'M' and 'F' were updated to 'Male' and 'Female' to provide clarity and avoid ambiguity in analysis.

3. Removing Duplicate Values
  - Objective: Maintain the integrity of the dataset by ensuring each record is unique.
  - Description: Identified and removed duplicate records across relevant columns, which could skew analysis results if left unaddressed.

4. Handling Missing Values
  - Objective: Ensure completeness of the dataset by addressing any missing values.
  - Description: For the entry with the ID of 'FSXMV4', the [Stress Level Score] was updated to the average score of other entries to provide a more accurate representation of stress levels.

5. Deleting Null Values
  - Objective: Clean the dataset by removing any rows containing null values that could affect the quality of analysis.
  - Description: Rows with null values in any critical columns were deleted to ensure that subsequent analyses are based on complete data.

6. Transforming Numeric Values to Currency Format
  - Objective: Ensure financial data is presented consistently for clear analysis.
  - Description: Financial columns such as unit prices and totals were formatted to a standardized currency format. This is particularly important for financial analyses.
Note: This transformation is typically performed in Excel rather than SQL.

7. Creating Views for Analysis
  - Objective: Simplify complex queries by creating views that provide a consolidated view of necessary data.
  - Description: A view named stress_level was created to facilitate easier querying of full names, age, gender, and stress levels.

8. Grouping Stress Levels into Categories
  - Objective: Facilitate analysis by categorizing stress levels into distinct groups.
  - Description: Stress levels were classified into categories such as low, moderate, and high, enabling better understanding of stress distribution among individuals.

9. Updating Age Values and Classifying Age Groups
  - Objective: Provide demographic insights by calculating age and categorizing into age groups.
  - Description: New columns for age and corresponding age groups were added based on the date of birth.

10. Adjusting the Time Column Format
  - Objective: Enhance readability and usability of time-related data.
  - Description: The time column format was transformed into a more user-friendly format, facilitating easier analysis of time-based trends.
Note: This adjustment is typically done using Excel formatting tools.

### The SQL Queries used for data cleaning 👉[click here](https://github.com/Yourmaskguy/Stress-Management/blob/1b044bb52985e40768d89657d2e888db09be8e43/stress%20managemt%20data%20cleaning.sql)👈


### Exploratory Data Analysis (EDA)
After cleaning the dataset in SQL Server, it was exported to Excel for in-depth analysis and visualization. The following steps were conducted during the EDA phase:

- Descriptive Statistics: Key metrics such as stress severity, heart rate, and cortisol levels were calculated to provide a broad overview of the dataset. These statistics were used to summarize the data and identify any noticeable trends or outliers.
- Data Visualization: Multiple charts and graphs were created to visually explore the relationships between stress sources, symptoms, heart rate, and cortisol levels. This included clustered bar charts, pie
  charts, and line charts, which helped in identifying patterns and trends across gender, time of day, and emotional or physical symptoms.
- Comparative Analysis: Pivot tables were used to compare stress sources across different demographics, such as gender. This allowed for a deeper understanding of how stress triggers differ between groups,
  enabling more targeted insights.
- Dashboard Creation: Interactive dashboards were built to present the key findings effectively. Features such as slicers were added to the Excel dashboard to allow for dynamic filtering and exploration of
  variables like stress sources by gender, emotional symptoms by heart rate, and stress duration by physical symptoms.

### Statistical Analysis
The Stress Management Project applied various statistical methods to uncover insights into stress triggers, physiological responses, and behavioral impacts:

- Descriptive Statistics: Summary statistics were generated for key variables, such as emotional symptoms, heart rate, cortisol levels, and stress duration. This quantified the average values and
  distributions, providing a foundational understanding of the data.
- Comparative Analysis: Stress triggers and emotional symptoms were compared across gender to identify patterns. Stress duration was also compared to sleep quality to determine how prolonged stress impacts
  rest. This helped assess variations in stress triggers and their effects based on demographics and duration.
- Trend Analysis: Cortisol levels were analyzed across different hours of the day to reveal hormonal fluctuations. This time-based analysis helped highlight patterns in cortisol peaks and troughs, showing
  when individuals were most physiologically affected by stress.
- Categorical Analysis: Physical symptoms were categorized and compared against stress duration to understand how long-term stress affected physical well-being. Additionally, moods were examined against
  stress levels to determine how varying levels of stress impacted emotional states

### Tools Used
This project utilized several tools to facilitate data analysis, visualization, and documentation:

- SQL Server(SMSS) : Used for data storage, retrieval, and manipulation. SQL queries were employed to clean the data, perform analyses, and create views.
   - [Download SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) and [Download SMSS](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15)

- Microsoft Excel: Utilized for exploratory data analysis (EDA), visualization, and dashboard creation. Excel’s pivot tables, charts, and slicers provided a dynamic way to present findings and enable user interaction.
 - [Download here](https://www.microsoft.com/en-us/microsoft-365/excel)

- Microsoft Word: For comprehensive documentation of the project, including methodologies, findings, and recommendations.
  - [Download here](https://www.microsoft.com/en-us/microsoft-365/download-office)

## Data Analysis
This section details the analyses conducted to address the project's key objectives. Each objective is presented with its rationale, the analytical approach employed, and the insights derived from the findings.

- Objective 1: Analyze Emotional Symptoms with Average Heart Rate
  - Rationale: Understanding the correlation between emotional symptoms and heart rate provides insights into how stress manifests physically, enabling targeted interventions.
  - Analysis: Emotional symptoms were categorized, and the average heart rate associated with each symptom was calculated. The results were subsequently visualized in Excel for further analysis.
  - Insights: The findings revealed that negative emotions, such as anger and anxiety, corresponded with significantly higher average heart rates. In contrast, positive emotions like joy were linked to lower
    heart rates, indicating a strong connection between emotional well-being and physiological responses.

- Objective 2: Identify Stress Triggers by Gender
  - Rationale: Identifying gender differences in stress triggers aids in designing targeted stress management strategies, enhancing intervention effectiveness.
  - Analysis: A comparative analysis was conducted to evaluate the frequency of various stress triggers across genders. The data was visualized in Excel to highlight differences.
  - Insights: Work-related stress emerged as the primary trigger for both genders, while financial concerns were reported more frequently by females. This suggests the need for tailored stress management
    programs that address gender-specific concerns.

- Objective 3: Calculate Average Cortisol Levels by Hour
  - Rationale: Cortisol serves as a key indicator of stress levels, and understanding its fluctuation throughout the day can inform strategies for effective stress management.
  - Analysis: Average cortisol levels were calculated for each hour of the day to identify patterns in stress responses. This data was visualized using line charts in Excel.
  - Insights: The analysis indicated that cortisol levels peaked in the late morning and gradually declined throughout the afternoon. This insight suggests that stress management interventions could be most
    effective during peak cortisol periods.

- Objective 4: Assess the Impact of Stress Duration on Sleep Quality
  - Rationale: Investigating the impact of stress duration on sleep quality emphasizes the importance of timely stress intervention to prevent sleep disturbances.
  - Analysis: The relationship between stress duration and reported sleep quality was analyzed to identify trends. Visualizations in Excel highlighted the findings.
  - Insights: Prolonged exposure to stress was significantly linked to poorer sleep quality, particularly instances of insomnia. This underscores the importance of early intervention strategies in stress
    management to enhance sleep outcomes.

- Objective 5: Assess the Impact of Stress Level on Mood
  - Rationale: Understanding how varying stress levels affect mood can assist in identifying effective coping strategies and interventions to improve emotional well-being.
  - Analysis: A categorical analysis was performed to assess the relationship between stress levels and reported moods. The results were visualized to convey key findings.
  - Insights: Higher stress levels were consistently associated with negative moods, such as sadness and irritability. This relationship highlights the necessity of implementing stress reduction techniques
    to improve overall emotional health.

## Dashboard Creation (Excel)
Following the data analysis, an interactive dashboard was developed using Excel, which includes:

Charts:
Line charts displaying average cortisol levels by hour.
Bar charts illustrating stress triggers by gender.
Pie charts visualizing the relationship between emotional symptoms and heart rate.
Interactivity: Slicers were incorporated to enable users to filter data based on gender, stress duration, and emotional symptoms, facilitating a more in-depth exploration of the findings.


