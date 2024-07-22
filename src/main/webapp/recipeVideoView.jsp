<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.Model_class"%>
<%@page import="service.Service_class"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="css/recipeVideoView.css" rel="stylesheet" type="text/css">
  <style type="text/css">
  
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
  .videoLinkSize{
  	height: 270px;width: 470px;
  }
  .section-1-text a{
  		 transition: .3s;
  }
   .section-1-text a:hover{
   		 scale: 1.1;
   }
  
  
  </style>
</head>

<% 
	int id=Integer.parseInt(request.getParameter("id"));
	//pass id
	Service_class rs=new Service_class();
	Model_class rm=new Model_class();
	rm=rs.searchRecipeVideo(id);
	
%>
<body>
	 <nav>
        <div class="na-logo">
            <a href="/main_project/user.jsp" class="nav-logo-text">रूजी</a>&nbsp;&nbsp;&nbsp;<h1>
        </div>
    </nav>
    
    <div class="dropdown-holder" style="margin-top: 3.5rem;margin-left: 1rem;">
	    <div class="dropdown" onclick="window.location.href='user.jsp'">
	      <button class="dropbtn">HOME ></button>
	      <div class="dropdown-content">
	        <a href="/main_project/veg.jsp">VEG</a>
	        <a href="/main_project/nonveg.jsp">NON-VEG</a>
	        <a href="/main_project/recipeVideo.jsp">VIDEOS</a>
	      </div>
	    </div> 
	
	    <div class="dropdown" onclick="window.location.href='recipeVideo.jsp'">
	      <button class="dropbtn">VIDEO ></button>
	    </div> 
	    
	    <div class="dropdown">
	      <button class="dropbtn"><%=rm.getFoodname() %>  </button>
	    </div>
	
	</div>

    <section id="section-1" style="margin-top: -.5rem;">
        <div class="section-1-text">
            <a href="recipeVideo.jsp" style="margin-bottom: 0;color: orange;"><- Back to overview</a>
            <h1 style="margin-bottom: 0;margin-top: 10px;color: white;"><%=rm.getFoodname() %></h1>
            <p id="fid" style="color: white;display:none;"><%= id%></p>
            <p style="margin-top: 5px;color: white;width: 70%;"><%=rm.getRecipeDes() %></p>

        </div>
        <div class="section-1-btn">
            
            <button onclick="favorite(this)" style="height: 40px;width: 200px;">Add to Fav</button>

        </div>
    </section>

    <section id="section-2" style="background: url('<%=rm.getImgLink() %>');background-repeat: no-repeat;background-size:cover;background-position:600px -500px;">
        <div class="section-2-text">
            <p style="margin-bottom: 0;"><i class="fa-solid fa-plate-wheat fa-xl" style="color: #000000;"></i>&nbsp;CALORIES:<%=rm.getCalorie() %></p>
            <p><i class="fa-solid fa-clock fa-xl" style="color: #000000;"></i>&nbsp;TIME:<%=rm.getDuration() %></p>
        </div>
    </section>

    <section id="section-3">

        <div class="section-3-left">

            <div class="section-3-ingredients">

                <div class="section-3-ingredients-head"><h1 style="margin: 0;margin-left: 1.5rem;">Ingredients:</h1></div>

                <div style="width: 100%;height: 90%;display: flex;justify-content: center;">
                    <div class="" style="width: 90%;height: 90%;margin-top: 1rem;"><%=rm.getIngredients() %></div>
                </div>
            </div>

            <div class="section-3-needed">
                <div class="section-3-needed-head"><h1 style="margin: 0;margin-left: 1.5rem;">Needed:</h1></div>

                <div style="width: 100%;height: 80%;display: flex;justify-content: center;">
                    <div class="" style="width: 90%;height: 90%;margin-top: 1rem;overflow-y:scroll; scrollbar-width: none; "><%=rm.getNeeded() %></div>
                </div>
            </div>
        </div>

        <div class="section-3-right">

            <div class="" style="height: 100px;width: 500px;background-color: rgb(0, 0, 0);position: absolute;margin-top: -3rem;display: flex;align-items: center;">
                <p style="color: white;font-size: 45px;margin-left: 2rem;">Instructions</p>
            </div>
	
            <div class="" style="height: 300px;width: 500px;background-color: rgba(255, 255, 255, 0.769);display: flex;justify-content: center;position: relative;align-items: center;margin-top: 5rem;border-radius: 5px;">
                <div class="" style="height: 270px;width: 470px;background-color: white;">
                		<iframe style="height: 100%;width: 100%;" src="<%=rm.getVideoLink() %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                </div>
            </div>

            <div class="" style="height: 400px;width: 500px;margin-top: 2rem;color: white;">
            	<p style="height: 100%;width: 500px;margin-top: 2rem;color: white;overflow-y:scroll; scrollbar-width: none;"><%=rm.getRecipe() %></p>
          
            </div>

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
    
    <script type="text/javascript">
    
    	function favorite(e) {
    		let fid=document.getElementById('fid').innerText
    		console.log(e.innerText)
    		if(e.innerText=="Add to Fav"){
    			e.innerText='Remove from fav'
    			var details = {					
    					'favorite': '1',
    					'operation': 'fav',
    					'foodid':fid ,
    					'imgLink':'<%=rm.getImgLink() %>'
    					
    					};
    			
    			var formBody = [];
    			for (var property in details) {
    			
    			var encodedKey = encodeURIComponent(property);
    			var encodedValue = encodeURIComponent(details[property]);
    			formBody.push(encodedKey + "=" + encodedValue);

    			}
    			formBody = formBody.join("&");



          
    			fetch('servlet',{
    				method:'post',
    				headers: {'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'},
    				body:formBody
    			})
    		}
    		else{
    			e.innerText='Add to Fav'
    			var details = {					
    					'favorite': '0',
    					'operation': 'fav',
    					'foodid': fid
    					};
    			
    			var formBody = [];
    			for (var property in details) {
    			
    			var encodedKey = encodeURIComponent(property);
    			var encodedValue = encodeURIComponent(details[property]);
    			formBody.push(encodedKey + "=" + encodedValue);

    			}
    			formBody = formBody.join("&");



          
    			fetch('servlet',{
    				method:'post',
    				headers: {'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'},
    				body:formBody
    			})
    		}
    		
    		
		}
    </script>
    
</body>
</html>