-- Count of letters per decade (i.e. the first 3 numbers in the sent_date_year)
SELECT SUBSTRING(sent_date_year, 0, 4) as "decades",
	COUNT(*) as "count"
FROM researchdata_letter rl
GROUP by decades;

-- Total count of letters
SELECT count(*)
FROM researchdata_letter rl ;