<?php
ini_set('display_errors',1);
error_reporting(E_ALL);

//Data, connection, auth
//http://data.brreg.no/enhetsregisteret/enhet.{format}?page={side}&size={antall per page} & $ filter = {filter}
$format = $_REQUEST['format'];
$page = $_REQUEST['side'];
$size = $_REQUEST['antall_per_page'];
$filterSet = $_REQUEST['filter'];

$filterData = explode(':', $filterSet);
$filterParam = $filterData[0];
$filterValue = $filterData[1];

## echo "<pre/>";print_r($_REQUEST);die;

if($filterParam == "name"):
	$filterParam = "navn";
endif;

$filterset = "startswith($filterParam,'".$filterValue."')";
$endpointUrl = 'http://data.brreg.no/enhetsregisteret/enhet.'.$format.'?page='.$page.'&size='.$size.'&$filter='.$filterset;

echo "<pre/>";print_r($endpointUrl);

/*$curl_options = array(
                    CURLOPT_URL => $endpointUrl,
                    CURLOPT_HEADER => 0,
                    CURLOPT_RETURNTRANSFER => TRUE,
                    CURLOPT_TIMEOUT => 1000,
                    CURLOPT_SSL_VERIFYPEER => true,
                    CURLOPT_FOLLOWLOCATION => TRUE,
                    CURLOPT_ENCODING => 'gzip,deflate',
            );

            $ch = curl_init();
            curl_setopt_array( $ch, $curl_options );
            $output = curl_exec( $ch );
            curl_close($ch);

$arr = json_decode($output,true);*/

$ch = curl_init($endpointUrl);
curl_setopt($ch, CURLOPT_TIMEOUT, 5);
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_ENCODING, 'gzip,deflate');
$data = curl_exec($ch);
curl_close($ch);
echo "<pre/>";print_r(json_decode($data));die;
?>
