DROP TABLE IF EXISTS DiseaseType CASCADE;
DROP TABLE IF EXISTS Country CASCADE;
DROP TABLE IF EXISTS Disease CASCADE;
DROP TABLE IF EXISTS Discover CASCADE;
DROP TABLE IF EXISTS Users CASCADE;
DROP TABLE IF EXISTS PublicServant CASCADE;
DROP TABLE IF EXISTS Doctor CASCADE;
DROP TABLE IF EXISTS Specialize CASCADE;
DROP TABLE IF EXISTS Record CASCADE;

CREATE TABLE DiseaseType (
	id             integer PRIMARY KEY,
	description    varchar(140) NOT NULL
);

CREATE TABLE Country (
	cname          varchar(50) PRIMARY KEY,
	population     bigint NOT NULL
);

CREATE TABLE Disease (
	disease_code   varchar(50) PRIMARY KEY,
	pathogen       varchar(20) NOT NULL,
	description    varchar(140) NOT NULL,
	id             integer REFERENCES DiseaseType(id) NOT NULL
);

CREATE TABLE Discover (
	cname          varchar(50) REFERENCES Country(cname),
	disease_code   varchar(50) REFERENCES Disease(disease_code),
	first_enc_date date NOT NULL,
	PRIMARY KEY (cname, disease_code)
);

CREATE TABLE Users (
	uid            serial PRIMARY KEY,
	email          varchar(60) UNIQUE NOT NULL,
	name           varchar(30) NOT NULL,
	surname        varchar(40) NOT NULL,
	salary         integer NOT NULL,
	phone          varchar(20) UNIQUE NOT NULL,
	cname          varchar(50) REFERENCES Country(cname) NOT NULL,
	deleted        boolean DEFAULT FALSE NOT NULL
);

CREATE TABLE PublicServant (
	uid            integer PRIMARY KEY REFERENCES Users(uid) ON DELETE CASCADE ON UPDATE CASCADE,
	department     varchar(50) NOT NULL
);

CREATE TABLE Doctor (
	uid            integer PRIMARY KEY REFERENCES Users(uid) ON DELETE CASCADE ON UPDATE CASCADE,
	degree         varchar(20) NOT NULL
);

CREATE TABLE Specialize (
	id             integer REFERENCES DiseaseType(id),
	uid            integer REFERENCES Doctor(uid) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (id, uid)
);

CREATE TABLE Record (
	uid            integer REFERENCES PublicServant(uid) ON DELETE CASCADE ON UPDATE CASCADE,
	cname          varchar(50) REFERENCES Country(cname),
	disease_code   varchar(50) REFERENCES Disease(disease_code),
	total_deaths   integer NOT NULL,
	total_patients integer NOT NULL,
	PRIMARY KEY (uid, cname, disease_code)
);