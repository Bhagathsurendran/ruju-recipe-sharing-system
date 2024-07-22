<%@page import="service.Service_class"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Model_class"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/main_project/css/category.css" rel="stylesheet" type="text/css">
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
	*{
	font-family: sans-serif;
	}
	.poppins-medium {
	      font-family: "Poppins", sans-serif;
	      font-weight: 500;
	      font-style: normal;
	 }
	 .card-holder{
		gap: 50px;
		display: grid;
		grid-template-columns: 1fr 1fr 1fr;
		justify-items: center;
	}
	.card {
		border: 2px solid black;
		width: 350px;
		position: relative;
		overflow: hidden;
		height: 350px;
		border-radius: 10px;
		color: black;
		
	}
	.card-img{
		display: flex;align-items: center;justify-content: center;
	}
	.card-img h1{
		position: absolute;z-index: 1;color: white;font-weight: 600;text-transform: uppercase;font-size: 45px;
	}
	.image {
	  background-size: cover;background-repeat: no-repeat;width: 100%;height: 350px;opacity: .8.5;
	}
	
	.card-text {
		display: flex;flex-direction: column;align-items: center;z-index: 2;
		color: black;
		background-color: rgba(255, 255, 255, 0.975);
		position: absolute;
		top: 0;
		left: -100%;
		width: 100%;
		height: 100%;
		padding: 20px;
		box-sizing: border-box;
		transition: all .6s;
	}
	.card-text h1{
		font-size: 30px;
		margin-bottom: 15px;margin-top: 0;
	}
	.card-text p{
		text-align: justify;width: 80%;height: 200px;overflow-y: scroll;scrollbar-width: none;margin-bottom: 0;
	}
	.card-text button{
		color: white;
		margin-top: 20px;
		height: 40px;
		width: 200px;
		border-radius: 20px;
		border: none;
		transition: .3s;
		background-color:black; 
		font-size: 18px;
		font-weight: 600;
	}
	.card-text button:hover{
		scale:1.1; 
	}
	.card:hover .card-text{
		left: 0;   
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
.plus{
            height:350px;
            width:350px;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 1px solid white;
            border-radius: 10px;   
            transition: .3s;
        }
        .plus:hover{
            scale: 1.1;
        }
	
</style>
</head>
<%
	String cat=request.getParameter("category");
	String type=request.getParameter("type");
	String url="typeTemplate.jsp?category="+cat+"&type="+type;
	
	Model_class sendReq=new Model_class();
	
	sendReq.setCategory(cat);
	sendReq.setType(type);
	
	Service_class rs=new Service_class();
	
	

	ArrayList<Model_class> arr=rs.getRecipe(sendReq);
	
	ArrayList<Model_class> arr2=rs.getRecipeComments(sendReq);
	
	ArrayList<Model_class> arr3=rs.getLikeCount();
	
	Cookie cookie=null; 
	Cookie[] cookies=null;
	cookies=request.getCookies();
%>
<%
//comments
String allComments="";

for(Model_class dm:arr2){
	allComments=dm.getComments();
	
}
String[] comments = allComments.split(";");


//like
String allLikes="";
for(Model_class fm:arr3){
	allLikes=fm.getLikeCount();
	
}
String[] likes = allLikes.split(";");
%>
<body>
    <div id="scollhere" style="width: 100%;"></div>	
        <div id="modal-holder-2" style="margin-top: 3rem;">
            <div class="recipe-modal">
                <h1 style="font-family: sans-serif;">Add recipe</h1>
                <br>
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
                       <br>
                       <input type="text" value="<%=cat%>" name="category" id="category" style="display: none;"/>
                       <input type="text" value="<%=type%>" name="type" id="type" style="display: none;"/>
                       <input type="text" value="<%=url%>" name="url" id="url" style="display: none;"/>
                       
                    <button style="margin-top: 15px;" type="submit" class="recipe-modal-btn" value="recipebtn" id="recipebtn" name="operation">Submit</button>
    
                 </form>
            </div>
            <div onclick="closebtn2()" class="" style="cursor: pointer;margin-top: 1rem;margin-right: 1rem;">
                X
            </div>
        </div>
        
        <!-- navbar -->
        <nav>
            <div class="na-logo">
                <a href="/main_project/user.jsp" class="nav-logo-text">रूजी</a>
             </div>
             <div class="na-input">
                    <input type="text" name="recipeName" id="recipeName" placeholder="Search">
                    <button onclick="recipeSearch()" type="submit" value="recipeSearchbtn" id="recipeSearchbtn" name="operation" style="border-radius: 50%;">GO</button>       	
             </div>
        </nav>
        
        
        
        <section style="margin-top: 4.5rem;">
            <div id="btnCloseRecipe" style="display: none;" class="btnCloseRecipe" onclick="btnCloseRecipe()" >X</div>
            <div id="recipeSearchView" style=" overflow-y: scroll;">
                <div id="searchCardHolder" class="" style="display: flex;gap: 50px;width: max-content;padding-left: 5%;padding-right: 5%;">
        
        
                </div>
                
            </div>
        </section>
        
<div style="display: flex;justify-content: space-between;">     
	<div class="dropdown-holder" style="margin-left: 1.5rem;">
	    <div class="dropdown" onclick="window.location.href='user.jsp'">
	      <button class="dropbtn">HOME ></button>
	      <div class="dropdown-content">
	        <a href="/main_project/veg.jsp">VEG</a>
	        <a href="/main_project/nonveg.jsp">NON-VEG</a>
	        <a href="/main_project/recipeVideo.jsp">VIDEOS</a>
	      </div>
	    </div> 
	
	    <div class="dropdown" onclick="window.location.href='<%=cat.toLowerCase()%>.jsp'">
	      <button class="dropbtn"><%=cat.toUpperCase()%> ></i>
	      </button>
	      <div class="dropdown-content">
	        <a href="typeTemplate.jsp?category=<%=cat.toLowerCase()%>&type=breakfast">BREAKFAST</a>
	        <a href="typeTemplate.jsp?category=<%=cat.toLowerCase()%>&type=lunch">LUNCH</a>
	        <a href="typeTemplate.jsp?category=<%=cat.toLowerCase()%>&type=dinner">DINNER</a>
	        <a href="typeTemplate.jsp?category=<%=cat.toLowerCase()%>&type=dessert">DESSERT</a>
	      </div>
	    </div>
	    
	    <div class="dropdown" onclick="">
	      <button class="dropbtn"><%=type.toUpperCase() %></button>
	    </div> 
	
	</div>
    <div>
    	<%try{ %>
                    <%if(cookies[0].getName().equals("username")){ %>
                        <% if(cookies[0].getValue().equals("")){%>
                        
                            
                        <%}else{ %>
                                  <div class="c-box plus" style="height: 70px;width: 200px;margin-right: 2rem;" onclick="addItem()">
							        <h1 style="font-weight: 800;font-size: 80px;color: white;">+</h1>                
							      </div>      			 		
                                  <% }%>
                     <%}else if(cookies[1].getName().equals("username")){ %>
                              <% if(cookies[1].getValue().equals("")){%>
                        
                            
                        <%}else{ %>
                                   <div class="c-box plus" style="height: 70px;width: 200px;margin-right: 2rem;" onclick="addItem()">
							          <h1 style="font-weight: 800;font-size: 80px;color: white;">+</h1>                
							       </div>          			 		
                                  <% }%>
                  <%}else if(cookies[2].getName().equals("username")) {%>
                          <% if(cookies[2].getValue().equals("")){%>
                        
                            
                        <%}else{ %>
                                   <div class="c-box plus" style="height: 70px;width: 200px;margin-right: 2rem;" onclick="addItem()">
							        <h1 style="font-weight: 800;font-size: 80px;color: white;">+</h1>                
							       </div>         			 		
                                  <% }%>
                     <%}else{ %>
                             
                                                
                     <% }%>
            <%}catch(Exception e) {%>
                   
            <% }%>
    </div>
</div>           
        <!-- section-1 -->
    
       
    
        <!-- section-2 -->
   		
    
    
        <!-- section-3 -->
        <div style="margin-top: 3rem;margin-left: 4rem;">
        	<h1 style="color: white;font-family: poppins;font-size: 50px;">Recipes</h1>
        </div>
        
        
        
        
        <section class="section-3" style="padding-top: 3rem;height: max-content;margin-bottom: 2rem">
            <div class="card-holder">
            <% for(Model_class rm:arr){%>
                <div class="card">
                    <div class="card-img poppins-medium">
                        <h1><%=rm.getFoodname() %></h1>
                        <img src="<%=rm.getImgLink() %>" alt="Avatar" class="image">
                    </div>
                    <div class="card-text poppins-medium">
                        <div style="display: flex;flex-direction: column;align-items: center;">
                            <h1>Description</h1>
                            <p><%=rm.getRecipeDes() %></p>
                            <p style="display:none;"><%=rm.getId() %></p>					
                        </div>
                        <button onclick="modal(this)">GET THE RECIPE</button>
                    </div>
                    
                    
                        <div style="height: 650px;width: 1200px;position: fixed;top:50%;border-radius: 15px;transform:translate(-50%,-50%);left:50%;z-index:100;display: none;cursor: default;border: 2px solid gray;overflow: hidden;">
                                         
                            
                            <div class="" style="display: flex;flex-direction: column;gap: 20px;padding-top: 20px;padding-left: 20px;width: 50%;background-color: white;overflow-y: scroll;">
                            	<img style="width: 97%;height: 300px;background-size: cover;" src="<%=rm.getImgLink() %>" alt="">
                                <h1>By, <%=rm.getUsername() %></h1>
                                <h3 style="display: none;"><%=rm.getId() %></h3>
                           
                                <h1>Recipe for: <%= rm.getFoodname()%></h1>
                                 <P style="width: 550px;text-align: left;padding: 1%;line-height: 30px"><%= rm.getRecipe()%></P>
                            </div>
                            
                             <div class="" style="display: flex;flex-direction: column;width: 50%;background-color: rgb(0, 0, 0);">
                             
                                <div class="" style="height: 10%;width: 100%;background-color: rgb(0, 0, 0);border-bottom: 1px solid gray;">
                                    
            
                                    <div style="color: white;padding: 1rem;">Total Like: 
                                    
                                    <% 
                                    int index=0;
                                         for(String like:likes){
                                                    
                                             
                                            
                                             String cId="&"+rm.getId()+":" ;
                                            
                                            if(like.contains(cId)){
                                                     
                                                String thisId="&"+rm.getId()+":";                       						
                                                String[] singleLike=like.split(thisId);                        							
                                                        
                                                for(String sl:singleLike){
                                                    index++;   
                                                }    		
                                              }      
                                                                                   
                                        }
                                    %>
                                    
                                            <p style="color: white;"> <%=index %></p>
                                                    
                                                          
                                    </div>
                                    <div style="display: flex;justify-content: right;margin-top: -4rem;">                        	
                                        <span style="margin-top: 1rem;cursor: pointer;text-align: right;position: relative;z-index: 101;width: 30px;height: 30px;margin: 0;display: flex;align-items: center;justify-content: center;color: white;padding: 2%;" onclick="closebtn(this)">
                                            X
                                        </span>
                                    </div>	
                                </div>
                                
                                <div class="" style="height: 80%;width: 100%;background-color: rgb(0, 0, 0);overflow-y: scroll;scrollbar-width:none;">
                                    <div style="display: flex;align-items: center;padding: 2%;gap:10px;">                  	                       	  			
                                            <div style="color: white;">
                                            
                                                <% for(String comment:comments){%>
                                                    
                                                    <% 	String id=""+rm.getId();	%>
                                                        <% String cId="&"+rm.getId()+"@" ;%>
                                                        
                                                        <% if(comment.contains(cId)){%>
                                                        <% 
                                                            
                                                            String thisId="&"+rm.getId();                       						
                                                            String[] singleComment=comment.split(thisId);
                                                        %>
                                                        <div style="display: flex;width: 100%;align-items: center;gap:10px;margin-bottom: 1rem;">
                                                                <img alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQna96LOHsB0K43Ybx1vGQyqq4IKX9k_1xW_am2qdgT-Q&s" style="height: 40px;width: 40px;border-radius: 50%;">
                                                            <% for(String sc:singleComment){%>
                                                            <p style="color: white;"><%=sc %></p>	
                                                            <% }%>	
                                                            </div>
                                                      <% }%>               					
                                                <% }%>
                                     
                                            </div>              			                                 		
                                    </div>
                                </div>
                                   
                               <div class="like-login" style="height: 10%;width: 100%;display: flex;border-top: 1px solid gray;justify-content: center;align-items: center;">
                                    
                               
                                
                                </div>                      
                            </div>                    		        
                        </div>
                </div>
            <%	 }%>
            
                </div>
        </section>
        
        <section style="background-color: black;width: 100%;height: 260px;display: flex;justify-content: space-between;align-items: center;border-top: 2px solid gray;margin-top: 50px;">
		        <div class="" style="margin-left: 8rem;">
		            <h1 style="color: white;font-size: 100px;">रूजी</h1>
		            
		        </div>
		        <div class="" style="display: flex;flex-direction: column;gap: 10px;">
		            <h1 style="color: white;font-size: 35px;">Explore</h1>
		            <a href="/main_project/user.jsp">Home</a>
		            <a href="/main_project/<%=cat.toLowerCase()%>.jsp"><%=cat.toUpperCase()%> </a>
		            
		        </div>
		        <div class="" style="display: flex;flex-direction: column;gap: 10px;margin-top: -50px;margin-right: 10rem;">
		            <h1 style="color: white;font-size: 35px;">Follow</h1>
		            <div class="" style="color: white;display: flex;gap: 30px;margin-top: 20px;">
		
		                <i class="fa-brands fa-facebook fa-2xl"></i>
		                <i class="fa-brands fa-twitter fa-2xl" style="color: #ffffff;"></i>
		                <i class="fa-brands fa-instagram fa-2xl"></i>
            		</div>
        		</div>
    </section>
        
        
        <script>
    
    
            // for search function (SF1)
                function searchModal(e){
                    let fid = e.previousElementSibling.children[2].innerText
    
                    console.log(fid)
    
                    let allCard = document.getElementsByClassName('card-holder')[0].children
    
                    for(i=0;i<allCard.length;i++){
    
                        if(allCard[i].className == "c-box plus"){
                            continue;
                        }else{
                            if(fid == allCard[i].children[1].children[0].children[2].innerText){
                                allCard[i].children[1].children[1].click();
                            }
                        }
    
                        
                        
                    }
                }
    
            // (SF1)
    
    
    
                let recipesearch=document.getElementById('recipeSearchView')
    
                function recipeSearch(){
                    
                
                    document.getElementById('btnCloseRecipe').style.display = 'flex'
                    document.getElementById('scollhere').scrollIntoView()
                    
                    recipesearch.style.display ='flex'
                    let searchValue=document.getElementById('recipeName').value
                    console.log(searchValue)
                    
                        var details = {					
                            'recipeName': searchValue+'%',
                            'operation': 'recipeSearch',
                            'category': '<%=cat%>',
                            'type':'<%=type%>'
                            };
                    
                    var formBody = [];
                    for (var property in details) {
                    
                    var encodedKey = encodeURIComponent(property);
                    var encodedValue = encodeURIComponent(details[property]);
                    formBody.push(encodedKey + "=" + encodedValue);
    
                    }
                    formBody = formBody.join("&");
    
    
    
                    // '{"x":5,"y":6}'
                    
                    fetch('servlet',{
                        method:'post',
                        headers: {'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'},
                        body:formBody
                        
                    }).then(response => {
                            return response.json()
                            })
                            .then(data => {
                                let elementHolder = document.getElementById('searchCardHolder')
                                elementHolder.innerHTML=''
                                console.log(data)
                                if(data.length >0){
                                        for(i=0;i<data.length;i++){
                                            let name = data[i].name
                                            let recipeDesc = data[i].recipedescription
                                            let id = data[i].fid
                                            let img = data[i].imglink
    
                                            
                                            
                                        
                                        elementHolder.innerHTML = elementHolder.innerHTML + `<div class="card">
                                        <div class="card-img poppins-medium">
                                        <h1></h1>
                                        <img src="" alt="Avatar" class="image">
                                    </div>
                                    <div class="card-text poppins-medium">
                                        <div style="display: flex;flex-direction: column;align-items: center;">
                                            <h1>Description</h1>
                                            <p></p>
                                            <p style="display:none;"></p>
                                        </div>								
                                        <button onclick="searchModal(this)">GET THE RECIPE</button>
                                    </div>`;
    
                                        elementHolder.children[i].children[0].children[0].innerText = name;
                                        elementHolder.children[i].children[0].children[1].src = img;
                                        elementHolder.children[i].children[1].children[0].children[1].innerText = recipeDesc;
                                        elementHolder.children[i].children[1].children[0].children[2].innerText = id;
                                        
    
    
    
                                        console.log(name)
                                        console.log(recipeDesc)
    
    
                                        }
                                }
                                else{
                                    elementHolder.innerHTML='<p style="color:white;">No Item Found</p>'
                                }
    
                                
                        
                            })
                }
                            
                function btnCloseRecipe(){
                    recipesearch.style.display ='none'
                    document.getElementById('btnCloseRecipe').style.display = 'none'
                }
        </script>
    
    
    
    
    
    
    
        <!-- modal -->
        <script>
            function like(e) {
                console.log(e.parentElement.parentElement.previousElementSibling.children[2].innerText)
                if(e.children[0].attributes[1].value=='img/white.png'){
                    e.children[0].src='img/red.png'
                    // add foodRecipeId from e.parentElement (321) 
                        var details = {					
                            'like': 'like',
                            'operation': 'liked',
                            'foodRecipeId': e.parentElement.parentElement.previousElementSibling.children[2].innerText,
                            'category': '<%=cat%>'                           
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
                    e.children[0].src='img/white.png'
                    
                        var details = {					
                            'like': 'unliked',
                            'operation': 'unliked'	,
                            'foodRecipeId': e.parentElement.parentElement.previousElementSibling.children[2].innerText,
                            'category': '<%=cat%>'
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
        
            function closebtn(e){
                console.log(e.parentElement.parentElement.parentElement.parentElement)
                e.parentElement.parentElement.parentElement.parentElement.style.display='none'
            }
    
            function modal(e){ 		
                if(getCookie('username')){
                    e.parentElement.parentElement.children[2].children[1].children[2].innerHTML=`<div style="background-color: black;font-size: 25px;color: gray;border: none;padding: 2%;" onclick="like(this)"><img alt="" src="img/white.png" style="height: 32px;"></div>
                        <form action="servlet" method="post" style="width: 100%;background-color: rgb(0, 0, 0);display: flex;align-items: center;justify-content: space-around;">
                    <input type="text" name="foodRecipeId" value="" style="display:none;">
                    <input type="text" name="category" value="<%=cat%>" style="display:none;">
                    <input type="text" name="comments" id="comments" style="height: 70%;width: 450px;margin-left: 1rem;font-size: 20px;background-color: black;border: none;text-indent: 5px;color: white;" placeholder="Add a comment...">
                    <input type="text" name="url" value="<%=url%>" style="display:none;">
                    <button type="submit" value="commentBtn" id="commentBtn" name="operation" style="background-color: black;font-size: 25px;color: gray;border: none;"><img alt="" src="img/right-arrow.png" style="height: 32px;"></button> 
                </form>`;
    
                e.parentElement.parentElement.children[2].children[1].children[2].children[1].children[0].value =  e.parentElement.parentElement.children[2].children[0].children[2].innerText
    
                }
                else{
      
                    e.parentElement.parentElement.children[2].children[1].children[2].innerHTML=`<p style="color: white;"> <a  style="color: white;text-decoration: underline;" href="/main_project/login.jsp">Log in</a> to comment and like </p>`
                }
                        
                    e.parentElement.parentElement.children[2].style.display='flex'
    
              
            }
            function getCookie(cname) {
                  let name = cname + "=";
                  let decodedCookie = decodeURIComponent(document.cookie);
                  let ca = decodedCookie.split(';');
                  for(let i = 0; i <ca.length; i++) {
                    let c = ca[i];
                    while (c.charAt(0) == ' ') {
                      c = c.substring(1);
                    }
                    if (c.indexOf(name) == 0) {
                      return c.substring(name.length, c.length);
                    }
                  }
                  return "";
                }
         </script>
        
        <script>
               
           function closebtn2() {
               document.getElementById('modal-holder-2').style.display='none'
               
           }
            
        </script>
        <script>
            let modal2=document.getElementById('modal-holder-2');
            
            function addItem(){
                modal2.style.display = 'flex' 
            }
        </script>
    
        <script>
            const observer = new IntersectionObserver((entries)=>{
    
                entries.forEach((entry)=>{
    
                if(entry.isIntersecting){
                    entry.target.classList.add("show")
                }
                else{
                    entry.target.classList.remove("show")
                }
                })
                })
    
                const hiddenElements = document.querySelectorAll(".hidden"); 
    
                hiddenElements.forEach((el)=> observer.observe(el))
        </script>
        
    </body>
</html>