<?php
class OfferManager
{
    private PDO $dbh;
    public function __construct()
    {
        try {
            $this->dbh = new PDO("mysql:host=localhost;dbname=nom_de_la_base;charset=utf8", "root", password: "");
        } catch (PDOException $e) {
            die("Erreur de connexion : " . $e->getMessage());
        }
    }
    public function create_offer(string $title, string $description, string $skills, string $start_date, string $end_date, int $base_remuneration): bool
    {
        try {
            $stmt = $this->dbh->prepare("
                INSERT INTO offer (offer_title, offer_description, offer_skills, offer_start_date, offer_end_date, offer_base_remuneration) 
                VALUES (:title, :description, :skills, :start_date, :end_date, :base_remuneration)
            ");

            return $stmt->execute([
                'title' => $title,
                'description' => $description,
                'skills' => $skills,
                'start_date' => $start_date,
                'end_date' => $end_date,
                'base_remuneration' => $base_remuneration
            ]);
        } catch (PDOException $e) {
            error_log("Erreur SQL : " . $e->getMessage());
            return false;
        }
    }

    public function read_offer(int $id): array|false
    {
        try {
            $stmt = $this->dbh->prepare('SELECT * FROM offer WHERE offer_id = :id');

            $stmt->execute(['id' => $id]);
            return $stmt->fetch(PDO::FETCH_OBJ);

        } catch (PDOException $e) {
            error_log("Erreur SQL : " . $e->getMessage());
            return false;
        }
    }

    public function update_offer(int $id, string $title, string $description, string $skills, string $start_date, string $end_date, int $base_remuneration): bool
    {
        try {
            $stmt = $this->dbh->prepare('UPDATE offer 
            SET offer_title = :title,
            offer_description = :description,
            offer_skills = :skills,
            offer_start_date = :start_date,
            offer_end_date = :end_date,
            offer_base_remuneration = :base_remuneration
            WHERE offer_id = :id');

            return $stmt->execute([
                'id' => $id,
                'title' => $title,
                'description' => $description,
                'skills' => $skills,
                'start_date' => $start_date,
                'end_date' => $end_date,
                'base_remuneration' => $base_remuneration
            ]);

        } catch (PDOException $e) {
            error_log("Erreur SQL : " . $e->getMessage());
            return false;
        }
    }

    public function delete_offer(int $id): bool
    {
        try {
            $stmt = $this->dbh->prepare('DELETE FROM offer WHERE offer_id=:id');

            return $stmt->execute(['id' => $id]);

        } catch (PDOException $e) {
            error_log("Erreur SQL : " . $e->getMessage());
            return false;
        }
    }
}