# 🏭 Manufacturing Downtime Analysis | Team Insights Makers
Project Plan on Notion  https://www.notion.so/Manufacturing_Downtime_Project-2a8077f7e2c1805d9b4dcd186468fa5e?source=copy_link

---

## 💡 Project Overview & Goal

Our team conducted a comprehensive, data-driven investigation into machine operational metrics to identify and mitigate the key drivers of production downtime across a manufacturing facility.

By analyzing **10,000 recorded downtime events**, our core objective was to shift the maintenance strategy from **reactive repairs** to **predictive asset management**, ultimately enhancing **Overall Equipment Effectiveness (OEE)**.

---

## 📈 Business Value Delivered

### **Strategic Focus**
We identified the *critical few* faults causing the majority of lost production time, allowing the organization to focus resources effectively.

### **Cost Reduction**
Our recommendations target minimizing financial losses associated with unplanned, high-duration outages.

### **Operational Optimization**
We provided actionable insights enabling smarter workforce and maintenance resource allocation across different shifts.

---

## 🚨 Key Findings & Actionable Recommendations

The team isolated several critical failure patterns that form a strong foundation for operational improvement:

| Finding | Detailed Impact | Team Recommendation |
|--------|-----------------|---------------------|
| 🚨 **Critical Fault Driver** | Electrical Faults were proven to cause the **longest average duration** of unplanned downtime, significantly reducing annual Efficiency Scores. | Implement a **Predictive Maintenance Program** for electrical systems (e.g., quarterly thermographic inspections). |
| ⏳ **Asset Lifecycle** | A strong inverse correlation was found between **Machine Age** and **Efficiency**, showing that older assets are costly to maintain. | Establish a formal **Asset Replacement Strategy** for aging machines below performance benchmarks. |
| 👥 **Shift A Bottleneck** | Shift A showed the highest average downtime duration, indicating lack of specialized technical expertise during that shift. | Optimize scheduling to ensure **certified technicians** are available during Shift A. |

---

## 🔧 Analytical Toolkit & Methodology

We used a multi-stage analytical workflow supported by industry-standard tools:

| Tool | Role in Project |
|------|-----------------|
| 🐍 **Python (Jupyter)** | Data cleaning, merging datasets, statistical checks, and EDA. |
| 🖥️ **SQL (T-SQL)** | Complex querying, metric aggregation, and computing yearly performance scores (`Efficiency_Score_year`). |
| 📊 **Power BI (.pbix)** | Final dashboard environment for executive-level visualization. |
| 📐 **Excel** | Produced Intial analysis for data. |
| 📒 **Notion** | Project management hub for documentation, planning, and task tracking. |

---

## 📁 Repository Contents

This repository contains all files required to reproduce our analysis:

| File Name | Description |
|-----------|-------------|
| `Manufacturing_Downtime_Python.ipynb` | Full Python code: EDA, data merging, and statistical analysis. |
| `Manufacturing Downtime.sql` | SQL queries for modeling and calculating performance metrics. |
| `Manufacturing_Downtime.pbix` | Power BI dashboard for interactive visualization. |
| `Machine_Info.csv` & `Manufacturing_Downtime.csv` | Clean, formatted datasets used in the project. |
| `[Manufacturing_Downtime].docx` | (Optional) Comprehensive final report documenting methods and findings. |

---

## 🚀 Getting Started

Follow the steps below to explore or reproduce our analysis:
### **1. Clone the Repository**
```bash
git clone https://github.com/2002kareem/Manufacturing-Resources-Data-Set.git
````
2.Review the Plan: Access the Notion Project Plan (link above) to understand the full project scope and data dictionary.

3.Execute the Code: Run the SQL queries against your database environment and execute the cells in the Jupyter Notebook.

4.View the Dashboard: Open the Manufacturing\_Downtime.pbix file using Power BI Desktop to interact with our findings.

### 🤝 Contact the Team
For any questions, feedback, or collaboration opportunities, please contact our team lead or members via:

Kareem Ibrahim Elrawady

LinkedIn: www.linkedin.com/in/kareem-elrawady

Team Email: Kareemelrawady@gmail.com
