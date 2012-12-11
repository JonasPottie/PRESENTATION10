<?php
$uploads_dir = 'http://student.howest.be/jonas.pottie/20122013/CPIII/phpxml/';

if( $_FILES['Filedata']['error'] == 0 ){
	if( move_uploaded_file( $_FILES['Filedata']['tmp_name'], $uploads_dir.$_FILES['Filedata']['name'] ) ){
		echo 'ok';
		exit();
	}
}

$uploads_dir = './assets/xml';

if( $_FILES['Filedata']['error'] == 0 ){
	if( move_uploaded_file( $_FILES['Filedata']['tmp_name'], $uploads_dir.$_FILES['Filedata']['name'] ) ){
		echo 'ok';
		exit();
	}
}


echo 'error';
exit();
?>