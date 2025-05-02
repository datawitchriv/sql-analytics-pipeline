-- User-defined function to combine first and last name
CREATE OR REPLACE FUNCTION get_full_name(first_name TEXT, last_name TEXT) 
RETURNS TEXT AS $$ 
BEGIN 
    RETURN INITCAP(first_name || ' ' || last_name); 
END; 
$$ LANGUAGE plpgsql;

-- SQL transformation query to populate the detailed_category_revenue table
SELECT 
    r.rental_id, 
    r.rental_date, 
    c.customer_id, 
    get_full_name(c.first_name, c.last_name) AS full_name, 
    f.title, 
    cat.name AS category_name, 
    p.amount, 
    r.staff_id 
FROM rental r 
JOIN customer c ON r.customer_id = c.customer_id 
JOIN inventory i ON r.inventory_id = i.inventory_id 
JOIN film f ON i.film_id = f.film_id 
JOIN film_category fc ON f.film_id = fc.film_id 
JOIN category cat ON fc.category_id = cat.category_id 
JOIN payment p ON r.rental_id = p.rental_id;
