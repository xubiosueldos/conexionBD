DO $$
 DECLARE
    _kind "char";
BEGIN

 SELECT relkind
		   FROM   pg_class
		   WHERE  relname = 'escalaimpuestoaplicable_id_seq'  -- sequence name
		   INTO  _kind;
		   IF NOT FOUND THEN       -- name is free
		      CREATE SEQUENCE escalaimpuestoaplicable_id_seq
				  INCREMENT 1
				  MINVALUE 1
				  MAXVALUE 9223372036854775807
				  START 1
				  CACHE 1;
				ALTER TABLE escalaimpuestoaplicable_id_seq
				  OWNER TO postgres;
				GRANT ALL ON SEQUENCE escalaimpuestoaplicable_id_seq TO postgres;
				GRANT SELECT, USAGE ON SEQUENCE escalaimpuestoaplicable_id_seq TO rol_super;
				GRANT SELECT, USAGE ON SEQUENCE escalaimpuestoaplicable_id_seq TO rol_common;
		   ELSIF _kind = 'S' THEN  -- sequence exists
		      -- nada
		   ELSE                    -- object name exists for different kind
		      -- nada
		   END IF;

CREATE TABLE escalaimpuestoaplicable(
  id INTEGER NOT NULL DEFAULT nextval('escalaimpuestoaplicable_id_seq'::regclass),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  deleted_at TIMESTAMP,
  nombre VARCHAR,
  codigo VARCHAR,
  descripcion VARCHAR,
  activo int,
  limiteinferior NUMERIC(19,4) NOT NULL,
  limitesuperior NUMERIC(19,4) NOT NULL,
  valorfijo NUMERIC(19,4) NOT NULL,
  valorvariable NUMERIC(19,4) NOT NULL,
  mesanio VARCHAR NOT NULL,
  CONSTRAINT escalaimpuestoaplicableid__seq PRIMARY KEY (id)
)

WITH (
	OIDS=FALSE
);
	
END;
$$;



DO $$
BEGIN
INSERT INTO escalaimpuestoaplicable(created_at,activo,limiteinferior,limitesuperior,valorfijo,valorvariable,mesanio)
VALUES
(current_timestamp, 1, 0.00, 2753.32, 0.00, 0.05, '01/2019'),
(current_timestamp, 1, 2753.32, 5506.63, 137.67, 0.09, '01/2019'),
(current_timestamp, 1, 5506.63, 8259.95, 385.46, 0.12, '01/2019'),
(current_timestamp, 1, 8259.95, 11013.27, 715.86, 0.15, '01/2019'),
(current_timestamp, 1, 11013.27, 16519.90, 1128.86, 0.19, '01/2019'),
(current_timestamp, 1, 16519.90, 22026.54, 2175.12, 0.23, '01/2019'),
(current_timestamp, 1, 22026.54, 33039.81, 3441.65, 0.27, '01/2019'),
(current_timestamp, 1, 33039.81, 44053.08, 6415.23, 0.31, '01/2019'),
(current_timestamp, 1, 44053.08, 9999999999.00, 9829.34, 0.35, '01/2019'),
(current_timestamp, 1, 0.00, 5506.64, 0.00, 0.05, '02/2019'),
(current_timestamp, 1, 5506.64, 11013.27, 275.33, 0.09, '02/2019'),
(current_timestamp, 1, 11013.27, 16519.90, 770.93, 0.12, '02/2019'),
(current_timestamp, 1, 16519.90, 22026.54, 1431.73, 0.15, '02/2019'),
(current_timestamp, 1, 22026.54, 33039.81, 2257.72, 0.19, '02/2019'),
(current_timestamp, 1, 33039.81, 44053.08, 4350.24, 0.23, '02/2019'),
(current_timestamp, 1, 44053.08, 66079.61, 6883.29, 0.27, '02/2019'),
(current_timestamp, 1, 66079.61, 88106.15, 12830.46, 0.31, '02/2019'),
(current_timestamp, 1, 88106.15, 9999999999.00, 19658.69, 0.35, '02/2019'),
(current_timestamp, 1, 0.00, 8259.95, 0.00, 0.05, '03/2019'),
(current_timestamp, 1,8259.95, 16519.90, 413.00, 0.09, '03/2019'),
(current_timestamp, 1, 16519.90, 24779.86, 1156.39, 0.12, '03/2019'),
(current_timestamp, 1, 24779.86, 33039.81, 2147.59, 0.15, '03/2019'),
(current_timestamp, 1, 33039.81, 49559.71, 3386.58, 0.19, '03/2019'),
(current_timestamp, 1, 49559.71, 66079.61, 6525.36, 0.23, '03/2019'),
(current_timestamp, 1, 66079.61, 99119.42, 10324.94, 0.27, '03/2019'),
(current_timestamp, 1, 99119.42, 132159.23, 19245.69, 0.31, '03/2019'),
(current_timestamp, 1, 132159.23, 9999999999.00, 29488.03, 0.35, '03/2019'),
(current_timestamp, 1, 0.00, 11013.27, 0.00, 0.05, '04/2019'),
(current_timestamp, 1, 11013.27, 22026.54, 550.66, 0.09, '04/2019'),
(current_timestamp, 1, 22026.54, 33039.81, 1541.86, 0.12, '04/2019'),
(current_timestamp, 1, 33039.81, 44053.08, 2863.45, 0.15, '04/2019'),
(current_timestamp, 1, 44053.08, 66079.61, 4515.44, 0.19, '04/2019'),
(current_timestamp, 1, 66079.61, 88106.15, 8700.48, 0.23, '04/2019'),
(current_timestamp, 1, 88106.15, 132159.23, 13766.59, 0.27, '04/2019'),
(current_timestamp, 1, 132159.23, 176212.30, 25660.92, 0.31, '04/2019'),
(current_timestamp, 1, 176212.30, 9999999999.00, 39317.37, 0.35, '04/2019'),
(current_timestamp, 1, 0.00, 19862.15, 0.00, 0.05, '05/2020'),																			
(current_timestamp, 1, 19862.15, 39724.30, 993.11, 0.09, '05/2020'),																					
(current_timestamp, 1, 39724.30, 59586.45, 2780.70, 0.12, '05/2020'),																					
(current_timestamp, 1, 59586.45, 79448.60, 5164.16,	0.15, '05/2020'),																					
(current_timestamp, 1, 79448.60, 119172.90,	8143.48, 0.19, '05/2020'),																					
(current_timestamp, 1, 119172.90, 158897.20, 15691.10, 0.23, '05/2020'),																					
(current_timestamp, 1, 158897.20, 238345.80, 24827.69, 0.27, '05/2020'),																					
(current_timestamp, 1, 238345.80, 317794.40, 46278.81, 0.31, '05/2020'),																					
(current_timestamp, 1, 317794.40, 9999999999.00, 70907.88, 0.35, '05/2019'),
(current_timestamp, 1, 0.00, 23834.58, 0.00, 0.05, '06/2020'),
(current_timestamp, 1, 23834.58, 47669.16, 1191.73, 0.09, '06/2020'),
(current_timestamp, 1, 47669.16, 71503.74, 3336.84,	0.12, '06/2020'),
(current_timestamp, 1, 71503.74, 95338.33, 6196.99,	0.15, '06/2020'),
(current_timestamp, 1, 95338.33, 143007.48, 9772.18, 0.19, '06/2020'),
(current_timestamp, 1, 143007.48, 190676.64, 18829.32, 0.23, '06/2020'),
(current_timestamp, 1, 190676.64, 286014.96, 29793.22, 0.27, '06/2020'),
(current_timestamp, 1, 286014.96, 381353.29, 55534.57, 0.31, '06/2020'),
(current_timestamp, 1, 381353.29, 9999999999.00, 85089.45, 0.35, '06/2020'),
(current_timestamp, 1, 0.00, 27807.01, 0.00, 0.05, '07/2020'),
(current_timestamp, 1, 27807.01, 55614.02, 1390.35, 0.09, '07/2020'),
(current_timestamp, 1, 55614.02, 83421.03, 3892.98, 0.12, '07/2020'),
(current_timestamp, 1, 83421.03, 111228.05, 7229.82, 0.15, '07/2020'),
(current_timestamp, 1, 111228.05, 166842.06, 11400.87, 0.19, '07/2020'),
(current_timestamp, 1, 166842.06, 222456.08, 21967.54, 0.23, '07/2020'),
(current_timestamp, 1, 222456.08, 333684.12, 34758.76, 0.27, '07/2020'),
(current_timestamp, 1, 333684.12, 444912.17, 64790.33, 0.31, '07/2020'),
(current_timestamp, 1, 444912.17, 9999999999.00, 99271.03, 0.35, '07/2020'),
(current_timestamp, 1, 0.00, 31779.44, 0.00, 0.05, '08/2020'),
(current_timestamp, 1, 31779.44, 63558.88, 1588.97, 0.09, '08/2020'),
(current_timestamp, 1, 63558.88, 95338.32, 4449.12,	0.12, '08/2020'),
(current_timestamp, 1, 95338.32, 127117.77, 8262.65, 0.15, '08/2020'),
(current_timestamp, 1, 127117.77, 190676.64, 13029.57, 0.19, '08/2020'),
(current_timestamp, 1, 190676.64, 254235.52, 25105.76, 0.23, '08/2020'),
(current_timestamp, 1, 254235.52, 381353.28, 39724.30, 0.27, '08/2020'),
(current_timestamp, 1, 381353.28, 508471.05, 74046.09, 0.31, '08/2020'),
(current_timestamp, 1, 508471.05, 9999999999.00, 113452.60,	0.35, '08/2020'),
(current_timestamp, 1, 0.00, 35751.87, 0.00, 0.05, '09/2020'),
(current_timestamp, 1, 35751.87, 71503.74, 1787.59, 0.09, '09/2020'),
(current_timestamp, 1, 71503.74, 107255.61, 5005.26, 0.12, '09/2020'),
(current_timestamp, 1, 107255.61, 143007.49, 9295.49, 0.15, '09/2020'),
(current_timestamp, 1, 143007.49, 214511.22, 14658.27, 0.19, '09/2020'),
(current_timestamp, 1, 214511.22, 286014.96, 28243.98, 0.23, '09/2020'),
(current_timestamp, 1, 286014.96, 429022.44, 44689.84, 0.27, '09/2020'),
(current_timestamp, 1, 429022.44, 572029.93, 83301.86, 0.31, '09/2020'),
(current_timestamp, 1, 572029.93, 9999999999.00, 127634.18,	0.35, '09/2020'),
(current_timestamp, 1, 0.00, 39724.30, 0.00, 0.05, '10/2020'),
(current_timestamp, 1, 39724.30, 79448.60, 1986.21, 0.09, '10/2020'),
(current_timestamp, 1, 79448.60, 119172.90, 5561.40, 0.12, '10/2020'),
(current_timestamp, 1, 119172.90, 158897.21, 10328.32, 0.15, '10/2020'),
(current_timestamp, 1, 158897.21, 238345.80, 16286.96, 0.19, '10/2020'),
(current_timestamp, 1, 238345.80, 317794.40, 31382.20, 0.23, '10/2020'),
(current_timestamp, 1, 317794.40, 476691.60, 49655.37, 0.27, '10/2020'),
(current_timestamp, 1, 476691.60, 635588.81, 92557.62, 0.31, '10/2020'),
(current_timestamp, 1, 635588.81, 9999999999.00, 141815.75, 0.35, '10/2020'),
(current_timestamp, 1, 0.00, 43696.73, 0.00, 0.05, '11/2020'),
(current_timestamp, 1, 43696.73, 87393.46, 2184.84, 0.09, '11/2020'),
(current_timestamp, 1, 87393.46, 131090.19, 6117.54, 0.12, '11/2020'),
(current_timestamp, 1, 131090.19, 174786.93, 11361.15, 0.15, '11/2020'),
(current_timestamp, 1, 174786.93, 262180.38, 17915.66, 0.19, '11/2020'),
(current_timestamp, 1, 262180.38, 349573.84, 34520.42, 0.23, '11/2020'),
(current_timestamp, 1, 349573.84, 524360.76, 54620.91, 0.27, '11/2020'),
(current_timestamp, 1, 524360.76, 699147.69, 101813.38, 0.31, '11/2020'),
(current_timestamp, 1, 699147.69, 9999999999.00, 155997.33, 0.35, '11/2020'),
(current_timestamp, 1, 0.00, 47669.16, 0.00, 0.05, '12/2020'),
(current_timestamp, 1, 47669.16, 95338.32, 2383.46,	0.09, '12/2020'),
(current_timestamp, 1, 95338.32, 143007.48,	6673.68, 0.12, '12/2020'),
(current_timestamp, 1, 143007.48, 190676.65, 12393.98, 0.15, '12/2020'),
(current_timestamp, 1, 190676.65, 286014.96, 19544.36, 0.19, '12/2020'),
(current_timestamp, 1, 286014.96, 381353.28, 37658.64, 0.23, '12/2020'),
(current_timestamp, 1, 381353.28, 572029.92, 59586.45, 0.27, '12/2020'),
(current_timestamp, 1, 572029.92, 762706.57, 111069.14,	0.31, '12/2020'),
(current_timestamp, 1, 762706.57, 9999999999.00, 170178.90, 0.35, '12/2020');

UPDATE public.escalaimpuestoaplicable SET id = -id;
END;
$$;