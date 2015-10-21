<?php
$basePath = explode('=', $argv[1]);
$pathData = parse_url($basePath[1]);
$ip = $pathData['host'];
$uri = ltrim($pathData['path'],'/');
$uri = substr($uri, 0, strrpos( $uri, '/'));
if($pathData['scheme'] == 'smb')
	$finalPath = "/run/user/1000/gvfs/smb-share:server=$ip,share=$uri";
else
	$finalPath = "/run/user/1000/gvfs/ftp:host=$ip/$uri";

echo $finalPath;exit;
?>
