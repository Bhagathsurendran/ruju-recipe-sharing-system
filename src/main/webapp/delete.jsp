<%@page import="model.Model_class"%>
<%@page import="service.Service_class"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
        *{
            font-family: sans-serif;
        }
        body{
            background-repeat: no-repeat;background-size: cover;background-image: linear-gradient(black, rgb(255, 255, 255));
        }
        p{
        	margin: 0;
        	padding: 0;
        	color: white;
        	margin-left: 50px;
        }
        .login-holder{
            height: 620px;width: 400px;background-color: rgb(0, 0, 0);margin: auto;margin-top: 90px;border-radius: 20px;
        }
        .login-holder-div{
            position: absolute;margin-top: 50px;
        }
        .login-holder-input-1{
            width: 300px;height: 30px;border-radius: 5px;border: none;margin-left: 50px;
        }
        .login-holder-button-holder{
            margin-left: 3rem;
        }
        .login-holder-button{
            width: 150px;height: 35px;color: rgb(54, 54, 54);border-radius: 10px;border: none;font-weight: 500;font-size: 20px;margin-top: 20px;
        }
             
    </style>

</head>
<%
	int id=Integer.parseInt(request.getParameter("id"));
	System.out.print(id);
	Service_class rs=new Service_class();
	Model_class rm=new Model_class();
	rm=rs.searchUser(id);
%>

<body>
	 <div class="login-holder">
        <div class="login-holder-div">


            <div class="login-holder-input">
            
               <form action="servlet" method="post">
                  <input class="login-holder-input-1" type="text" name="id" id="id" value="<%=id%>">
                  <br>
                  <br>
                   <p>Username</p>
                  <br>
                  <input class="login-holder-input-1" type="text" name="username" id="username" value="<%=rm.getUsername() %>">
                  <br>
                  <br>
                  <p>Fullname</p>
                  <br>
                  <input class="login-holder-input-1" type="text" name="fullname" id="fullname" value="<%=rm.getFullname() %>">
                  <br>
                  <br>
                  <p>Email</p>
                  <br>
                  <input class="login-holder-input-1" type="text" name="email" id="email" value="<%=rm.getEmail() %>">
                  <br>
                  <br>
                  <p>Password</p>
                  <br>
                  <input class="login-holder-input-1" type="text" name="password" id="password" value="<%=rm.getPassword() %>">
                  <br>
                  <br>
                  <p>Type</p>
                  <br>
                  <input class="login-holder-input-1" type="text" name="type" id="type" value="<%=rm.getType() %>">
                  <br>
                  <br>
                  
                  
                  <div class="login-holder-button-holder">
                      <input class="login-holder-button" type="submit" name="operation" id="delete" value="delete">
                      <input class="login-holder-button" type="submit" name="operation" id="update" value="update">
                  </div>
               </form>
            </div>
       </div>
    </div>
</body>
</html>