SELECT 	person.id,
        person.first_name,
        person.middle_name,
        person.last_name,
        person.alternative_spelling_of_name,
        person.alternative_names,
        person.year_of_birth,
        person.year_of_death,
        person.year_active_start,
        person.year_active_end,
        person.occupation,
        slpersongender.name as 'gender',
        GROUP_CONCAT(DISTINCT slpersonmaritalstatus.name) as 'm2m_marital_status',
        GROUP_CONCAT(DISTINCT slpersonrank.name) as 'm2m_rank',
        GROUP_CONCAT(DISTINCT slpersonreligion.name) as 'm2m_religion',
        GROUP_CONCAT(DISTINCT slpersontitle.name) as 'm2m_title',
        person.admin_notes

FROM researchdata_person person

-- FK
LEFT JOIN researchdata_slgeneric slpersongender ON person.gender_id = slpersongender.id
-- M2M - marital status
LEFT JOIN researchdata_person_marital_status person_marital_status ON person.id = person_marital_status.person_id
LEFT JOIN researchdata_slgeneric slpersonmaritalstatus ON person_marital_status.slpersonmaritalstatus_id = slpersonmaritalstatus.id
-- M2M - rank
LEFT JOIN researchdata_person_rank person_rank ON person.id = person_rank.person_id
LEFT JOIN researchdata_slgeneric slpersonrank ON person_rank.slpersonrank_id = slpersonrank.id
-- M2M - religion
LEFT JOIN researchdata_person_religion person_religion ON person.id = person_religion.person_id
LEFT JOIN researchdata_slgeneric slpersonreligion ON person_religion.slpersonreligion_id = slpersonreligion.id
-- M2M - title
LEFT JOIN researchdata_person_title person_title ON person.id = person_title.person_id
LEFT JOIN researchdata_slgeneric slpersontitle ON person_title.slpersontitle_id = slpersontitle.id

GROUP BY person.id
ORDER BY person.id;
