CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "articles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "text" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "category_id" integer);
CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_articles_on_category_id" ON "articles" ("category_id");
INSERT INTO schema_migrations (version) VALUES ('20160428041322');

INSERT INTO schema_migrations (version) VALUES ('20160429143423');

INSERT INTO schema_migrations (version) VALUES ('20160430000545');

