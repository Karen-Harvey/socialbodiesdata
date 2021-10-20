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



