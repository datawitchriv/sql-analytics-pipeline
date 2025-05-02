-- Trigger function to update the summary_category_revenue table
CREATE OR REPLACE FUNCTION update_summary_category_revenue() 
RETURNS TRIGGER AS $$ 
BEGIN 
    -- If the category already exists, update it
    IF EXISTS (
        SELECT 1 FROM summary_category_revenue 
        WHERE category_name = NEW.category_name
    ) THEN 
        UPDATE summary_category_revenue 
        SET 
            total_revenue = total_revenue + NEW.amount, 
            number_of_rentals = number_of_rentals + 1, 
            average_revenue_per_rental = 
                (total_revenue + NEW.amount) / (number_of_rentals + 1) 
        WHERE category_name = NEW.category_name;

    -- If it's a new category, insert it
    ELSE 
        INSERT INTO summary_category_revenue (
            category_name, 
            total_revenue, 
            number_of_rentals, 
            average_revenue_per_rental
        ) VALUES (
            NEW.category_name, 
            NEW.amount, 
            1, 
            NEW.amount
        );
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to call the update function after insert
CREATE TRIGGER trg_update_summary_category_revenue 
AFTER INSERT ON detailed_category_revenue 
FOR EACH ROW 
EXECUTE FUNCTION update_summary_category_revenue();
