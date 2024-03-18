/*
Question: What are the most in-demand skills for data scientists?
*/

SELECT 
    skills_dim.skills AS skills,
    COUNT (skills_job_dim.job_id) AS demand_count
FROM job_postings_fact AS j
INNER JOIN skills_job_dim ON j.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short= 'Data Scientist' AND
GROUP BY 
    skills
ORDER BY 
    demand_count DESC;

/* Top skill is Python followed by SQL AND R
- SAS and Tableau are in top 5 
