# From the order_items table, find the price of the highest priced order item and lowest price order item:
select * from olist.order_items;
select max(price) from olist.order_items;
select min(price) from olist.order_items;
# # From the order_items table, what is range of the shipping_limit_date of the orders:
select min(shipping_limit_date) as earliest_date, max(shipping_limit_date) as latest_date from olist.order_items;
# From the customers table, find the 3 states with the greatest number of customers:
select * from olist.customers;
SELECT customer_state, COUNT(DISTINCT customer_id) AS "Count" from olist.customers group by customer_state ORDER BY count desc limit 3;
# From the customers table, within the state with the greatest number of customers, 
# find the 3 cities with the greatest number of customers.
select customer_city, count(distinct customer_id) as "count" from olist.customers where customer_state = "SP" group by customer_city order by count desc limit 3; 
# From the closed_deals table, how many distinct business segments are there (not including null):
select count(distinct business_segment) as count from olist.closed_deals where business_segment is not null;
# 6. From the closed_deals table, sum the declared_monthly_revenue for duplicate row values in 
# business_segment and find the 3 business segments with the highest declared monthly revenue
# (of those that declared revenue).
select distinct business_segment, sum(declared_monthly_revenue) as "sum" from olist.closed_deals group by business_segment order by sum desc limit 3;
# 7. From the order_reviews table, find the total number of distinct review score values.
SELECT count(distinct review_score) as 'total', review_score from olist.order_reviews group by review_score
order by total desc limit 5;

# 8. In the order_reviews table, create a new column with a description that corresponds to each number category 
# for each review score from 1 - 5:
select *, review_score as new_column from olist.order_reviews;
# 9. From the order_reviews table, find the review score occurring most frequently and how many times it occurs.

# Lab 2:
# 1. From the marketing_qualified_leads table, find the earliest and latest first_contact_date.
select max(first_contact_date), min(first_contact_date) from olist.marketing_qualified_leads;

# to see what is in the table:
select * from olist.marketing_qualified_leads;
# 2. From the marketing_qualified_leads table, find the top 3 most frequent origin types for 
#all first_contact_date entries in 2018.
select count(first_contact_date) as "sum", origin from olist.marketing_qualified_leads group by origin order by sum desc limit 3;

# 3. From the marketing_qualified_leads table, find the first_contact_date with the highest number of mql_id 
# entries and state the number of entries on that date.alter
SELECT COUNT(mql_id), CONVERT_TZ(first_contact_date , @@session.time_zone, '+00:00') AS nfirst_contact_date  
FROM olist.marketing_qualified_leads
GROUP BY nfirst_contact_date 
ORDER BY COUNT(mql_id) DESC LIMIT 1;

# 4. From the products table, find the name and count of the top 2 product category names.
select * from olist.product_category_name_translation;
select count(product_id) as "count", product_category_name 
from olist.products group by product_category_name order by count desc limit 2;

# 5. From the products table, find the product_category_name with the highest recorded product weight in grams.
select * from olist.products;
select max(product_weight_g) as "weight", product_category_name from olist.products
group by product_category_name order by weight desc limit 1;

# 6. From the products table, find the product_category_name with the greatest sum of dimensions including length, 
# height and width in centimeters.

select * from olist.products;

select (product_length_cm + product_height_cm + product_width_cm) as "total", product_category_name from olist.products
order by total desc limit 1;

# 7. From the order_payments table, find the payment_type with the greatest number of order_id entries and 
# the count of that payment type.
select * from olist.order_payments;
select count(payment_type) as "total", payment_type from olist.order_payments 
group by payment_type order by total desc limit 1;

# 8. From the order_payments table, find the highest payment value for an individual order_id.
select max(payment_value) from olist.order_payments;

# 9. From the sellers table, find the 3 seller states with the greatest number of distinct seller cities.
select * from olist.sellers;
select count(distinct seller_city) as "sum1", seller_state from olist.sellers
group by seller_state order by sum1 desc limit 3;




