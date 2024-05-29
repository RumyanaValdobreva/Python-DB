CREATE TABLE mountains(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TABLE peaks(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	mountain_id INTEGER
	-- mountain_id INTEGER REFERENCES mountains(id)
	-- CONSTRAINT fk_peaks_mountains
	-- 	FOREIGN KEY(mountain_id)
	-- 		REFERENCES mountains(id)
);

ALTER TABLE peaks
ADD CONSTRAINT fk_peaks_mountains
	FOREIGN KEY (mountain_id)
		REFERENCES mountains(id)
;