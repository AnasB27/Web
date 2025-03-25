<?php

$user = "root";
$password = "password";

$host = "mysql:host=localhost;dbname=test";

try {
    $dbh = new PDO($host, $user, $password);
} catch (PDOException $e) {
    die("Connection impossible" . $e->getMessage());
}

$company_name = $_POST['name'];
$company_description = $_POST['desc'];

$stmt = $dbh->prepare("INSERT INTO companies (company_name,company_description) VALUES (:company_name, :company_description)");

try {
    $stmt->execute([":company_name" => $company_name, ":company_description" => $company_description]);
} catch (PDOException $e) {
    die('Connection impossible' . $e->getMessage());
}
