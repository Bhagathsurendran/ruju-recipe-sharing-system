<%@page import="java.util.ArrayList"%>
<%@page import="service.Service_class"%>
<%@page import="java.rmi.server.RMIClassLoader"%>
<%@page import="model.Model_class"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="css/admin.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
	#userInfo{
	    background-color: rgb(44, 44, 44);height: 500px;width: 800px;position: fixed;border-radius: 30px;z-index: 100;transform:translate(-50%,-50%);left:50%;top:55%;
	    display: none;justify-content: space-between;
	}
	.userInfo-text{
	    color: white;font-size: 30px;display: flex;flex-direction: column;gap: 10px;padding-left: 2rem;padding-top: 2rem;
	}
	.userInfo-text button{
	    height: 40px;width: 200px;border-radius: 20px ;border: none;font-size: 25px;font-weight: 500;transition: .1s;
	}
	.userInfo-text button:hover{
	    opacity: .7;
	}
	.userInfo-button{
	    cursor: pointer;background-color: red;color: black;height: 30px;width: 30px;display: flex;justify-content: center;border-radius: 50%;align-items: center;margin: 1rem;transition: .1s;
	}
	.userInfo-button:hover{
	    opacity: .7;
	}
	td {
    	padding: 10px;
  	}
</style>

</head>
<%
	Service_class rs=new Service_class();
	ArrayList<Model_class> userarr=rs.selectUser();
	ArrayList<Model_class> recipearr=rs.selectRecipe();
	ArrayList<Model_class> resipeVideo=rs.resipeVideoView();
	Cookie cookie=null; 
	Cookie[] cookies=null;
	cookies=request.getCookies();
	System.out.println(resipeVideo.get(1));
	
	ArrayList<Model_class> userdetail=null;
	ArrayList<Model_class> recipes=null;
	
	String user=""; 
	
		if(cookies[0].getName().equals("username")){
			user=""+cookies[0].getValue();
			userdetail=rs.userSearch(user);
			recipes=rs.userAllRecipe(user);
		}
		else if(cookies[1].getName().equals("username")){
			user=""+cookies[1].getValue();
			userdetail=rs.userSearch(user);
			recipes=rs.userAllRecipe(user);
		}
		else if(cookies[2].getName().equals("username")) {
			user=""+cookies[2].getValue();
			userdetail=rs.userSearch(user);
			recipes=rs.userAllRecipe(user);
		}
		System.out.println(userdetail);
		System.out.println(recipes);
%>
<body>
	
	<section id="deleteRecipeVideo">

        <div class="poppins-medium deleteRecipeVideo-holder">

            <div class="deleteRecipeVideo-head">
                <h1 style="border: none;">Id</h1>
                <h1>Foodname</h1>
                <h1>Calorie</h1>
                <h1 style="width:130px;">Recipe</h1>
                <h1 style="width:130px;">Image Link</h1>
                <h1 style="width:130px;">Recipe Description</h1>
                <h1 style="width:130px;">Ingredients</h1>
                <h1 style="width:130px;">Needed</h1>
                <h1>Duration</h1>
                <h1 style="width:130px;">VideoLink</h1>
                <h1>options</h1>
            </div>
            <% for(Model_class rm:resipeVideo){  %>
	            <div class="deleteRecipeVideo-detail">
	                <h1 style="border: none;"><%=rm.getId() %></h1>
	                <h1><%=rm.getFoodname() %></h1>
	                <h1><%=rm.getCalorie() %></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;overflow:hidden;width: 130px;" title=""><%=rm.getRecipe() %></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;overflow:hidden;width: 130px;"><%=rm.getImgLink() %></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;overflow:hidden;width: 130px;"><%=rm.getRecipeDes() %></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;overflow:hidden;width: 130px;"><%=rm.getIngredients() %></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;overflow:hidden;width: 130px;"><%=rm.getNeeded() %></h1>
	                <h1><%=rm.getDuration() %></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;overflow:hidden;width: 130px; " title=""><%=rm.getVideoLink() %></h1>
	                <h1><a href="deleteRecipeVideo.jsp?id=<%=rm.getId() %>">Select</a></h1>
	            </div>
            <%	} %>
            
        </div>
        <div  class="poppins-medium userInfo-button" onclick="closeBtn()" style="">
            <p style="font-size: 23px;font-weight: 600;cursor: pointer;">X</p>    
        </div>
    </section>
	
	
	  
    <nav>
        <h1 class="poppins-medium">रूजी | Admin</h1>
    </nav>

    <section id="userInfo">
        <div class="poppins-medium userInfo-text">
            <h1 style="text-decoration: underline;">Personal Information</h1>

            <%for(Model_class am:userdetail){%>
            	<table border="1" style="border: white;border-collapse: collapse ;margin-bottom: 20px;">
                    <tr>
                        <td>Username </td>
                        <td><%=am.getUsername() %></td>
                    </tr>
                    <tr>
                        <td>Email </td>
                        <td><%=am.getEmail() %></td>
                    </tr>
                    <tr>
                        <td>Fullname </td>
                        <td><%=am.getFullname() %></td>
                    </tr>
                 </table>
                 <a href="updateUser.jsp?id=<%=am.getId() %>"><button class="">EDIT</button></a>
        	<% }%>
            

        </div>
        <div  class="poppins-medium userInfo-button" onclick="closeBtn()" style="">
            <p style="font-size: 23px;font-weight: 600;cursor: pointer;">X</p>    
        </div>
    </section>  


    <section id="recipeInfo" >
       <div class="poppins-medium recipeInfoHolder">
            <div class="recipeInfo-head">
                <h1 style="border: none;">Id</h1>
                <h1>Username</h1>
                <h1>Foodname</h1>
                <h1>Calorie</h1>
                <h1 style="width: 161px;">Recipe</h1>
                <h1>Category</h1>
                <h1 style="width: 161px;">Image Link</h1>
                <h1 style="width: 161px;">Recipe Description</h1>
                <h1>Options</h1>
            </div>
		<% for(Model_class rm:recipearr){  %>
	            <div class="recipeInfo-detail" >
	                <h1 style="border: none;"><%=rm.getId()%></h1>
	                <h1><%=rm.getUsername() %></h1>
	                <h1><%=rm.getFoodname()%></h1>
	                <h1><%=rm.getCalorie()%></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;width: 160px;overflow:hidden; " title=""><%=rm.getRecipe()%></h1>
	                <h1><%=rm.getCategory()%></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;width: 160px;overflow:hidden; " title=""><%=rm.getImgLink()%></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;width: 160px;overflow:hidden; " title=""><%=rm.getRecipeDes()%></h1>     
	                <h1><a href="deleteRecipe.jsp?id=<%=rm.getId() %>">Select</a></h1>   
	                       
	            </div>
            <%	} %>
       </div>
        <div  class="poppins-medium userInfo-button" onclick="closeBtn()" style="">
            <p style="font-size: 23px;font-weight: 600;cursor: pointer;">X</p>    
        </div>
    </section>

    <section id="allUserInfo">

        <div class="poppins-medium allUserInfo-holder">

            <div class="allUserInfo-head">
                <h1 style="border: none;">Id</h1>
                <h1>Username</h1>
                <h1>Fullname</h1>
                <h1 style="width:170px;">Email</h1>
                <h1>Password</h1>
                <h1>Type</h1>
                <h1>Options</h1>
            </div>
            <% for(Model_class rm:userarr){  %>
	            <div class="allUserInfo-detail">
	                <h1 style="border: none;"><%=rm.getId() %></h1>
	                <h1><%=rm.getUsername() %></h1>
	                <h1><%=rm.getFullname() %></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;overflow:hidden;width: 170px; " title=""><%=rm.getEmail() %></h1>
	                <h1><%=rm.getPassword() %></h1>
	                <h1><%=rm.getType() %></h1>
	                <h1><a href="delete.jsp?id=<%=rm.getId() %>">Select</a></h1>
	            </div>
            <%	} %>
            
        </div>
        <div  class="poppins-medium userInfo-button" onclick="closeBtn()" style="">
            <p style="font-size: 23px;font-weight: 600;cursor: pointer;">X</p>    
        </div>
    </section>

	<section id="allRecipeVideo">
	
		<div class="poppins-medium allRecipeVideo-holder">
            	<form action="servlet" method="post">
                <input type="text" class="recipe-modal-input" name="foodname" id="foodname" placeholder="Food Name"> 
                <br><br>
                <input type="text" class="recipe-modal-input" name="calorie" id="calorie" placeholder="Calorie">
                <br><br>
                <textarea class="recipe-modal-input" name="recipe" id="recipe" placeholder="Recipe"></textarea>
                <br><br>
               	<input type="text" class="recipe-modal-input" name="imgLink" id="imgLink" placeholder="imgLink">
               	 <br><br>
               	<input type="text" class="recipe-modal-input" name="recipeDescription" id="recipeDescription" placeholder="Recipe Description">
               	<br><br>
               	<input type="text" class="recipe-modal-input" name="ingredients" id="ingredients" placeholder="Ingredients">
               	<br><br>
               	<input type="text" class="recipe-modal-input" name="needed" id="needed" placeholder="Needed">
               	<br><br>
               	<input type="text" class="recipe-modal-input" name="duration" id="duration" placeholder="Duration">
               	<br><br>
               	<input type="text" class="recipe-modal-input" name="videoLink" id="videoLink" placeholder="videoLink">
               	<br>
                <button type="submit" class="recipe-modal-btn" value="addrecipevideoAdmin" id="addrecipevideoAdmin" name="operation" style="margin-bottom:10px;">Submit</button>
             </form>
        </div>
        <div  class="poppins-medium userInfo-button" onclick="closeBtn()" style="">
            <p style="font-size: 23px;font-weight: 600;cursor: pointer;">X</p>    
        </div>
	
	</section>

	

    <section class="poppins-medium section-1">
      <%for(Model_class am:userdetail){%>
       		<p>Welcome To Your Account,<%=am.getFullname() %> 
       		<span onclick="logout()">Log out</span> </p>
       		
    	<% }%>
    
       <div class="card-holder" >
            <div class="card" onclick="modalUser()">
                <div class="card-logo"><i class="fa-solid fa-book fa-2xl" style="color: #000000;"></i></div>

                <div class="card-text">
                    <p style="font-size: 22px;font-weight: 600;">Personal Information  </p>
                    <p style="font-size: 13px;">Edit your account information and address</p>
                </div>
            </div>

            <div class="card" onclick="modalRecipe()">
                <div class="card-logo"><i class="fa-solid fa-bowl-food fa-2xl" style="color: #000000;"></i></div>

                <div class="card-text">
                    <p style="font-size: 22px;font-weight: 600;">Recipe Information  </p>
                    <p style="font-size: 13px;">Edit your recipe information</p>
                </div>
            </div>
       
            <div class="card" onclick="modalAllUser()">
                <div class="card-logo"><i class="fa-solid fa-lock fa-2xl" style="color: #000000;"></i></div>

                <div class="card-text">
                    <p style="font-size: 22px;font-weight: 600;">User Information </p>
                    <p style="font-size: 13px;">Edit users account information and address</p>
                </div>
             </div>

             
             <div class="card" onclick="modalAddvideo()" style="margin-top: 3rem;">
                <div class="card-logo"><i class="fa-solid fa-video fa-2xl" style="color: #000000;"></i></div>        

                <div class="card-text">
                    <p style="font-size: 22px;font-weight: 600;">Recipe Video  </p>
                    <p style="font-size: 13px;">insert recipe informations</p>
                </div>
             </div>
             
             <div class="card" onclick="modalDeletevideo()" style="margin-top: 3rem;">
                <div class="card-logo"><i class="fa-solid fa-trash fa-2xl" style="color: #000000;"></i></div>        

                <div class="card-text">
                    <p style="font-size: 22px;font-weight: 600;">Delete Video  </p>
                    <p style="font-size: 13px;">Delete and update recipe informations</p>
                </div>
             </div>
        </div>
    </section>

    
    
<script>
    let userinfo=document.getElementById('userInfo')
    let recipeinfo=document.getElementById('recipeInfo')
    let alluserinfo=document.getElementById('allUserInfo')
    let allrecipevideo=document.getElementById('allRecipeVideo')
    let deletercipevideo=document.getElementById('deleteRecipeVideo')
   
	function modalDeletevideo() {
    	deletercipevideo.style.display = 'flex'
    	userinfo.style.display = 'none'
        recipeinfo.style.display = 'none'
        alluserinfo.style.display = 'none'
        allrecipevideo.style.display = 'none'
	}

    function modalUser(){
        userinfo.style.display = 'flex'
        recipeinfo.style.display = 'none'
        alluserinfo.style.display = 'none'
        allrecipevideo.style.display = 'none'
        	deletercipevideo.style.display = 'none'
    }
    function modalRecipe(){
        recipeinfo.style.display = 'flex'
        userinfo.style.display = 'none'
        alluserinfo.style.display = 'none'
        allrecipevideo.style.display = 'none'
        	deletercipevideo.style.display = 'none'
    } 
    function modalAllUser(){
        alluserinfo.style.display = 'flex'
        recipeinfo.style.display = 'none'
        userinfo.style.display = 'none'
        allrecipevideo.style.display = 'none'
        	deletercipevideo.style.display = 'none'
        		
    }
    function modalAddvideo(){
    		allrecipevideo.style.display = 'flex'
    		alluserinfo.style.display = 'none'
            recipeinfo.style.display = 'none'
            userinfo.style.display = 'none'
            	deletercipevideo.style.display = 'none'
    }

    function closeBtn(){
        userinfo.style.display = 'none'
        recipeinfo.style.display = 'none'
        alluserinfo.style.display = 'none'
        allrecipevideo.style.display = 'none'
        	deletercipevideo.style.display = 'none'

    }
    function logout() {
    	setCookie("username","");
    	setCookie("password","");
    	window.location.href="/main_project/login.jsp"
	}
    function setCookie(cname, cvalue) {
    	  document.cookie = cname + "=" + cvalue + ";" + "path=/main_project;" 
    }

    
</script>
    	
</body>
</html>