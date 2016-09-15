<?php
echo "<H1>Sistemas Distribuidos</H1>";

$serverIP = $_SERVER["SERVER_ADDR"];
echo "Server IP: <b>{$serverIP}</b> <br/><br />";
echo "Estudiante : Andres Felipe Ortiz <br />";
echo "Codigo: 10207000 <br />";

$user = 'pi';
$passwd = 'security++';
$dbname = 'swn';
$port = '5432';
$host = '192.168.56.104';

$database = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$passwd");
if (!$database) {
  echo "Connection error\n";
  exit;
}

$sql = "SELECT * FROM devices";
if ($serverIP == '192.168.56.103') {
  $sql = "SELECT * FROM devices WHERE device_name LIKE 'Samsung%'";
}

$result = pg_query($database, $sql);
if (!$result) {
  echo pg_last_error($database);
  exit;
}

echo "<br />DEVICES<br />\n";
while ($row = pg_fetch_row($result)) {
  echo "# $row[0]\t\t$row[1]";
  echo "<br />\n";
}

echo "<br />Query success!";
pg_close($database);
?>