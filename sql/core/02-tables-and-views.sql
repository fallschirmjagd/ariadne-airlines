USE ariadne;

CREATE TABLE country (
  id INT(12) NOT NULL AUTO_INCREMENT,
  country VARCHAR(200) NOT NULL DEFAULT '',
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

CREATE TABLE airports (
  id INT(12) NOT NULL AUTO_INCREMENT,
  city VARCHAR(80) NOT NULL DEFAULT '',
  country_id INT(12) NOT NULL DEFAULT '64',
  iata_code VARCHAR(5) NOT NULL DEFAULT '',
  icao_code VARCHAR(5) NOT NULL DEFAULT '',
  airport_name VARCHAR(150) NOT NULL DEFAULT '',
  PRIMARY KEY (id),
  KEY country_id (country_id),
  CONSTRAINT airports_country FOREIGN KEY (country_id) REFERENCES country (id)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;

CREATE TABLE staff (
  employee_id INT(12) NOT NULL AUTO_INCREMENT,
  rank ENUM('office','ground','cabin','pic','fo','so','to','aso') NOT NULL DEFAULT 'office',
  dob DATE DEFAULT NULL,
  pob VARCHAR(150) NOT NULL DEFAULT '',
  first_name VARCHAR(50) NOT NULL DEFAULT '',
  last_name VARCHAR(50) NOT NULL DEFAULT '',
  duties VARCHAR(100) NOT NULL DEFAULT '',
  med_clearence ENUM('Y','N','N/A') DEFAULT NULL,
  sec_clearence ENUM('Y','N','N/A') DEFAULT NULL,
  PRIMARY KEY (employee_id)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

CREATE TABLE fleet (
  fleet_id INT(12) NOT NULL AUTO_INCREMENT,
  aircraft_type VARCHAR(18) NOT NULL DEFAULT '',
  registration VARCHAR(10) NOT NULL DEFAULT '',
  delivered DATE DEFAULT NULL,
  config VARCHAR(8) NOT NULL DEFAULT '',
  seat_count INT(10) NOT NULL DEFAULT '-1',
  PRIMARY KEY (fleet_id),
  UNIQUE KEY (registration)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE flight (
  flight_id INT(12) NOT NULL AUTO_INCREMENT,
  flight_code varchar(14) NOT NULL DEFAULT '',
  origin varchar(14) NOT NULL DEFAULT '',
  destination varchar(14) NOT NULL DEFAULT '',
  flight_date date DEFAULT NULL,
  departure time DEFAULT NULL,
  arrival time DEFAULT NULL,
  aircraft_registration varchar(10) NOT NULL DEFAULT '',
  UNIQUE KEY (aircraft_registration, flight_code, flight_date, departure),
  PRIMARY KEY (flight_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE manning (
  flight_code VARCHAR(14),
  employee_id INT(12),
  rank VARCHAR(15),
  UNIQUE KEY (flight_code, employee_id, rank)
);

/*** outstanding... Agents, Booking, Booking2Agent ***/