package servlet;

import jakarta.servlet.RequestDispatcher;


import jakarta.servlet.ServletException;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Model_class;
import service.Service_class;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import org.json.JSONObject;



/**
 * Servlet implementation class servlet
 */
public class servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */

	 public servlet() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	/*
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		
		
	
	}

	/**
	 * @return 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String operation=request.getParameter("operation");
		System.out.println(operation);
		Model_class rm=new Model_class();
		Service_class rs=new Service_class();
		
		//---------------------signup------------------------
		if(operation.equals("signUp")) {
			
			System.out.println("inside the servlet-signup");
			String email=request.getParameter("email");
			String fullname=request.getParameter("fullname");
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String userlogo=request.getParameter("userlogo");
			
			rm.setEmail(email);
			rm.setFullname(fullname);
			rm.setUsername(username);
			rm.setPassword(password);
			rm.setUserlogo(userlogo);
			int a=rs.insert(rm);
			
			if(a==0) {
				response.sendRedirect("login.jsp");
			}
			else {
				response.sendRedirect("signup.jsp");
			}
		}
		//---------------------user-delete----------------------
		else if(operation.equals("delete")) {
			System.out.println("inside user-delete");
			int id=Integer.parseInt(request.getParameter("id"));
			rm.setId(id);
			
			int a=rs.delete(rm);
			
			if(a==0) {
				System.out.println("success");
				response.sendRedirect("admin.jsp");
			}
			else {
				response.sendRedirect("Error.jsp");
			}
		}
		//---------------------recipe-delete----------------------
		else if(operation.equals("delete-recipe")) {
			System.out.println("inside recipe-delete");
			int id=Integer.parseInt(request.getParameter("id"));
			rm.setId(id);
			int a=rs.deleteRecipe(rm);
			
			if(a==0) {
				System.out.println("success");
				response.sendRedirect("admin.jsp");
			}
			else {
				response.sendRedirect("Error.jsp");
			}			
		}
		//---------------------update-admin---------------------
		else if(operation.equals("update")) {
			
			int id=Integer.parseInt(request.getParameter("id"));
			String username=request.getParameter("username");
			String fullname=request.getParameter("fullname");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String type=request.getParameter("type");
	
			rm.setId(id);
			rm.setUsername(username);
			rm.setFullname(fullname);
			rm.setEmail(email);
			rm.setPassword(password);
			rm.setType(type);
			int a=rs.update(rm);
			
			if(a==0) {
				System.out.println("success");
				response.sendRedirect("admin.jsp");
			}
			else {
				response.sendRedirect("Error.jsp");
			}
		}
		
		//------------------------------updateUser--------------
		else if(operation.equals("updateUser")) {
			
			int id=Integer.parseInt(request.getParameter("id"));
			String username=request.getParameter("username");
			String fullname=request.getParameter("fullname");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String userlogo=request.getParameter("userlogo"); 
	
			rm.setId(id);
			rm.setUsername(username);
			rm.setFullname(fullname);
			rm.setEmail(email);
			rm.setPassword(password);
			rm.setUserlogo(userlogo);
			int a=rs.updateUser(rm);
			
			if(a==0) {
				System.out.println("success");
				response.sendRedirect("userDetail.jsp");
			}
			else {
				response.sendRedirect("Error.jsp");
			}
		}
		
		//---------------------update-recipe---------------------
		else if(operation.equals("update-recipe")) {
			
			int id=Integer.parseInt(request.getParameter("id"));
			String username=request.getParameter("username");
			String foodname=request.getParameter("foodname");
			int calorie= Integer.parseInt(request.getParameter("calorie")); 	
			String recipe=request.getParameter("recipe");
			String category=request.getParameter("category");
			String imglink=request.getParameter("imglink");
			String recipeDes=request.getParameter("recipeDes");
			
			rm.setId(id);
			rm.setUsername(username);
			rm.setFoodname(foodname);
			rm.setCalorie(calorie);
			rm.setRecipe(recipe);
			rm.setCategory(category);
			rm.setImgLink(imglink);
			rm.setRecipeDes(recipeDes);
			
			int a=rs.updateRecipe(rm);
				
			if(a==0) {
				System.out.println("success");
				response.sendRedirect("admin.jsp");
			}
			else {
				System.out.println("error");
			}
		}
		//-----------------------log-in--------------------------
		
		else if(operation.equals("login")) {
		
			String username=request.getParameter("username");
			String password=request.getParameter("password");
		
			rm.setUsername(username);
			rm.setPassword(password);
			
			rm=rs.login(username,password);
		
			int id=rm.getId();
			String userName=rm.getUsername();
			String fullname=rm.getFullname();
			String email=rm.getEmail();
			String Userpassword=rm.getPassword();
			String userType=rm.getType();
			String userlogo=rm.getUserlogo();
			
			 if(userType.equals("admin")) {
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("admin.jsp");
				Cookie usercookie=new Cookie("username",userName);
				Cookie passcookie=new Cookie("password",Userpassword);
				response.addCookie(usercookie);
				response.addCookie(passcookie);
				
				requestDispatcher.forward(request,response);
			}
			else {
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("user.jsp");
				ArrayList<Object> userdetails=new ArrayList<Object>();
				userdetails.add(id);
				userdetails.add(userName);
				userdetails.add(fullname);
				userdetails.add(email);
				userdetails.add(Userpassword);
				userdetails.add(userlogo);
				
				System.out.println(userdetails);
				
				Cookie usercookie=new Cookie("username",userName);
				Cookie passcookie=new Cookie("password",Userpassword);
				response.addCookie(usercookie);
				response.addCookie(passcookie);
				
				request.setAttribute("userdetail", userdetails);
				requestDispatcher.forward(request,response);
			}	
		}
		
		//---------------------recipie-insert------------------------
		else if(operation.equals("recipebtn")) {
			
			Cookie[] cookies=request.getCookies();
			String usercookie = null;
			
			if(cookies[0].getName().equals("username")) {
					usercookie=cookies[0].getValue();
			}
			else if(cookies[1].getName().equals("username")){
					usercookie=cookies[1].getValue();
			}
			else{
					usercookie=cookies[2].getValue();
			}
			
			System.out.println("inside the veg-recipie-insertion");
			String foodname=request.getParameter("foodname");
			int calorie= Integer.parseInt(request.getParameter("calorie"));
			String recipe=request.getParameter("recipe");
			String imgLink=request.getParameter("imgLink");
			String recipeDes=request.getParameter("recipeDescription");
			String category=request.getParameter("category");
			String type=request.getParameter("type");
			String url=request.getParameter("url");
			
			
			rm.setUsername(usercookie);
			rm.setFoodname(foodname);
			rm.setCalorie(calorie);
			rm.setRecipe(recipe);
			rm.setImgLink(imgLink);
			rm.setRecipeDes(recipeDes);
			rm.setCategory(category);
			rm.setType(type);
			
			
			int a=rs.recipieInsert(rm);
			System.out.println(request);
			if(a==0) {
				
				response.sendRedirect(url);
			}
			else {
				System.out.println("");
			}
		}
		//-------------------------recipeVideoInsert---------------------
		else if(operation.equals("addrecipevideoAdmin")) {
			
			Cookie[] cookies=request.getCookies();
			String usercookie = null;
			
			if(cookies[0].getName().equals("username")) {
					usercookie=cookies[0].getValue();
			}
			else if(cookies[1].getName().equals("username")){
					usercookie=cookies[1].getValue();
			}
			else{
					usercookie=cookies[2].getValue();
			}
			
			String foodname=request.getParameter("foodname");
			int calorie= Integer.parseInt(request.getParameter("calorie"));
			String recipe=request.getParameter("recipe");
			String imgLink=request.getParameter("imgLink");
			String recipeDes=request.getParameter("recipeDescription");
			String ingredients=request.getParameter("ingredients");
			String needed=request.getParameter("needed");
			String duration=request.getParameter("duration");
			String videoLink=request.getParameter("videoLink");
			
			rm.setUsername(usercookie);
			rm.setFoodname(foodname);
			rm.setCalorie(calorie);
			rm.setRecipe(recipe);
			rm.setImgLink(imgLink);
			rm.setRecipeDes(recipeDes);
			rm.setIngredients(ingredients);
			rm.setNeeded(needed);
			rm.setDuration(duration);
			rm.setVideoLink(videoLink);
			
			int a=rs.resipeVideoInsert(rm);
			
			if(a==0) {
				System.out.println("success");
				response.sendRedirect("admin.jsp");
			}
			else {
				System.out.println("error");
			}
		}
		
		//----------------------------------------------------
		else if(operation.equals("addrecipevideoUser")) {
			
			Cookie[] cookies=request.getCookies();
			String usercookie = null;
			
			if(cookies[0].getName().equals("username")) {
					usercookie=cookies[0].getValue();
			}
			else if(cookies[1].getName().equals("username")){
					usercookie=cookies[1].getValue();
			}
			else{
					usercookie=cookies[2].getValue();
			}
			
			String foodname=request.getParameter("foodname");
			int calorie= Integer.parseInt(request.getParameter("calorie"));
			String recipe=request.getParameter("recipe");
			String imgLink=request.getParameter("imgLink");
			String recipeDes=request.getParameter("recipeDescription");
			String ingredients=request.getParameter("ingredients");
			String needed=request.getParameter("needed");
			String duration=request.getParameter("duration");
			String videoLink=request.getParameter("videoLink");
			
			rm.setUsername(usercookie);
			rm.setFoodname(foodname);
			rm.setCalorie(calorie);
			rm.setRecipe(recipe);
			rm.setImgLink(imgLink);
			rm.setRecipeDes(recipeDes);
			rm.setIngredients(ingredients);
			rm.setNeeded(needed);
			rm.setDuration(duration);
			rm.setVideoLink(videoLink);
			
			int a=rs.resipeVideoInsert(rm);
			
			if(a==0) {
				System.out.println("success");
				response.sendRedirect("userDetail.jsp");
			}
			else {
				System.out.println("error");
			}
		}
		
		//-------------------------recipeVideoDelete----------
		
		else if(operation.equals("delete-recipe-video")) {
			System.out.println("inside recipe-video-delete");
			int id=Integer.parseInt(request.getParameter("id"));
			rm.setId(id);
			
			int a=rs.deleteRecipeVideo(rm);
			
			if(a==0) {
				System.out.println("success");
				response.sendRedirect("admin.jsp");
			}
			else {
				response.sendRedirect("Error.jsp");
			}
		}
		//-------------------------recipeVideoDeleteUSER----------
		
				else if(operation.equals("delete-recipe-video-User")) {
					System.out.println("inside recipe-video-delete");
					int id=Integer.parseInt(request.getParameter("id"));
					rm.setId(id);
					
					int a=rs.deleteRecipeVideo(rm);
					
					if(a==0) {
						System.out.println("success");
						response.sendRedirect("userDetail.jsp");
					}
					else {
						response.sendRedirect("Error.jsp");
					}
				}
		
		//-------------------------recipeVideoUpdate--------------------
		else if(operation.equals("update-recipe-video")) {
			
			int id=Integer.parseInt(request.getParameter("id"));
			String foodname=request.getParameter("foodname");
			int calorie= Integer.parseInt(request.getParameter("calorie"));
			String recipe=request.getParameter("recipe");
			String imgLink=request.getParameter("imgLink");
			String recipeDes=request.getParameter("recipeDescription");
			String ingredients=request.getParameter("ingredients");
			String needed=request.getParameter("needed");
			String duration=request.getParameter("duration");
			String videoLink=request.getParameter("videoLink");
			
			rm.setId(id);
			rm.setFoodname(foodname);
			rm.setCalorie(calorie);
			rm.setRecipe(recipe);
			rm.setImgLink(imgLink);
			rm.setRecipeDes(recipeDes);
			rm.setIngredients(ingredients);
			rm.setNeeded(needed);
			rm.setDuration(duration);
			rm.setVideoLink(videoLink);
			
			int a=rs.recipeVideoUpdate(rm);
				
			if(a==0) {
				System.out.println("success");
				response.sendRedirect("admin.jsp");
			}
			else {
				System.out.println("error");
			}
		}
		
		//-------------------------recipeVideoUpdateUSER--------------------
				else if(operation.equals("update-recipe-video-Update")) {
					
					int id=Integer.parseInt(request.getParameter("id"));
					String foodname=request.getParameter("foodname");
					int calorie= Integer.parseInt(request.getParameter("calorie"));
					String recipe=request.getParameter("recipe");
					String imgLink=request.getParameter("imgLink");
					String recipeDes=request.getParameter("recipeDescription");
					String ingredients=request.getParameter("ingredients");
					String needed=request.getParameter("needed");
					String duration=request.getParameter("duration");
					String videoLink=request.getParameter("videoLink");
					
					rm.setId(id);
					rm.setFoodname(foodname);
					rm.setCalorie(calorie);
					rm.setRecipe(recipe);
					rm.setImgLink(imgLink);
					rm.setRecipeDes(recipeDes);
					rm.setIngredients(ingredients);
					rm.setNeeded(needed);
					rm.setDuration(duration);
					rm.setVideoLink(videoLink);
					
					
					int a=rs.recipeVideoUpdate(rm);
						
					if(a==0) {
						System.out.println("success");
						response.sendRedirect("userDetail.jsp");
					}
					else {
						System.out.println("error");
					}
				}
			
		//-------------------------commentbtn-------------------------
		
		else if(operation.equals("commentBtn")) {
			
			
			Cookie[] cookies=request.getCookies();	
			String usercookie = null;
		
			
			if(cookies[0].getName().equals("username")) {
					usercookie=cookies[0].getValue();
			}
			else if(cookies[1].getName().equals("username")){
					usercookie=cookies[1].getValue();
			}
			else{
					usercookie=cookies[2].getValue();
			}
		

			String comments=request.getParameter("comments");
			String category=request.getParameter("category");
			int foodRecipeId=Integer.parseInt(request.getParameter("foodRecipeId"));
			String url=request.getParameter("url");
		
			
			rm.setComments(comments);
			rm.setUsername(usercookie);
			rm.setCategory(category);
			rm.setFoodRecipeId(foodRecipeId);
			
			
			int c=rs.commentInsert(rm);
			
			if(c==0) {
				response.sendRedirect(url);		
			}
			else {
				System.out.println("error in comment Insertion");
			}		
		}
		
		//--------------------------like----------------------
		else if(operation.equals("liked")) {
			System.out.println("inside like");
			try {
				System.out.println("this");
				Cookie[] cookies=request.getCookies();	
				String usercookie = null;
			
				if(cookies[0].getName().equals("username")) {
						usercookie=cookies[0].getValue();
				}
				else if(cookies[1].getName().equals("username")){
						usercookie=cookies[1].getValue();
				}
				else{
						usercookie=cookies[2].getValue();
				}
				
				String liked=request.getParameter("like");
				int foodRecipeId=Integer.parseInt(request.getParameter("foodRecipeId"));
				System.out.println(liked);
				String category=request.getParameter("category");
				
				rm.setUsername(usercookie);
				rm.setLiked(liked);
				rm.setFoodRecipeId(foodRecipeId);
				rm.setCategory(category);
				
				int d=rs.likeinsert(rm);
				
				if(d==0) {
					response.sendRedirect("veg.jsp");
				}
				else {
					
				}
							
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		//--------------unlike------------
		else if(operation.equals("unliked")) {
			System.out.println("inside unlike");
			try {
				
				Cookie[] cookies=request.getCookies();	
				String usercookie = null;
			
				if(cookies[0].getName().equals("username")) {
						usercookie=cookies[0].getValue();
				}
				else if(cookies[1].getName().equals("username")){
						usercookie=cookies[1].getValue();
				}
				else{
						usercookie=cookies[2].getValue();
				}
				
			
				String liked=request.getParameter("like");
				int foodRecipeId=Integer.parseInt(request.getParameter("foodRecipeId"));
				String category=request.getParameter("category");			
				
				rm.setUsername(usercookie);
				rm.setLiked(liked);
				rm.setFoodRecipeId(foodRecipeId);
				rm.setCategory(category);
				
				int d=rs.unlike(rm);
				
				if(d==0) {
					response.sendRedirect("veg.jsp");
				}
				else {
					
				}
							
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		//------------------------recipe search----------
		else if(operation.equals("recipeSearch")) {
			
			String recipeName=request.getParameter("recipeName");
			String category=request.getParameter("category");
			String type=request.getParameter("type");
			
			rm.setRecipeName(recipeName);
			rm.setCategory(category);
			rm.setType(type);
				
			ArrayList<Model_class> arrRecipename=rs.recipeSearch(rm);
			
			if(arrRecipename != null) {
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				
				ArrayList<Object> recipesendArr=new ArrayList<Object>();
						
				for(Model_class allrecipearr:arrRecipename) {
					String name=allrecipearr.getFoodname();
					int fid=allrecipearr.getId();
					String fooduser=allrecipearr.getUsername();
					int calorie=allrecipearr.getCalorie();
					String recipe=allrecipearr.getRecipe();
					String recipecategory=allrecipearr.getCategory();
					String imglink=allrecipearr.getImgLink();
					String recipedescription=allrecipearr.getRecipeDes();
					String allrecipe="{\"name\":\""+name+"\",\"fid\":"+fid+",\"fooduser\":\""+fooduser+"\",\"calorie\":"+calorie+",\"recipe\":\""+recipe+"\",\"category\":\""+recipecategory+"\",\"imglink\":\""+imglink+"\",\"recipedescription\":\""+recipedescription+"\"}";
					recipesendArr.add(allrecipe);
				}
				System.out.println(recipesendArr);

				// Write JSON to response
				PrintWriter out = response.getWriter();
				out.print(recipesendArr);
				out.flush();
			
		
			}
			else {System.out.println("707");
				PrintWriter out = response.getWriter();
				out.print("0");
				out.flush();
			}
		}
		//---------------------------fav-----------------------------------------
		else if(operation.equals("fav")){
			String favr=request.getParameter("favorite");
			
			int fid=Integer.parseInt(request.getParameter("foodid"));
			String img=request.getParameter("imgLink");
			Cookie[] cookies=request.getCookies();
			String usercookie = null;
			
			if(cookies[0].getName().equals("username")) {
					usercookie=cookies[0].getValue();
			}
			else if(cookies[1].getName().equals("username")){
					usercookie=cookies[1].getValue();
			}
			else{
					usercookie=cookies[2].getValue();
			}

			
			rm.setFavorite(favr);
			rm.setFoodRecipeId(fid);
			rm.setUsername(usercookie);
			rm.setImgLink(img);
			
			int returnValue=rs.favorite(rm);
			
			
			PrintWriter out = response.getWriter();
			out.print(returnValue);
			out.flush();

		}
		//-------------------------userbtn-----------------------------
		
		
		doGet(request, response);
	}
}

