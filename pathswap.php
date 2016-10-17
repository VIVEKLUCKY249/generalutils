<!DOCTYPE HTML>
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
<script type="text/javascript">
function copyToClipboard(text) {
	window.prompt("Copy to clipboard: Ctrl+C, Enter", text);
}
</script>
</head>
<body>

<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (empty($_POST["basePath"])) {
	 $nameErr = "Basepath cannot be empty";
	}

	$basePath = $_POST['basePath'];
	$pathData = parse_url($basePath);

	$ip = $pathData['host'];
	## echo "<pre/>";print_r($pathData);die;
	$uri = ltrim ($pathData['path'],'/');

	if($pathData['scheme'] == "smb")
		$finalPath = "/run/user/1000/gvfs/smb-share:server=$ip,share=$uri";
	elseif($pathData['scheme'] == "ftp")
		$finalPath = "/run/user/1000/gvfs/ftp:host=$ip/$uri";
}
?>

<h2>Convert path from SMB/FTP to RUN GVFS Linux</h2>
<p><span class="error">* required field.</span></p>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
   Base Path: <input type="text" name="basePath" value="<?php echo $basePath;?>">
   <span class="error">* <?php echo $nameErr;?></span>
   <br><br>
   <input type="submit" name="submit" value="Convert">
</form>
<!-- 9Ix1tuY55K-p -->
<?php
if($finalPath):
	echo "<h2>Converted Run GVFS path:</h2>";
	$magePath = strstr($finalPath, 'app/');
	echo "<script type='text/javascript'>copyToClipboard('".$finalPath."');</script>";

	if($magePath != '')
		echo "<script type='text/javascript'>copyToClipboard('".$magePath."');</script>";
endif;
?>
</body>
</html>
<?php exit; ?>
