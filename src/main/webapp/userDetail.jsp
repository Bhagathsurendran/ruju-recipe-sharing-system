<%@page import="model.Model_class"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.Service_class"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 <link href="css/userDetail.css" rel="stylesheet" type="text/css">
 <style>
 .poppins-medium {
	      font-family: "Poppins", sans-serif;
	      font-weight: 500;
	      font-style: normal;
	 }
 nav a{
		color:black;
	}
 a{
 	text-decoration: none;
 	font-size:25px;
 	font-weight: 600;
 }
 
 nav button{
 	border:	 none;
 	background-color:white;
 	font-size:25px;
 	font-weight:600;
 	
 }
 
 td {
    	padding: 10px;
  	}
		#userInfo{
		    background-color: rgb(44, 44, 44);height: 500px;width: 800px;position: fixed;border-radius: 30px;z-index: 100;transform:translate(-50%,-50%);left:50%;top:55%;
		    display: none;justify-content: space-between;
		}
		.userInfo-text{
		    color: white;font-size: 30px;display: flex;flex-direction: column;gap: 10px;padding-left: 2rem;margin-left: 2reml
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
       	#recipeInfo{
            background-color: rgb(44, 44, 44);height: 600px;width: 1500px;position: fixed;border-radius: 30px;z-index: 100;transform:translate(-50%,-50%);left:50%;top:55%;
            display: none;justify-content: space-between;overflow-y: scroll;scrollbar-width: none;
        }
        .recipeInfoHolder{
            display: flex;flex-direction: column;padding-left: 3rem;padding-top: 3rem;
        }
        .recipeInfo-head{
            display: flex;gap: 10px;font-size: 15px;border-bottom:  5px solid black;border: 2px solid white;
        }
        .recipeInfo-head h1{
            color: white;
            font-size: 28px;
            width: 160px;
            border-left: 2px solid white;
            text-indent: 7px;
        }
        .recipeInfo-detail{
            display: flex;gap: 10px;font-size: 15px;border: 2px solid white;
            
        }
        .recipeInfo-detail h1{
            border-left: 2px solid rgb(255, 255, 255);
            width: 160px;font-size: 18px;
            color: white;
            text-indent: 7px;
        }	
        
        #allRecipeVideo{
		    background-color: rgb(44, 44, 44);height: 600px;width: 1000px;position: fixed;border-radius: 30px;z-index: 100;transform:translate(-50%,-50%);left:50%;top:53%;
		    display: none;justify-content: space-between;overflow-y: scroll;scrollbar-width: none;
		}
		.allRecipeVideo-holder{
		    display: flex;flex-direction: column;padding-left: 3rem;padding-top: 2rem;
		}
		.allRecipeVideo-head{
		    display: flex;gap: 10px;font-size: 15px;border-bottom:  5px solid black;border: 2px solid white;
		}
		.allRecipeVideo-head h1{
		    color: white;
		    font-size: 20px;
		    width: 110px;
		    border-left: 2px solid white;
		    text-indent: 7px;
		}
		.allRecipeVideo-detail{
		    display: flex;gap: 10px;font-size: 15px;border: 2px solid white;
		    
		}
		.allRecipeVideo-detail h1{
		    border-left: 2px solid rgb(255, 255, 255);
		    width: 110px;font-size: 16px;
		    color: white;
		    text-indent: 7px;
		}
		
		#deleteRecipeVideo{
	    background-color: rgb(44, 44, 44);height: 600px;width: 1500px;position: fixed;border-radius: 30px;z-index: 100;transform:translate(-50%,-50%);left:50%;top:55%;
	    display: none;justify-content: space-between;overflow-y: scroll;scrollbar-width: none;
	}
	.deleteRecipeVideo-holder{
	    display: flex;flex-direction: column;padding-left: 3rem;padding-top: 3rem;
	}
	.deleteRecipeVideo-head{
	    display: flex;gap: 10px;font-size: 15px;border-bottom:  5px solid black;border: 2px solid white;
	}
	.deleteRecipeVideo-head h1{
	    color: white;
	    font-size: 18px;
	    width: 100px;
	    border-left: 2px solid white;
	    text-indent: 7px;
	}
	.deleteRecipeVideo-detail{
	    display: flex;gap: 10px;font-size: 15px;border: 2px solid white;
	    
	}
	.deleteRecipeVideo-detail h1{
	    border-left: 2px solid rgb(255, 255, 255);
	    width: 100px;font-size: 15px;
	    color: white;
	    text-indent: 7px;
	}
	
	.dropdown-holder{
  overflow: hidden;
}

.dropdown-holder a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  transition: .3s;
}
.dropdown-holder a:hover{
  scale: 1.1;
}

.dropdown {
  float: left;
  overflow: hidden;
}
.dropdown button{
  transition: .3s;
}
.dropdown button:hover{
  scale: 1.1;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}


.dropdown-content {
  border-radius: 10px;
  overflow: hidden;
  display: none;
  position: absolute;
  background-color: rgba(255, 255, 255, 0.859) ;
  min-width: 120px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  margin-left: 10px;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #575757;
}

.dropdown:hover .dropdown-content {
  display: block;
}
.fav-button{
      cursor: pointer;background-color: red;color: black;height: 30px;width: 30px;display: flex;justify-content: center;border-radius: 50%;align-items: center;margin: 1rem;transition: .1s;
  }
  .fav-button:hover{
      opacity: .7;
  }
    #favInfo{
        background-color: rgb(44, 44, 44);height: 500px;width: 800px;position: fixed;border-radius: 30px;z-index: 100;transform:translate(-50%,-50%);left:50%;top:55%;
        display: none;justify-content: space-between;
  }
  .favInfoHolder{
      display: grid;
      grid-template-columns: 1fr 1fr 1fr; gap: 20px;
      margin-left: 4rem;
      margin-top: 4rem;
      overflow-y: scroll;scrollbar-width: none;
      height: 400px;
  }
  .fav-card{
    height: 110px;width: 210px;background: url('https://images.pexels.com/photos/1647163/pexels-photo-1647163.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
    background-size: cover;
    transition: .5s;
  }
  .fav-card:hover{
    scale: 1.1;
  }
		
    </style>
 

</head>
<%

Service_class rs=new Service_class();
Model_class rm=new Model_class();



Cookie cookie=null; 
Cookie[] cookies=null;
cookies=request.getCookies();

ArrayList<Model_class> userdetail=null;
ArrayList<Model_class> recipes=null;
ArrayList<Model_class> favorites=null;
ArrayList<Model_class> resipeVideoUser=null;

String user=""; 

		if(cookies[0].getName().equals("username")){
			user=""+cookies[0].getValue();
			userdetail=rs.userSearch(user);
			recipes=rs.userAllRecipe(user);
			favorites=rs.userAllFav(user);
			resipeVideoUser=rs.resipeVideoViewUser(user);
		}
		else if(cookies[1].getName().equals("username")){
			user=""+cookies[1].getValue();
			userdetail=rs.userSearch(user);
			recipes=rs.userAllRecipe(user);
			favorites=rs.userAllFav(user);
			resipeVideoUser=rs.resipeVideoViewUser(user);
		}
		else if(cookies[2].getName().equals("username")) {
			user=""+cookies[2].getValue();
			userdetail=rs.userSearch(user);
			recipes=rs.userAllRecipe(user);
			favorites=rs.userAllFav(user);
			resipeVideoUser=rs.resipeVideoViewUser(user);
		}
		System.out.println(userdetail);
		System.out.println(recipes);
%>



<body>
  <nav>	
  		<%try{ %>
				<%if(cookies[0].getName().equals("username")){ %>
					<% if(cookies[0].getValue().equals("")){%>
						 <a href="/main_project/login.jsp">रूजी</a>	
						
					<%}else{ %>
							   <a href="/main_project/user.jsp">रूजी</a>	      			 		
							  <% }%>
				 <%}else if(cookies[1].getName().equals("username")){ %>
						  <% if(cookies[1].getValue().equals("")){%>
						 <a href="/main_project/login.jsp">रूजी</a>	
						
					<%}else{ %>
							   <a href="/main_project/user.jsp">रूजी</a>	       			 		
							  <% }%>
			  <%}else if(cookies[2].getName().equals("username")) {%>
					  <% if(cookies[2].getValue().equals("")){%>
					 	<a href="/main_project/login.jsp">रूजी</a>	
						
					<%}else{ %>
							   <a href="/main_project/user.jsp">रूजी</a>	       			 		
							  <% }%>
				 <%}else{ %>
						 <a href="/main_project/login.jsp">रूजी</a>	
											
				 <% }%>
		<%}catch(Exception e) {%>
			   
		<% }%>
	        
  	
    </nav>

    <section id="userInfo" >
        <div class="poppins-medium userInfo-text">
          <h1 style="text-decoration: underline;margin-top: -100px;">Personal Information</h1>
            
            <%for(Model_class am:userdetail){%>
            <div style="display: flex;">
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
            	 <p style="margin-left: 50px;height: 100px;width: 100px;border-radius: 50%;background: url('<%=am.getUserlogo() %>');background-repeat: no-repeat;background-size: cover;border: 2px solid white;"></p>
            </div>
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
                <h1 style="border: none;">Foodname</h1>
                <h1>Calorie</h1>
                <h1 style="width: 160px;">Recipe</h1>
                <h1>Category</h1>
                <h1 style="width: 180px;">Recipe Description</h1>
               	<h1 style="width: 180px;">Update/<br>Delete</h1>
            </div>
			
			<%for(Model_class bm:recipes){ %>
	            <div class="recipeInfo-detail" >
	        
	                <h1 style="border: none;"><%=bm.getFoodname() %></h1>
	                <h1><%=bm.getCalorie() %></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;width: 160px;overflow:hidden; " title=""><%=bm.getRecipe() %></h1>
	                <h1><%=bm.getCategory() %></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;width: 180px;overflow:hidden; " title=""><%=bm.getRecipeDes() %></h1>
	                <h1 style="width: 180px;"><a href="deleteRecipeUser.jsp?id=<%=bm.getId() %>">Select</a></h1>
	             </div>
	       <% }%>
       </div>
        <div  class="poppins-medium userInfo-button" onclick="closeBtn()" style="">
            <p style="font-size: 23px;font-weight: 600;cursor: pointer;">X</p>    
        </div>
    </section>

	 <section id="favInfo" >
	    <div class="poppins-medium favInfoHolder">
	      <%for(Model_class cm:favorites){ %>
	        <div class="fav-card" onclick="window.location.href='/main_project/recipeVideoView.jsp?id=<%=cm.getFoodRecipeId() %>'" style="background: url('<%=cm.getImgLink() %>');background-size: cover;"></div>
	      <% }%>
	    </div>
	   
	         
	     <div  class="poppins-medium fav-button" onclick="closeBtn()" style="">
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
                <button type="submit" class="recipe-modal-btn" value="addrecipevideoUser" id="addrecipevideoUser" name="operation" style="margin-bottom:10px;">Submit</button>
             </form>
        </div>
        <div  class="poppins-medium userInfo-button" onclick="closeBtn()" style="">
            <p style="font-size: 23px;font-weight: 600;cursor: pointer;">X</p>    
        </div>
	
	</section>

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
            <% for(Model_class bm:resipeVideoUser){  %>
	            <div class="deleteRecipeVideo-detail">
	                <h1 style="border: none;"><%=bm.getId() %></h1>
	                <h1><%=bm.getFoodname() %></h1>
	                <h1><%=bm.getCalorie() %></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;overflow:hidden;width: 130px;" title=""><%=bm.getRecipe() %></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;overflow:hidden;width: 130px;"><%=bm.getImgLink() %></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;overflow:hidden;width: 130px;"><%=bm.getRecipeDes() %></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;overflow:hidden;width: 130px;"><%=bm.getIngredients() %></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;overflow:hidden;width: 130px;"><%=bm.getNeeded() %></h1>
	                <h1><%=bm.getDuration() %></h1>
	                <h1 style="text-overflow: ellipsis;white-space: nowrap;overflow:hidden;width: 130px; " title=""><%=bm.getVideoLink() %></h1>
	                <h1><a href="DeleteRecipeVideoUser.jsp?id=<%=bm.getId() %>">Select</a></h1>
	            </div>
            <%	} %>
            
        </div>
        <div  class="poppins-medium userInfo-button" onclick="closeBtn()" style="">
            <p style="font-size: 23px;font-weight: 600;cursor: pointer;">X</p>    
        </div>
    </section>


	<div class="dropdown-holder poppins-medium " style="margin-top: 3rem;">
	    <div class="dropdown" onclick="window.location.href='user.jsp'">
	      <button class="dropbtn">Home ></button>
	      <div class="dropdown-content">
	        <a href="/main_project/veg.jsp">VEG</a>
	        <a href="/main_project/nonveg.jsp">NON-VEG</a>
	        <a href="/main_project/recipeVideo.jsp">VIDEOS</a>
	      </div>
	    </div> 
	
	</div>

    <section class="poppins-medium section-1" style="transform: translate(0,10%);">
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
       
            <div class="card" onclick="modalFav()">
                <div class="card-logo"><i class="fa-solid fa-star fa-2xl" style="color: #0d0d0d;"></i></div>

                <div class="card-text">
                    <p style="font-size: 22px;font-weight: 600;">Favourites  </p>
                    <p style="font-size: 13px;">Your favourite recipe</p>
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
    let favinfo=document.getElementById('favInfo')
    let allrecipevideo=document.getElementById('allRecipeVideo')
    let deletercipevideo=document.getElementById('deleteRecipeVideo')
	
  	
	function logout() {
    	setCookie("username","");
    	setCookie("password","");
    	window.location.href="/main_project/login.jsp"
	}
    function setCookie(cname, cvalue) {
    	  document.cookie = cname + "=" + cvalue + ";" + "path=/main_project;" 
    }

    function modalUser(){
        userinfo.style.display = 'flex'
        recipeinfo.style.display = 'none'
        favinfo.style.display = 'none'
        allrecipevideo.style.display = 'none'
        deletercipevideo.style.display = 'none'
    }
    function modalRecipe(){
        recipeinfo.style.display = 'flex'
        userinfo.style.display = 'none'
        favinfo.style.display = 'none'
        allrecipevideo.style.display = 'none'
        deletercipevideo.style.display = 'none'
    }
    function modalFav() {
    	favinfo.style.display = 'flex'
    	recipeinfo.style.display = 'none'
    	userinfo.style.display = 'none'
    	allrecipevideo.style.display = 'none'
    	deletercipevideo.style.display = 'none'
	}
    function modalAddvideo(){
		allrecipevideo.style.display = 'flex'
		userinfo.style.display = 'none'
		recipeinfo.style.display = 'none'
		favinfo.style.display = 'none'
		deletercipevideo.style.display = 'none'
	}
    function modalDeletevideo() {
    	deletercipevideo.style.display = 'flex'
    	userinfo.style.display = 'none'
        recipeinfo.style.display = 'none'
        alluserinfo.style.display = 'none'
        allrecipevideo.style.display = 'none'
	}
    

    function closeBtn(){
        userinfo.style.display = 'none'
        recipeinfo.style.display = 'none'
        favinfo.style.display = 'none'
       	allrecipevideo.style.display = 'none'
       	deletercipevideo.style.display = 'none'
    }
</script>
</body>
</html>