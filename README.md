# Employee (HR) Data Analysis | MySQL · Power BI

An HR analytics project that cleans and analyses employee data in SQL, then presents the results in an interactive Power BI dashboard. It looks at workforce makeup, salary distribution, performance and remote work across departments and cities.

## Business Questions
- How is the workforce distributed across departments, cities and age groups?
- Which departments and cities have the highest salary spend?
- Does employee performance differ by age group?
- Who are the high earners (salary above 35,000)?
- How common is remote work across the organisation?

## Tools Used
| Tool | Purpose |
|------|---------|
| MySQL | Data cleaning, transformation and analysis |
| Power BI | Interactive HR dashboard |
| GitHub | Version control and documentation |

## Dataset
- **File:** `Hr_data.csv`, 266 employee records
- **Columns:**

| Column | Description |
|--------|-------------|
| emp_name | Employee name |
| department | Department the employee works in |
| join_date | Original joining timestamp |
| salary | Employee salary |
| age | Employee age |
| performance_rating | Performance score |
| city | Work location |
| remote_work | Whether the employee works remotely |
| Age_category | Derived: age group (created in SQL) |
| Joining_date | Derived: date part of `join_date` (created in SQL) |
| Joining_time | Derived: time part of `join_date` (created in SQL) |

## Project Workflow
All queries are in [`Hr_data.sql`](Hr_data.sql).

### 1. Data Quality Checks
- Checked for duplicate employee records
- Checked for NULL and empty values in the `department` column

### 2. Data Cleaning
- Replaced empty department values with `no_department`
- Standardised `remote_work` values to uppercase
- Replaced `NAN` values in `remote_work` with `NO`

### 3. Feature Engineering
- **Age_category:** grouped employees into four age buckets

| Category | Age |
|----------|-----|
| Young | Below 25 |
| Adult | 25 to 35 |
| Middle-age | 36 to 55 |
| Senior | Above 55 |

- **Joining_date / Joining_time:** split the `join_date` timestamp into separate date and time columns

### 4. Analysis
- Total salary by city
- Average performance rating by age category
- Average salary by department
- High-salary employees (above 35,000) using a CTE

### 5. Dashboard (Power BI)
File: [`Hr_data.pbix`](Hr_data.pbix)
- Interactive dashboard built on the cleaned dataset

## SQL Concepts Used
`GROUP BY` · `HAVING` · `CASE WHEN` · `CTE` · `ALTER TABLE` · `UPDATE` · `String functions (UPPER)` · `Date/Time functions (DATE, TIME)` · `Aggregate functions (SUM, AVG, ROUND)`

## Key Insights
> Replace these with your own findings.
- Pune had the highest total salary spend, while Mumbai had the lowest
- No_department had the highest average salary at 67861.71
- The Senior age group had the best average performance rating of 3.97
- 244 employees earn above 35,000.
- 41.06% of employees work remotely

## Dashboard Preview
> Add a screenshot: upload an image to the repo and link it, e.g. <img width="1183" height="676" alt="HR_data" src="https://github.com/user-attachments/assets/626ac354-104c-4b00-91c3-e42bda531095" />


## Repository Structure
```
Employees-data-Analysis/
├── Hr_data.csv      # Cleaned employee dataset
├── Hr_data.sql      # MySQL cleaning and analysis queries
├── Hr_data.pbix     # Power BI dashboard
└── README.md
```

## How to Run
1. Import `Hr_data.csv` into MySQL as the table `employees_raw_data`
2. Run the queries in `Hr_data.sql` from top to bottom
3. Open `Hr_data.pbix` in Power BI Desktop

## Author
**Varatharaj S.**, Data Research Analyst
[LinkedIn](#) · [GitHub](https://github.com/Varatha1)
