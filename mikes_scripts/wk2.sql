-- bodily activity

select lp.id, slletterpersonbodilyactivity.name
from researchdata_letterperson lp
LEFT JOIN researchdata_letterperson_bodily_activity letterperson_bodily_activity ON lp.id = letterperson_bodily_activity.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonbodilyactivity ON letterperson_bodily_activity.slletterpersonbodilyactivity_id = slletterpersonbodilyactivity.id
WHERE slletterpersonbodilyactivity.name = 'travel';


select count(*)
from researchdata_letterperson lp
LEFT JOIN researchdata_letterperson_bodily_activity letterperson_bodily_activity ON lp.id = letterperson_bodily_activity.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonbodilyactivity ON letterperson_bodily_activity.slletterpersonbodilyactivity_id = slletterpersonbodilyactivity.id
WHERE slletterpersonbodilyactivity.name = 'travel';


-- emotion

select lp.id, slletterpersonemotion.name
from researchdata_letterperson lp
LEFT JOIN researchdata_letterperson_emotion letterperson_emotion ON lp.id = letterperson_emotion.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonemotion ON letterperson_emotion.slletterpersonemotion_id = slletterpersonemotion.id
where slletterpersonemotion.name = 'regret';


-- sensation and roles

--select count(*)
select lp.id, slletterpersonsensation.name, slletterpersonroles.name
from researchdata_letterperson lp
-- sensations
LEFT JOIN researchdata_letterperson_sensation letterperson_sensation ON lp.id = letterperson_sensation.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonsensation ON letterperson_sensation.slletterpersonsensation_id = slletterpersonsensation.id
-- roles
LEFT JOIN researchdata_letterperson_roles letterperson_roles ON lp.id = letterperson_roles.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonroles ON letterperson_roles.slletterpersonrole_id = slletterpersonroles.id
where slletterpersonroles.name = 'motherhood' and slletterpersonsensation.name = 'pain';



-- appearance
select lp.id, slletterpersonappearance.name
from researchdata_letterperson lp
LEFT JOIN researchdata_letterperson_appearance letterperson_appearance ON lp.id = letterperson_appearance.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonappearance ON letterperson_appearance.slletterpersonappearance_id = slletterpersonappearance.id