# we need to respect order as it is stated here be tartib: select, from, where, group by, order by, limit:
# 1. From the client table, what are the ids of the first 5 clients from disrict_id 1?
select * from bank.client limit 10;
select district_id, client_id from bank.client order by district_id limit 5;

# 2. From the client table, what is the id of the last client from district_id 72?
select district_id, client_id from bank.client where district_id=72 order by client_id desc limit 1;

#3. From the loan table, what are the 3 lowest amounts?
select * from bank.loan;
select amount from bank.loan order by amount asc limit 3;

#4. From the loan table, what are the possible values for status, ordered alphabetically in ascending order?
select distinct status from bank.loan order by status asc;

#5. From the loans table, what is the loan_id of the highest payment received?
# ask Cristina about it:
select max(payments), loan_id from bank.loan;  
select * from bank.loan where loan_id = 6415;

#6. From the loans table, what is the loan amount of the lowest 5 account_ids. Show the account_id and the corresponding amount
select account_id, amount from bank.loan order by account_id asc limit 5; 

#7. From the loans table, which are the account_ids with the lowest loan amount have a loan duration of 60?
select account_id, amount, duration from bank.loan where duration = 60 order by amount asc limit 5;

# 8. From the order table, what are the unique values of k_symbol?
select distinct k_symbol from bank.order where k_symbol is not null;

#9. From the order table, which are the order_ids from the client with the account_id 34?
select order_id from bank.order where account_id = 34;

#10. From the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
select distinct account_id from bank.order where order_id between 29540 and 29560;

#11. From the order table, what are the individual amounts that were sent to (account_to) id 30067122?
select * from bank.order;
select amount, account_to from bank.order where account_to = 30067122;

#12. From the trans table, show the trans_id, date, type and amount of the 10 first transactions from 
# account_id = 793 in chronological order, from newest to oldest.
select * from bank.trans;
select trans_id, date, type, amount from bank.trans where account_id = 793 order by date desc limit 10;

# Lab 2 :aggregation

# 1. From the client table, of all districts with a district_id lower than 10, how many clients are from 
# each district_id? Show the results sorted by district_id in ascending order.
select district_id, count(client_id) from bank.client where district_id between 1 and 9 group by district_id 
order by district_id asc; 

# 2. From the card table, how many cards exist for each type? Rank the result starting with the most frequent type.
select * from bank.card;
select type, count(card_id) from bank.card group by type order by count(card_id) desc;

# 3. Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
select account_id, sum(amount) from bank.loan group by account_id order by sum(amount) desc limit 10;

# 4. From the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in 
# descending order:
SELECT * FROM bank.loan;
SELECT date, COUNT(loan_id) FROM bank.loan WHERE date<930907 GROUP BY date ORDER BY date DESC; 

# 5. From the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration, 
# ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.

SELECT duration, COUNT(loan_id), date FROM bank.loan WHERE date BETWEEN 971201 AND 971231 GROUP BY date 
order by duration ASC; 

# 6. From the trans table, for account_id 396, sum the amount of transactions for each type 
# (VYDAJ = Outgoing, PRIJEM = Incoming). Your output should have the account_id, the type and the sum of amount, named as
# total_amount. Sort alphabetically by type.
SELECT * FROM bank.trans;

SELECT account_id, type, SUM(amount) FROM bank.trans WHERE type = 'VYDAJ' and account_id =396 
or type = 'PRIJEM' and account_id =396 group by type order by type;

# 7. From the previous output, translate the values for type to English, rename the column to transaction_type, 
# round total_amount down to an integer

SELECT account_id, type as transaction_type, SUM(amount) FROM bank.trans WHERE type = 'VYDAJ' as 'outgoing' and account_id =396 
or type = 'PRIJEM' as 'incoming'and account_id =396 group by type order by type;











