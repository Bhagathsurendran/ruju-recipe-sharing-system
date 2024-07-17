<%@page import="model.Model_class"%>
<%@page import="service.Service_class"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
            height: 830px;width: 400px;background-color: rgb(0, 0, 0);margin: auto;margin-top: 90px;border-radius: 20px;
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
	Service_class rs=new Service_class();
	Model_class rm=new Model_class();
	rm=rs.searchRecipe(id);
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
                   <p>Foodname</p>
                  <br>
                  <input class="login-holder-input-1" type="text" name="foodname" id="foodname" value="<%=rm.getFoodname() %>">
                  <br>
                  <br>
                  <p>Calorie</p>
                  <br>
                  <input class="login-holder-input-1" type="text" name="calorie" id="calorie" value="<%=rm.getCalorie() %>">
                  <br>
                  <br>
                  <p>Recipe</p>
                  <br>
                  <input class="login-holder-input-1" type="text" name="recipe" id="recipe" value="<%=rm.getRecipe() %>">
                  <br>
                  <br>
                  <p>Category</p>
                  <br>
                  <input class="login-holder-input-1" type="text" name="category" id="category" value="<%=rm.getCategory() %>">
                  <br>
                  <br>
                  <p>Image Link</p>
                  <br>
                  <input class="login-holder-input-1" type="text" name="imglink" id="imglink" value="<%=rm.getImgLink() %>">
                  <br>
                  <br>
                  <p>Recipe Description</p>
                  <br>
                  <input class="login-holder-input-1" type="text" name="recipeDes" id="recipeDes" value="<%=rm.getRecipeDes() %>">
                  <br>
                  <br>
                  
                  
                  <div class="login-holder-button-holder">
                      <input class="login-holder-button" type="submit" name="operation" id="delete-recipe" value="delete-recipe">
                      <input class="login-holder-button" type="submit" name="operation" id="update-recipe" value="update-recipe">
                  </div>
               </form>
            </div>
       </div>
    </div>


</body>
</html>