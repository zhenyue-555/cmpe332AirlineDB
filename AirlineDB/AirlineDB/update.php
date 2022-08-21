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
<?php
require_once'dbconfig.php';
$sql = 'select flightCode, departureScheduledTime, departureActualTime from Flight';
$q = $conn->prepare($sql);
$q->execute();
?>
<table border='1'>
<tr>
<th>FlightCode</th>
<th>departureScheduledTime</th>
<th>departureActualTime</th>
</tr>
<?php while($row = $q->fetch()): ?>
<tr>
<td><?php echo $row['flightCode'];?></td>
<td><?php echo $row['departureScheduledTime'];?></td>
<td><?php echo $row['departureActualTime'];?></td>
</tr>
<?php endwhile; ?>
</table>
<?php
$sql = 'select flightCode from Flight';
$q = $conn->prepare($sql);
$q->execute();
$allFlights = $q->fetchAll();

?>
<form method = "post" action= "update1.php">
<h3>Please select the updated flight.</h3>
<select name="selectedFlight">
<option value="" selected>Please select a flight:</option>
<?php foreach($allFlights as $flight): ?>

<option value= "<?php echo $flight['flightCode']; ?>"><?php echo $flight['flightCode']; ?></option>
<?php endforeach; ?>
</select>
<h3>Update the departing time</h3>
<input type="date" name="datetime"/>
<input type="submit" value="Update"/>
</form>
</body>
</html>