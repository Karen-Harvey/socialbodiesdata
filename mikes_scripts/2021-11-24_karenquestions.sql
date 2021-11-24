-- Karen asked a few questions during our coaching session on 2021-11-24 that I had to work on after the session. These are the answers to the questions.




-- QQ - can we group by country??

-- Mike's notes: this is all 1 query (using 4 subqueries), so copy, paste and execute the whole block as one. It will display them as 4 columns instead of 4 rows, but the data will be the same.

select 
(select count (*) from researchdata_letter where sent_from_location like '%england%') as 'england',
(select count (*) from researchdata_letter where sent_from_location like '%scotland%') as 'scotland',
(select count (*) from researchdata_letter where sent_from_location like '%wales%') as 'wales',
(select count (*) from researchdata_letter where sent_from_location like '%ireland%') as 'ireland';






--QQ - How many of all letterpersons are male and female? [we need to do two separate calculations, I think??]

-- Mike's notes: This uses subqueries as well and adds them together (note the + sign between subqueries). 

select
(
	select count(*)
	from researchdata_letterperson lp
	left join researchdata_slgeneric genothergen on lp.person_other_gender_id = genothergen.id
	where person_other_gender_id is not null and genothergen.name = 'male'
	group by person_other_gender_id
) +
(
	select count(*)
	from researchdata_letterperson lp
	left join researchdata_person p on lp.person_id = p.id
	left join researchdata_slgeneric gengen on p.gender_id = gengen.id
	where p.gender_id is not null and gengen.name = 'male'
	group by p.gender_id
)
as 'count_total_males',
(
	select count(*)
	from researchdata_letterperson lp
	left join researchdata_slgeneric genothergen on lp.person_other_gender_id = genothergen.id
	where person_other_gender_id is not null and genothergen.name = 'female'
	group by person_other_gender_id
) +
(
	select count(*)
	from researchdata_letterperson lp
	left join researchdata_person p on lp.person_id = p.id
	left join researchdata_slgeneric gengen on p.gender_id = gengen.id
	where p.gender_id is not null and gengen.name = 'female'
	group by p.gender_id
)
as 'count_total_females',
(
	select count(*)
	from researchdata_letterperson lp
	left join researchdata_slgeneric genothergen on lp.person_other_gender_id = genothergen.id
	where person_other_gender_id is not null and genothergen.name = 'both'
	group by person_other_gender_id
)
as 'count_total_both'





-- QQ - is there a way of removing duplicates from the query above on non-person gender??

-- Mike's notes: you were previously wrapping distinct() around the name from generic table but it instead needs to be put around the person_other field to show unique person_other values. In this example I've done 2 counts: 1 of all person_other and another of distinct person_other, so you can compare (and easily remove one if not needed)

select genothergen.name as 'other gender', 
	   count(person_other) as 'total_count',
	   count(distinct(person_other)) as 'distinct_count'
from researchdata_letterperson lp 
left join researchdata_slgeneric genothergen on lp.person_other_gender_id = genothergen.id 
where lp.person_id is null
group by person_other_gender_id;

