-- Organizations
INSERT INTO plot_theme (name, theme_type_id) VALUES ('Opus Dei', (SELECT id FROM theme_type WHERE name = 'organisation'));
INSERT INTO plot_theme (name, theme_type_id) VALUES ('Priory of Sion', (SELECT id FROM theme_type WHERE name = 'organisation'));

-- Theories
INSERT INTO plot_theme (name, theme_type_id) VALUES ('The Holy Grail', (SELECT id FROM theme_type WHERE name = 'theory'));
INSERT INTO plot_theme (name, theme_type_id) VALUES ('Sacred Feminine', (SELECT id FROM theme_type WHERE name = 'theory'));
INSERT INTO plot_theme (name, theme_type_id) VALUES ('Jesus and Mary Magdalene', (SELECT id FROM theme_type WHERE name = 'theory'));

-- Artworks
INSERT INTO plot_theme (name, theme_type_id) VALUES ('Mona Lisa', (SELECT id FROM theme_type WHERE name = 'artwork'));
INSERT INTO plot_theme (name, theme_type_id) VALUES ('The Last Supper', (SELECT id FROM theme_type WHERE name = 'artwork'));
INSERT INTO plot_theme (name, theme_type_id) VALUES ('Madonna of the Rocks', (SELECT id FROM theme_type WHERE name = 'artwork'));
INSERT INTO plot_theme (name, theme_type_id) VALUES ('Vitruvian Man', (SELECT id FROM theme_type WHERE name = 'artwork'));

-- Locations
INSERT INTO plot_theme (name, theme_type_id) VALUES ('Louvre Museum', (SELECT id FROM theme_type WHERE name = 'location'));
INSERT INTO plot_theme (name, theme_type_id) VALUES ('Rosslyn Chapel', (SELECT id FROM theme_type WHERE name = 'location'));
INSERT INTO plot_theme (name, theme_type_id) VALUES ('Temple Church', (SELECT id FROM theme_type WHERE name = 'location'));
INSERT INTO plot_theme (name, theme_type_id) VALUES ('Château Villette', (SELECT id FROM theme_type WHERE name = 'location'));

-- Devices
INSERT INTO plot_theme (name, theme_type_id) VALUES ('Cryptex', (SELECT id FROM theme_type WHERE name = 'device'));

-- Rituals
INSERT INTO plot_theme (name, theme_type_id) VALUES ('Hieros Gamos', (SELECT id FROM theme_type WHERE name = 'ritual'));