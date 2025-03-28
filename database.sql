CREATE DATABASE JobApplicationDB;
USE JobApplicationDB;

CREATE TABLE User (
    user_ID INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

CREATE TABLE Company (
    company_ID INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100),
    company_description TEXT
);

CREATE TABLE Offer (
    offer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100),
    description TEXT,
    skills TEXT,
    start_date DATE,
    end_date DATE,
    base_remuneration DECIMAL(10,2),
    company_ID INT,
    FOREIGN KEY (company_ID) REFERENCES Company(company_ID)
);

CREATE TABLE Application (
    application_ID INT AUTO_INCREMENT PRIMARY KEY,
    application_date DATE,
    cv TEXT,
    cover_letter TEXT,
    user_ID INT,
    offer_ID INT,
    FOREIGN KEY (user_ID) REFERENCES User(user_ID),
    FOREIGN KEY (offer_ID) REFERENCES Offer(offer_ID)
);

CREATE TABLE Evaluation (
    ID_evaluation INT AUTO_INCREMENT PRIMARY KEY,
    note INT CHECK (note BETWEEN 0 AND 10),
    comment TEXT,
    application_ID INT,
    FOREIGN KEY (application_ID) REFERENCES Application(application_ID)
);

CREATE TABLE Wishlist (
    user_ID INT,
    offer_ID INT,
    PRIMARY KEY (user_ID, offer_ID),
    FOREIGN KEY (user_ID) REFERENCES User(user_ID),
    FOREIGN KEY (offer_ID) REFERENCES Offer(offer_ID)
);

CREATE TABLE Send (
    user_ID INT,
    application_ID INT,
    PRIMARY KEY (user_ID, application_ID),
    FOREIGN KEY (user_ID) REFERENCES User(user_ID),
    FOREIGN KEY (application_ID) REFERENCES Application(application_ID)
);

CREATE TABLE Receive (
    application_ID INT,
    offer_ID INT,
    PRIMARY KEY (application_ID, offer_ID),
    FOREIGN KEY (application_ID) REFERENCES Application(application_ID),
    FOREIGN KEY (offer_ID) REFERENCES Offer(offer_ID)
);

CREATE TABLE Post (
    company_ID INT,
    offer_ID INT,
    PRIMARY KEY (company_ID, offer_ID),
    FOREIGN KEY (company_ID) REFERENCES Company(company_ID),
    FOREIGN KEY (offer_ID) REFERENCES Offer(offer_ID)
);

CREATE TABLE ReadTable (
    evaluation_ID INT,
    company_ID INT,
    PRIMARY KEY (evaluation_ID, company_ID),
    FOREIGN KEY (evaluation_ID) REFERENCES Evaluation(ID_evaluation),
    FOREIGN KEY (company_ID) REFERENCES Company(company_ID)
);
