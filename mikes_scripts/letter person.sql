SELECT 	lp.id,
        lp.letter_id,
        letter.title as 'letter_title',
        lp.person_id,
        person.first_name as 'person_first_name',
        person.middle_name as 'person_middle_name',
        person.last_name as 'person_last_name',
        lp.person_form_of_address,
        lp.person_other,
        slpersonletterrelationship.name as 'person_letter_relationship',
        GROUP_CONCAT(DISTINCT slletterpersonbodypart.name) as 'm2m_body_part',
        GROUP_CONCAT(DISTINCT slletterpersonbodilyactivity.name) as 'm2m_bodily_activity',
        GROUP_CONCAT(DISTINCT slletterpersonappearance.name) as 'm2m_appearance',
        GROUP_CONCAT(DISTINCT slletterpersonconditionspecificstate.name) as 'm2m_condition_specific_state',
        GROUP_CONCAT(DISTINCT slletterpersonconditionspecificlifestage.name) as 'm2m_condition_specific_life_stage',
        GROUP_CONCAT(DISTINCT slletterpersonconditiongeneralizedstate.name) as 'm2m_condition_generalized_state',
        GROUP_CONCAT(DISTINCT slletterpersonemotion.name) as 'm2m_emotion',
        GROUP_CONCAT(DISTINCT slletterpersonimmaterial.name) as 'm2m_immaterial',
        GROUP_CONCAT(DISTINCT slletterpersonsensation.name) as 'm2m_sensation',
        GROUP_CONCAT(DISTINCT slletterpersontreatment.name) as 'm2m_treatment',
        GROUP_CONCAT(DISTINCT slletterpersoncontext.name) as 'm2m_context',
        GROUP_CONCAT(DISTINCT slletterpersonroles.name) as 'm2m_roles',
        GROUP_CONCAT(DISTINCT slletterpersonstate.name) as 'm2m_state',
        lp.admin_notes

FROM researchdata_letterperson lp

-- FK
LEFT JOIN researchdata_letter letter ON lp.letter_id = letter.id
LEFT JOIN researchdata_person person ON lp.person_id = person.id
LEFT JOIN researchdata_slgeneric slpersonletterrelationship ON lp.person_letter_relationship_id = slpersonletterrelationship.id
-- M2M - body part
LEFT JOIN researchdata_letterperson_body_part letterperson_body_part ON lp.id = letterperson_body_part.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonbodypart ON letterperson_body_part.slletterpersonbodypart_id = slletterpersonbodypart.id
-- M2M - bodily activity
LEFT JOIN researchdata_letterperson_bodily_activity letterperson_bodily_activity ON lp.id = letterperson_bodily_activity.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonbodilyactivity ON letterperson_bodily_activity.slletterpersonbodilyactivity_id = slletterpersonbodilyactivity.id
-- M2M - appearance
LEFT JOIN researchdata_letterperson_appearance letterperson_appearance ON lp.id = letterperson_appearance.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonappearance ON letterperson_appearance.slletterpersonappearance_id = slletterpersonappearance.id
-- M2M - condition specific state
LEFT JOIN researchdata_letterperson_condition_specific_state letterperson_condition_specific_state ON lp.id = letterperson_condition_specific_state.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonconditionspecificstate ON letterperson_condition_specific_state.slletterpersonconditionspecificstate_id = slletterpersonconditionspecificstate.id
-- M2M - condition specific life stage
LEFT JOIN researchdata_letterperson_condition_specific_life_stage letterperson_condition_specific_life_stage ON lp.id = letterperson_condition_specific_life_stage.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonconditionspecificlifestage ON letterperson_condition_specific_life_stage.slletterpersonconditionspecificlifestage_id = slletterpersonconditionspecificlifestage.id
-- M2M - condition generalized state
LEFT JOIN researchdata_letterperson_condition_generalized_state letterperson_condition_generalized_state ON lp.id = letterperson_condition_generalized_state.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonconditiongeneralizedstate ON letterperson_condition_generalized_state.slletterpersonconditiongeneralizedstate_id = slletterpersonconditiongeneralizedstate.id
-- M2M - emotion
LEFT JOIN researchdata_letterperson_emotion letterperson_emotion ON lp.id = letterperson_emotion.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonemotion ON letterperson_emotion.slletterpersonemotion_id = slletterpersonemotion.id
-- M2M - immaterial
LEFT JOIN researchdata_letterperson_immaterial letterperson_immaterial ON lp.id = letterperson_immaterial.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonimmaterial ON letterperson_immaterial.slletterpersonimmaterial_id = slletterpersonimmaterial.id
-- M2M - sensation
LEFT JOIN researchdata_letterperson_sensation letterperson_sensation ON lp.id = letterperson_sensation.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonsensation ON letterperson_sensation.slletterpersonsensation_id = slletterpersonsensation.id
-- M2M - treatment
LEFT JOIN researchdata_letterperson_treatment letterperson_treatment ON lp.id = letterperson_treatment.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersontreatment ON letterperson_treatment.slletterpersontreatment_id = slletterpersontreatment.id
-- M2M - context
LEFT JOIN researchdata_letterperson_context letterperson_context ON lp.id = letterperson_context.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersoncontext ON letterperson_context.slletterpersoncontext_id = slletterpersoncontext.id
-- M2M - roles
LEFT JOIN researchdata_letterperson_roles letterperson_roles ON lp.id = letterperson_roles.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonroles ON letterperson_roles.slletterpersonrole_id = slletterpersonroles.id
-- M2M - state
LEFT JOIN researchdata_letterperson_state letterperson_state ON lp.id = letterperson_state.letterperson_id
LEFT JOIN researchdata_slgeneric slletterpersonstate ON letterperson_state.slletterpersonstate_id = slletterpersonstate.id

GROUP BY lp.id
ORDER BY lp.id;
