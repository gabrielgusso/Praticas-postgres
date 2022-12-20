CREATE DATABASE "pratica_modelagem_integridade";

CREATE TYPE customerPhones  AS ENUM ('landline', 'mobile')
CREATE TYPE transactions  AS ENUM ('deposit', 'withdraw')

CREATE TABLE "states" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL
);

CREATE TABLE "cities" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL,
	"stateId" integer NOT NULL
);

CREATE TABLE "customerAddres" (
	"id" serial PRIMARY KEY,
	"customerId" integer NOT NULL,
	"street" TEXT NOT NULL,
	"number" integer NOT NULL,
	"complement" TEXT NOT NULL,
	"postalCode" integer NOT NULL,
    "cityId" integer NOT NULL
);

CREATE TABLE "customerPhones" (
	"id" serial PRIMARY KEY,
	"customerId" integer NOT NULL,
	"number" integer NOT NULL,
    "type" customerPhones NOT NULL
);

CREATE TABLE "customer" (
	"id" serial PRIMARY KEY,
	"userId" integer NOT NULL,
	"date" DATE NOT NULL,
	"addressId" integer NOT NULL,
	"state" TEXT NOT NULL
);

CREATE TABLE "ordersProducts" (
	"id" serial PRIMARY KEY,
	"fullName" TEXT NOT NULL,
	"cpf" integer NOT NULL,
	"email" TEXT NOT NULL,
	"password" TEXT NOT NULL,
	"paidPrice" integer NOT NULL
);

CREATE TABLE "bankAccount" (
	"id" serial PRIMARY KEY,
	"customerId" integer NOT NULL,
	"accountNumber" integer NOT NULL,
	"agency" integer NOT NULL,
	"openDate" DATE NOT NULL,
	"closeDate" DATE
); 

CREATE TABLE "transactionsTable" (
	"id" serial PRIMARY KEY,
	"banckAccountId" integer NOT NULL,
	"amount" integer NOT NULL,
    "type" transactions NOT NULL,
    "time" time NOT NULL,
    "description" TEXT NOT NULL,
    "cancelled" bool NOT NULL
);

CREATE TABLE "creditCards" (
	"id" serial PRIMARY KEY,
	"banckAccountId" integer NOT NULL,
	"name" TEXT NOT NULL,
    "number" integer NOT NULL,
    "securityCode" TEXT NOT NULL,
    "expirationMounth" integer NOT NULL,
    "expirationYear" integer NOT NULL,
    "password" TEXT NOT NULL,
    "limit" integer NOT NULL
);


ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");

ALTER TABLE "customerAddres" ADD CONSTRAINT "custumerAddres_fk0" FOREIGN KEY ("cityId") REFERENCES "cities"("id");
ALTER TABLE "customerAddres" ADD CONSTRAINT "custumerAddres_fk1" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "customerPhones" ADD CONSTRAINT "customerPhones_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "bankAccount" ADD CONSTRAINT "bankAccount_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "transactionsTable" ADD CONSTRAINT "transactionsTable_fk0" FOREIGN KEY ("banckAccountId") REFERENCES "bankAccount"("id");

ALTER TABLE "creditCards" ADD CONSTRAINT "creditCards_fk0" FOREIGN KEY ("banckAccountId") REFERENCES "bankAccount"("id");
