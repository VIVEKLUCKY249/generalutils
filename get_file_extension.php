<?php
# Get any file extension start
$fileExt = pathinfo($filename, PATHINFO_EXTENSION);

$path_info = pathinfo('/foo/bar/baz.bill');
echo $path_info['extension'];

$file = new SplFileInfo($path);
$ext  = $file->getExtension();

$ext  = (new SplFileInfo($path))->getExtension();

$finfo = new FileInfo(null, '/path/to/magic/file');
# Get any file extension end
