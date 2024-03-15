/* 
Question: What are the top paying data scientist jobs that are remote 
*/

SELECT
    company.name as company_name,
    job_post.job_id,
    job_post.job_title_short,
    job_post.job_schedule_type,
    job_post.job_posted_date,
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
    job_post.job_location = 'Anywhere'
ORDER BY 
       salary_year_avg DESC;