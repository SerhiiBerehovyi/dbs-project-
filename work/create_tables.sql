CREATE TABLE aol_user (
    id INTEGER PRIMARY KEY
);

CREATE TABLE aol_query (
    id SERIAL PRIMARY KEY,
    aol_user_id INTEGER REFERENCES aol_user(id),
    timestamp TIMESTAMP NOT NULL,
    text TEXT NOT NULL
);

CREATE TABLE url (
	id SERIAL PRIMARY KEY,
	url TEXT NOT NULL
);

CREATE TABLE aol_query_url (
    aol_query_id INTEGER REFERENCES aol_query(id),
    url_id INTEGER REFERENCES url(id),
    page_rank INTEGER,
    PRIMARY KEY (aol_query_id, url_id)
);

CREATE TABLE search_term (
    id SERIAL PRIMARY KEY,
    text TEXT NOT NULL
);

CREATE TABLE theme_type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE plot_theme (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    theme_type_id INTEGER REFERENCES theme_type(id)
);

CREATE TABLE location (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE organisation (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE film_cast (
    id SERIAL PRIMARY KEY,
    role VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE visitors (
    location_id INTEGER REFERENCES location(id),
    interval_start TIMESTAMP NOT NULL,
    interval_end TIMESTAMP NOT NULL,
    count INTEGER NOT NULL,
    PRIMARY KEY (location_id, interval_start, interval_end)
);

CREATE TABLE enrollments (
    school VARCHAR(255) NOT NULL,
    interval_start TIMESTAMP NOT NULL,
    interval_end TIMESTAMP NOT NULL,
    count INTEGER NOT NULL,
    PRIMARY KEY (school, interval_start, interval_end)
);

CREATE TABLE search_term_plot_theme (
    search_term_id INTEGER REFERENCES search_term(id),
    plot_theme_id INTEGER REFERENCES plot_theme(id),
    PRIMARY KEY (search_term_id, plot_theme_id)
);

CREATE TABLE search_term_organisation (
    search_term_id INTEGER REFERENCES search_term(id),
    organisation_id INTEGER REFERENCES organisation(id),
    PRIMARY KEY (search_term_id, organisation_id)
);

CREATE TABLE search_term_location (
    search_term_id INTEGER REFERENCES search_term(id),
    location_id INTEGER REFERENCES location(id),
    PRIMARY KEY (search_term_id, location_id)
);

CREATE TABLE search_term_cast (
    search_term_id INTEGER REFERENCES search_term(id),
    cast_id INTEGER REFERENCES film_cast(id),
    PRIMARY KEY (search_term_id, cast_id)
);

CREATE TABLE plot_theme_location (
    plot_theme_id INTEGER REFERENCES plot_theme(id),
    location_id INTEGER REFERENCES location(id),
    PRIMARY KEY (plot_theme_id, location_id)
);

CREATE TABLE plot_theme_organisation (
    plot_theme_id INTEGER REFERENCES plot_theme(id),
    organisation_id INTEGER REFERENCES organisation(id),
    PRIMARY KEY (plot_theme_id, organisation_id)
);