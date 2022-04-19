--  select all stores from store table join address,city,country tables and get full_address of stores by string concat
SELECT 
 	store.store_id,
 	first_name,
 	last_name,
 	address||' '||city||' '||country as full_address
 from store
 JOIN staff ON store.manager_staff_id = staff.staff_id
 JOIN address ON store.address_id = address.address_id
 JOIN city on address.city_id=city.city_id
 JOIN country on city.country_id=country.country_id


---------------------------------------------------------------

--select all countries which country name starts with A
SELECT * from country where country like'A%'

--------------------------------------------------------------------
-- select all cities city name includes e
SELECT 	* from city where city like '%e%'


---------------------------------------------------------
--select all payments which happened between 2007-02-15 - 2007-02-20 and join customer who made payment
SELECT 
	payment_date,
	customer.customer_id,
	customer.first_name||' '||customer.last_name as customer
from payment
JOIN customer on payment.customer_id=customer.customer_id
where payment_date between '2007-02-15' and '2007-02-20'
order by customer asc

---------------------------------------------------------
--select all films and sort by title
SELECT 
	*
	from film
	order by title asc

---------------------------------------------------------
--select  all payments where amount between 2-5 join staff and customer
SELECT 
	payment_id,
	staff.first_name||' '||staff.last_name||' // id='||staff.staff_id as staff_name,
	customer.first_name||' '||customer.last_name||' // id='||customer.customer_id as customer_name,
	amount
	from payment

join staff on payment.staff_id=staff.staff_id
join customer on payment.customer_id=customer.customer_id
where amount between '2' and '5'

---------------------------------------------------------
-- create blog table that includes following columns
-- blog_id
-- title
-- category
-- content

CREATE TABLE IF NOT EXISTS blog(
	blog_id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	title varchar(50) NOT NULL,
	category varchar(50) NOT NULL,
	_content varchar(100) NOT NULL UNIQUE,
	created_at TIMESTAMPTZ DEFAULT NOW(),
	updated_at TIMESTAMPTZ DEFAULT NOW()
);