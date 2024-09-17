WITH media_entregador AS (
	SELECT 
		entregador,
		CAST(strftime('%m', data) AS INTEGER) AS mes,
		ROUND(AVG(entregas_por_dia), 2) AS media_entregas_por_dia,
		RANK() OVER(PARTITION BY CAST(strftime('%m', data) AS INTEGER) ORDER BY AVG(entregas_por_dia) DESC) AS rank_entregador
	FROM (
		SELECT
			ud.driver_id AS entregador,
			DATE(o.order_moment_created) AS data,
			COUNT(o.order_id) AS entregas_por_dia
		FROM 
			orders o 
		INNER JOIN (
			SELECT 
				DISTINCT delivery_order_id, 
				driver_id, 
				delivery_status
			FROM 
				deliveries    	
		) AS ud
		ON o.delivery_order_id = ud.delivery_order_id
		LEFT JOIN 
			drivers dr ON ud.driver_id = dr.driver_id	
		WHERE 
			o.order_status = 'FINISHED' AND 
			ud.driver_id IS NOT NULL AND  
			ud.delivery_status = 'DELIVERED'
		GROUP BY 
			ud.driver_id, 
			CAST(strftime('%Y-%m-%d', o.order_moment_created) AS DATE)
	) AS subquery
	GROUP BY
		entregador,
		CAST(strftime('%m', data) AS INTEGER)
)
SELECT
	entregador AS driver_id
FROM
	media_entregador
WHERE
	rank_entregador <= 5
ORDER BY 
	mes,
	rank_entregador;