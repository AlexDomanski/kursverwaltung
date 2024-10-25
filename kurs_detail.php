<?php
require("includes/config.inc.php");
require("includes/common.inc.php");
require("includes/db.inc.php");

$conn = dbConnect();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/common.css">
    <title>Kursdetails</title>
</head>
<body>
    <?php
        if(count($_GET)>0 && isset($_GET["idKurs"]) && intval($_GET["idKurs"])>0) {
			$idKat = intval($_GET["idKurs"]);

            $sql = "
                SELECT
                    kurs.kursnummer,
                    kurs.name AS Kursname,
                    kurs.beginndatum,
                    kurs.kursnummer,
                    fachbereich.name AS Fachbereich
                FROM kurs
                JOIN fachbereich ON kurs.fachbereich_id = fachbereich.id
                WHERE kurs.kursnummer = " . $idKat . " 
            ";
            $query = dbQuery($conn, $sql);
            while($kurs = $query->fetch_object()){
                echo('<h2>Kurs: ' .$kurs->kursnummer . ' ' .$kurs->Kursname. '</h2>');
            }

            
        }
    ?>
    <h1></h1>
    


    <a href="index.php">Zurück zur Startseite</a>
</body>
</html>