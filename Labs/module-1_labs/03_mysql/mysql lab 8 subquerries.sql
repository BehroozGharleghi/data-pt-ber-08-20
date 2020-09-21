# In this challenge, please create a table which for each author contains their author ID, last name, first name, number of 
#total titles and the sum of royalties they have received,
select * from publications.titles order by title_id DESC;
SELECT authors.au_id, authors.au_lname, authors.au_fname, COUNT(titleauthor.title_id) AS Total_Title,
SUM(titles.royalty) as sum_royalty FROM publications.authors 
INNER JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN publications.titles ON titleauthor.title_id = titles.title_id
group by authors.au_id order by sum_royalty DESC;

# Step 2: #In a second step, we from this table would then like to calculate the average royalty per title each author has 
#received. The final table should contain for each author their author ID, last name, first name and average royalty 
# calculated as sum of royalties divided by title count. Here is teh temporary table:
CREATE TEMPORARY TABLE publications.royalty_summary1
SELECT authors.au_id, authors.au_lname, authors.au_fname, COUNT(titleauthor.title_id) AS Total_Title,
SUM(titles.royalty) as sum_royalty FROM publications.authors 
INNER JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN publications.titles ON titleauthor.title_id = titles.title_id
group by titleauthor.title_id;
SELECT au_id, au_lname, au_fname, sum_royalty/Total_Title AS Avereage_Royalty FROM publications.royalty_summary1;

##Solve this challenge using a subquery: 
SELECT au_id, au_lname, au_fname, sum_royalty/Total_Title AS Avereage_Royalty FROM 
(SELECT authors.au_id, authors.au_lname, authors.au_fname, COUNT(titleauthor.title_id) AS Total_Title,
SUM(titles.royalty) as sum_royalty FROM publications.authors 
INNER JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN publications.titles ON titleauthor.title_id = titles.title_id
group by titleauthor.title_id) AS summary;
