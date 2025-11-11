 🏭 Manufacturing Downtime Analysis

## 🌟 Executive Summary

This project conducts a comprehensive analysis of machine downtime data in a manufacturing facility, utilizing a robust Data Warehouse methodology based on the **Star Schema** model. The primary focus is on measuring key performance indicators (KPIs) such as **Mean Time To Repair (MTTR)** and **Mean Time Between Failures (MTBF)** to identify the root causes of major production time loss and propose actionable recommendations.

**Key Deliverable:** An interactive dashboard is provided to monitor machine and shift performance continuously, alongside a detailed report identifying the top three contributors to unplanned downtime.

## 🎯 Project Objectives

1.  **Build a Standardized Data Model:** Create a flexible Fact and Dimension model in SQL to enable fast, accurate, and reliable analytical queries.
2.  **Calculate Core KPIs:** Accurately measure Availability Rate (AR), MTTR, and MTBF per machine and department.
3.  **Identify Root Causes:** Analyze downtime across key dimensions (Machine, Reason, Shift, Operator) to pinpoint the main drivers of failure.
4.  **Provide Visual Insights:** Design a comprehensive, interactive dashboard to support operational and strategic decision-making.

## 🛠️ Tools and Technologies Used

This project integrates various professional tools across the entire data analysis lifecycle (ELT):

| Phase | Tool/Technology | Purpose |
| :--- | :--- | :--- |
| **Data Storage & Modeling** | **SQL** (MySQL / PostgreSQL) | Building the Data Warehouse and implementing the Star Schema structure. |
| **Exploratory Data Analysis (EDA)** | **Python** (Pandas, Numpy, Matplotlib) | Time series analysis, calculation of complex KPIs, and initial statistical analysis. |
| **Initial Analysis & Transformation** | **MS Excel** (Power Query & Pivot Tables) | Data cleaning, dimension table preparation, and quick preliminary analysis. |
| **Final Visualization** | **Power BI / Tableau** | Designing the final interactive dashboard for data visualization and insights presentation. |
| **Documentation & Code Management** | **Notion** and **GitHub** | Comprehensive documentation of methodology and results, and version control. |

## 📁 Repository Structure

The repository is logically organized to reflect the project phases, making the workflow easy to follow:

| Folder | Content | Phase |
| :--- | :--- | :--- |
| [`Data/`](https://www.google.com/search?q=./Data) | Raw source files and cleaned CSV files ready for SQL loading. | Data |
| [`SQL_Warehouse/`](https://www.google.com/search?q=./SQL_Warehouse) | All SQL code for table creation (`CREATE TABLE`), data loading, and building analytical views. | Data Warehouse |
| [`Analysis/`](https://www.google.com/search?q=./Analysis) | Jupyter notebooks (Python) and Excel files containing the exploratory data analysis (EDA). | Initial Analysis |
| [`Visualizations/`](https://www.google.com/search?q=./Visualizations) | Final dashboard files (.pbix or .twb) and high-resolution screenshots. | Final Visualization |
| [`Documentation/`](https://www.google.com/search?q=./Documentation) | The comprehensive final report (PDF/Markdown) detailing the methodology, results, and recommendations. | Documentation |

## 🚀 How to Run the Project

To reproduce or extend this project, follow these steps:

1.  **Database Setup:** Run the code in the `SQL_Warehouse/` folder sequentially:
      * `01_Schema_Creation.sql` (to create all Fact and Dimension tables).
      * `02_Data_Loading.sql` (to populate the tables using the cleaned data).
2.  **Run Python Analysis:**
      * Install required Python libraries from `Analysis/requirements.txt`.
      * Open `Analysis/Downtime_EDA.ipynb` and execute the code blocks for deep analysis.
3.  **View the Dashboard:**
      * Open the dashboard file in the `Visualizations/` folder (requires connection to your SQL database for live data).

## 📄 Documentation and Report

For a detailed explanation of the methodology, assumptions, analytical conclusions, and strategic recommendations, please refer to the comprehensive report file located in the [`Documentation/`](https://www.google.com/search?q=./Documentation) folder.

-----

**Authored by:** [Your Name / Team Name]

**Last Updated:** [Project Last Update Date]
