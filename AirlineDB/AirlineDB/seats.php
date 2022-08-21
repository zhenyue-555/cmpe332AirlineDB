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
<a href="seats.php">Seats</a>
</div>

<form class="search" action="seats.php" method="post">
<input type="date" name="datetime"/>
<input type="submit" value="search"/>
</form>
<?php
require_once'dbconfig.php';
if(isset($_POST['datetime'])){
$avg = 0;
$sum = 0;
$datetime=$_POST['datetime'];
$sql='select flightCode, Type, maxSeats from Flight inner join Airplane inner join AirplaneType where Flight.airplane = Airplane.id and Airplane.Type = AirplaneType.name and DATE(Flight.departureScheduledTime) = ?';
$q = $conn->prepare($sql);
$q->execute([$datetime]);
?>
<table border='1'>
<tr>
<th>FlightCode</th>
<th>Flight Type</th>
<th>MaxSeats</th>
</tr>
<?php while($row = $q->fetch()): ?>
<?php $sum = $sum + $row['maxSeats']; $avg = $avg + 1; ?>
<tr>
<td><?php echo $row['flightCode'];?></td>
<td><?php echo $row['Type'];?></td>
<td><?php echo $row['maxSeats'];?></td>
</tr>
<?php endwhile; ?>
<tr>
<td>Average Seats:</td>
<td colspan="2"> <?php if($avg) {echo $sum/$avg;}else{ echo '0';} ?></td>
</tr>
</table>
<?php
}else{
echo "Please choose a date to check the available seats.";
}
?>
</body>
</html>
