CREATE DATABASE "pratica_modelagem";

CREATE TABLE "users" (
	"id" SERIAL PRIMARY KEY,
	"name" varchar(255) NOT NULL,
	"email" varchar(255) NOT NULL UNIQUE,
	"password" varchar(255) NOT NULL
)



CREATE TABLE "products" (
	"id" SERIAL NOT NULL,
	"name" varchar(255) NOT NULL,
	"price" INTEGER NOT NULL,
	"image" TEXT NOT NULL
)



CREATE TABLE "categories" (
	"id" SERIAL NOT NULL,
	"type" TEXT NOT NULL UNIQUE
)



CREATE TABLE "sizes" (
	"id" SERIAL NOT NULL,
	"size" TEXT NOT NULL UNIQUE
)



CREATE TABLE "purchaseStatus" (
	"id" SERIAL NOT NULL UNIQUE,
	"status" TEXT NOT NULL UNIQUE
)



CREATE TABLE "purchase" (
	"id" SERIAL NOT NULL,
	"userId" INTEGER NOT NULL,
	"productsId" INTEGER NOT NULL,
	"categoryId" INTEGER NOT NULL,
	"purchaseStatusId" INTEGER NOT NULL,
	"sizesId" INTEGER NOT NULL,
	"date" DATE NOT NULL,
	"addres" TEXT NOT NULL,
	"amount" INTEGER NOT NULL
)














