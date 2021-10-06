-- This query shows how many ....

--SELECT lp.id, l.title, p.first_name, p.last_name, slletterpersonemotion.name as 'emotion', person_letter_relationship_id
SELECT SUBSTRING(l.sent_date_year, 0, 4) as "decades",
	COUNT(*) as "count"
FROM researchdata_letterperson lp 
LEFT JOIN researchdata_letter l ON lp.letter_id = l.id
LEFT JOIN researchdata_person p ON lp.person_id = p.id
LEFT JOIN researchdata_letterperson_emotion letterperson_emotion ON lp.id = letterperson_emotion.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonemotion ON letterperson_emotion.slletterpersonemotion_id = slletterpersonemotion.id
--WHERE (emotion = 'sorrow' or emotion = 'fear') and p.first_name = 'Samuel' and person_letter_relationship_id = 278;
WHERE slletterpersonemotion.name = 'sorrow' and p.gender_id = 2
GROUP by decades;
