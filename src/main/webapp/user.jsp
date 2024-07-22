<!DOCTYPE html>
<%@page import="java.awt.DisplayMode"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.Service_class"%>
<%@page import="model.Model_class"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/user.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<style type="text/css">
a{
            text-decoration: none;
            transition: .3s;
        }
        a:hover{
            scale: 1.1;
        }
        i{
            transition: .3s;
        }
        i:hover{
            scale: 1.1;
        }
.poppins-medium {
	      font-family: "Poppins", sans-serif;
	      font-weight: 500;
	      font-style: normal;
	 </style>
</head>
<%
	Model_class rm=new Model_class();
	Service_class rs=new Service_class();
	
	Cookie cookie=null; 
	Cookie[] cookies=null;
	cookies=request.getCookies();
	
	ArrayList<Model_class> userdetail=null;	
	
	String user=""; 

	if(cookies[0].getName().equals("username")){
		user=""+cookies[0].getValue();
		userdetail=rs.userSearch(user);
	}
	else if(cookies[1].getName().equals("username")){
		user=""+cookies[1].getValue();
		userdetail=rs.userSearch(user);
	}
	else if(cookies[2].getName().equals("username")) {
		user=""+cookies[2].getValue();
		userdetail=rs.userSearch(user);
	}
%>




<body style="scroll-behavior: smooth;">
	  <div id="hamburgerNav">
        <div id="hamburgerNav-holder">
            <div id="closeBtn" onclick="closeNav()" class="close">
                ❌
            </div>
        </div>

        <div class="link-parent">
            <a href="#section-1" onclick="closeNav()">HOME</a>
            <a href="#section-2" onclick="closeNav()">ABOUT</a>
            <a href="#section-3" onclick="closeNav()">CATEGORY</a>
            <a href="" onclick="closeNav()">hi</a>
        </div> 
    </div>


    <!--------------------------- navbar ----------------------------->
    
    

    <nav>
        <div class="na-logo">
           <a href="" class="nav-logo-text">रूजी</a> 
        </div>
        <ul>
            <li><a href="#section-1">Home</a></li>
            <li><a href="#section-2">About</a></li>
            <li><a href="#section-3">Recipies</a></li>
            <li><a href="/main_project/recipeVideo.jsp">Videos</a></li>      
            <li>
            	<%try{ %>
				<%if(cookies[0].getName().equals("username")){ %>
					<% if(cookies[0].getValue().equals("")){%>
						 <a href="/main_project/login.jsp">LOG IN</a>	
						
					<%}else{ %>
								<%for(Model_class am:userdetail){%>
							
								   <button type="submit" value="userdetail" id="userdetail" name="operation" onclick="profile()" style="height: 30px;width: 30px;border-radius: 50%;background-image: url('<%=am.getUserlogo() %>');background-repeat: no-repeat;background-size: cover;"></button>
								 <% }%>   
								    			 		
							<% }%>
				 <%}else if(cookies[1].getName().equals("username")){ %>
						  <% if(cookies[1].getValue().equals("")){%>
						 <a href="/main_project/login.jsp">LOG IN</a>	
						
					<%}else{ %>
								   <%for(Model_class am:userdetail){%>
									   <button type="submit" value="userdetail" id="userdetail" name="operation" onclick="profile()" style="height: 30px;width: 30px;border-radius: 50%;background-image: url('<%=am.getUserlogo() %>');background-repeat: no-repeat;background-size: cover;"></button>
								   <% }%>          			 		
							  <% }%>
			  <%}else if(cookies[2].getName().equals("username")) {%>
					  <% if(cookies[2].getValue().equals("")){%>
					 	<a href="/main_project/login.jsp">LOG IN</a>	
						
					<%}else{ %>
								   <%for(Model_class am:userdetail){%>
									   <button type="submit" value="userdetail" id="userdetail" name="operation" onclick="profile()" style="height: 30px;width: 30px;border-radius: 50%;background-image: url('<%=am.getUserlogo() %>');background-repeat: no-repeat;background-size: cover;"></button>
								   <% }%>         			 		
							  <% }%>
				 <%}else{ %>
						 <a href="/main_project/login.jsp">LOG IN</a>	
											
				 <% }%>
		<%}catch(Exception e) {%>
			   <a href="/main_project/login.jsp">LOG IN</a>
		<% }%>
             	
            </li>       
        </div>
        </ul>

        <div id="humburgerBtn" class="hamburger" onclick="openNav()">
            <div class="line"></div>
            <div class="line"></div>
            <div class="line"></div>
        </div>
    </nav>
    <section class="section-1" id="section-1">  
        <p class="section-1-head">रूजी</p>
        <video class="section-1-video" src="img/videoplayback_1.mp4" autoplay loop muted style=" height: 750px;"></video>
    </section>

    <section class="section-2" id="section-2">

        <p class="section-2-head poppins-medium" style="font-weight: 600;margin-top: 200px;margin-left: 100px;">ABOUT</p>

        <div class="section-2-holder poppins-medium">
            <p style="font-size: 20px;word-spacing: 4px;line-height: 25px;margin-top: 200px;">Unleash your inner chef with our dynamic recipe management app! Share your culinary masterpieces, edit and perfect your favorite dishes, and explore an ever-growing collection of recipes from a passionate community of food lovers. Join us and transform your kitchen into a hub of creativity and delicious adventures!</p>
            <img src="img/2nd image.jpeg    " class="rotate" alt="">
        </div>
    
    </section>

    <section class="section-3" id="section-3">

        <p class="section-3-header">Category</p>

         <div class="section-3-holder">

            <div class="card" onclick="vegPage()" style="background-image: url('https://images.pexels.com/photos/1988624/pexels-photo-1988624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');display:flex;align-items:center;justify-content:center;">
                <p style="display: flex;justify-content: center;align-items: center;">veg</p>
            </div>

            <div class="card" onclick="nonvegPage()" style="background-image: url('https://images.pexels.com/photos/6210747/pexels-photo-6210747.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');display:flex;align-items:center;justify-content:center;">
                <p style="display: flex;justify-content: center;align-items: center;">non-veg</p>
            </div>

        </div>
    </section>
    
    
   
    
   <section style="background-color: black;width: 100%;height: 260px;display: flex;justify-content: space-between;align-items: center;border-top: 2px solid gray;margin-top: 50px;">
        <div class="" style="margin-left: 8rem;">
            <h1 style="color: white;font-size: 100px;">रूजी</h1>
            
        </div>
        <div class="" style="display: flex;flex-direction: column;gap: 10px;">
            <h1 style="color: white;font-size: 35px;">Explore</h1>
            <a href="#section-1" style="color: white;font-size: 20px;">Home</a>
            <a href="#section-2" style="color: white;font-size: 20px;">About</a>
            <a href="#section-3" style="color: white;font-size: 20px;">Category</a>
            <a href="/main_project/recipeVideo.jsp" style="color: white;font-size: 20px;">Video</a>
        </div>
        <div class="" style="display: flex;flex-direction: column;gap: 10px;margin-top: -100px;margin-right: 10rem;">
            <h1 style="color: white;font-size: 35px;">Follow</h1>
            <div class="" style="color: white;display: flex;gap: 30px;margin-top: 20px;">

                <i class="fa-brands fa-facebook fa-2xl"></i>
                <i class="fa-brands fa-twitter fa-2xl" style="color: #ffffff;"></i>
                <i class="fa-brands fa-instagram fa-2xl"></i>

            </div>
        </div>
    </section>


    <script>
        function vegPage(){
            window.location.href = '/main_project/veg.jsp'
        }
      
        function nonvegPage() {
        	window.location.href ='/main_project/nonveg.jsp'
		}
        
        function profile() {
        	window.location.href ='/main_project/userDetail.jsp'
			
		}
    </script>

    <script>
        let hamburger = document.getElementById('hamburgerNav')
        let closeBtn = document.getElementById('closeBtn')
        let humburgerBtn = document.getElementById('humburgerBtn')

        function openNav(){
        
            hamburger.style.display ='block'
            closeBtn.style.display = 'block'
            console.log("Nav Opened")
        }
        function closeNav(){       
            hamburger.style.display ='none'
            closeBtn.style.display = 'none'
        }
    </script>
</body>
</html>