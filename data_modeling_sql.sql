CREATE TABLE "users" (
	"user_id" SERIAL PRIMARY KEY NOT NULL,
	"username" VARCHAR(40) NOT NULL,
	"password" TEXT NOT NULL,
	"email" VARCHAR(50) NOT NULL,
	"first_name" VARCHAR(50) NOT NULL,
	"last_name" VARCHAR(50) NOT NULL
);



CREATE TABLE "ingredients" (
	"ingredient_id" SERIAL PRIMARY KEY NOT NULL,
	"name" VARCHAR(40) NOT NULL
);



CREATE TABLE "recipes" (
	"recipe_id" SERIAL PRIMARY KEY NOT NULL,
	"name" VARCHAR(80) NOT NULL,
	"user_id" INTEGER REFERENCES users(user_id),
	-- "creator" VARCHAR(80) REFERENCES users(user_id),
	"privacy" BOOLEAN NOT NULL,
	"instructions" TEXT NOT NULL
);


CREATE TABLE "grocery_list" (
	"ingredient_user_id" SERIAL PRIMARY KEY NOT NULL,
	"ingredient_id" INTEGER NOT NULL,
	"user_id" INTEGER NOT NULL
);

CREATE TABLE "occasions" (
	"occasion_id" SERIAL PRIMARY KEY NOT NULL,
	"name" VARCHAR(40) NOT NULL
);

CREATE TABLE "IngredientRecipe" (
	"recipe_ingredient_id" SERIAL PRIMARY KEY NOT NULL,
	"ingredient_id" INTEGER REFERENCES ingredients(ingredient_id),
	"recipe_id" INTEGER REFERENCES ingredients(ingredient_id)
);

CREATE TABLE "OccasionsRecipes" (
	"occasions_recipe_id" SERIAL PRIMARY KEY NOT NULL,
	"occasion_id" INTEGER NOT NULL,
	"recipe_id" INTEGER NOT NULL
);

INSERT INTO users(password, first_name, email, last_name, username)
VALUES('asdf', 'cody', 'cody@cody.cody', 'barlow', 'cbarlow');

DELETE
FROM users
WHERE user_id = 1;

SELECT * FROM users;