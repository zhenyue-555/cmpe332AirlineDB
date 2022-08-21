<?php
require_once 'dbconfig.php';
$flightCode = $_POST['selectedFlight'];
$actualDepartureTime = $_POST['datetime'];
try{
$sql = 'update Flight set departureActualTime= ? where flightCode= ?';
$q = $conn->prepare($sql);
$q->execute([$actualDepartureTime, $flightCode]);
echo '<script language="javascript">alert("Actual departing time update successfully!");window.location.href="update.php";</script>';
}catch(PDOEXception $e){

echo '<script language="javascript">alert("Actual departing time update fail!");window.location.href="update.php";</script>';
}

?>