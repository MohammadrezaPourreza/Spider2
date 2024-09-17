WITH
    actor_count AS (
        SELECT 
            f.film_id,
            f.title,
            COUNT(fa.actor_id) AS num_actors
        FROM 
            film f
        JOIN 
            film_actor fa ON fa.film_id = f.film_id
        GROUP BY 
            f.film_id, f.title
        ORDER BY 
            f.film_id
    ),
    film_revenue AS (
        SELECT 
            i.film_id,
            SUM(p.amount) AS gross_revenue
        FROM 
            payment p
        JOIN 
            rental r ON r.rental_id = p.rental_id
        JOIN 
            inventory i ON i.inventory_id = r.inventory_id
        GROUP BY 
            i.film_id
        ORDER BY 
            i.film_id
    ),
    film_rev_per_actor AS (
        SELECT 
            ac.title,
            ROUND(fr.gross_revenue / ac.num_actors, 2) AS rev_per_actor
        FROM 
            actor_count ac
        JOIN 
            film_revenue fr ON fr.film_id = ac.film_id
    )
SELECT 
    *
FROM 
    film_rev_per_actor
ORDER BY 
    rev_per_actor DESC
LIMIT 
    3;
