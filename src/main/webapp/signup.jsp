<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="css/login.css">
   
   <style type="text/css">
   	  .img-holder p{
            font-size: 100px;position: absolute; color: white;font-weight: 500;padding-left: 3rem;padding-top: 1rem;
        }
   </style>
   
</head>
<body>
	<section>
        <div class="poppins-medium section_1holder">
            <p style="font-size: 45px;">Get Started Now</p>
            
        <form action="servlet" method="post">
            <p class="input-text" style="margin-top: 20px;">Email</p>
            <input class="input" type="text" name="email" id="email" placeholder="Enter your Email">

            <p class="input-text" style="margin-top: 20px;">Fullname</p>
            <input class="input" type="text" name="fullname" id="fullname" placeholder="Enter your Fullname">


            <p class="input-text" style="margin-top: 20px;">Username</p>
            <input class="input" type="text" name="username" id="username" placeholder="Enter your Username">
 
            <p class="input-text" style="margin-top: 20px;">Password</p>
            <input class="input" type="password" name="password" id="password" placeholder="Enter your Password">
            
             <p class="input-text" style="margin-top: 20px;">UserLogo</p>
            <input class="input" type="password" name="userlogo" id="userlogo" placeholder="Paste you Logo Link">


            <button class="poppins-medium" type="submit" value="signUp" id="signUp" name="operation">Signup</button>

            <p>Have an account? <a href="login.jsp">LogIn</a></p>
        </form>
        </div>
        <div class="img-holder">
            <p>रूजी</p>
            <img src="img/signinimg.jpg" style="height: 750px;" alt="">
        </div>
    </section>
</body>
</html>