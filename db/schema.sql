-- sqlite3 foodnetwork.sqlite3 < schema.sql
-- This is how you load the schema file into the DB in the terminal via route project2/db

DROP TABLE IF EXISTS articles;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS images;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS articles_authors;
DROP TABLE IF EXISTS articles_categories;

CREATE TABLE articles (
  article_id INTEGER PRIMARY KEY,
  date_created DATE,
  date_edited DATE,
  title VARCHAR,
  content TEXT
);

CREATE TABLE users (
  user_id INTEGER PRIMARY KEY,
  name VARCHAR,
  username VARCHAR
);

CREATE TABLE images (
  id INTEGER PRIMARY KEY,
  name VARCHAR,
  img_url TEXT,
  article_id INTEGER REFERENCES articles(id)
);

CREATE TABLE categories (
  id INTEGER PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE articles_users (
  article_id INTEGER REFERENCES articles(id),
  user_id INTEGER REFERENCES authors(id)
);

CREATE TABLE articles_categories (
  article_id INTEGER REFERENCES articles(id),
  category_id INTEGER REFERENCES categories(id)
);