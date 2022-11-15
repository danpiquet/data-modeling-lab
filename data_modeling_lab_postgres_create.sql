CREATE TABLE "public.users" (
	"user_id" serial NOT NULL,
	"username" varchar(40) NOT NULL,
	"password" TEXT NOT NULL,
	"email" varchar(50) NOT NULL,
	"first_name" varchar(50) NOT NULL,
	"last_name" varchar(50) NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ingredients" (
	"ingredient_id" serial NOT NULL,
	"name" serial(40) NOT NULL,
	CONSTRAINT "ingredients_pk" PRIMARY KEY ("ingredient_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.recipes" (
	"recipe_id" serial NOT NULL,
	"name" serial(80) NOT NULL,
	"creator" varchar(80) NOT NULL,
	"privacy" BOOLEAN NOT NULL,
	"instructions" TEXT NOT NULL,
	CONSTRAINT "recipes_pk" PRIMARY KEY ("recipe_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.IngredientRecipe" (
	"recipe_ingredient_id" serial NOT NULL,
	"ingredient_id" TEXT NOT NULL,
	"recipe_id" TEXT NOT NULL,
	CONSTRAINT "IngredientRecipe_pk" PRIMARY KEY ("recipe_ingredient_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.grocery_list" (
	"ingredient_user_id" serial NOT NULL,
	"ingredient_id" integer NOT NULL,
	"user_id" integer NOT NULL,
	CONSTRAINT "grocery_list_pk" PRIMARY KEY ("ingredient_user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.occasions" (
	"occasion_id" serial NOT NULL,
	"name" varchar(40) NOT NULL,
	CONSTRAINT "occasions_pk" PRIMARY KEY ("occasion_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.OccasionsRecipes" (
	"occasions_recipe_id" serial NOT NULL,
	"occasion_id" integer NOT NULL,
	"recipe_id" integer NOT NULL,
	CONSTRAINT "OccasionsRecipes_pk" PRIMARY KEY ("occasions_recipe_id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "recipes" ADD CONSTRAINT "recipes_fk0" FOREIGN KEY ("creator") REFERENCES "users"("user_id");

ALTER TABLE "IngredientRecipe" ADD CONSTRAINT "IngredientRecipe_fk0" FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("ingredient_id");
ALTER TABLE "IngredientRecipe" ADD CONSTRAINT "IngredientRecipe_fk1" FOREIGN KEY ("recipe_id") REFERENCES "recipes"("recipe_id");

ALTER TABLE "grocery_list" ADD CONSTRAINT "grocery_list_fk0" FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("ingredient_id");
ALTER TABLE "grocery_list" ADD CONSTRAINT "grocery_list_fk1" FOREIGN KEY ("user_id") REFERENCES "users"("user_id");


ALTER TABLE "OccasionsRecipes" ADD CONSTRAINT "OccasionsRecipes_fk0" FOREIGN KEY ("occasion_id") REFERENCES "occasions"("occasion_id");
ALTER TABLE "OccasionsRecipes" ADD CONSTRAINT "OccasionsRecipes_fk1" FOREIGN KEY ("recipe_id") REFERENCES "recipes"("recipe_id");








