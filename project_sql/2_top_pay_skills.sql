WITH top_pay_jobs AS (
SELECT
    company.name as company_name,
    job_post.job_id,
    job_post.job_title_short,
    job_post.job_schedule_type,
    job_post.salary_year_avg,
    CASE WHEN job_post.job_location = 'St. Louis, MO' THEN 'local' 
         WHEN job_post.job_location = 'Anywhere' THEN 'REMOTE'
         ELSE 'On-site' 
    END AS location
FROM 
    job_postings_fact AS job_post
LEFT JOIN company_dim AS company ON
    job_post.company_id = company.company_id
WHERE 
    job_post.job_title_short ='Data Scientist' AND 
    job_post.salary_year_avg IS NOT NULL AND
    job_post.job_schedule_type = 'Full-time' AND
    (job_post.job_location = 'St. Louis, MO' OR job_post.job_location = 'Anywhere')
ORDER BY 
    salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_pay_jobs.*,
    skills
FROM top_pay_jobs
INNER JOIN skills_job_dim ON top_pay_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
   salary_year_avg DESC;

/*
Breakdown of most demanded skills for Data Scientist in 2023 based on job positngs
- PYTHON is leading with a count of 5.
- SQL follows with count of 4.
- AWS is also falls into top 3 skills 
- Other skills like java,gcp,pandas,numpy are low in demand when compared to python and sql.

[
  {
    "company_name": "Selby Jennings",
    "job_id": 40145,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "550000.0",
    "location": "REMOTE",
    "skills": "sql"
  },
  {
    "company_name": "Selby Jennings",
    "job_id": 40145,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "550000.0",
    "location": "REMOTE",
    "skills": "python"
  },
  {
    "company_name": "Selby Jennings",
    "job_id": 1714768,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "525000.0",
    "location": "REMOTE",
    "skills": "sql"
  },
  {
    "company_name": "Algo Capital Group",
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "location": "REMOTE",
    "skills": "sql"
  },
  {
    "company_name": "Algo Capital Group",
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "location": "REMOTE",
    "skills": "python"
  },
  {
    "company_name": "Algo Capital Group",
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "location": "REMOTE",
    "skills": "java"
  },
  {
    "company_name": "Algo Capital Group",
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "location": "REMOTE",
    "skills": "cassandra"
  },
  {
    "company_name": "Algo Capital Group",
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "location": "REMOTE",
    "skills": "spark"
  },
  {
    "company_name": "Algo Capital Group",
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "location": "REMOTE",
    "skills": "hadoop"
  },
  {
    "company_name": "Algo Capital Group",
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "location": "REMOTE",
    "skills": "tableau"
  },
  {
    "company_name": "Teramind",
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "location": "REMOTE",
    "skills": "azure"
  },
  {
    "company_name": "Teramind",
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "location": "REMOTE",
    "skills": "aws"
  },
  {
    "company_name": "Teramind",
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "location": "REMOTE",
    "skills": "tensorflow"
  },
  {
    "company_name": "Teramind",
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "location": "REMOTE",
    "skills": "keras"
  },
  {
    "company_name": "Teramind",
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "location": "REMOTE",
    "skills": "pytorch"
  },
  {
    "company_name": "Teramind",
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "location": "REMOTE",
    "skills": "scikit-learn"
  },
  {
    "company_name": "Teramind",
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "location": "REMOTE",
    "skills": "datarobot"
  },
  {
    "company_name": "Lawrence Harvey",
    "job_id": 457991,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "location": "REMOTE",
    "skills": "python"
  },
  {
    "company_name": "Lawrence Harvey",
    "job_id": 457991,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "location": "REMOTE",
    "skills": "aws"
  },
  {
    "company_name": "Lawrence Harvey",
    "job_id": 457991,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "location": "REMOTE",
    "skills": "gcp"
  },
  {
    "company_name": "Storm4",
    "job_id": 129924,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "location": "REMOTE",
    "skills": "python"
  },
  {
    "company_name": "Storm4",
    "job_id": 129924,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "location": "REMOTE",
    "skills": "pandas"
  },
  {
    "company_name": "Storm4",
    "job_id": 129924,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "location": "REMOTE",
    "skills": "numpy"
  },
  {
    "company_name": "Storm5",
    "job_id": 38905,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "location": "REMOTE",
    "skills": "sql"
  },
  {
    "company_name": "Storm5",
    "job_id": 38905,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "location": "REMOTE",
    "skills": "python"
  },
  {
    "company_name": "Storm5",
    "job_id": 38905,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "location": "REMOTE",
    "skills": "java"
  },
  {
    "company_name": "Storm5",
    "job_id": 38905,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "location": "REMOTE",
    "skills": "c"
  },
  {
    "company_name": "Storm5",
    "job_id": 38905,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "location": "REMOTE",
    "skills": "aws"
  },
  {
    "company_name": "Storm5",
    "job_id": 38905,
    "job_title_short": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "location": "REMOTE",
    "skills": "gcp"
  }
]
*/

