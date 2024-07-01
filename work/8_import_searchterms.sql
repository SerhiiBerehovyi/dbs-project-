-- Insert search terms for selected organizations
INSERT INTO search_term (text) VALUES
('opus dei'), ('opusdei'),
('priory of sion'), ('sion of priory'), ('prieuré de sion'),
('illuminati'), ('illuminatus'), ('illuminaten');

INSERT INTO search_term_organisation (search_term_id, organisation_id) VALUES
(1, 7), (2, 7),  -- Search terms related to Opus Dei
(3, 15), (4, 15), (5, 15),  -- Search terms related to Priory of Sion
(6, 2), (7, 2), (8, 2);  -- Search terms related to Illuminati