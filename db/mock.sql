INSERT INTO DiseaseType (id, description) VALUES
(1,  'infectious diseases'),
(2,  'virology'),
(3,  'deficiency diseases'),
(4,  'hereditary diseases'),
(5,  'physiological diseases'),
(6,  'immune system diseases'),
(7,  'endocrine, nutritional or metabolic diseases'),
(8,  'mental, behavioural or neurodevelopmental disorders'),
(9,  'nervous system diseases'),
(10, 'visual system diseases'),
(11, 'ear or mastoid process diseases'),
(12, 'circulatory system diseases'),
(13, 'respiratory system diseases');

INSERT INTO Country (cname, population) VALUES
('China',         1439323776),
('India',         1380004385),
('United States',  331002651),
('Indonesia',      273523615),
('Pakistan',       220892340),
('Brazil',         212559417),
('Nigeria',        206139589),
('Bangladesh',     164689383),
('Russia',         145934462),
('Mexico', 	       128932753);

INSERT INTO Disease (disease_code, pathogen, description, id) VALUES
('copad-10', 'parasites', 'Severe illness',   3),
('cobad-11', 'bacteria',  'Severe disease',   7),
('covid-12', 'virus',     'Serious illness', 13),
('cofud-13', 'fungee',    'Serious disease',  6),
('copad-14', 'parasites', 'Severe illness',   9),
('cobad-15', 'bacteria',  'Severe disease',   5),
('cobad-16', 'bacteria',  'Serious illness', 12),
('covid-17', 'virus',     'Serious disease', 10),
('cofud-18', 'fungee',    'Severe illness',   8),
('covid-19', 'virus',     'Severe disease',   2),
('cobad-20', 'bacteria',  'Serious illness',  1),
('covid-21', 'virus',     'Serious disease',  4);

INSERT INTO Discover (cname, disease_code, first_enc_date) VALUES
('India',         'copad-10', '2021-08-20'),
('China',         'copad-10', '1964-01-15'),
('Brazil',        'copad-10', '1984-06-17'),
('Bangladesh',    'cobad-11', '2008-08-15'),
('India',         'cobad-11', '1970-11-18'),
('Brazil',        'covid-12', '2004-03-29'),
('United States', 'covid-12', '2000-02-15'),
('Pakistan',      'cofud-13', '1996-02-24'),
('Indonesia',     'cofud-13', '2003-10-25'),
('Russia',        'copad-14', '1982-12-31'),
('Pakistan',      'copad-14', '1981-11-01'),
('Nigeria',       'cobad-15', '1965-09-10'),
('Brazil',        'cobad-15', '2006-05-30'),
('Indonesia',     'cobad-16', '1978-02-21'),
('Nigeria',       'cobad-16', '2018-07-02'),
('Mexico',        'covid-17', '1993-02-05'),
('Bangladesh',    'covid-17', '2019-11-23'),
('United States', 'cofud-18', '1987-11-17'),
('Russia',        'cofud-18', '2020-06-25'),
('China',         'covid-19', '2019-11-18'),
('Pakistan',      'covid-19', '2019-12-31'),
('Nigeria',       'covid-19', '2020-01-03'),
('Mexico',        'covid-19', '2020-01-09'),
('Russia',        'covid-19', '2007-11-21'),
('Bangladesh',    'covid-19', '2020-02-19'),
('Bangladesh',    'cobad-20', '1993-10-16'),
('Mexico',        'covid-21', '1972-01-30');

INSERT INTO Users (email, name, surname, salary, phone, cname) VALUES
('krin.holland@example.com',      'Krin',      'Holland',   '344362', '+86 (357)-586-5265',  'China'),
('bmedgwick1@example.com',        'Barnebas',  'Medgwick',  '439239', '+62 (840)-905-8724',  'Indonesia'),
('wilma.fleming@example.com',     'Wilma',     'Fleming',   '417837', '+1 (291)-679-5447',   'United States'),
('cecil.howell@example.com',      'Cecil',     'Howell',    '235129', '+92 (934)-814-9166',  'Pakistan'),
('mitchell.wood@example.com',     'Mitchell',  'Wood',      '323337', '+880 (230)-387-7162', 'Bangladesh'),
('iabbots6@example.com',          'Isa',       'Abbots',    '156424', '+55 (390)-794-6372',  'Brazil'),
('jruperti4@example.com',         'Jacky',     'Ruperti',   '375494', '+91 (497)-893-5219',  'India'),
('ggoodship2@example.com',        'Gwynne',    'Goodship',  '128341', '+62 (465)-911-4829',  'Indonesia'),
('clambell5@example.com',         'Creighton', 'Lambell',   '334315', '+55 (618)-860-7654',  'Brazil'),
('kbenko8@example.com',           'Karla',     'Benko',     '205050', '+62 (907)-391-6808',  'Indonesia'),
('herbert.patterson@example.com', 'Herbert',   'Patterson', '220749', '+91 (488)-216-9082',  'India'),
('lpattisson9@example.com',       'Laverne',   'Pattisson', '136685', '+86 (344)-562-8003',  'China'),
('edward.reid@example.com',       'Edward',    'Reid',      '255380', '+92 (069)-807-8727',  'Pakistan'),
('herman.watts@example.com',      'Herman',    'Watts',     '412481', '+92 (151)-394-3140',  'Pakistan'),
('swright7@example.com',          'Salem',     'Wright',    '251922', '+52 (361)-573-0008',  'Mexico'),
('bonnie.bailey@example.com',     'Bonnie',    'Bailey',    '474709', '+91 (890)-980-6347',  'India'),
('toni.tucker@example.com',       'Toni',      'Tucker',    '183865', '+86 (848)-571-2377',  'China'),
('crustidge3@example.com',        'Cassy',     'Rustidge',  '137429', '+7 (979)-612-6967',   'Russia'),
('ellis.joelbek@example.com',     'Ellis',     'Joelbek',   '281035', '+234 (442)-855-7829', 'Nigeria'),
('egeorgeson0@example.com',       'Ewen',      'Georgeson', '434887', '+91 (941)-853-6001',  'India');

INSERT INTO PublicServant (email, department) VALUES
('krin.holland@example.com',  'Dept1'),
('bmedgwick1@example.com',    'Dept2'),
('wilma.fleming@example.com', 'Dept3'),
('cecil.howell@example.com',  'Dept1'),
('mitchell.wood@example.com', 'Dept2'),
('iabbots6@example.com',      'Dept3'),
('jruperti4@example.com',     'Dept1'),
('ggoodship2@example.com',    'Dept4'),
('clambell5@example.com',     'Dept3'),
('kbenko8@example.com',       'Dept3');

INSERT INTO Doctor (email, degree) VALUES
('herbert.patterson@example.com', 'DoM'),
('lpattisson9@example.com',       'MoC'),
('edward.reid@example.com',       'MoM'),
('herman.watts@example.com',      'DoM'),
('swright7@example.com',          'MoP'),
('bonnie.bailey@example.com',     'DoM'),
('toni.tucker@example.com',       'DoC'),
('crustidge3@example.com',        'DoM'),
('ellis.joelbek@example.com',     'DoC'),
('egeorgeson0@example.com',       'DoM');
	
INSERT INTO Specialize (id, email) VALUES
(5,  'herbert.patterson@example.com'),
(10, 'herbert.patterson@example.com'),
(2,  'lpattisson9@example.com'),
(9,  'lpattisson9@example.com'),
(6,  'edward.reid@example.com'),
(11, 'edward.reid@example.com'),
(8,  'edward.reid@example.com'),
(2,  'herman.watts@example.com'),
(8,  'swright7@example.com'),
(13, 'bonnie.bailey@example.com'),
(1,  'toni.tucker@example.com'),
(2,  'toni.tucker@example.com'),
(3,  'toni.tucker@example.com'),
(4,  'toni.tucker@example.com'),
(7,  'crustidge3@example.com'),
(3,  'ellis.joelbek@example.com'),
(10, 'ellis.joelbek@example.com'),
(12, 'egeorgeson0@example.com');

INSERT INTO Record (email, cname, disease_code, total_deaths, total_patients) VALUES
('krin.holland@example.com',  'China',         'copad-10',  300793, 1100063),
('krin.holland@example.com',  'China',         'covid-19',  152939, 1221112),
('bmedgwick1@example.com',    'India',         'cobad-11',  611164,  721404),
('wilma.fleming@example.com', 'United States', 'covid-12',  109827,  309311),
('cecil.howell@example.com',  'Indonesia',     'cofud-13',  107172,  705327),
('cecil.howell@example.com',  'China',         'covid-19',  502089,  767983),
('mitchell.wood@example.com', 'Pakistan',      'copad-14',  768065,  946722),
('mitchell.wood@example.com', 'Pakistan',      'covid-19', 1132950, 1332235),
('iabbots6@example.com',      'Brazil',        'cobad-15', 1399530,  544960),
('jruperti4@example.com',     'Nigeria',       'cobad-16', 1048302,  916301),
('jruperti4@example.com',     'Nigeria',       'covid-19',  894710,  927695),
('ggoodship2@example.com',    'Bangladesh',    'covid-17',  642778, 1278944),
('clambell5@example.com',     'Russia',        'cofud-18',  545848, 1446607),
('kbenko8@example.com',       'Mexico',        'covid-19',  771370, 1203274),
('kbenko8@example.com',       'Russia',        'covid-19',  168087, 1196071),
('kbenko8@example.com',       'Bangladesh',    'covid-19',  398701,  608148),
('kbenko8@example.com',       'China',         'covid-19',  838077, 1350346);