<img src="https://raw.githubusercontent.com/FabioDiCeglie/META--Database-Engineer-Certificate/main/badge.png" alt="Badge" width="200">

# Meta Database Engineer Certificate Repository

This repository contains the artifacts created as part of the Meta Database Engineer Certificate course. Here's a breakdown of the contents:

## Learning Objectives

In this course, I acquired proficiency in:

- Understanding relational database fundamentals and practical applications.
- Designing and implementing robust database schemas using MySQL Workbench.
- Crafting complex SQL queries for data manipulation and management.
- Visualizing data effectively with Tableau and other analytics tools.
- Leveraging Python for seamless database connectivity and automation.
- Optimizing database performance through advanced techniques.
- Implementing security measures for data protection and compliance.
- Collaborating effectively across teams through clear communication and documentation.

## Notes

The main folder contains the final exam.
Each folder in this repository represents a course module aimed at completing the Meta Database Engineer Certificate. Feel free to explore and utilize the resources provided here for your learning and reference purposes.

# Final Exam Developing a MySQL Relational Database System with Python Client Integration

![little_lemon_logo_small](https://github.com/CelineBoutinon/little-lemon/assets/143210563/591c0036-f1d9-46c7-8fdf-e90fc978ff6f)

Capstone project for the META database engineer specialization on Coursera

## Project summary
The goal of the project is to build a database system for Little Lemon restaurant, allowing them to store data regarding:
  - bookings;
  - orders;
  - order delivery status;
  - menu;
  - customer details; and
  - staff information.

## Project guidelines
- The data model should be created and deployed in MySQL server using the Forward Engineer method in MySQL Workbench;
- SQL queries should be created to manage and summarize data for Little Lemon;
- a Python project should be set up for the database client; and
- Tableau software will be used to perform different types of data analytics to provide Little Lemon with relevant insights into their business performance on a dashboard. 

## Contents Main Folder - List of files and folders

1. **Tasks List**:
   - [TASK LIST](./task_list.pdf): Tasks lists.

2. **MySQL Workbench ER Diagram and Database Creation**:
   - [ER DIAGRAM DATABASE](./final_ass_db.png):: ER diagram depicting the database structure.
   - [ER DATABASE](./final_database_er.mwb): MySQL Workbench file for the ER diagram and forward engineering.
   - [DATABASE SQL SCRIPT](./creation_database_script.sql): SQL Script for creating database.

3. **SQL Scripts**:
   - [SCRIPTS](./final.sql) and [CRUD OPERATIONS](./crud_operations.sql): SQL scripts containing views, tables, procedures, statements and CRUD operations for a table booking system.

4. **Data Visualization**:
   - [TABLEAU](./FinalTableau.twb): Tableau workbook for visualizing data.

5. **Python Database Connectivity**:
   - [PYTHON CONNECTOR](./final.py): Python script demonstrating connectivity to a MySQL database using `mysql-connector-python` and executing queries.
   - [JUPYTER](./LittleLemon-db-client.ipynb): Jupyter file with scripts.

## Skills acquired
* Create an entity relationship diagram using MySQL Workbench
* Use MySQL Workbench to forward engineer the database and tables and populate data
* Perform CRUD operations with SQL and with a Python client
* Use the Python connector class to access the database
* Create a dashboard using Tableau software to analyse business KPIs

## Languages & software
* Tableau software
* MySQL / MySQL Workbench
* Python / Pandas / MySQL Connector
* Jupyter Notebook