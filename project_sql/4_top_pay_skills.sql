/* What are the top skills based on salary?
*/

SELECT 
    skills_dim.skills AS skills,
    ROUND(AVG(salary_year_avg),2 ) AS avg_salary
FROM job_postings_fact AS j
INNER JOIN skills_job_dim ON j.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short= 'Data Scientist' 
    AND salary_year_avg IS NOT NULL
    AND job_location = 'Anywhere'
GROUP BY 
    skills
ORDER BY 
    avg_salary DESC;

/*
[
  {
    "skills": "gdpr",
    "avg_salary": "217737.50"
  },
  {
    "skills": "golang",
    "avg_salary": "208750.00"
  },
  {
    "skills": "atlassian",
    "avg_salary": "189700.00"
  },
  {
    "skills": "selenium",
    "avg_salary": "180000.00"
  },
  {
    "skills": "opencv",
    "avg_salary": "172500.00"
  },
  {
    "skills": "neo4j",
    "avg_salary": "171655.00"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "171146.58"
  },
  {
    "skills": "dynamodb",
    "avg_salary": "169670.33"
  },
  {
    "skills": "php",
    "avg_salary": "168125.00"
  },
  {
    "skills": "tidyverse",
    "avg_salary": "165512.50"
  },
  {
    "skills": "solidity",
    "avg_salary": "165000.00"
  },
  {
    "skills": "c",
    "avg_salary": "164864.98"
  },
  {
    "skills": "go",
    "avg_salary": "164691.09"
  },
  {
    "skills": "datarobot",
    "avg_salary": "164500.00"
  },
  {
    "skills": "qlik",
    "avg_salary": "164484.64"
  },
  {
    "skills": "redis",
    "avg_salary": "162500.00"
  },
  {
    "skills": "watson",
    "avg_salary": "161710.00"
  },
  {
    "skills": "elixir",
    "avg_salary": "161250.00"
  },
  {
    "skills": "rust",
    "avg_salary": "161250.00"
  },
  {
    "skills": "cassandra",
    "avg_salary": "160850.00"
  },
  {
    "skills": "looker",
    "avg_salary": "158714.91"
  },
  {
    "skills": "slack",
    "avg_salary": "158333.33"
  },
  {
    "skills": "terminal",
    "avg_salary": "157500.00"
  },
  {
    "skills": "airflow",
    "avg_salary": "157414.13"
  },
  {
    "skills": "julia",
    "avg_salary": "157243.80"
  },
  {
    "skills": "bigquery",
    "avg_salary": "157142.36"
  },
  {
    "skills": "scala",
    "avg_salary": "156701.92"
  },
  {
    "skills": "hugging face",
    "avg_salary": "156519.83"
  },
  {
    "skills": "node.js",
    "avg_salary": "156107.00"
  },
  {
    "skills": "vue",
    "avg_salary": "156107.00"
  },
  {
    "skills": "gcp",
    "avg_salary": "155810.57"
  },
  {
    "skills": "dplyr",
    "avg_salary": "155000.00"
  },
  {
    "skills": "aurora",
    "avg_salary": "155000.00"
  },
  {
    "skills": "ibm cloud",
    "avg_salary": "154613.33"
  },
  {
    "skills": "node",
    "avg_salary": "153333.33"
  },
  {
    "skills": "snowflake",
    "avg_salary": "152686.88"
  },
  {
    "skills": "pytorch",
    "avg_salary": "152602.70"
  },
  {
    "skills": "microsoft teams",
    "avg_salary": "152500.00"
  },
  {
    "skills": "redshift",
    "avg_salary": "151708.14"
  },
  {
    "skills": "assembly",
    "avg_salary": "151620.00"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "151536.49"
  },
  {
    "skills": "jira",
    "avg_salary": "151164.55"
  },
  {
    "skills": "spark",
    "avg_salary": "150188.49"
  },
  {
    "skills": "aws",
    "avg_salary": "149629.96"
  },
  {
    "skills": "numpy",
    "avg_salary": "149089.24"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "148963.95"
  },
  {
    "skills": "theano",
    "avg_salary": "148250.00"
  },
  {
    "skills": "fastapi",
    "avg_salary": "148000.00"
  },
  {
    "skills": "shell",
    "avg_salary": "147727.60"
  },
  {
    "skills": "pyspark",
    "avg_salary": "147544.45"
  },
  {
    "skills": "sap",
    "avg_salary": "147517.14"
  },
  {
    "skills": "zoom",
    "avg_salary": "147010.63"
  },
  {
    "skills": "tableau",
    "avg_salary": "146970.05"
  },
  {
    "skills": "terraform",
    "avg_salary": "146400.00"
  },
  {
    "skills": "nosql",
    "avg_salary": "146110.28"
  },
  {
    "skills": "java",
    "avg_salary": "145706.30"
  },
  {
    "skills": "powerpoint",
    "avg_salary": "145139.04"
  },
  {
    "skills": "visual basic",
    "avg_salary": "145000.00"
  },
  {
    "skills": "spreadsheet",
    "avg_salary": "145000.00"
  },
  {
    "skills": "powershell",
    "avg_salary": "145000.00"
  },
  {
    "skills": "pandas",
    "avg_salary": "144815.95"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "144497.96"
  },
  {
    "skills": "ruby",
    "avg_salary": "144375.00"
  },
  {
    "skills": "spring",
    "avg_salary": "144258.33"
  },
  {
    "skills": "python",
    "avg_salary": "143827.93"
  },
  {
    "skills": "matplotlib",
    "avg_salary": "143823.69"
  },
  {
    "skills": "mongodb",
    "avg_salary": "143335.26"
  },
  {
    "skills": "hadoop",
    "avg_salary": "143321.50"
  },
  {
    "skills": "sql",
    "avg_salary": "142832.59"
  },
  {
    "skills": "azure",
    "avg_salary": "142305.83"
  },
  {
    "skills": "keras",
    "avg_salary": "141633.60"
  },
  {
    "skills": "kafka",
    "avg_salary": "140132.08"
  },
  {
    "skills": "flow",
    "avg_salary": "140026.72"
  },
  {
    "skills": "notion",
    "avg_salary": "140000.00"
  },
  {
    "skills": "databricks",
    "avg_salary": "139631.11"
  },
  {
    "skills": "confluence",
    "avg_salary": "139483.52"
  },
  {
    "skills": "unity",
    "avg_salary": "139262.50"
  },
  {
    "skills": "gitlab",
    "avg_salary": "138883.17"
  },
  {
    "skills": "plotly",
    "avg_salary": "138332.96"
  },
  {
    "skills": "seaborn",
    "avg_salary": "138062.87"
  },
  {
    "skills": "r",
    "avg_salary": "137885.37"
  },
  {
    "skills": "rshiny",
    "avg_salary": "137500.00"
  },
  {
    "skills": "nltk",
    "avg_salary": "137212.02"
  },
  {
    "skills": "mongo",
    "avg_salary": "136980.00"
  },
  {
    "skills": "linux",
    "avg_salary": "136468.50"
  },
  {
    "skills": "phoenix",
    "avg_salary": "135402.46"
  },
  {
    "skills": "couchbase",
    "avg_salary": "134689.75"
  },
  {
    "skills": "crystal",
    "avg_salary": "134277.90"
  },
  {
    "skills": "github",
    "avg_salary": "132707.13"
  },
  {
    "skills": "git",
    "avg_salary": "132598.80"
  },
  {
    "skills": "docker",
    "avg_salary": "132536.19"
  },
  {
    "skills": "express",
    "avg_salary": "132241.38"
  },
  {
    "skills": "power bi",
    "avg_salary": "131390.36"
  },
  {
    "skills": "spss",
    "avg_salary": "131100.59"
  },
  {
    "skills": "sharepoint",
    "avg_salary": "130186.13"
  },
  {
    "skills": "sas",
    "avg_salary": "129919.88"
  },
  {
    "skills": "c++",
    "avg_salary": "129833.86"
  },
  {
    "skills": "sheets",
    "avg_salary": "129650.00"
  },
  {
    "skills": "word",
    "avg_salary": "129504.93"
  },
  {
    "skills": "jupyter",
    "avg_salary": "129281.13"
  },
  {
    "skills": "excel",
    "avg_salary": "129224.44"
  },
  {
    "skills": "no-sql",
    "avg_salary": "129000.00"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "128491.76"
  },
  {
    "skills": "unify",
    "avg_salary": "127875.00"
  },
  {
    "skills": "swift",
    "avg_salary": "127000.00"
  },
  {
    "skills": "bash",
    "avg_salary": "126500.00"
  },
  {
    "skills": "c#",
    "avg_salary": "125406.67"
  },
  {
    "skills": "flask",
    "avg_salary": "125404.38"
  },
  {
    "skills": "mxnet",
    "avg_salary": "125250.00"
  },
  {
    "skills": "trello",
    "avg_salary": "125000.00"
  },
  {
    "skills": "ssrs",
    "avg_salary": "124500.00"
  },
  {
    "skills": "firebase",
    "avg_salary": "124166.67"
  },
  {
    "skills": "ssis",
    "avg_salary": "123628.64"
  },
  {
    "skills": "css",
    "avg_salary": "122500.00"
  },
  {
    "skills": "mariadb",
    "avg_salary": "122500.00"
  },
  {
    "skills": "t-sql",
    "avg_salary": "121600.00"
  },
  {
    "skills": "mysql",
    "avg_salary": "121179.22"
  },
  {
    "skills": "ggplot2",
    "avg_salary": "121166.67"
  },
  {
    "skills": "matlab",
    "avg_salary": "120894.72"
  },
  {
    "skills": "windows",
    "avg_salary": "120404.67"
  },
  {
    "skills": "flutter",
    "avg_salary": "120000.00"
  },
  {
    "skills": "oracle",
    "avg_salary": "119474.95"
  },
  {
    "skills": "jenkins",
    "avg_salary": "118689.00"
  },
  {
    "skills": "sql server",
    "avg_salary": "118434.68"
  },
  {
    "skills": "outlook",
    "avg_salary": "117500.00"
  },
  {
    "skills": "codecommit",
    "avg_salary": "117467.04"
  },
  {
    "skills": "cognos",
    "avg_salary": "115318.00"
  },
  {
    "skills": "django",
    "avg_salary": "115176.43"
  },
  {
    "skills": "alteryx",
    "avg_salary": "114909.53"
  },
  {
    "skills": "perl",
    "avg_salary": "114329.17"
  },
  {
    "skills": "db2",
    "avg_salary": "113381.67"
  },
  {
    "skills": "unix",
    "avg_salary": "112999.56"
  },
  {
    "skills": "postgresql",
    "avg_salary": "112769.86"
  },
  {
    "skills": "visio",
    "avg_salary": "111250.00"
  },
  {
    "skills": "dax",
    "avg_salary": "110500.00"
  },
  {
    "skills": "jquery",
    "avg_salary": "107500.00"
  },
  {
    "skills": "vba",
    "avg_salary": "107079.40"
  },
  {
    "skills": "html",
    "avg_salary": "105027.78"
  },
  {
    "skills": "electron",
    "avg_salary": "105000.00"
  },
  {
    "skills": "javascript",
    "avg_salary": "104810.00"
  },
  {
    "skills": "planner",
    "avg_salary": "104500.00"
  },
  {
    "skills": "react",
    "avg_salary": "100555.56"
  },
  {
    "skills": "clojure",
    "avg_salary": "100000.00"
  },
  {
    "skills": "lisp",
    "avg_salary": "100000.00"
  },
  {
    "skills": "angular",
    "avg_salary": "92467.04"
  },
  {
    "skills": "next.js",
    "avg_salary": "80000.00"
  },
  {
    "skills": "typescript",
    "avg_salary": "80000.00"
  },
  {
    "skills": "digitalocean",
    "avg_salary": "75000.00"
  },
  {
    "skills": "ruby on rails",
    "avg_salary": "66000.00"
  }
]
*/