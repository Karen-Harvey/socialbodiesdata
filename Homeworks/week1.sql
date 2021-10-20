-- week 1 - 4th october
-- Coding Homework

-- Question 1
select rp.id, rp.first_name, rp.last_name, rs.name 
from researchdata_person rp 
left join researchdata_slgeneric rs on rp.gender_id = rs.id;

-- Question 2
select rp.id, rp.first_name, rp.last_name, rs.name 
from researchdata_person rp 
left join researchdata_slgeneric rs on rp.gender_id = rs.id 
where rp.last_name is 'Nicholson';

-- Question 3
select rl.id, rp.first_name, rp.last_name 
from researchdata_letterperson rl 
left join researchdata_person rp on rl.person_id = rp.id;

-- Question 4
select lp.id, letter.title, person.first_name, person.last_name, genplr.name as 'person letter relationship'
from researchdata_letterperson lp 
LEFT JOIN researchdata_letter letter ON lp.letter_id = letter.id
LEFT JOIN researchdata_person person ON lp.person_id = person.id
LEFT JOIN researchdata_slgeneric genplr ON lp.person_letter_relationship_id = genplr.id;

-- Question 5
select lp.id, letter.title, person.first_name, person.last_name, genplr.name as 'person letter relationship'
from researchdata_letterperson lp 
LEFT JOIN researchdata_letter letter ON lp.letter_id = letter.id
LEFT JOIN researchdata_person person ON lp.person_id = person.id
LEFT JOIN researchdata_slgeneric genplr ON lp.person_letter_relationship_id = genplr.id
where genplr.name = 'primary author';

-- Question 6
select lp.id as 'letter person', gen_ba.name as 'bodily activity'
from researchdata_letterperson lp 
LEFT JOIN researchdata_letterperson_bodily_activity lpba on lp.id = lpba.letterperson_id
LEFT JOIN researchdata_slgeneric gen_ba on lpba.slletterpersonbodilyactivity_id = gen_ba.id;

--Question 7
elect lp.id as 'letter person', gen_ba.name as 'bodily activity'
from researchdata_letterperson lp 
LEFT JOIN researchdata_letterperson_bodily_activity lpba on lp.id = lpba.letterperson_id
LEFT JOIN researchdata_slgeneric gen_ba on lpba.slletterpersonbodilyactivity_id = gen_ba.id
where gen_ba.name = 'writing'
