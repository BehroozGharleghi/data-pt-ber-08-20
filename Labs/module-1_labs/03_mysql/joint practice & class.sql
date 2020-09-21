CREATE DATABASE publications;
# to join publishers & titles: and want to see the sales of the publishers (sales performance):
# the pub_id is the common data and it is the primary key for pub_id table. 
SELECT * FROM publications.publishers INNER JOIN publications.titles ON publishers.pub_id = titles.pub_id;

# now lets use titles as left table and publishers as right table: in inner join i get the recoreds athat are presen tin 
# both tables.
SELECT * FROM publications.titles INNER JOIN publications.publishers ON titles.pub_id = publishers.pub_id;

# now left join: this gives every publisher that even may not publish anything.
SELECT * FROM publications.publishers LEFT JOIN publications.titles ON publishers.pub_id = titles.pub_id;

# now reverse above:
SELECT * FROM publications.titles LEFT JOIN publications.publishers ON titles.pub_id = publishers.pub_id;

# now right join which is typically more practical and more conventional:

# lets selet just some columns:

SELECT publishers.pub_name, titles.title_id, titles.title FROM publications.publishers INNER JOIN
publications.titles ON publishers.pub_id = titles.pub_id; 

# how many titles each publisher has published?
SELECT publishers.pub_name, COUNT(titles.title_id) FROM publications.publishers
INNER JOIN publications.titles ON publishers.pub_id = titles.pub_id GROUP BY publishers.pub_name;

# how to rename the result coloumn from above command:
SELECT publishers.pub_name, COUNT(titles.title_id) AS CountTitles FROM publications.publishers
LEFT JOIN publications.titles ON publishers.pub_id = titles.pub_id GROUP BY publishers.pub_name ORDER BY CountTitles DESC;

# to alies for tables:
SELECT pub.pub_name, COUNT(tit.title_id) AS CountTitles FROM publications.publishers AS pub
LEFT JOIN publications.titles AS tit ON pub.pub_id = tit.pub_id GROUP BY pub.pub_name ORDER BY CountTitles DESC;
