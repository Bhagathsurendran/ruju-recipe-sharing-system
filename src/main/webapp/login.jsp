<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/login.css">

	<style type="text/css">
			body{
				overflow-y:hidden;
			}
    	  .img-holder p{
            font-size: 100px;position: absolute; color: white;font-weight: 500;padding-left: 3rem;padding-top: 1rem;
        }
   </style>
   
</head>

<body>
	   <section>
        <div class="poppins-medium section_1holder">
            <p style="font-size: 45px;">Welcome back!</p>
            <p style="font-size: 20px;">Enter your Credentials to access your account</p>
		<form action="servlet" method="post">
            <p class="input-text" style="margin-top: 50px;">Username</p>
            <input class="input" type="text" name="username" id="username" placeholder="Enter your Username">
 
            <p class="input-text" style="margin-top: 20px;">Password</p>
            <input class="input" type="password" name="password" id="password" placeholder="Enter your Password">


            <button class="poppins-medium" type="submit" value="login" id="login" name="operation">Login</button>

            <p>Don’t have an account? <a href="signup.jsp">Sign Up</a></p>
		</form> 
        </div>
        <div class="img-holder" style="">
         	<p>रूजी</p>
            <img src="img/login_img.jpg" style="height: 740px;" alt="">
        </div>
    </section>
</body>
</html>