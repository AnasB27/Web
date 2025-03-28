-- Création de la base de données
CREATE DATABASE JobApplicationDB;
USE JobApplicationDB;

-- Table Role
DROP TABLE IF EXISTS role;
CREATE TABLE role(
   role_id INT NOT NULL,
   role_name VARCHAR(50) NOT NULL,
   PRIMARY KEY(role_id)
);
INSERT INTO role(role_id, role_name) VALUES
(1, 'administrateur'),
(2, 'pilote'),
(3, 'étudiant');

-- Table User
DROP TABLE IF EXISTS user;
CREATE TABLE user(
   user_id INT NOT NULL AUTO_INCREMENT,
   user_first_name VARCHAR(50) NOT NULL,
   user_last_name VARCHAR(50) NOT NULL,
   user_email VARCHAR(50) NOT NULL,
   user_password VARCHAR(255) NOT NULL,
   user_phone_number VARCHAR(12) NOT NULL,
   role_id INT NOT NULL,
   PRIMARY KEY(user_id),
   FOREIGN KEY(role_id) REFERENCES role(role_id)
);
INSERT INTO user(user_first_name, user_last_name, user_email, user_password, user_phone_number, role_id) VALUES
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
   company_id INT NOT NULL AUTO_INCREMENT,
   company_name VARCHAR(50) NOT NULL,
   company_desc VARCHAR(100),
   company_phone_number VARCHAR(15) NOT NULL,
   company_email VARCHAR(50) NOT NULL,
   PRIMARY KEY(company_id)
);
INSERT INTO company(company_name, company_desc, company_phone_number, company_email) VALUES
('Google', 'The best company in the world', '1234567890', 'contact@google.com'),
('Amazon', 'The second best company in the world', '0987654321', 'contact@amazon.com'),
('Facebook', 'The third best company in the world', '1122334455', 'contact@facebook.com'),
('Microsoft', 'The fourth best company in the world', '2233445566', 'contact@microsoft.com'),
('Apple', 'The fifth best company in the world', '3344556677', 'contact@apple.com');

-- Table Offer
DROP TABLE IF EXISTS offer;
CREATE TABLE offer(
   offer_id INT NOT NULL AUTO_INCREMENT,
   offer_title VARCHAR(50) NOT NULL,
   offer_description VARCHAR(200),
   offer_skills VARCHAR(50),
   offer_start_date DATE,
   offer_end_date DATE,
   offer_base_remuneration INT,
   company_id INT NOT NULL,
   PRIMARY KEY(offer_id),
   FOREIGN KEY(company_id) REFERENCES company(company_id)
);
INSERT INTO offer(offer_title, offer_description, offer_skills, offer_start_date, offer_end_date, offer_base_remuneration, company_id) VALUES
('Software Engineer', 'Develop and maintain software applications', 'Java, SQL', '2020-01-06', '2020-01-07', 6000, 1),
('Data Analyst', 'Analyze and interpret complex data sets', 'Python, Excel', '2020-01-07', '2020-01-08', 7000, 1);

-- Table Application
DROP TABLE IF EXISTS application;
CREATE TABLE application(
   application_id INT NOT NULL AUTO_INCREMENT,
   application_date DATE NOT NULL,
   application_cv VARCHAR(50) NOT NULL,
   application_cover_letter VARCHAR(50) NOT NULL,
   offer_id INT NOT NULL,
   user_id INT NOT NULL,
   PRIMARY KEY(application_id),
   FOREIGN KEY(offer_id) REFERENCES offer(offer_id),
   FOREIGN KEY(user_id) REFERENCES user(user_id)
);
INSERT INTO application(application_date, application_cv, application_cover_letter, offer_id, user_id) VALUES
('2020-01-01', 'cv1', 'cover_letter1', 1, 7),
('2020-01-02', 'cv2', 'cover_letter2', 2, 8);

-- Table Evaluation
DROP TABLE IF EXISTS evaluation;
CREATE TABLE evaluation(
   evaluation_id INT NOT NULL AUTO_INCREMENT,
   evaluation_note INT NOT NULL CHECK (evaluation_note BETWEEN 0 AND 10),
   evaluation_comment VARCHAR(50),
   company_id INT NOT NULL,
   user_id INT NOT NULL,
   PRIMARY KEY(evaluation_id),
   FOREIGN KEY(company_id) REFERENCES company(company_id),
   FOREIGN KEY(user_id) REFERENCES user(user_id)
);
INSERT INTO evaluation(evaluation_note, evaluation_comment, company_id, user_id) VALUES
(5, 'Great work environment', 1, 1),
(4, 'Challenging tasks', 2, 2);

-- Table Wishlist
DROP TABLE IF EXISTS wishlist;
CREATE TABLE wishlist(
   user_id INT NOT NULL,
   offer_id INT NOT NULL,
   PRIMARY KEY(user_id, offer_id),
   FOREIGN KEY(user_id) REFERENCES user(user_id),
   FOREIGN KEY(offer_id) REFERENCES offer(offer_id)
);
INSERT INTO wishlist(user_id, offer_id) VALUES
(7, 1),
(8, 2);