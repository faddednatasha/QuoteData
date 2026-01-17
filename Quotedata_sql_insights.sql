create database assin;
use assin;

 select * from Quote; 

-- 1.Find the number of quotes by each author.
SELECT 
    Author,
    COUNT(*) AS number_of_quotes
FROM 
    Quote
GROUP BY 
    Author
ORDER BY 
    number_of_quotes DESC;
-- 2.List the top 5 most common tags.
SELECT 
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(tags, ',', numbers.n), ',', -1)) AS Tag,
    COUNT(*) AS tag_count
FROM 
    comp
JOIN 
    (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL 
     SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6) numbers
    ON CHAR_LENGTH(tags) - CHAR_LENGTH(REPLACE(tags, ',', '')) >= numbers.n - 1
WHERE 
    Tags IS NOT NULL
GROUP BY 
    Tag
ORDER BY 
    tag_count DESC
LIMIT 5;
-- 3.Find authors who have more than 5 quotes.
SELECT 
    Author,
    COUNT(*) AS quote_count
FROM 
    Quote
GROUP BY 
    Author
HAVING 
    COUNT(*) > 5
ORDER BY 
    quote_count DESC;
    
-- 4. Retrieve the longest quote and its author.-- 
SELECT 
    Author,
    Quote,
    LENGTH(quote) AS quote_length
FROM 
    Quotes
ORDER BY 
    quote_length DESC
LIMIT 1;
