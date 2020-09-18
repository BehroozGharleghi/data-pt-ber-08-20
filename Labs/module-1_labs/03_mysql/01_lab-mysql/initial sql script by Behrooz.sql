SELECT * FROM olist.closed_deals;
select sr_id, lead_type, has_company from olist.closed_deals;
select business_segment from olist.closed_deals;
select distinct business_segment from olist.closed_deals;
select * from olist.closed_deals where business_segment='toys';
select* from olist.closed_deals order by lead_type;
select distinct lead_type from olist.closed_deals order by lead_type;
# introduce limit:
select * from olist.closed_deals order by won_date desc limit 5;
# we can perform aggregations: like max , min, average, etc
select max(won_date) from olist.closed_deals;
# first date by business segment:
select max(won_date) from olist.closed_deals;
# min of (first date) every business segment:
select min(won_date), business_segment from olist.closed_deals group by business_segment ;

# we need to respect order as it is stated here be tartib: select, from, where, group by, order by, limit:
select min(won_date) as earliest_date, business_segment from olist.closed_deals group by business_segment order by earliest_date limit 10;


