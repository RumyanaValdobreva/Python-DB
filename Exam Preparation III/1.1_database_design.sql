CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS addresses (
    id SERIAL PRIMARY KEY,
    street_name VARCHAR(100) NOT NULL,
    street_number INTEGER CHECK (street_number > 0) NOT NULL,
    town VARCHAR(30) NOT NULL,
    country VARCHAR(50) NOT NULL,
    zip_code INTEGER CHECK (zip_code > 0) NOT NULL
);

CREATE TABLE IF NOT EXISTS publishers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    address_id INTEGER
        REFERENCES addresses ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    website VARCHAR(40),
    phone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS players_ranges (
    id SERIAL PRIMARY KEY,
    min_players INTEGER CHECK (min_players > 0) NOT NULL,
    max_players INTEGER CHECK (max_players > 0) NOT NULL
);

CREATE TABLE IF NOT EXISTS creators (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS board_games (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    release_year INTEGER CHECK (release_year > 0) NOT NULL,
    rating NUMERIC(2) NOT NULL,
    category_id INTEGER
        REFERENCES categories ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    publisher_id INTEGER
        REFERENCES publishers ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    players_range_id INTEGER REFERENCES players_ranges ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

CREATE TABLE IF NOT EXISTS creators_board_games (
    creator_id INTEGER
        REFERENCES creators ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    board_game_id INTEGER
        REFERENCES board_games ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);