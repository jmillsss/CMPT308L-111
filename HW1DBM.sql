-- Jarett Miller	
-- Homework 1 - DBM
-- 9/15/13

-- 1
select * from agents

-- 2  
select agents.name, agents.city  
from agents  
where (agents.name='Smith')

-- 3
select products.pid, products.name, products.quantity 
from products 
where (products.priceUSD > 1.25)

-- 4
 select ordno, aid 
 from orders

-- 5
 select customers.name, customers.city 
from customers  
where (customers.city <> 'Dallas')

-- 6 
select agents.name 
from agents  
where (agents.city = 'New York') 
OR (agents.city = 'Newark')

-- 7
 select *  from products  
where (products.city <> 'New York') 
and (products.city <> 'Newark') 
and (products.priceUSD <= 1.00)

-- 8
  SELECT * 
 from orders 
where (orders.mon = 'jan')
 or (orders.mon = 'mar')

-- 9
 select * 
 from orders  
where (orders.mon = 'feb')
and (orders.dollars < 100)

-- 10
select *  
from orders  
where (orders.cid = 'c005')
