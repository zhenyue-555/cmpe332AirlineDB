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
<a href="update.php">Update</a>
</div>
<form class="search" action="search.php" method="post">
<input type="text" name="airline"/>
<input type="date" name="datetime"/>
<input type="submit" value="search"/>
</form>
<?php
require_once'dbconfig.php';
if(isset($_POST['airline'])&&isset($_POST['datetime'])){
$airline=$_POST['airline'];
$datetime=$_POST['datetime'];
$sql='select flightCode, (select city from Airport WHERE Airport.code = Flight.arrivalAirport) as arrivalAirport, (SELECT city from Airport WHERE Airport.code = Flight.departureAirport) as departureAirport from Flight where flightCode =? and DATE(departureScheduledTime) =?' ;
$q = $conn->prepare($sql);
$q->execute([$airline,$datetime]);
//$q->setFetchMode(PDO::FETCH_ASSOC);
?>
<table border='1'>
<tr>
<th>FlightCode</th>
<th>DepartingCity</th>
<th>ArrivingCity</th>
</tr>
<?php while($row = $q->fetch()): ?>
<tr>
<td><?php echo $row['flightCode'];?></td>
<td><?php echo $row['departureAirport'];?></td>
<td><?php echo $row['arrivalAirport'];?></td>
</tr>
<?php endwhile; ?>
</table>
<?php
}else{
echo "Please enter airlineCode and choose a date.";
}
?>
</body>
</html>