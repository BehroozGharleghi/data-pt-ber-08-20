# Please create a new table in the publications database called total_royalties which for each author contains 
# their author ID, last name, first name, number of total titles and the sum of royalties they have received.

create table publications.total_royalties
select authors.au_id, authors.au_lname, authors.au_fname, count(titleauthor.title_id) as count_title, 
sum(titleauthor.royaltyper) as sum_royalty from publications.authors 
inner join publications.titleauthor on authors.au_id = titleauthor.au_id
group by au_id;
select * from publications.total_royalties;
#drop table publications.total_royalties;

# Delete every author which has received total royalties of less than 100.
delete from  publications.total_royalties where sum_royalty < 100;

#  Create a new column of type float called AvgRoyalty (this is an ALTER TABLE statement).
alter table publications.total_royalties 
add AvgRoyalty varchar(255);
select * from total_royalties;

# 4. AvgRoyaltyUpdate the new column AvgRoyalty to equal the average royalty per title for each author.

update publications.total_royalties
set AvgRoyalty = sum_royalty/count_title;
select * from total_royalties;

# Empty all of the values in the table.
truncate table publications.total_royalties;
select * from total_royalties;

# Repopulate the table to contain the same values as it did after step (4), in one single query (you have to use
#  a subquery here)!
# why it does not have values bigger than 100 in AvgRoyalty?
 
INSERT INTO publications.total_royalties
 SELECT au_id, au_lname, au_fname, count_title, sum_royalty, sum_royalty/count_title AS AvgRoyalty FROM
(SELECT authors.au_id, authors.au_lname, authors.au_fname,
COUNT(titleauthor.title_id) AS count_title, SUM(titleauthor.royaltyper) AS sum_royalty
FROM publications.authors
INNER JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id
GROUP BY authors.au_id ORDER BY count_title) summary;
select * from total_royalties;



