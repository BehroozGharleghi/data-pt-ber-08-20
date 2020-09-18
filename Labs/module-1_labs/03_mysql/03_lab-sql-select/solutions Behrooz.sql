# 1. From the client table, what are the ids of the first 5 clients from disrict_id 1?
select * from bank.client limit 10;
select district_id, client_id from bank.client order by district_id limit 5;

# 2. From the client table, what is the id of the last client from district_id 72?
select district_id, client_id from bank.client where district_id=72 order by client_id desc limit 1;

#3. From the loan table, what are the 3 lowest amounts?
