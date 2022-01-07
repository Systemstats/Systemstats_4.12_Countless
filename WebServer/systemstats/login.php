<?php session_start(); 
/* Startar sessionen, detta resulterar i en sessions cookie */
	
	/* Kolla om login form är ifyllt och skickat, "submited" */	
	if(isset($_POST['Submit'])){
		/* Definera användarnamn och lösenord i denna array */
		$logins = array('system' => 'stats','test_user' => '123');
		
		/* Check and assign submitted Username and Password to new variable */
		$Username = isset($_POST['Username']) ? $_POST['Username'] : '';
		$Password = isset($_POST['Password']) ? $_POST['Password'] : '';
		
		/* Check Username and Password existence in defined array */		
		if (isset($logins[$Username]) && $logins[$Username] == $Password){
			
			# Hämta logger.php
			require("logger.php");
			# Hämta IP address
			$userIp = $_SERVER['REMOTE_ADDR'];
			#Logga
			Logging($userIp . " har loggat in med användarnamn: " . $Username); 
			
			/* Success: Set session variables and redirect to Protected page  */
			$_SESSION['UserData']['Username']=$logins[$Username];
			header("location:systemstats.php");
			exit;
		} else {
			# Hämta logger.php
			require("logger.php");
			# Hämta IP address
			$userIp = $_SERVER['REMOTE_ADDR'];
			#Logga
			Logging($userIp . " försökte logga in med användarnamn: " . $Username . " och lösenord: " . $Password);
			/* Felmedelande vid fel autentiseringsuppgifter  */
			$msg="<span style='color:red'><h3>Fel autentiseringsuppgifter</h3></span>";
		}
	}
?>

<?php
//Global header, skrivs till HTML-koden med licens och copyright information
include('license_header.php');
?>

<?php
require_once('systemstats_config.php');
?>

<!DOCTYPE html>
<html>
<head>

<title> 
	Login 
</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="refresh" content="120">
<link rel="icon" type="image/ico" href="./assets/systemstats/<?php echo $systemstats_favicon ?>">
<link href="./assets/css/app.css" rel="stylesheet" type="text/css" />
<link href="./vendor/bootstrap/3.3.7/css/bootstrap.min.css?v=3.3.7" rel="stylesheet" type="text/css" />

<?php // include('assets/cookies-notice.html'); ?>

</head>
<?php include('assets/noscript.html'); ?>
<body> 
<?php
$date = date('m');
if($date >= 03 && $date <= 06 ) {
	$month = "Spring/"; 
	$bg = array('bg-01.jpg', 'bg-02.jpg', 'bg-03.jpg', 'bg-04.jpg', 'bg-05.jpg', 'bg-06.jpg', 'bg-07.jpg', 'bg-08.jpg'); // array of filename
}

else if($date >= 07 && $date <= 10  ) {
	$month = "Summer/"; 
	$bg = array('bg-01.jpg', 'bg-02.jpg', 'bg-03.jpg', 'bg-04.jpg', 'bg-05.jpg', 'bg-06.jpg', 'bg-07.jpg', 'bg-08.jpg', 'bg-09.png'); // array of filename
}

else {
	$month = "Winter/"; 
	$bg = array('bg-01.jpg', 'bg-02.jpg', 'bg-03.jpg', 'bg-04.jpg', 'bg-05.jpg'); // array of filename
}

$i = rand(0, count($bg)-1); // generate random number size of the array
$selectedBg = "$bg[$i]"; // set variable equal to which random filename was chosen 
?>

<!--CSS SOM INTE GÅR ATT LÄGGA I EXTERN CSS-FIL -->
<style> 
body{
background: url('assets/LoginBG/<?php echo $month; echo $selectedBg; ?>') no-repeat;
	background-repeat: no-repeat;
  background-attachment: fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
   color:#000;
  text-align:center;
  margin: 0 0 10px; /* bottom = footer height */ 
}
</style>
<!--CSS SOM INTE GÅR ATT LÄGGA I EXTERN CSS-FIL -->

<center>
<div class="logincontainer">
<div class="loginInput">
</br>
<div class="logo">
<img src="assets/systemstats/systemstats_W.png" width="300" hight="225px">
</div>
<!-- LOGIN FORM --> 
<div class="LoginFrame1">
<form class="form-signin" action="./login.php" method="post" style="align: center;">
	</br>
        <label for="inputEmail" class="sr-only">Anv ID/AD Konto</label>
        <input name="Username" type="text" id="inputEmail" class="form-control" placeholder="Användarnamn" autofocus>
        <label for="inputPassword" class="sr-only">Lösenord</label>
        <input name="Password" type="password" id="inputPassword" class="form-control" placeholder="Lösenord" required>
        <input align="center" name="Submit" type="submit" value="Logga in" class="btn btn-success">
      </form>

      <?php if(isset($msg)){?>

        <?php } ?>

</div> 
	  </div> 
<!-- // LOGIN FORM --> 
</center>

<script>
function CookieInfo() {
window.open("webhelp.php?htmlhelp=docs/cookies.html", "_blank", "toolbar=no,scrollbars=no,resizable=no,top=500,left=500,width=750,height=385"); 
}
function VerInfo() {
window.open("webhelp.php?htmlhelp=docs/ver.htm", "_blank", "toolbar=no,scrollbars=no,resizable=no,top=500,left=500,width=750,height=485"); 
}
</script>

<div class="footerLogin">
	<p style="padding-top:70px;"> <b style="float:left;padding-left:14px"><?php echo $org ?> </b> <b style="text-align:right;"><b>  </b><b style="float:right;padding-left:14px;padding-right:10px; align:left;"> <b> | <a href="#" onclick="javascript:CookieInfo();" > Cookies </a> | </b> <a  href="#" onclick="javascript:VerInfo();" >Version <?php echo $version ?>  </a> | <a href="docs/README.txt"> &copy; 2016-2020 </a> </b> </p>	
	  </div>

</div> <!-- end container -->

<script src="./scripts/jquery-3.2.1.min.js"></script>
<script src="./vendor/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
