CREATE DATABASE "agencia_de_viagens";

CREATE TABLE "companys" (
	"id" serial PRIMARY KEY NOT NULL,
	"acronym" varchar(10) NOT NULL UNIQUE,
	"name" varchar(100) NOT NULL UNIQUE,
);



CREATE TABLE "airports" (
	"id" serial PRIMARY KEY NOT NULL,
	"acronym" varchar(10) NOT NULL UNIQUE,
	"name" varchar(100) NOT NULL UNIQUE,
);



CREATE TABLE "flights" (
	"id" serial PRIMARY KEY NOT NULL,
	"acronym" varchar(10) NOT NULL UNIQUE,
	"companyId" integer NOT NULL,
	"airportExit" integer NOT NULL,
	"airportDestiny" integer NOT NULL,
	"exitTime" TIMESTAMP NOT NULL,
	"arrivalTime" TIMESTAMP NOT NULL,
);





ALTER TABLE "flights" ADD CONSTRAINT "flights_fk0" FOREIGN KEY ("companyId") REFERENCES "companys"("id");
ALTER TABLE "flights" ADD CONSTRAINT "flights_fk1" FOREIGN KEY ("airportExit") REFERENCES "airports"("id");
ALTER TABLE "flights" ADD CONSTRAINT "flights_fk2" FOREIGN KEY ("airportDestiny") REFERENCES "airports"("id");



