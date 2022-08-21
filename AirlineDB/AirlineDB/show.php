<!DOCTYPE html>
<html>
<head>
<title>Airline</title>
<style>
div.menu{
background-color: grey;
overflow:auto;
white=space:nowrap;
}
div.menu a{
display:inline-block;
color:white;
text-align:center;
padding:14px;
text-decoration:none;
}
div.menu a:hover{
background-color:pink;}
</style>
</head>
<body>
<div class ="menu">
<a href="index.html">Home</a>
<a href="search.php">Search</a>
<a href="addAirline.php">AddAirline</a>
<a href="show.php">View</a>
</div>

<?php
echo "<table style='border: solid 1px black;'>";
echo "<tr><th>flightCode</th><th>ScheduledArriveTime</th><th>ActualArriveTime</th></tr>";

$servername = "localhost";
$username = "root";
$password = "";

class TableRows extends RecursiveIteratorIterator {
  function __construct($it) {
    parent::__construct($it, self::LEAVES_ONLY);
  }

  function current() {
    return "<td style='width:150px;border:1px solid black;'>" . parent::current(). "</td>";
  }

  function beginChildren() {
    echo "<tr>";
  }

  function endChildren() {
    echo "</tr>" . "\n";
  }
}
try {
  $conn = new PDO("mysql:host=$servername;dbname=airlinedb", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  //echo "Connected successfully";
  $stmt = $conn->prepare("SELECT flightNumber, ScheduledArriveTime, ActualArriveTime FROM flight where ScheduledArriveTime=ActualArriveTime");
  $stmt->execute();

  // set the resulting array to associative
  $result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
  foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
    echo $v;
  }
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}
?>

</body>
</html>