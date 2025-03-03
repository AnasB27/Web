-- Création de la base de données
CREATE DATABASE Projet;
USE Projet;

-- Table des utilisateurs (administrateurs, étudiants, pilotes)
CREATE TABLE Utilisateurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    role ENUM('administrateur', 'etudiant', 'pilote') NOT NULL
);

-- Table des entreprises
CREATE TABLE Entreprises (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    description TEXT,
    email_contact VARCHAR(255),
    telephone_contact VARCHAR(20)
);

-- Table des offres de stage
CREATE TABLE Offres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entreprise_id INT NOT NULL,
    titre VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    competences TEXT NOT NULL,
    remuneration DECIMAL(10,2),
    date_debut DATE,
    date_fin DATE,
    FOREIGN KEY (entreprise_id) REFERENCES Entreprises(id) ON DELETE CASCADE
);

-- Table des candidatures
CREATE TABLE Candidatures (
    id INT AUTO_INCREMENT PRIMARY KEY,
    etudiant_id INT NOT NULL,
    offre_id INT NOT NULL, 
    date_candidature TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cv TEXT NOT NULL,
    lettre_motivation TEXT NOT NULL,
    FOREIGN KEY (etudiant_id) REFERENCES Utilisateurs(id) ON DELETE CASCADE,
    FOREIGN KEY (offre_id) REFERENCES Offres(id) ON DELETE CASCADE
);

-- Table des évaluations des entreprises
CREATE TABLE Evaluations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entreprise_id INT NOT NULL,
    etudiant_id INT NOT NULL,
    note INT NOT NULL,
    commentaire TEXT,
    FOREIGN KEY (entreprise_id) REFERENCES Entreprises(id) ON DELETE CASCADE,
    FOREIGN KEY (etudiant_id) REFERENCES Utilisateurs(id) ON DELETE CASCADE,
    CONSTRAINT chk_note CHECK (note BETWEEN 1 AND 5)
);

-- Table des wish-lists
CREATE TABLE WishList (
    id INT AUTO_INCREMENT PRIMARY KEY,
    etudiant_id INT NOT NULL,
    offre_id INT NOT NULL,
    FOREIGN KEY (etudiant_id) REFERENCES Utilisateurs(id) ON DELETE CASCADE,
    FOREIGN KEY (offre_id) REFERENCES Offres(id) ON DELETE CASCADE
);