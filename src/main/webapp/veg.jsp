<%@page import="service.Service_class"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Model_class"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/category.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<style>

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
.link-parent a{

	color: black;
}
	*{
	font-family: sans-serif;
	}
	.poppins-medium {
	      font-family: "Poppins", sans-serif;
	      font-weight: 500;
	      font-style: normal;
	 }
	 
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: poppins;
}
.section-3-head{
  font-size: 55px;
  margin-bottom: 3rem;
  
}
.section-3{
  display: grid;
  place-items: center;
  background: #000000;
  font-family: Poppins;
  font-weight: 100;
  
}
.section-3-head{
  font-size: 55px;
}

.container {
  width: 300px;
  display: flex;
  justify-content: center;
  height: 550px;
  gap: 10px;
  margin-bottom: 3rem;

  > div {
    flex: 0 0 250px;
    border-radius: 0.5rem;
    transition: 0.5s ease-in-out;
    cursor: pointer;
    box-shadow: 1px 1px 7px 1px #606060;
    position: relative;
    overflow: hidden;

    &:nth-of-type(1) {
      background: url("https://img.freepik.com/free-photo/delicious-indian-dosa-arrangement_23-2149086026.jpg")
        no-repeat 50% / cover;
    }
    &:nth-of-type(2) {
      background: url("https://assets.zeezest.com/blogs/PROD_Onam%20sadya%20banner_1687707906966.png")
        no-repeat 50% / cover;
    }
    &:nth-of-type(3) {
      background: url("https://i.pinimg.com/736x/ff/68/fc/ff68fc3f488c6e28742c572f840333aa.jpg")
        no-repeat 50% / cover;
    }
    &:nth-of-type(4) {
      background: url("https://png.pngtree.com/thumb_back/fw800/background/20240209/pngtree-vegan-dietary-food-vitamins-summer-dessert-background-image_15625142.jpg")
        no-repeat 50% / cover;
    }

    .content {
      font-size: 1.5rem;
      color: #fff;
      display: flex;
      align-items: center;
      padding: 15px;
      opacity: 0;
      flex-direction: column;
      height: 100%;
      justify-content: center;
      background: rgboran;
      background: linear-gradient(
        0deg,
        rgba(83, 83, 83, 0.676) 0%,
        rgba(255, 255, 255, 0) 100%
      );
      transform: translatey(100%);
      transition: opacity 0.5s ease-in-out, transform 0.5s 0.2s;
      visibility: hidden;

      span {
        display: block;
        margin-top: 5px;
        font-size: 1.2rem;
      }
    }

    &:hover {
      flex: 0 0 250px;
      
      transform: translatey(-30px);
    }

    &:hover .content {
      opacity: 1;
      transform: translatey(0%);
      visibility: visible;
    }
  }
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
	
</style>
</head>
<%
	Service_class rs=new Service_class();
	
	Cookie cookie=null; 
	Cookie[] cookies=null;
	cookies=request.getCookies();
%>


<body>
<div id="scollhere" style="height: 1rem;width: 100%"></div>	

    <!-- navbar -->
    <nav>
        <div class="na-logo">
            <a href="/main_project/user.jsp" class="nav-logo-text">रूजी</a>&nbsp;&nbsp;&nbsp;<h1>|</h1>&nbsp;&nbsp;&nbsp; <img src="https://i.pinimg.com/originals/e4/1f/f3/e41ff3b10a26b097602560180fb91a62.png" alt=""> 
         </div>
         <div class="link-parent" style="display: flex;align-items: center;gap: 10px;color: black;margin-right: 2rem;">
         	<a href="#section-1" onclick="closeNav()">HOME</a>
            <a href="#section-2" onclick="closeNav()">ABOUT</a>
            <a href="#section-3" onclick="closeNav()">CATEGORY</a>
            
         </div>
    </nav>
	

    <!-- section-1 -->
	<div id="section-1"></div>
	<div class="dropdown-holder" style="margin-top: 3rem;margin-left: 1.5rem;">
	    <div class="dropdown" onclick="window.location.href='user.jsp'">
	      <button class="dropbtn">HOME ></button>
	      <div class="dropdown-content">
	        <a href="/main_project/veg.jsp">VEG</a>
	        <a href="/main_project/nonveg.jsp">NON-VEG</a>
	        <a href="/main_project/recipeVideo.jsp">VIDEOS</a>
	      </div>
	    </div> 
	
	    <div class="dropdown" onclick="">
	      <button class="dropbtn">VEG ></i>
	      </button>
	      <div class="dropdown-content">
	        <a href="typeTemplate.jsp?category=veg&type=breakfast">BREAKFAST</a>
	        <a href="typeTemplate.jsp?category=veg&type=lunch">LUNCH</a>
	        <a href="typeTemplate.jsp?category=veg&type=dinner">DINNER</a>
	        <a href="typeTemplate.jsp?category=veg&type=dessert">DESSERT</a>
	      </div>
	    </div> 
	
	</div>
    <section > 
        <div class="landing">
            <div class="landing-img-holder"><img src="img/pexels-olenkabohovyk-3323687.jpg" style="border-radius: 50%;" alt="" class="rotate"></div>
            <div class="landing-text-holder"><p class="landing-text-first-p">From रूजी </p><h1>VEGETARIAN</h1><p class="landing-text-sec-p">100% pure vegetarian food recipes</p></div>
        </div>

        <!-- <div class="section-1-head hidden slowed vertical" style="overflow-x: hidden;">
            <p>VEG / रूजी</p>
        </div> -->
    </section>

    <!-- section-2 -->
    <div id="section-2"></div>
    <section class="section-2">
        <img src="img/Group 239.png"  alt="">
    </section>


    <!-- section-3 -->
    <div id="section-3" ></div>
    <section class="section-3">
    <h1 class="section-3-head" style="color: white;">Category</h1>
    <div class="container">
    
        <div onclick="window.location.href='typeTemplate.jsp?category=veg&type=breakfast'">
          <div class="content">
         	<h2>Breakfast</h2>  
          </div> 
        </div>
  
        <div onclick="window.location.href='typeTemplate.jsp?category=veg&type=lunch'">
          <div class="content">
            <h2>Lunch</h2>
          </div>
        </div>
        
        <div onclick="window.location.href='typeTemplate.jsp?category=veg&type=dinner'">
          <div class="content">
            <h2>Dinner</h2>
          </div>
        </div>
        
        <div onclick="window.location.href='typeTemplate.jsp?category=veg&type=dessert'">
          <div class="content">
            <h2>dessert</h2>
          </div>
        </div>
      </div>
  </section>
   
    <!--section-4-->
   <section style="background-color: black;width: 100%;height: 260px;display: flex;justify-content: space-between;align-items: center;border-top: 2px solid gray;margin-top: 50px;">
        <div class="" style="margin-left: 8rem;">
            <h1 style="color: white;font-size: 100px;">रूजी</h1>
            
        </div>
        <div class="" style="display: flex;flex-direction: column;gap: 10px;">
            <h1 style="color: white;font-size: 35px;">Explore</h1>
            <a href="#section-1">Home</a>
            <a href="#section-2">About</a>
            <a href="#section-3">Category</a>
            
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
   
	
</body>
</html>