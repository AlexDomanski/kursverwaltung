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
    <title>Startseite</title>
</head>
<body>
    <h2>Navigation</h2>
    <nav>
        <ul>
            <li><a href="index.php">Startseite</a></li>
            <li><a href="kurse_fachb.php">Kurse nach Fachbereich</a></li>
            <li><a href="kurse_kursort.php">Kurse nach Kursort</a></li>
        </ul>
    </nav>
    <h1>Kursübersicht</h1>
    <table>
        <tr>
            <th>Kursnummer</th>
            <th>Name</th>
            <th>Beginndatum</th>
            <th>Kursort</th>
        </tr>  
    <?php
        $sql = "
            SELECT
                kurs.kursnummer,
                kurs.name AS Kursname,
                kurs.beginndatum,
                kursort.name AS Kursortname
            FROM kurs
            JOIN kursort ON kurs.kursort_id = kursort.id
            ORDER BY kurs.beginndatum 
        ";
        $kurse = dbQuery($conn, $sql);
        while ($kurs = $kurse->fetch_object())
        {
            echo('<tr>');
            echo('<td>'. $kurs->kursnummer .'</td>
                    <td><a href="kurs_detail.php?idKurs='. $kurs->kursnummer .'">'. $kurs->Kursname .'</a></td>
                    <td>'. $kurs->beginndatum .'</td>
                    <td>'. $kurs->Kursortname .'</td>'
            );

            echo('</tr>');
        }
    ?>
    </table>
</body>
</html>
