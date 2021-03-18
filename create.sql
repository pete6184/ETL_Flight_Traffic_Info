-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS airline_routes
(
    route_id SERIAL NOT NULL,
    airline_id INTEGER,
    airline VARCHAR(2),
    source_airport VARCHAR(5) NOT NULL,
    source_airport_id INTEGER,
    destination_airport VARCHAR(5) NOT NULL,
    destination_airport_id INTEGER,
    equipment VARCHAR(20),
    PRIMARY KEY(route_id)
);

CREATE TABLE IF NOT EXISTS airports
(
    iata_code VARCHAR(5) NOT NULL,
    identifier VARCHAR(5),
    country_code VARCHAR(2) NOT NULL,
    ap_name VARCHAR(20) NOT NULL,
    ap_type VARCHAR(10),
    lat REAL(0),
    lng REAL(0),
    PRIMARY KEY(iata_code)
);

CREATE TABLE IF NOT EXISTS countries
(
    code VARCHAR(2) NOT NULL,
    name VARCHAR(20) NOT NULL,
    continent_code VARCHAR(2),
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

