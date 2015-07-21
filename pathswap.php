 <!DOCTYPE HTML>
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>

<?php
// define variables and set to empty values
$nameErr = $emailErr = $genderErr = $websiteErr = "";
$name = $email = $gender = $comment = $website = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (empty($_POST["smb_path"])) {
	 $nameErr = "SMB path cannot be empty";
	}
	$path = $_POST['smb_path'];
	$pathData = parse_url($path);
	$ip = $pathData['host'];
	$uri = ltrim ($pathData['path'],'/');
	$rungvfspath = "/run/user/1000/gvfs/smb-share:server=$ip,share=$uri";
}
?>

<h2>Convert path from SMB to RUN GVFS Linux</h2>
<p><span class="error">* required field.</span></p>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
   SMB Path: <input type="text" name="smb_path" value="<?php echo $smb_path;?>">
   <span class="error">* <?php echo $nameErr;?></span>
   <br><br>
   <input type="submit" name="submit" value="Submit">
</form>

<?php
echo "<h2>Converted Run GVFS path:</h2>";
echo $rungvfspath;
exit;
?>

</body>
</html>
