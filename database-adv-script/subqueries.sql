-- subqueries
-- query to find all properties where the average rating is
-- greater than 4.0 using a subquery.

SELECT * FROM Property p
WHERE (
    SELECT AVG(r.rating)
    FROM Review r
    WHERE r.property_id = p.property_id
) > 4.0 ;