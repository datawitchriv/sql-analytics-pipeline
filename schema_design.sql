CREATE TABLE detailed_category_revenue ( 
    rental_id INTEGER, 
    rental_date TIMESTAMP, 
    customer_id INTEGER, 
    full_name TEXT, 
    title TEXT, 
    category_name TEXT, 
    amount NUMERIC(5,2), 
    staff_id INTEGER 
);

CREATE TABLE summary_category_revenue ( 
    category_name TEXT, 
    total_revenue NUMERIC(10,2), 
    number_of_rentals INTEGER, 
    average_revenue_per_rental NUMERIC(10,2) 
);
