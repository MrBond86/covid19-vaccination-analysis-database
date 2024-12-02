# covid19-vaccination-analysis-database
# COVID-19 Vaccination Database Project

This repository contains the files and resources for the **Database Design Project** as part of the ISYS1055/3412 Database Concepts course. The goal of this project is to design, implement, and analyze a relational database for a publicly available dataset on COVID-19 vaccinations.

## Overview

This project involves:
1. **Understanding the Dataset**: Analyzing a global COVID-19 vaccination dataset to derive insights.
2. **Database Design**: Creating a conceptual model, normalizing it, and designing the schema.
3. **Database Implementation**: Building and populating the database using SQLite.
4. **Data Analysis and Visualization**: Writing SQL queries to extract meaningful information and visualizing results.

### Dataset
The project uses a global dataset from the [Our World in Data GitHub repository](https://github.com/owid/covid-19-data/tree/master/public/data/vaccinations). Key data files include:
- `locations.csv`: Country names and administered vaccine types.
- `us_state_vaccinations.csv`: Vaccine data by U.S. states.
- `vaccinations-by-age-group.csv`: Vaccination data by age groups.
- `vaccinations-by-manufacturer.csv`: Manufacturer-wise vaccination data.
- `vaccinations.csv`: Global vaccination data by date.

### Key Deliverables
1. **ER Diagram**: Conceptual model of the database design.
2. **Normalized Schema**: Database schema adhering to third normal form (3NF).
3. **SQLite Database**: Populated database file (`Vaccinations.db`).
4. **SQL Scripts**:
   - `Database.sql`: Script to create tables and constraints.
   - `Queries.sql`: SQL queries for analysis.
5. **Visualization**: Graphical representation of query results.

## Structure
/repository │ ├── Model.pdf # ER diagram and normalization documentation ├── Database.sql # SQL script for creating database schema ├── Vaccinations.db # SQLite database file ├── Queries.sql # SQL queries for analysis ├── Queries.pdf # Query results and visualizations └── README.md # Project documentation


### Instructions
1. **Database Setup**:
   - Open `Database.sql` in SQLite Studio.
   - Execute the script to create the database schema.
   - Import the data from the provided CSV files into the database.

2. **Query Execution**:
   - Load `Queries.sql` in SQLite Studio to execute analysis queries.
   - Save results and screenshots for visualizations.

3. **Visualization**:
   - Use tools like Excel, Tableau, or Google Charts for graphical representation of query results.

## Tasks Breakdown
- **Part A**: Data Understanding
  - Analyze the dataset structure and contents.
- **Part B**: Database Design
  - Create ER diagram and schema documentation.
- **Part C**: Database Implementation
  - Build the database schema and import data.
- **Part D**: Data Analysis & Visualization
  - Write SQL queries and represent results visually.

## Tools & Technologies
- **Database Management**: SQLite Studio
- **Visualization**: Tableau, Excel, Google Charts
- **ER Diagram Tool**: Lucidchart

## Learning Outcomes
This project demonstrates the ability to:
1. Design and implement a normalized relational database.
2. Write complex SQL queries for data analysis.
3. Represent query results effectively through visualization.

## References
- [Our World in Data Vaccination Dataset](https://github.com/owid/covid-19-data/tree/master/public/data/vaccinations)
- [RMIT Harvard Referencing Guide](https://www.rmit.edu.au/library/study/referencing)

## Acknowledgements
Special thanks to the course instructors and peers for guidance and support throughout this project.
