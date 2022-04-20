{\rtf1\ansi\ansicpg1252\cocoartf2636
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\froman\fcharset0 Times-Roman;\f1\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red32\green32\blue32;\red242\green242\blue242;
\red32\green32\blue32;\red255\green255\blue255;\red242\green242\blue242;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\cssrgb\c16863\c16863\c16863;\cssrgb\c96078\c96078\c96078;
\cssrgb\c16863\c16863\c16863;\cssrgb\c100000\c100000\c100000\c80000;\cssrgb\c96078\c96078\c96078;}
{\*\listtable{\list\listtemplateid1\listhybrid{\listlevel\levelnfc0\levelnfcn0\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{decimal\}}{\leveltext\leveltemplateid1\'01\'00;}{\levelnumbers\'01;}\fi-360\li720\lin720 }{\listlevel\levelnfc23\levelnfcn23\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{hyphen\}}{\leveltext\leveltemplateid2\'01\uc0\u8259 ;}{\levelnumbers;}\fi-360\li1440\lin1440 }{\listname ;}\listid1}}
{\*\listoverridetable{\listoverride\listid1\listoverridecount0\ls1}}
\margl1440\margr1440\vieww17880\viewh13380\viewkind0
\deftab720
\pard\pardeftab720\li960\partightenfactor0

\f0\fs24 \cf2 \expnd0\expndtw0\kerning0
# Deliverable 2\
\
## \cf3 \kerning1\expnd0\expndtw0 	\expnd0\expndtw0\kerning0
Filter the data and create a new DataFrame or table to retrieve all the rows where the\'a0\cb4 total_votes\cb1 \'a0count is equal to or greater than 20 to pick reviews that are more likely to be helpful and to avoid having division by zero errors later on.\
\pard\pardeftab720\li960\partightenfactor0
\cf2 \
CREATE TABLE vine_table_totalvotes\
AS (SELECT * \
FROM vine_table\
WHERE total_votes >20\
GROUP BY review_id);\
\'a0\
## \cf5 \cb6 \outl0\strokewidth0 \strokec5 Filter the new DataFrame or table created in Step 1 and create a new DataFrame or table to retrieve all the rows where the number of\'a0\cf0 \cb7 \strokec2 helpful_votes\cf5 \cb6 \strokec5 \'a0divided by\'a0\cf0 \cb7 \strokec2 total_votes\cf5 \cb6 \strokec5 \'a0is equal to or greater than 50%.\cf5 \cb1 \strokec5 \
\
\cf2 \outl0\strokewidth0 CREATE TABLE vine_table_helpfulvotes\
AS (SELECT * \
FROM vine_table_totalvotes\
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5);\
\
## \cf5 \kerning1\expnd0\expndtw0 	\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec5 Filter the DataFrame or table created in Step 2, and create a new DataFrame or table that retrieves all the rows where a review was written as part of the Vine program (paid),\'a0\cb7 vine == 'Y'\cb1 .\
\cf2 \outl0\strokewidth0 \
CREATE TABLE vine_table_vine_y\
AS (SELECT *\
FROM vine_table_helpfulvotes\
WHERE (vine = 'Y'));\
\'a0\
\pard\tx940\tx1440\pardeftab720\li1440\fi-1440\ri580\partightenfactor0
\ls1\ilvl1\cf5 \kerning1\expnd0\expndtw0 	## \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec5 Repeat Step 3, but this time retrieve all the rows where the review was not part of the Vine program (unpaid),\'a0\cb7 vine == 'N'\cb1 .\
\pard\pardeftab720\li960\partightenfactor0
\cf2 \outl0\strokewidth0 \
CREATE TABLE vine_table_vine_n\
AS (SELECT *\
FROM vine_table_helpfulvotes\
WHERE (vine = 'N'));\
\
##\cf5 \kerning1\expnd0\expndtw0 	\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec5 Determine the total number of reviews, the number of 5-star reviews, and the percentage of 5-star reviews for the two types of review (paid vs unpaid).\
\cf2 \outl0\strokewidth0 \
SELECT DISTINCT COUNT(review_id)\
FROM vine_table_vine_y;\
Answer: 162\
\'a0\
SELECT DISTINCT COUNT(review_id)\
FROM vine_table_vine_y\
WHERE (star_rating = 5);\
Answer: 63\
\'a0\
SELECT DISTINCT COUNT(review_id)\
FROM vine_table_vine_n;\
Answer: 35606\
\'a0\
SELECT DISTINCT COUNT(review_id)\
FROM vine_table_vine_n\
WHERE (star_rating = 5);\
Answer: 19444
\f1\fs32 \
}