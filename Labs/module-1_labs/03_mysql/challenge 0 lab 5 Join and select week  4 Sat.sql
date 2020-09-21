# this is lab for JOIN: Challenge 0:
# a) Create a table which for each author contains their author id, first name, last name, and the total number of titles 
# they have written according to the titleauthor table. Give each variable an alias, such that the table output is easy to 
# read and interpret.
# Are there any authors in the author table, that do not have any publications in the titleauthor table?

SELECT authors.au_id, authors.au_fname, authors.au_lname, count(titleauthor.title_id) AS WrittenArticle FROM
publications.authors LEFT JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id
GROUP BY authors.au_id ORDER BY WrittenArticle DESC;

# b) Create a table which for each job description contains the first hire date (i.e. the first employee with this 
# job id was hired). Again, name the columns properly to have a nice return table. Sort the results from the job description 
# with the first hire to the one with the last hire.

SELECT employee.hire_date, jobs.job_desc, jobs.job_id FROM publications.employee
INNER JOIN publications.jobs ON employee.job_id = jobs.job_id
ORDER BY employee.hire_date ASC;

# Challenge 1 - Who Have Published What At Where?
#In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author 
# has published at which publishers. Your output should have at least the following columns:
# AUTHOR ID - the ID of the author
#LAST NAME - author last name
#FIRST NAME - author first name
#TITLE - name of the published title
#PUBLISHER - name of the publisher where the title was published

SELECT authors.au_id as Author_ID, authors.au_fname as First_Name, authors.au_lname as Last_Name, 
titles.title, publishers.pub_name AS PUBLISHER FROM publications.authors 
INNER JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN publications.titles ON titles.title_id = titleauthor.title_id
INNER JOIN publications.publishers ON publishers.pub_id = titles.pub_id;

# Challenge 2 - Who Have Published How Many At Where?
# Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. 
# Your output should look something like below:

SELECT authors.au_id as Author_ID, authors.au_fname as First_Name, authors.au_lname as Last_Name, 
COUNT(titles.title_id) AS Title_Count, publishers.pub_name AS PUBLISHER FROM publications.authors 
INNER JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN publications.titles ON titles.title_id = titleauthor.title_id
INNER JOIN publications.publishers ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id Order by Title_Count DESC;

# Challenge 3 - Best Selling Authors
#Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

#Requirements:
#Your output should have the following columns:
#AUTHOR ID - the ID of the author
#LAST NAME - author last name
#FIRST NAME - author first name
#TOTAL - total number of titles sold from this author
#Your output should be ordered based on TOTAL from high to low.
#Only output the top 3 best selling authors.

SELECT authors.au_id, authors.au_lname, authors.au_fname, sales.qty 


# Join Lab by Teacher from sales and store tables: to get name of the store, 
#number of orders(count of distinct order ids), the count of titles and the sum of qty from the sales table. 
SELECT stores.stor_name AS store, COUNT(distinct(sales.ord_num)) AS orders, COUNT(sales.title_id) as items, 
SUM(sales.qty) AS qty
FROM publications.stores INNER JOIN publications.sales
ON sales.stor_id = stores.stor_id
GROUP BY stores.stor_name;

# to make calculation on a output table we use temporary table(we use table above):
CREATE TEMPORARY TABLE publications.store_sales_summary
SELECT stores.stor_name AS store, COUNT(distinct(sales.ord_num)) AS orders, COUNT(sales.title_id) as items, 
SUM(sales.qty) AS qty
FROM publications.stores INNER JOIN publications.sales
ON sales.stor_id = stores.stor_id
GROUP BY stores.stor_name;
# to see what we have in our temporary table:
SELECT * FROM publications.store_sales_summary;
# now we can do calculations using our temporary table: average of items/order & Average of qtry/items:
SELECT store, items/orders AS avgItems, qty/items AS AvgQty
FROM publications.store_sales_summary; 

# to do calculations based on an output we can use subquery:
SELECT store, items/orders AS avgItems, qty/items AS AvgQty
FROM 
(SELECT stores.stor_name AS store, COUNT(distinct(sales.ord_num)) AS orders, COUNT(sales.title_id) as items, 
SUM(sales.qty) AS qty
FROM publications.stores INNER JOIN publications.sales
ON sales.stor_id = stores.stor_id
GROUP BY stores.stor_name) AS Summary;
