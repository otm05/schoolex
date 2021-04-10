<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/all.css">
    
    <title>oussama berhayla</title>
</head>
<body>

<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form method="POST">
			<h1>Create Account</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="fab fa-2x fa-facebook"></i></a>
				<a href="#" class="social"><i class="fab fa-2x fa-google"></i></a>
				
			</div>
			<span>or use your email for registration</span>
			<input type="text" placeholder="Name" name="Nom" required  />
			<input type="email" placeholder="Email" name="Email" required />
			<input type="password" placeholder="Password" name="Psw" required/>
			<button type="submit" name="sup">Sign Up</button>
			
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form method="POST" >
			<h1>Sign in</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="fab fa-2x fa-facebook"></i></a>
				<a href="#" class="social"><i class="fab fa-2x fa-google"></i></a>
			
			</div>
			<span>or use your account</span>
			<input type="email" placeholder="Email" name="email"  required />
			<input type="password" placeholder="Password" name="psw" required />
			<a href="#">Forgot your password?</a>
			<button type="submit" name="sin">Sign In</button> 
	
        
		</form>        
	</div>
<?php

	include("cnx.php");
	//SignUp code
	if(isset($_POST["sup"]))
	{
			$C=0;
			$nom=$_POST["Nom"];$email=$_POST["Email"];$psw=$_POST["Psw"];$date=date('d-m-y');
			ExecuteNonQuery($cnx,"insert into Utilisateur values('$nom','$email','$psw','','active','','','Utilisateur','$date')");
			$dr=ExecuteReader($cnx,"select * from Utilisateur where Login='$user'");
			while($cnt=$dr->fetch()) { $c++; } $dr->closeCursor();
			if($c>1)
			{
			echo("<script>alert('Enter an other Email');</script>");
			}
			else{echo("<script>alert('Bienvenue M.$nom');</script>");}
	}

	//Login code
	session_start();
	$bl=false;
	if(isset($_POST["sin"]))
	{
		$user=$_POST['email'];$psw=$_POST['psw'];
		$dr=ExecuteReader($cnx,"select * from Utilisateur where Login='$user'");
		while($inf=$dr->fetch())
		{
			if($inf['Login']==$user && $inf['Psw']==$psw && $inf['Statut']="active")
			{
				if($inf['Rolee']=="Utilisateur")
				{
					
					$bl==true;
					header("Location: https://www.php.net");
				}
				if($inf['Rolee']=="Admin")
				{
					$_SESSION['Login']=$user;$_SESSION['Psw']=$psw;$_SESSION['Nom']=$inf['Nom'];$_SESSION['Rolee']=$inf['Rolee'];
					$bl==true;
					header("Location: index2.php");
				}
			}
		}
		$dr->closeCursor();
			if($bl==false)
			{
				echo("<script>alert('Enter a valid information');</script>");
			}
	}
?>

	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>To keep connected with us please login with your personal info</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Hello, Friend!</h1>
				<p>Enter your personal details and start journey with us</p>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
		</div>
	</div>
</div>


<script src="script.js"></script>


</body>
</html>