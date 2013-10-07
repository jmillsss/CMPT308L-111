--Jarett Miller
--Database Management
--9/25/13


--1
select ag.city 
from agents as ag
where aid in 
	(select ord.aid
	from orders 
	where cid = 'c002' )
	
--2
select distinct agents.city 
from agents INNER JOIN Orders 
on agents.aid = orders.aid
Where orders.cid = 'c002'

--3
select pr.pid 
from products as pr
where pr.pid in
(select ord.pid 
from orders as ord 
where ord.cid in
(select cust.cid
from customers as cust 
where cust.city = 'Kyoto'
))

--4
select distinct pr.pid 
from products as pr INNER JOIN orders as ord
on pr.pid = ord.pid
inner join customers as cust
on ord.cid = cust.cid
where cust.city = 'Kyoto'

--5
select * 
from customers c
where c.cid not in (select s.cid 
from students s) 

-- 6 --
select c.name
from customers c full outer join orders o
	on (c.cid = o.cid)
where o.cid is null;

-- 7 --
select distinct c.name, a.name
from customers c full outer join orders o
		on (c.cid = o.cid)
	full outer join agents a
		on (o.aid = a.aid)
where c.city = a.city;

-- 8 --
select c.name, a.name
from customers c, agents a
where c.city = a.city

-- 9 --
select c.name, c.city
from customers c
where c.city in (
	select p.city
	from products p
	group by p.city
	order by count(*) asc
	limit 1);

-- 10

select c.name, c.city
from customers c
where c.city in (
	select p.city
	from products p
	group by city
	order by count(city) desc
	limit 1);

-- 12 
select p.name
from products p
where p.priceUSD>(select avg(priceUSD) from products);

-- 13 
select c.name, o.pid, o.dollars
from customers c full outer join orders o
		on (c.cid = o.cid)
order by coalesce(o.dollars, 0) desc;

-- 14 
select c.name, sum(coalesce(o.dollars,0))
from customers c full outer join orders o
		on (c.cid = o.cid)
group by c.name, c.cid;

-- 15 
select c.name, p.name, a.name
from customers c, products p, agents a, orders o
where c.cid = o.cid
  and o.pid = p.pid
  and o.aid = a.aid
  and a.city = 'New York';

-- 16 
select  o.ordno as OrderNumber, ((o.qty*p.priceUSD)-(o.qty*priceUSD*c.discount/100)) as Quoted,
	o.dollars as Paid
from customers c, orders o, products p
where c.cid = o.cid
  and p.pid = o.pid
  
-- 17 
update orders
set dollars = 400
where ordno = 1011
