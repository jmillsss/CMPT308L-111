--Jarett Miller
--Database Management 
--HW 2
--9/23/13

--1
select a.city
from agents a
where a.aid in (
	select o.aid
	from orders o
	where o.cid = 'c002'
	)
;

--2
select distinct o.pid
from orders o
where o.aid in (
	select o.aid
	from orders o
	where o.cid in (
		select c.cid
		from customers c
		where c.city = 'Kyoto'
		))
;

--3
select c.cid, c.name
from customers c
where c.cid in (
	select distinct o.cid
	from orders o
	where o.aid in (
		select a.aid
		from agents a
		where a.aid != 'a03' 
		))
;

--4
select c.cid, c.name
from customers c
where c.cid in (
	select o.cid
	from orders o
	where o.pid = 'p01' 
	   or o.pid = 'p07'
	)
;

--5
select distinct o.pid
from orders o
where o.cid in (
	select o.cid
	from orders o
	where o.aid = 'a03'
	)
;

--6
select c.name, c.discount
from customers c
where c.cid in (
	select distinct o.cid
	from orders o
	where o.aid in (
		select a.aid
		from agents a
		where a.city = 'Dallas' or a.city = 'Duluth'
		))
;

--7
select c.cid, c.name
from customers c
where c.discount in (
	select c.discount
	from customers c
	where c.city = 'Kyoto' or c.city = 'Dallas'
	)
;