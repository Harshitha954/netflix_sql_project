# Netflix SQL Data Analysis Project
![Netflix Logo](https://github.com/Harshitha954/netflix_sql_project/blob/main/netflix_img.jpg)

A clean, professional SQL portfolio project demonstrating data analysis and querying techniques using a Netflix dataset. This repository contains structured table creation scripts and analytical queries solving real-world business and data exploration questions using PostgreSQL.

---

## 📋 Table of Contents
- [Project Overview]
- [Dataset Schema]
- [Key Business Questions & SQL Insights]
- [Project Structure]
- [Technologies Used]
- [How to Run]

---

## 🚀 Project Overview
This project involves setting up a relational database structure for Netflix titles and performing advanced SQL queries to extract meaningful insights. It highlights data cleaning challenges (such as handling comma-separated lists and date string conversions), aggregation, window functions, and conditional categorization.

---

## 📊 Dataset Schema
The database consists of a single primary table `netflix` structured as follows:

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `show_id` | VARCHAR(6) | Unique identifier for each show/movie |
| `type` | VARCHAR(10) | Content type ('Movie' or 'TV Show') |
| `title` | VARCHAR(150) | Title of the movie or TV show |
| `director` | VARCHAR(250) | Director(s) of the content |
| `casts` | VARCHAR(1000) | Main actors/cast members |
| `country` | VARCHAR(150) | Country of origin |
| `date_added` | VARCHAR(50) | Date added on Netflix (formatted as text) |
| `release_year` | INT | Original release year |
| `rating` | VARCHAR(10) | Age/maturity rating |
| `duration` | VARCHAR(15) | Duration in minutes (movies) or seasons (TV shows) |
| `listed_in` | VARCHAR(100) | Genres / Categories |
| `description` | VARCHAR(250) | Synopsis / plot description |

---

## 🔍 Key Business Questions & SQL Insights

The project solves 15 distinct analytical problems:

1. **Content Distribution**: Counted the total number of Movies vs. TV Shows.
2. **Common Ratings**: Identified the most frequent rating for each content type using `DENSE_RANK()`.
3. **Year-Specific Releases**: Listed all movies released in a target year (e.g., 2020).
4. **Top Countries**: Unnested comma-separated country fields to find the top 5 countries with the most content.
5. **Longest Movie**: Filtered and sorted the dataset to find the movie with the maximum duration.
6. **Recent Additions**: Extracted content added within the last 5 years using date intervals.
7. **Director Analysis**: Filtered titles directed by specific individuals (e.g., Rajiv Chilaka).
8. **Long-Running TV Shows**: Identified TV shows with more than 5 seasons using string splitting and numeric casting.
9. **Genre Breakdown**: Unnested multi-genre fields to count content items per genre.
10. **Indian Content Trends**: Calculated the yearly distribution and top release years for content produced in India.
11. **Documentaries**: Filtered all movie entries belonging to the Documentaries category.
12. **Missing Directors**: Identified records lacking director information (`NULL`).
13. **Actor-Specific Output**: Analyzed an actor's catalog (e.g., Salman Khan) over the last 10 years.
14. **Top Indian Actors**: Ranked the top 10 actors based on total movie appearances in India.
15. **Content Keyword Categorization**: Classified content into 'Good' or 'Bad' categories based on the presence of keywords like 'kill' or 'violence' in the description using Common Table Expressions (CTEs) and `CASE` statements.

---

## 🛠️ Technologies Used
- **SQL (PostgreSQL)**: Database management, querying, window functions, CTEs, array/string manipulation functions (`unnest`, `string_to_array`, `split_part`).

---

## 💻 How to Run
1. Clone the repository or copy the SQL script.
2. Set up your PostgreSQL database environment.
3. Run the `CREATE TABLE` script to initialize the table.
4. Import your Netflix dataset CSV into the `netflix` table.
5. Execute the provided analytical queries to explore the data.
