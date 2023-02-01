CREATE TABLE IF NOT EXISTS Artist_List (
	id serial PRIMARY KEY,
	artist_name varchar(255) NOT NULL,
	alias varchar(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre_list (
	id serial PRIMARY KEY, 
	genre_name varchar(80) UNIQUE
);

CREATE TABLE IF NOT EXISTS artist_in_genre (
	id serial PRIMARY KEY,
	artist_id integer NOT NULL REFERENCES Artist_List(id),
	genre_id integer NOT NULL REFERENCES  Genre_List(id)
);	

CREATE TABLE IF NOT EXISTS Album_List (
	id serial PRIMARY KEY,
	album_name varchar(80) NOT NULL,
	release_date integer CHECK (release_date > 0 AND release_date < 2030)
);

CREATE TABLE IF NOT EXISTS Artist_album (
	id serial PRIMARY KEY,
	artist_id integer NOT NULL REFERENCES Artist_List(id),
	album_id integer NOT NULL REFERENCES Album_List(id)
);

CREATE TABLE IF NOT EXISTS Track_List (
	id serial PRIMARY KEY,
	album_id integer REFERENCES Album_List(id),
	track_name varchar(80) NOT NULL,
	track_time integer NOT NULL
);

CREATE TABLE IF NOT EXISTS Collection_List (
	id serial PRIMARY KEY,
	collection_name varchar (80) NOT NULL,
	release_date integer CHECK (release_date > 0 AND release_date < 2030)
);

CREATE TABLE IF NOT EXISTS Collection_Album_Track (
	id serial PRIMARY KEY,
	collection_id integer REFERENCES Collection_List(id),
	track_id integer REFERENCES Track_List(id)
);