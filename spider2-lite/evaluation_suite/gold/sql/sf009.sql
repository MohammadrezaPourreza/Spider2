WITH BUILDING AS(
SELECT A.NAMES['local']::VARCHAR AS NAME
     ,B.Class
     ,B.subclass
     ,count(*) num_buidling
     ,SUM(B.surface_area_sq_m) sum_surface_area_sq_m
 FROM NETHERLANDS_OPEN_MAP_DATA.NETHERLANDS.V_ADMINISTRATIVE A
INNER
 JOIN(SELECT Class
            ,subclass
            ,surface_area_sq_m
            ,GEO_CORDINATES
        FROM NETHERLANDS_OPEN_MAP_DATA.NETHERLANDS.V_BUILDING
       WHERE SUBSTR(QUADKEY
             ,0
             ,8) IN ('12020210', '12020211')) B
   ON ST_COVERS(A.GEO_CORDINATES
            ,B.GEO_CORDINATES)
WHERE A.id IN('r324431@56'
            ,'r47811@69')
GROUP BY A.NAMES['local']
     ,B.Class
     ,B.subclass
ORDER BY B.class
     ,B.subclass)
SELECT CLASS,
SUBCLASS,
MAX(CASE WHEN NAME='Amsterdam' THEN sum_surface_area_sq_m END) AS SUM_SURFACE_AREA_SQ_M_AMSTERDAM,
MAX(CASE WHEN NAME='Rotterdam' THEN sum_surface_area_sq_m END) AS SUM_SURFACE_AREA_SQ_M_ROTTERDAM,
MAX(CASE WHEN NAME='Amsterdam' THEN num_buidling END) AS NUM_OF_BUILDING_AMSTERDAM,
MAX(CASE WHEN NAME='Rotterdam' THEN num_buidling END) AS NUM_OF_BUILDING_ROTTERDAM
FROM BUILDING
GROUP BY CLASS,SUBCLASS
ORDER BY CLASS,SUBCLASS;