CREATE DATABASE "pratica_modelagem_cursos";

CREATE TYPE notes AS ENUM ('Dentro das Expectativas', 'Acima das Expectativas', 'Abaixo das expectativa')

CREATE TABLE "students" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(50) NOT NULL,
	"cpf" varchar(11) NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE,
);



CREATE TABLE "class" (
	"id" serial PRIMARY KEY NOT NULL,
	"code" TEXT NOT NULL,	
);



CREATE TABLE "studentClass" (
	"id" serial PRIMARY KEY NOT NULL,
	"classId" integer(50) NOT NULL,
	"enterTime" TIMESTAMP NOT NULL,
	"exitTime" TIMESTAMP,
	"studentId" integer NOT NULL,	
);



CREATE TABLE "module" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" integer NOT NULL UNIQUE,	
);



CREATE TABLE "projects" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(50) NOT NULL UNIQUE,
	"deliverTime" integer NOT NULL,
	"moduleId" integer NOT NULL,	
);



CREATE TABLE "deliveredProjects" (
	"id" serial PRIMARY KEY NOT NULL,
	"studentId" integer NOT NULL,
	"deliveredTime" TIMESTAMP NOT NULL,
	"note" notes NOT NULL,
	"projectId" integer NOT NULL,
);


ALTER TABLE "studentClass" ADD CONSTRAINT "studentClass_fk0" FOREIGN KEY ("classId") REFERENCES "class"("id");
ALTER TABLE "studentClass" ADD CONSTRAINT "studentClass_fk1" FOREIGN KEY ("studentId") REFERENCES "students"("id");

ALTER TABLE "projects" ADD CONSTRAINT "projects_fk0" FOREIGN KEY ("moduleId") REFERENCES "module"("id");

ALTER TABLE "deliveredProjects" ADD CONSTRAINT "deliveredProjects_fk0" FOREIGN KEY ("studentId") REFERENCES "students"("id");
ALTER TABLE "deliveredProjects" ADD CONSTRAINT "deliveredProjects_fk1" FOREIGN KEY ("projectId") REFERENCES "projects"("id");














