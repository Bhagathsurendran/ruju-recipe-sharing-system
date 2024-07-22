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
<link href="css/recipeVideo.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">

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

		a{
			text-decoration:none;
		}
		#section-2{
            width: 100%;
            height: max-content;
            margin-bottom: 3rem;
             display: flex;
            justify-content: center;
            align-items: center;
            
        }
        .cardHolder{
            padding-top: 4rem;
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            justify-items: center;
            gap: 30px;
            width: 72%;
        .card{
            width: 350px;
            height: 200px;background-color: rgb(135, 135, 135);
            transition: .5s;
            display: flex;
            flex-direction: column;justify-content: end;
            
        }
        .card:hover{
            scale: 1.1;
        }
        .card p{
            margin: 0;
            margin-left: 2rem;
        }
        .card h1{
        	
            margin-top: 0;
            margin-left: 2rem;
            width: 80%;
        }
        	
		a{
            text-decoration: none;
            color: white;
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

</style>
</head>
<% 
	Service_class rs=new Service_class();
	
	ArrayList<Model_class> resipeVideo=rs.resipeVideoView();
	System.out.println(resipeVideo);
	
%>
<body>
 	<nav>
        <div class="na-logo">
            <a href="/main_project/user.jsp" class="nav-logo-text">रूजी</a>&nbsp;&nbsp;&nbsp;<h1>
        </div>
    </nav>

    <section id="section-1">
        <h1 class="poppins-medium">Video Recipes</h1>
    </section>
    
    <div class="dropdown-holder" style="margin-top: 1rem;margin-left: 1rem;">
	    <div class="dropdown" onclick="window.location.href='user.jsp'">
	      <button class="dropbtn">HOME ></button>
	      <div class="dropdown-content">
	        <a href="/main_project/veg.jsp">VEG</a>
	        <a href="/main_project/nonveg.jsp">NON-VEG</a>
	        <a href="/main_project/recipeVideo.jsp">VIDEOS</a>
	      </div>
	    </div>
	</div>


    <section id="section-2">
        <div class="cardHolder">
        <% for(Model_class am:resipeVideo){%>
        	<a href="recipeVideoView.jsp?id=<%=am.getId() %>">
        		<div class="card poppins-medium" style="background: url('<%=am.getImgLink() %>');background-size: cover;color: white;">
        		 	<p><%=am.getDuration() %></p>
                	<h1><%=am.getFoodname() %></h1>
            	</div>
        	</a>
         <%} %>
        </div>
    </section>

	<section style="background-color: black;width: 100%;height: 260px;display: flex;justify-content: space-between;align-items: center;border-top: 2px solid gray;margin-top: 50px;">
        <div class="" style="margin-left: 8rem;">
            <h1 style="color: white;font-size: 100px;">रूजी</h1>
            
        </div>
        <div class="" style="display: flex;flex-direction: column;gap: 10px;">
            <h1 style="color: white;font-size: 35px;">Explore</h1>
            <a href="#section-1" style="margin-top: -30px; color: white;">Home</a>
            <a href="#section-2" style="color: white;">About</a>
            <a href="#section-3" style="color: white;">Category</a>
            
        </div>
        <div class="" style="display: flex;flex-direction: column;gap: 10px;margin-top: -40px;margin-right: 10rem;">
            <h1 style="color: white;font-size: 35px;">Follow</h1>
            <div class="" style="color: white;display: flex;gap: 30px;margin-top: 20px;">

                <i class="fa-brands fa-facebook fa-2xl" style="margin-top: -30px;"></i>
                <i class="fa-brands fa-twitter fa-2xl" style="color: #ffffff;margin-top: -30px;"></i>
                <i class="fa-brands fa-instagram fa-2xl" style="margin-top: -30px;"></i>

            </div>
        </div>
    </section>
 
    
</body>
</html>