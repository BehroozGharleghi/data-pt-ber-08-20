create table publications.store_sales_summary
select stores.stor_name as Store, count(distinct(ord_num)) as Orders, count(sales.title_id) as items, sum(qty) as QTY 
FROM publications.sales inner join publications.stores 
on stores.stor_id = sales.stor_id
group by store
select * from publications.store_sales_summary;


# delete rows by condition:
delete from publications.store_sales_summary 
where QTY < 100;

# to delete table:
drop table publications.store_sales_summary;

# delete the column QTY: we need to alter the table
alter table publications.store_sales_summary drop column QTY;


# updating data in the table:
update publications.store_sales_summary
set QTY = QTY*2;






