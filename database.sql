-- Création de la base de données
CREATE DATABASE JobApplicationDB;
USE JobApplicationDB;

-- Table Role
DROP TABLE IF EXISTS role;
CREATE TABLE role(
   ID_role INT NOT NULL,
   name_role VARCHAR(50) NOT NULL,
   PRIMARY KEY(ID_role)
);
INSERT INTO role(ID_role, name_role) VALUES
(1, 'administrateur'),
(2, 'pilote'),
(3, 'etudiant');

-- Table User
DROP TABLE IF EXISTS _user;
CREATE TABLE _user(
   user_ID INT NOT NULL AUTO_INCREMENT,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   password VARCHAR(255) NOT NULL,
   phone_number VARCHAR(12) NOT NULL,
   ID_role INT NOT NULL,
   PRIMARY KEY(user_ID),
   FOREIGN KEY(ID_role) REFERENCES role(ID_role)
);
INSERT INTO _user(first_name, last_name, email, password, phone_number, ID_role) VALUES
('Michael', 'Jordan', 'michael.jordan@example.com', 'securePass1', '1234567890', 1),
('Sarah', 'Connor', 'sarah.connor@example.com', 'securePass2', '0987654321', 1),
('David', 'Beckham', 'david.beckham@example.com', 'securePass3', '1122334455', 1),
('Emily', 'Blunt', 'emily.blunt@example.com', 'securePass4', '2233445566', 2),
('Chris', 'Evans', 'chris.evans@example.com', 'securePass5', '3344556677', 2),
('Sophia', 'Loren', 'sophia.loren@example.com', 'securePass6', '4455667788', 2),
('Daniel', 'Craig', 'daniel.craig@example.com', 'securePass7', '5566778899', 3),
('Emma', 'Watson', 'emma.watson@example.com', 'securePass8', '6677889900', 3);

-- Table Company
DROP TABLE IF EXISTS company;
CREATE TABLE company(
   company_ID INT NOT NULL AUTO_INCREMENT,
   company_name VARCHAR(50) NOT NULL,
   company_desc VARCHAR(100),
   PRIMARY KEY(company_ID)
);
INSERT INTO company(company_name, company_desc) VALUES
('Google', 'The best company in the world'),
('Amazon', 'The second best company in the world'),
('Facebook', 'The third best company in the world'),
('Microsoft', 'The fourth best company in the world'),
('Apple', 'The fifth best company in the world');

-- Table Offer
DROP TABLE IF EXISTS offer;
CREATE TABLE offer(
   offer_ID INT NOT NULL AUTO_INCREMENT,
   title VARCHAR(50) NOT NULL,
   description VARCHAR(200),
   skills VARCHAR(50),
   start_date DATE,
   end_date DATE,
   base_remuneration INT,
   company_ID INT NOT NULL,
   PRIMARY KEY(offer_ID),
   FOREIGN KEY(company_ID) REFERENCES company(company_ID)
);
INSERT INTO offer(title, description, skills, start_date, end_date, base_remuneration, company_ID) VALUES
('Software Engineer', 'Develop and maintain software applications', 'Java, SQL', '2020-01-06', '2020-01-07', 6000, 1),
('Data Analyst', 'Analyze and interpret complex data sets', 'Python, Excel', '2020-01-07', '2020-01-08', 7000, 1);

-- Table Application
DROP TABLE IF EXISTS application;
CREATE TABLE application(
   application_ID INT NOT NULL AUTO_INCREMENT,
   application_date DATE NOT NULL,
   cv VARCHAR(50) NOT NULL,
   cover_letter VARCHAR(50) NOT NULL,
   offer_ID INT NOT NULL,
   user_ID INT NOT NULL,
   PRIMARY KEY(application_ID),
   FOREIGN KEY(offer_ID) REFERENCES offer(offer_ID),
   FOREIGN KEY(user_ID) REFERENCES _user(user_ID)
);
INSERT INTO application(application_date, cv, cover_letter, offer_ID, user_ID) VALUES
('2020-01-01', 'cv1', 'cover_letter1', 1, 7),
('2020-01-02', 'cv2', 'cover_letter2', 2, 8);

-- Table Evaluation
DROP TABLE IF EXISTS evaluation;
CREATE TABLE evaluation(
   ID_evaluation INT NOT NULL AUTO_INCREMENT,
   note INT NOT NULL CHECK (note BETWEEN 0 AND 10),
   comment VARCHAR(50),
   company_ID INT NOT NULL,
   user_ID INT NOT NULL,
   PRIMARY KEY(ID_evaluation),
   FOREIGN KEY(company_ID) REFERENCES company(company_ID),
   FOREIGN KEY(user_ID) REFERENCES _user(user_ID)
);
INSERT INTO evaluation(note, comment, company_ID, user_ID) VALUES
(5, 'Great work environment', 1, 1),
(4, 'Challenging tasks', 2, 2);

-- Table Wishlist
DROP TABLE IF EXISTS wishlist;
CREATE TABLE wishlist(
   user_ID INT NOT NULL,
   offer_ID INT NOT NULL,
   PRIMARY KEY(user_ID, offer_ID),
   FOREIGN KEY(user_ID) REFERENCES _user(user_ID),
   FOREIGN KEY(offer_ID) REFERENCES offer(offer_ID)
);
INSERT INTO wishlist(user_ID, offer_ID) VALUES
(7, 1),
(8, 2);