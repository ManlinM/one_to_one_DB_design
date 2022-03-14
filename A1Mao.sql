-- COMP 53 Assignment 1, Topic:Greek Gods
-- Section:101
-- Name:Manlin Mao
DROP DATABASE IF EXISTS MaoGreekGods;
CREATE	DATABASE MaoGreekGods;

-- Select database
USE MaoGreekGods;

-- Creating Generation table, Primary table
-- One god type may have many gods 1:M
CREATE TABLE godType 
(
	typeID				INT 		PRIMARY KEY,
    genName				VARCHAR(80),
    firstImmortals		BOOLEAN
);
-- Inserting data to generation table
INSERT INTO godType VALUES
(1, 'Olympia',      FALSE),
(2, 'Titan',        FALSE),
(3, 'Primordial',	TRUE),
(4, 'Rustic', 	    FALSE),
(5, 'Argarian', 	FALSE);
-- Creating God table, related table
CREATE TABLE god
(
	godID				INT 		PRIMARY KEY,
    godGName			VARCHAR(50),
    godRName			VARCHAR(50),
    DOBBC        		DATE,
    famTie	        	VARCHAR(100),
	godWeightKG    		DECIMAL(4,1), 
    typeID				INT, 
        CONSTRAINT god_fk_godtype 
		FOREIGN KEY(typeID)
        REFERENCES godType(typeID)
);
-- Inserting data to god table
INSERT INTO god VALUES
(1, 'Aphrodite', 'Venus', '1660-11-09',  'Daughter of Zeus and Dione',55.6, 1),
(2, 'Zeus', 'Jupiter', '1780-08-09', 'Son of Cronus and Rhea',90.7, 1),
(3, 'Pan', 'Inuus', '1389-02-13', 'Son of Hermes and Penelope',80.6, 4),
(4, 'SEILENOS', 'Silenus', '1900-11-11','Son of Gaea',62.5 , 4),
(5, 'Apollo', 'Apollo', '1630-05-05', 'Son of Zeus and Leto',92.7, 1),
(6, 'Kronos', 'Saturn', '1770-10-28', 'Son of Uranus and Gaea',110.4, 2),
(7, 'Leto', 'Latona', '1785-12-25', 'Daughter of Coeus and Phoebe', 50.8, 2),
(8, 'HORAI ', 'Hora', '1670-05-29', 'Daughter of Zeus and Themis', 122.9, 5),
(9, 'PROMETHEUS', 'Prometheus', '1590-02-22','Son of Iapetus and Clymene',70.5, 2),
(10, 'Triptolemos', 'Triptolemus ', NULL, 'Son of Celeus and Metanira',62.6, 5),
(11, 'Khaos', 'Chaos', '8000-01-01', 'Emerged at creation',50.2, 3),
(12, 'Gaea', 'Terra', '8000-01-02',NULL , 58.9, 3),
(13, 'EREBOS', 'Erebus', '3867-07-22', 'Son of Chaos',120.4, 3),
(14, 'NYX', 'Nox', '5906-09-12',  'Daughter of Chaos',72.7, 3),
(15, 'AITHER', 'Acmon', '2689-01-08', 'Son of Erebus and Nyx',87.7, 3);
-- Creating attributs table
-- One attribute may only link to one god 1:1
CREATE TABLE godAttributes 
(
	godID          INT        PRIMARY KEY, 
    godDescr       VARCHAR(100),
    godPwr         VARCHAR(100),
		CONSTRAINT god_fk_godAttribute 
			FOREIGN KEY(godID) 
            REFERENCES god(godID)
);
INSERT INTO godAttributes VALUES
(1, 'Olympian goddess of love','The power of love'),
(2, 'The King of the Gods ','The power of lightning bolts' ),
(3, 'The god of shepherds and hunters','The power of excessive speed' ),
(4, 'The old rustic god of drunkenness','The power of prophecy' ),
(5, 'The Olympian god of prophecy','The power of see into the future' ),
(6, 'King of the Titanes and the god of time','The power of superhuman strength' ),
(7, 'The goddess of motherhood','The power of raising the moon'),
(8, 'The goddess of the natural portions of time ','The power of ralling the stars' ),
(9, 'The Titan god of forethought ','The power of forethought'),
(10, 'The demi-god of the Eleusinian mysteries','The power of presiding over the sowing of grain' ),
(11, 'The first of the primordial gods','The power of creating things out of nothing' ),
(12, 'The goddess of the earth','The power of creating life'),
(13, 'The primordial god of darkness','The power of controling reality' ),
(14, 'The goddess of the night','The power of controling the movement of planets'),
(15, 'The primordial god of light ','The power of controling the sun, the moon, the stars, and the clouds' );
-- Query 1: Display all contens of godType table
   SELECT * 
   FROM godType;
-- Query 2: Display all contens of god table
   SELECT * 
   FROM god;
-- Query 3: Display all contens of godAttributeS table
   SELECT * 
   FROM godAttributes;
-- Query 4: Code a query with a join to display any two columns from your 1:M tables 
   SELECT genName,godRName 
   FROM 	godType
 		  INNER JOIN god
   ON godType.typeID = god.typeID;
-- Query 5: Code a query with a join to display any two columns from your 1:1 tables 
   SELECT godGName, godPwr
   FROM 	    god
 		  INNER JOIN godAttributes
   ON god.godID = godAttributes.godID;