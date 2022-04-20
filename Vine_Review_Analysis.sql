# Deliverable 2

## 	Filter the data and create a new DataFrame or table to retrieve all the rows where the total_votes count is equal to or greater than 20 to pick reviews that are more likely to be helpful and to avoid having division by zero errors later on.

CREATE TABLE vine_table_totalvotes
AS (SELECT * 
FROM vine_table
WHERE total_votes >20
GROUP BY review_id);
 
## Filter the new DataFrame or table created in Step 1 and create a new DataFrame or table to retrieve all the rows where the number of helpful_votes divided by total_votes is equal to or greater than 50%.

CREATE TABLE vine_table_helpfulvotes
AS (SELECT * 
FROM vine_table_totalvotes
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5);

## 	Filter the DataFrame or table created in Step 2, and create a new DataFrame or table that retrieves all the rows where a review was written as part of the Vine program (paid), vine == 'Y'.

CREATE TABLE vine_table_vine_y
AS (SELECT *
FROM vine_table_helpfulvotes
WHERE (vine = 'Y'));
 
	## Repeat Step 3, but this time retrieve all the rows where the review was not part of the Vine program (unpaid), vine == 'N'.

CREATE TABLE vine_table_vine_n
AS (SELECT *
FROM vine_table_helpfulvotes
WHERE (vine = 'N'));

##	Determine the total number of reviews, the number of 5-star reviews, and the percentage of 5-star reviews for the two types of review (paid vs unpaid).

SELECT DISTINCT COUNT(review_id)
FROM vine_table_vine_y;
Answer: 162
 
SELECT DISTINCT COUNT(review_id)
FROM vine_table_vine_y
WHERE (star_rating = 5);
Answer: 63
 
SELECT DISTINCT COUNT(review_id)
FROM vine_table_vine_n;
Answer: 35606
 
SELECT DISTINCT COUNT(review_id)
FROM vine_table_vine_n
WHERE (star_rating = 5);
Answer: 19444