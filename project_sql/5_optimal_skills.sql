/*
What are the optimal skills to learn for Data scientist?
*/

WITH skills_demand AS (
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT (skills_job_dim.job_id) AS demand_count
FROM job_postings_fact AS j
INNER JOIN skills_job_dim ON j.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short= 'Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND job_location = 'Anywhere'
GROUP BY 
    skills_dim.skill_id
),average_salary AS (
SELECT
    skills_dim.skill_id,
    ROUND(AVG(salary_year_avg),2 ) AS avg_salary
FROM job_postings_fact AS j
INNER JOIN skills_job_dim ON j.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short= 'Data Scientist' 
    AND salary_year_avg IS NOT NULL
    AND job_location = 'Anywhere'
GROUP BY 
    skills_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average_salary on skills_demand.skill_id= average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY 
    demand_count DESC,
    avg_salary DESC;


/*

optimal skills to learn for Data scientist are PYTHON, SQL, R 

[
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "763",
    "avg_salary": "143827.93"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "591",
    "avg_salary": "142832.59"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "394",
    "avg_salary": "137885.37"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "219",
    "avg_salary": "146970.05"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "217",
    "avg_salary": "149629.96"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "149",
    "avg_salary": "150188.49"
  },
  {
    "skill_id": 99,
    "skills": "tensorflow",
    "demand_count": "126",
    "avg_salary": "151536.49"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "122",
    "avg_salary": "142305.83"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "demand_count": "115",
    "avg_salary": "152602.70"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": "113",
    "avg_salary": "144815.95"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "110",
    "avg_salary": "129919.88"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "110",
    "avg_salary": "129919.88"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "82",
    "avg_salary": "143321.50"
  },
  {
    "skill_id": 106,
    "skills": "scikit-learn",
    "demand_count": "81",
    "avg_salary": "148963.95"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "77",
    "avg_salary": "129224.44"
  },
  {
    "skill_id": 94,
    "skills": "numpy",
    "demand_count": "73",
    "avg_salary": "149089.24"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "72",
    "avg_salary": "152686.88"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "72",
    "avg_salary": "131390.36"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "64",
    "avg_salary": "145706.30"
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "demand_count": "63",
    "avg_salary": "139631.11"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "demand_count": "59",
    "avg_salary": "155810.57"
  },
  {
    "skill_id": 210,
    "skills": "git",
    "demand_count": "58",
    "avg_salary": "132598.80"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "57",
    "avg_salary": "164691.09"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "57",
    "avg_salary": "158714.91"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "56",
    "avg_salary": "156701.92"
  },
  {
    "skill_id": 26,
    "skills": "c",
    "demand_count": "48",
    "avg_salary": "164864.98"
  },
  {
    "skill_id": 108,
    "skills": "matplotlib",
    "demand_count": "40",
    "avg_salary": "143823.69"
  },
  {
    "skill_id": 100,
    "skills": "keras",
    "demand_count": "39",
    "avg_salary": "141633.60"
  },
  {
    "skill_id": 214,
    "skills": "docker",
    "demand_count": "37",
    "avg_salary": "132536.19"
  },
  {
    "skill_id": 102,
    "skills": "jupyter",
    "demand_count": "37",
    "avg_salary": "129281.13"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "36",
    "avg_salary": "157142.36"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "36",
    "avg_salary": "151708.14"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demand_count": "35",
    "avg_salary": "129833.86"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "demand_count": "34",
    "avg_salary": "147544.45"
  },
  {
    "skill_id": 15,
    "skills": "matlab",
    "demand_count": "34",
    "avg_salary": "120894.72"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "31",
    "avg_salary": "146110.28"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "31",
    "avg_salary": "119474.95"
  },
  {
    "skill_id": 216,
    "skills": "github",
    "demand_count": "28",
    "avg_salary": "132707.13"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "28",
    "avg_salary": "118434.68"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demand_count": "26",
    "avg_salary": "104810.00"
  },
  {
    "skill_id": 213,
    "skills": "kubernetes",
    "demand_count": "25",
    "avg_salary": "144497.96"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_count": "25",
    "avg_salary": "140026.72"
  },
  {
    "skill_id": 22,
    "skills": "vba",
    "demand_count": "24",
    "avg_salary": "107079.40"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demand_count": "23",
    "avg_salary": "157414.13"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "23",
    "avg_salary": "145139.04"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "22",
    "avg_salary": "151164.55"
  },
  {
    "skill_id": 169,
    "skills": "linux",
    "demand_count": "21",
    "avg_salary": "136468.50"
  },
  {
    "skill_id": 199,
    "skills": "spss",
    "demand_count": "21",
    "avg_salary": "131100.59"
  },
  {
    "skill_id": 62,
    "skills": "mongodb",
    "demand_count": "19",
    "avg_salary": "143335.26"
  },
  {
    "skill_id": 18,
    "skills": "mongodb",
    "demand_count": "19",
    "avg_salary": "143335.26"
  },
  {
    "skill_id": 10,
    "skills": "html",
    "demand_count": "18",
    "avg_salary": "105027.78"
  },
  {
    "skill_id": 98,
    "skills": "kafka",
    "demand_count": "16",
    "avg_salary": "140132.08"
  },
  {
    "skill_id": 56,
    "skills": "mysql",
    "demand_count": "16",
    "avg_salary": "121179.22"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "15",
    "avg_salary": "164484.64"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "15",
    "avg_salary": "129504.93"
  },
  {
    "skill_id": 103,
    "skills": "nltk",
    "demand_count": "13",
    "avg_salary": "137212.02"
  },
  {
    "skill_id": 112,
    "skills": "plotly",
    "demand_count": "12",
    "avg_salary": "138332.96"
  },
  {
    "skill_id": 137,
    "skills": "phoenix",
    "demand_count": "12",
    "avg_salary": "135402.46"
  },
  {
    "skill_id": 14,
    "skills": "c#",
    "demand_count": "12",
    "avg_salary": "125406.67"
  },
  {
    "skill_id": 57,
    "skills": "postgresql",
    "demand_count": "12",
    "avg_salary": "112769.86"
  }
]
*/
    