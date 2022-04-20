# Amazon_Vine_Analysis
Module 16
## Overview
The purpose of this assignment was to select a data file containing Amazon reviews written by members of the paid Vine program and perform an analysis. We used PySpark, AWS RDS, PG Admin and SQL to complete the analysis. I selected the 'Pet Products' file. After we extracted and transformed the data, we then looked deeper into whether or not the paid reviews had any bias compared to nonpaid reviews. 

## Analysis
* Once we cleaned and transformed the data into new dataframes, in my selected file, Pet Products, there were only 162 reviews that were paid (vine = 'Y') while there were 35,606 that were not paid (vine = 'N')

* Out of the Vine reviews, 63 reviews had a five star rating. From the non Vine reviews, 19,444 had a five star rating.

* The percent of Vine reviews with 5 star rating was 38.9% while the percent for non Vine reviews was 54.6%

## Summary
In conclusion, we did not find a positivity bias with the Vine reviews because the non Vine reviews actually had a higher percentage of 5 star ratings(54.6% compared to 38.9%). However, one recommendation I have would be to further analyze based on product type. I would be interested to see if different product types had varying ratings. 
