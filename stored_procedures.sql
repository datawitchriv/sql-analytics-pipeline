-- Stored procedure to refresh the category revenue tables 
CREATE OR REPLACE PROCEDURE refresh_category_revenue()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Clear existing data
    TRUNCATE TABLE detailed_category_revenue;
    TRUNCATE TABLE summary_category_revenue;

    -- Repopulate detailed table (trigger will update summary)
    INSERT INTO detailed_category_revenue (
        rental_id,
        rental_date,
        customer_id,
        full_name,
        title,
        category_name,
        amount,
        staff_id
    )
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
END;
$$;
