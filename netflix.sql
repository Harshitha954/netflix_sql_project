-- NETFLIX PROJECT

 CREATE TABLE NETFLIX(
 show_id	VARCHAR(6),
 type	VARCHAR(10),
 title	VARCHAR(150),
 director	VARCHAR(250),
 casts	VARCHAR(1000),
 country	VARCHAR(150),
 date_added	VARCHAR(50),
 release_year	INT,
 rating	VARCHAR(10),
 duration	VARCHAR(15),
 listed_in	VARCHAR(100),
 description VARCHAR(250)
);

select * from netflix;
select count(*) from netflix;

-- 1.count the num of movies vs tv shows

select type,count(*)
from netflix
group by type;



-- find the most common rating for movies and tv shows
select *
from (select type,rating,
         dense_rank() over (partition by type order by count(*) desc) as ranking
from netflix
group by type,rating
) as t
where ranking = 1;


-- list all movies released in a specific year (eg 2020)
select title
from netflix
where release_year = 2020  and  type = 'Movie';

-- find the top 5 countries with the most content on netflix

select count(show_id) as total,unnest(string_to_array(country,','))as new_country
from netflix
group by new_country
order by total desc
limit 5;

-- identify the longest movie
select title,duration
from netflix
where type='Movie' and duration is not null
order by duration desc;

select title,duration
from netflix
where type='Movie' and duration=(select max(duration) from netflix);

-- find the content added in the last 5 years
select *
from netflix
where to_date(date_added,'month dd,yyyy')>= current_date - interval '5 years';


-- find all the movies\tv shows by director 'rajiv chilaka'

select title,director
from netflix
where director like '%Rajiv Chilaka%';

-- list all tv shows with more than 5 seasons

select *
from netflix
where type = 'TV Show' and split_part(duration,' ',1)::numeric > 5;

-- count the num of content item in each genre
select unnest(string_to_array(listed_in,',')) as new_listed_in,count(show_id)
from netflix
group by new_listed_in
order by count(show_id) desc;


select new_listed_in,count(show_id)
from (select unnest(string_to_array(netflix.listed_in,',')) as new_listed_in,show_id
from netflix) as t
group by new_listed_in
order by count(show_id) desc;


-- find each year and the average num of content realse by india on netflix.return top 5 yr with highest
-- avg content realease

select *
from netflix;

select 
        extract(year from to_date(date_added, 'month dd,yyyy')) as year,
		count(*) as yearly_content,
		round(
        count(*)::numeric/(select count(*) from netflix where country = 'India')::numeric *100,2)
		      as avg_content_per_year
from netflix
where country = 'India'
group by year
order by avg_content_per_year desc
limit 5;


-- list all the movies that are documentaries

select *
from netflix
where listed_in Ilike '%documentaries%';

-- find all content without a director
select *
from netflix
where director is null;

-- find how many movies actor 'salman khan' appeared in last 10 years

select *
from netflix
where casts Ilike '%Salman Khan%' and release_year > extract(year from current_date)-10;

-- find the top 10 actors who have appeared in the highest num of movies produced in india
select unnest(string_to_array(casts,',')) as actors,
count(*) as total_content
from netflix
where country='India'
group by 1
order by 2 desc
limit 10;


-- categorize the content based on the presence of the keyword 'kill' and 'violence' in the 
-- description feild. label content containing these keywords as 'bad' and all other content
-- as 'good'.count how many times items fall into each category.

with new_table
as(
select *,
         case when description Ilike '%kill%' or
		           description Ilike  '%violence%' then 'bad_content'
			  else 'Good_content'
		end category
from netflix)
select category,
        count(*) as total_content
from new_table
group by 1;