--see change in package.json, specifying -U postgres
--and getting rid of -d filez

--should be like this:
--"db:schema": "psql -U postgres -f db/schema.sql",


DROP DATABASE IF EXISTS filez;
CREATE DATABASE filez;
\c filez;

CREATE TABLE folders (
  id serial PRIMARY KEY,
  name text UNIQUE NOT NULL
);

CREATE TABLE files (
    id serial PRIMARY KEY,
    name text NOT NULL,
    size integer NOT NULL,
    folder_id integer NOT NULL REFERENCES folders(id) ON DELETE CASCADE,
    UNIQUE (name, folder_id)
);
