SELECT 	letter.id,
        letter.title,
        letter.summary,
        slcollection.name as 'collection',
        letter.item_number,
        slrepository.name as 'repository',
        letter.transcription_plain,
        letter.transcription_normalized,
        letter.sent_date_year,
        letter.sent_date_month,
        letter.sent_date_day,
        letter.sent_date_as_given,
        letter.sent_time,
        letter.sent_from_location,
        letter.sent_to_location,
        slletterestimatedproportionofletter.name as 'est_proportion_of_letter',
        GROUP_CONCAT(DISTINCT sllettercommentary.name) as 'm2m_commentary',
        GROUP_CONCAT(DISTINCT slletterlocation.name) as 'm2m_location',
        GROUP_CONCAT(DISTINCT slletterlettertype.name) as 'm2m_letter_type',
        letter.admin_notes

FROM researchdata_letter letter

-- FK
LEFT JOIN researchdata_slgeneric slcollection ON letter.collection_id = slcollection.id
LEFT JOIN researchdata_slgeneric slrepository ON letter.repository_id = slrepository.id
LEFT JOIN researchdata_slgeneric slletterestimatedproportionofletter ON letter.estimated_proportion_of_letter_id = slletterestimatedproportionofletter.id
-- M2M - commentary
LEFT JOIN researchdata_letter_commentary letter_commentary ON letter.id = letter_commentary.letter_id
LEFT JOIN researchdata_slgeneric sllettercommentary ON letter_commentary.sllettercommentary_id = sllettercommentary.id
-- M2M - location
LEFT JOIN researchdata_letter_location letter_location ON letter.id = letter_location.letter_id
LEFT JOIN researchdata_slgeneric slletterlocation ON letter_location.slletterlocation_id = slletterlocation.id
-- M2M - letter_type
LEFT JOIN researchdata_letter_letter_type letter_letter_type ON letter.id = letter_letter_type.letter_id
LEFT JOIN researchdata_slgeneric slletterlettertype ON letter_letter_type.sllettertype_id = slletterlettertype.id

GROUP BY letter.id
ORDER BY letter.id;
