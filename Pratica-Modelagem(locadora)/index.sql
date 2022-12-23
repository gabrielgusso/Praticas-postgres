CREATE DATABASE "locadora";

CREATE TABLE "discos" (
	"id" serial PRIMARY KEY NOT NULL,
	"numero" integer NOT NULL,
	"codigoDeBarras" TEXT NOT NULL UNIQUE,
	"filme" TEXT NOT NULL
);



CREATE TABLE "atoresPorFilme" (
	"id" serial PRIMARY KEY NOT NULL,
	"atorId" integer NOT NULL,
	"discoId" integer NOT NULL
);



CREATE TABLE "categoriasPorFilme" (
	"id" serial PRIMARY KEY NOT NULL,
	"categoriaId" integer NOT NULL,
	"discoId" integer NOT NULL
);

CREATE TABLE "telefones" (
	"id" serial PRIMARY KEY NOT NULL,
	"numero" integer NOT NULL,
	"clientId" integer NOT NULL
);

CREATE TABLE "categorias" (
	"id" serial PRIMARY KEY NOT NULL,
	"categoria" TEXT NOT NULL,
);


CREATE TABLE "atores" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(50) NOT NULL,
	"paisDeOrigem" varchar(20) NOT NULL,
	"dataDeNascimento" DATE(20) NOT NULL
);



CREATE TABLE "clientes" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(50) NOT NULL
);



CREATE TABLE "endereços" (
	"id" serial PRIMARY KEY NOT NULL,
	"rua" varchar(50) NOT NULL,
	"numero" integer NOT NULL,
	"complemento" TEXT,
	"bairro" varchar(50) NOT NULL,
	"cep" integer NOT NULL,
	"cidade" TEXT NOT NULL,
	"estado" TEXT NOT NULL,
	"clientId" integer NOT NULL
);



CREATE TABLE "locação" (
	"id" serial PRIMARY KEY NOT NULL,
	"discoId" integer NOT NULL,
	"clientId" integer NOT NULL,
	"data" DATE NOT NULL
);



CREATE TABLE "devolução" (
	"id" serial PRIMARY KEY NOT NULL,
	"dataDevolução" DATE NOT NULL,
	"clientId" integer NOT NULL
);



CREATE TABLE "avaliaçãoFilme" (
	"id" serial PRIMARY KEY NOT NULL,
	"devoluçãoId" integer NOT NULL,
	"filmeId" integer NOT NULL,
	"avaliação" integer
);



CREATE TABLE "avaliaçãoAtendimento" (
	"id" serial PRIMARY KEY NOT NULL,
	"devoluçãoId" integer NOT NULL,
	"avaliação" integer
);




ALTER TABLE "atoresPorFilme" ADD CONSTRAINT "atoresPorFilme_fk0" FOREIGN KEY ("atorId") REFERENCES "atores"("id");
ALTER TABLE "atoresPorFilme" ADD CONSTRAINT "atoresPorFilme_fk1" FOREIGN KEY ("discoId") REFERENCES "discos"("id");

ALTER TABLE "categoriasPorFilme" ADD CONSTRAINT "categoriasPorFilme_fk0" FOREIGN KEY ("categoriaId") REFERENCES "categorias"("id");
ALTER TABLE "categoriasPorFilme" ADD CONSTRAINT "categoriasPorFilme_fk1" FOREIGN KEY ("discoId") REFERENCES "discos"("id");

ALTER TABLE "telefones" ADD CONSTRAINT "telefones_fk0" FOREIGN KEY ("clientId") REFERENCES "clientes"("id");

ALTER TABLE "endereços" ADD CONSTRAINT "endereços_fk0" FOREIGN KEY ("clientId") REFERENCES "clientes"("id");

ALTER TABLE "locação" ADD CONSTRAINT "locação_fk0" FOREIGN KEY ("discoId") REFERENCES "discos"("id");
ALTER TABLE "locação" ADD CONSTRAINT "locação_fk1" FOREIGN KEY ("clientId") REFERENCES "clientes"("id");

ALTER TABLE "devolução" ADD CONSTRAINT "devolução_fk0" FOREIGN KEY ("clientId") REFERENCES "clientes"("id");

ALTER TABLE "avaliaçãoFilme" ADD CONSTRAINT "avaliaçãoFilme_fk0" FOREIGN KEY ("devoluçãoId") REFERENCES "devolução"("id");
ALTER TABLE "avaliaçãoFilme" ADD CONSTRAINT "avaliaçãoFilme_fk1" FOREIGN KEY ("filmeId") REFERENCES "discos"("id");

ALTER TABLE "avaliaçãoAtendimento" ADD CONSTRAINT "avaliaçãoAtendimento_fk0" FOREIGN KEY ("devoluçãoId") REFERENCES "devolução"("id");










