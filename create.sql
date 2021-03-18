-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS airline_routes
(
    route_id SERIAL NOT NULL,
    airline_id INTEGER,
    airline VARCHAR(10),
    source_airport VARCHAR(10) NOT NULL,
    source_airport_id INTEGER,
    destination_airport VARCHAR(10) NOT NULL,
    destination_airport_id INTEGER,
    equipment VARCHAR(200),
    PRIMARY KEY(route_id)
);

CREATE TABLE IF NOT EXISTS airports
(
    iata_code VARCHAR(10) NOT NULL,
    id VARCHAR(10),
    country_code VARCHAR(5) NOT NULL,
    ap_name VARCHAR(200) NOT NULL,
    ap_type VARCHAR(200),
    lat FLOAT(32),
    lng FLOAT(32),
    PRIMARY KEY(iata_code)
);

CREATE TABLE IF NOT EXISTS countries
(
    code VARCHAR(5) NOT NULL,
    id INTEGER,
    name VARCHAR(200) NOT NULL,
    PRIMARY KEY(code)
);


-- Create FKs
ALTER TABLE airports
    ADD    FOREIGN KEY (country_code)
    REFERENCES countries(code)
    MATCH SIMPLE
;
    
ALTER TABLE airline_routes
    ADD    FOREIGN KEY (source_airport)
    REFERENCES airports(iata_code)
    MATCH SIMPLE
;
    

-- Create Indexes





--drop table airline_routes;
--drop table airports;
--drop table countries;