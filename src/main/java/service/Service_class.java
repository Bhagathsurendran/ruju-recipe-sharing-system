 package service;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.annotation.processing.Generated;

import connection.DBConnection;
import model.Model_class;

public class Service_class {
	
	Connection con=DBConnection.getConnection();
	
	
	//--------------------insert---------------------	
	public int insert(Model_class rm) {
		
		try {
			String s1="insert into user (USERNAME , FULLNAME, EMAIL, PASSWORD, TYPE, USERLOGO) values (?, ?, ?, ?, 'user' , ?)";
			PreparedStatement ps=con.prepareStatement(s1,PreparedStatement.RETURN_GENERATED_KEYS);
			
			ps.setString(1, rm.getUsername());
			ps.setString(2, rm.getFullname());
			ps.setString(3, rm.getEmail());
			ps.setString(4, rm.getPassword());
			ps.setString(5, rm.getUserlogo());
	
			ps.executeUpdate();
			
			ResultSet rs = ps.getGeneratedKeys();
			
			if(rs.next()) {
				int generatedId= rs.getInt(1);
				System.out.print("Generated ID: "+generatedId);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
//-------------------------user-view------------------------
	
	public ArrayList<Model_class> userSearch(String user){

		
		Model_class rm=null;
		ArrayList<Model_class> userarr=new ArrayList<Model_class>();
		try {
			String str="select * from user where username=?";
			PreparedStatement p=con.prepareStatement(str);
			p.setString(1, user);
			ResultSet rs=p.executeQuery();
			
			while (rs.next()) {
				rm=new Model_class();
				rm.setId(rs.getInt(1));
				rm.setUsername(rs.getString(2));
				rm.setFullname(rs.getString(3));
				rm.setEmail(rs.getString(4));
				rm.setPassword(rs.getString(5));
				rm.setType(rs.getString(6));
				rm.setUserlogo(rs.getString(7));
				userarr.add(rm);
			}
			return userarr;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return userarr;
	}
//------------------------------adminAllUser--------------------------------------	
	public ArrayList<Model_class> selectUser(){

		
		Model_class rm=null;
		ArrayList<Model_class> userarr=new ArrayList<Model_class>();
		try {
			String str="select * from user";
			PreparedStatement p=con.prepareStatement(str);
			ResultSet rs=p.executeQuery();
			
			while (rs.next()) {
				rm=new Model_class();
				rm.setId(rs.getInt(1));
				rm.setUsername(rs.getString(2));
				rm.setFullname(rs.getString(3));
				rm.setEmail(rs.getString(4));
				rm.setPassword(rs.getString(5));
				rm.setType(rs.getString(6));
				userarr.add(rm);
			}
			return userarr;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return userarr;
	}

//-------------------------recipe-view------------------------
	
	public ArrayList<Model_class> userAllRecipe(String user){


		Model_class rm=null;
		ArrayList<Model_class> recipearr=new ArrayList<Model_class>();
		try {
			String str="select * from recipe where username=?";
			PreparedStatement ps=con.prepareStatement(str);
			ps.setString(1, user);
			ResultSet rs=ps.executeQuery();
			
			while (rs.next()) {
				rm=new Model_class();
				rm.setId(rs.getInt(1));
				rm.setUsername(rs.getString(2));
				rm.setFoodname(rs.getString(3));
				rm.setCalorie(rs.getInt(4));
				rm.setRecipe(rs.getString(5));
				rm.setCategory(rs.getString(6));
				rm.setImgLink(rs.getString(7));
				rm.setRecipeDes(rs.getString(8));
				recipearr.add(rm);
			}
			return recipearr;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return recipearr;
	}
//----------------------------------------recipeSearchbtnVeg------------------------
	public ArrayList<Model_class> recipeSearch(Model_class pm){
		
		Model_class rm=null;
		ArrayList<Model_class> ArrRE=new ArrayList<Model_class>();
		
		try {
			String str="SELECT * FROM `recipe` WHERE category=? AND type=? AND foodname LIKE ?";
			PreparedStatement ps=con.prepareStatement(str);
			ps.setString(1, pm.getCategory());
			ps.setString(2, pm.getType());
			ps.setString(3, pm.getRecipeName());
			
			System.out.println(ps);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				rm=new Model_class();
				rm.setId(rs.getInt(1));
				rm.setUsername(rs.getString(2));
				rm.setFoodname(rs.getString(3));
				rm.setCalorie(rs.getInt(4));
				rm.setRecipe(rs.getString(5));
				rm.setCategory(rs.getString(6));
				rm.setImgLink(rs.getString(7));
				rm.setRecipeDes(rs.getString(8));
				ArrRE.add(rm);
			}
			System.out.println(ArrRE);
			return ArrRE;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return ArrRE;
	}
//---------------------------------------adminAllRecipe----------------------
	
	public ArrayList<Model_class> selectRecipe(){

		Model_class rm=null;
		ArrayList<Model_class> recipearr=new ArrayList<Model_class>();
		try {
			String str="select * from recipe";
			PreparedStatement ps=con.prepareStatement(str);
			
			ResultSet rs=ps.executeQuery();
			
			while (rs.next()) {
				rm=new Model_class();
				rm.setId(rs.getInt(1));
				rm.setUsername(rs.getString(2));
				rm.setFoodname(rs.getString(3));
				rm.setCalorie(rs.getInt(4));
				rm.setRecipe(rs.getString(5));
				rm.setCategory(rs.getString(6));
				rm.setImgLink(rs.getString(7));
				rm.setRecipeDes(rs.getString(8));
				recipearr.add(rm);
			}
			return recipearr;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return recipearr;
	}
	
//-----------------------search-User-------------------
	public Model_class searchUser(int id) {

		Model_class rm=null;
		try {
			String str="select * from user where id=?";
			PreparedStatement ps=con.prepareStatement(str);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			System.out.println(ps);
			
			while (rs.next()) {
				rm=new Model_class();
				rm.setId(rs.getInt(1));
				rm.setUsername(rs.getString(2));
				rm.setFullname(rs.getString(3));
				rm.setEmail(rs.getString(4));
				rm.setPassword(rs.getString(5));
				rm.setType(rs.getString(6));
				rm.setUserlogo(rs.getString(7));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return rm;	
	}
//-----------------------search-Recipe-------------------
	public Model_class searchRecipe(int id) {

		Model_class rm=null;
		try {
			String str="select * from recipe where id=?";
			PreparedStatement ps=con.prepareStatement(str);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				rm=new Model_class();
				rm.setId(rs.getInt(1));
				rm.setUsername(rs.getString(2));
				rm.setFoodname(rs.getString(3));
				rm.setCalorie(rs.getInt(4));
				rm.setRecipe(rs.getString(5));
				rm.setCategory(rs.getString(6));
				rm.setImgLink(rs.getString(7));
				rm.setRecipeDes(rs.getString(8));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return rm;
	}
//----------------------delete-------------------------
	public int delete(Model_class rm) {

		try {
			String str="delete from user where id=?";
			PreparedStatement ps=con.prepareStatement(str);
			ps.setInt(1, rm.getId());
			System.out.println(ps);
			
			ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
//---------------------recipe-delete-------------------------
	public int deleteRecipe(Model_class rm) {

		try {
			String str="delete from recipe where id=?";
			PreparedStatement ps=con.prepareStatement(str);
			ps.setInt(1, rm.getId());
			System.out.println(ps);
			
			ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	
//--------------------update-------------------------
	public int update(Model_class rm) {

		try {
			String str="UPDATE `user` SET `username`=?,`fullname`=?,`email`=?,`password`=?,`type`=? WHERE id=?;";
			PreparedStatement ps=con.prepareStatement(str);
			ps.setString(1, rm.getUsername());
			ps.setString(2, rm.getFullname());
			ps.setString(3, rm.getEmail());
			ps.setString(4, rm.getPassword());
			ps.setString(5, rm.getType());
			ps.setInt(6, rm.getId());
			ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	//-----------------------updateuser--------------------
	
	public int updateUser(Model_class rm) {

		try {
			String str="UPDATE `user` SET `username`=?,`fullname`=?,`email`=?,`password`=?,`userlogo`=? WHERE id=?;";
			PreparedStatement ps=con.prepareStatement(str);
			ps.setString(1, rm.getUsername());
			ps.setString(2, rm.getFullname());
			ps.setString(3, rm.getEmail());
			ps.setString(4, rm.getPassword());
			ps.setString(5, rm.getUserlogo());
			ps.setInt(6, rm.getId());
			ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	//--------------------update-recipe------------------------
	public int updateRecipe(Model_class rm) {

		try{
			String str="UPDATE `recipe` SET `username`=?,`foodname`=?,`calorie`=?,`recipe`=?,`category`=?,`imglink`=?,`recipeDescription`=? WHERE id=?;";
			PreparedStatement ps=con.prepareStatement(str);
			ps.setString(1, rm.getUsername());
			ps.setString(2, rm.getFoodname());
			ps.setInt(3, rm.getCalorie());
			ps.setString(4, rm.getRecipe());
			ps.setString(5, rm.getCategory());
			ps.setString(6, rm.getImgLink());
			ps.setString(7, rm.getRecipeDes());
			ps.setInt(8, rm.getId());
			
			ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
//----------------------log-in-------------------------
	public Model_class login(String username,String password) {


		Model_class rm=null;
		try {
			String str="select * from user where username=? and password=?";
			PreparedStatement ps=con.prepareStatement(str);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				rm=new Model_class();
				rm.setId(rs.getInt(1));
				rm.setUsername(rs.getString(2));
				rm.setFullname(rs.getString(3));
				rm.setEmail(rs.getString(4));
				rm.setPassword(rs.getString(5));
				rm.setType(rs.getString(6));	
				rm.setUserlogo(rs.getString(7));
			}
			return rm;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return rm;
	}
	

//------------------------recipie-insert------------------------------

	public int recipieInsert(Model_class rm) {

		try {
			String str="insert into recipe(USERNAME ,FOODNAME , CALORIE, RECIPE , CATEGORY , imglink , recipeDescription ,type) VALUES (? , ? , ?, ?, ? , ?, ? ,?)";
			PreparedStatement ps=con.prepareStatement(str,PreparedStatement.RETURN_GENERATED_KEYS);

			ps.setString(1, rm.getUsername());
			ps.setString(2, rm.getFoodname());
			ps.setInt(3, rm.getCalorie());
			ps.setString(4, rm.getRecipe());
			ps.setString(5, rm.getCategory());
			ps.setString(6, rm.getImgLink());
			ps.setString(7, rm.getRecipeDes());
			ps.setString(8, rm.getType());
			
			
			ps.executeUpdate();
			System.out.println(ps);
			
			ResultSet rs = ps.getGeneratedKeys();
			if(rs.next()) {
				int generatedId= rs.getInt(1);
				System.out.print("Generated ID: "+generatedId);
			}	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}


	//----------------------veg-recipe-view---------------------------

public ArrayList<Model_class> getRecipe(Model_class ss){

		
		Model_class rm=null;
		ArrayList<Model_class> arr=new ArrayList<Model_class>();
		
		try {
			String str="select * from recipe where category=? AND type=?";
			PreparedStatement p=con.prepareStatement(str);
			p.setString(1, ss.getCategory());
			p.setString(2, ss.getType());
			ResultSet rs=p.executeQuery();
			
			while (rs.next()) {
				 	
				rm=new Model_class();
				rm.setId(rs.getInt(1));
				rm.setUsername(rs.getString(2));
				rm.setFoodname(rs.getString(3));
				rm.setCalorie(rs.getInt(4));
				rm.setRecipe(rs.getString(5));
				rm.setImgLink(rs.getString(7));
				rm.setRecipeDes(rs.getString(8));
				arr.add(rm);
			}
			System.out.println(arr);
			return arr;
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}

//----------------------user-recipe-view---------------------------
public ArrayList<Model_class> userRecipeView(){

	Model_class rm=null;
	ArrayList<Model_class> recipeArr=new ArrayList<Model_class>();
	
	try {
		String str="select * from recipe";
		PreparedStatement ps=con.prepareStatement(str);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			
			rm=new Model_class();
			rm.setId(rs.getInt(1));
			rm.setUsername(rs.getString(2));
			rm.setFoodname(rs.getString(3));
			rm.setCalorie(rs.getInt(4));
			rm.setRecipe(rs.getString(5));
			rm.setCategory(rs.getString(6));
			rm.setImgLink(rs.getString(7));
			rm.setRecipeDes(rs.getString(8));
			recipeArr.add(rm);	
		}
		return recipeArr;
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	return recipeArr;
}

//--------------------------recipeVideoInsert----------------------------
public int resipeVideoInsert(Model_class rm) {
	try {
		String str="insert into recipevideo (FOODNAME , CALORIE, RECIPE , IMGLINK , RECIPEDES , INGREDIENTS , NEEDED ,DURATION , VIDEOLINK , USERNAME) values (?, ?, ?, ?, ?, ?, ? , ?, ?, ?)";
		PreparedStatement ps=con.prepareStatement(str,PreparedStatement.RETURN_GENERATED_KEYS);
		ps.setString(1, rm.getFoodname());
		ps.setInt(2, rm.getCalorie());
		ps.setString(3, rm.getRecipe());
		ps.setString(4, rm.getImgLink());
		ps.setString(5, rm.getRecipeDes());
		ps.setString(6, rm.getIngredients());
		ps.setString(7, rm.getNeeded());
		ps.setString(8, rm.getDuration());
		ps.setString(9, rm.getVideoLink());
		ps.setString(10, rm.getUsername());
		ps.executeUpdate();
		
		ResultSet rs = ps.getGeneratedKeys();
		
		if(rs.next()) {
			int generatedId= rs.getInt(1);
			System.out.print("Generated ID: "+generatedId);
		}
	}
	catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return 0;
}

//-------------------------------recipeVideoView----------------
public ArrayList<Model_class> resipeVideoView(){

	Model_class rm=null;
	ArrayList<Model_class> recipeVideoview=new ArrayList<Model_class>();
	
	try {
		String str="select * from recipevideo";
		PreparedStatement ps=con.prepareStatement(str);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			rm=new Model_class();
			rm.setId(rs.getInt(1));
			rm.setFoodname(rs.getString(2));
			rm.setCalorie(rs.getInt(3));
			rm.setRecipe(rs.getString(4));
			rm.setImgLink(rs.getString(5));
			rm.setRecipeDes(rs.getString(6));
			rm.setIngredients(rs.getString(7));
			rm.setNeeded(rs.getString(8));
			rm.setDuration(rs.getString(9));
			rm.setVideoLink(rs.getString(10));
			rm.setUsername(rs.getString(11));
			recipeVideoview.add(rm);	
		}
		return recipeVideoview;
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	return recipeVideoview;
}

//----------------------------resipeVideoViewUser------------

public ArrayList<Model_class> resipeVideoViewUser(String user){

	Model_class rm=null;
	ArrayList<Model_class> resipeVideoViewUser=new ArrayList<Model_class>();
	
	try {
		String str="select * from recipevideo where username=?";
		PreparedStatement ps=con.prepareStatement(str);
		ps.setString(1, user);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			rm=new Model_class();
			rm.setId(rs.getInt(1));
			rm.setFoodname(rs.getString(2));
			rm.setCalorie(rs.getInt(3));
			rm.setRecipe(rs.getString(4));
			rm.setImgLink(rs.getString(5));
			rm.setRecipeDes(rs.getString(6));
			rm.setIngredients(rs.getString(7));
			rm.setNeeded(rs.getString(8));
			rm.setDuration(rs.getString(9));
			rm.setVideoLink(rs.getString(10));
			rm.setUsername(rs.getString(11));
			resipeVideoViewUser.add(rm);	
		}
		return resipeVideoViewUser;
		
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	return resipeVideoViewUser;
}
//-----------------------------searchRecipeVideo-----------------------
public Model_class searchRecipeVideo(int id) {

	Model_class rm=null;
	try {
		String str="select * from recipevideo where id=?";
		PreparedStatement ps=con.prepareStatement(str);
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			rm=new Model_class();
			rm.setId(rs.getInt(1));
			rm.setFoodname(rs.getString(2));
			rm.setCalorie(rs.getInt(3));
			rm.setRecipe(rs.getString(4));
			rm.setImgLink(rs.getString(5));
			rm.setRecipeDes(rs.getString(6));
			rm.setIngredients(rs.getString(7));
			rm.setNeeded(rs.getString(8));
			rm.setDuration(rs.getString(9));
			rm.setVideoLink(rs.getString(10));
			rm.setUsername(rs.getString(11));
		}
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	return rm;
}

//---------------------------deleteRecipeVideo--------------------------------
	public int deleteRecipeVideo(Model_class rm) {

		try {
			String str="delete from recipevideo where id=?";
			PreparedStatement ps=con.prepareStatement(str);
			ps.setInt(1, rm.getId());
			System.out.println(ps);
			
			ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
//------------------------------recipeVideoUpdate-------------------------------
	public int recipeVideoUpdate(Model_class rm) {

		try{
			String str="UPDATE `recipevideo` SET `foodname`=?,`calorie`=?,`recipe`=?,`imgLink`=?,`RecipeDes`=?,`Ingredients`=?,`Needed`=?,`Duration`=?,`videoLink`=? WHERE id=?;";
			PreparedStatement ps=con.prepareStatement(str);
			
			ps.setString(1, rm.getFoodname());
			ps.setInt(2, rm.getCalorie());
			ps.setString(3, rm.getRecipe());
			ps.setString(4, rm.getImgLink());
			ps.setString(5, rm.getRecipeDes());
			ps.setString(6, rm.getIngredients());
			ps.setString(7, rm.getNeeded());
			ps.setString(8, rm.getDuration());
			ps.setString(9, rm.getVideoLink());
			ps.setInt(10, rm.getId());
			
			ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

//--------------------------comments-insert------------------------------

public int commentInsert(Model_class rm) {

	System.out.println("inside comment insertion");
	try {
	
		String str="insert into comments (USERNAME,COMMENTS,CATEGORY,foodRecipeId) values (?, ? , ?, ?)";		
		PreparedStatement ps=con.prepareStatement(str,PreparedStatement.RETURN_GENERATED_KEYS);
		
		ps.setString(1, rm.getUsername());	
		ps.setString(2, rm.getComments());	
		ps.setString(3, rm.getCategory());
		ps.setInt(4, rm.getFoodRecipeId());
		ps.executeUpdate();
			
		ResultSet rs=ps.getGeneratedKeys();

		
		while(rs.next()) {
			int generatedId=rs.getInt(1);
			System.out.print("Generated ID: "+generatedId);
		}
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	return 0;	
}

//-------------------------------Like insert-------

public int likeinsert(Model_class rm) {	

	try {
		String strSelect="select * from liked where username=? and foodRecipeId=? and category=?";
		PreparedStatement selectPs=con.prepareStatement(strSelect);
		selectPs.setString(1,  rm.getUsername());
		selectPs.setInt(2, rm.getFoodRecipeId());
		selectPs.setString(3, rm.getCategory());
		
		ResultSet rs=selectPs.executeQuery();
		if(rs.next()) {
			if(rs.getString(2) != null ) {
				String str="UPDATE `liked` SET `liked`=? WHERE `username`=? AND `foodRecipeId`=? AND `category`=?";
				PreparedStatement ps=con.prepareStatement(str);
				
				ps.setString(1, rm.getLiked());
				ps.setString(2, rm.getUsername());
				ps.setInt(3, rm.getFoodRecipeId());
				ps.setString(4, rm.getCategory());
				ps.executeUpdate();
			}
		}
		else {
			String str="insert into liked (USERNAME,LIKED,foodRecipeId,category) values (?, ?, ? ,?)";
			PreparedStatement ps=con.prepareStatement(str);
			ps.setString(1, rm.getUsername());
			ps.setString(2, rm.getLiked());
			ps.setInt(3, rm.getFoodRecipeId());
			ps.setString(4, rm.getCategory());
			ps.executeUpdate();
		}	
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	return 0;
}

//------------------------------UnLike--------

public int unlike(Model_class rm) {

	try {
		String strSelect="select * from liked where username=? and foodRecipeId=? and category=?";
		PreparedStatement selectPs=con.prepareStatement(strSelect);
		selectPs.setString(1,  rm.getUsername());
		selectPs.setInt(2, rm.getFoodRecipeId());
		selectPs.setString(3, rm.getCategory());
		
		ResultSet rs=selectPs.executeQuery();
		if(rs.next()) {
			if(rs.getString(2) != null ) {
				String str="UPDATE `liked` SET `liked`=? WHERE `username`=? AND `foodRecipeId`=? AND `category`=?";
				PreparedStatement ps=con.prepareStatement(str);
				
				ps.setString(1, rm.getLiked());
				ps.setString(2, rm.getUsername());
				ps.setInt(3, rm.getFoodRecipeId());
				ps.setString(4, rm.getCategory());
				ps.executeUpdate();
			}
		}
		else {
			String str="insert into liked (USERNAME,LIKED,foodRecipeId,category) values (?, ?, ? ,?)";
			PreparedStatement ps=con.prepareStatement(str);
			ps.setString(1, rm.getUsername());
			ps.setString(2, rm.getLiked());
			ps.setInt(3, rm.getFoodRecipeId());
			ps.setString(4, rm.getCategory());
			ps.executeUpdate();
		}	
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	return 0;
}

//------------------------------veg-recipeComments-----------------------

public ArrayList<Model_class> getRecipeComments(Model_class ss){
	
	Model_class rm=null;
	ArrayList<Model_class> arr=new ArrayList<Model_class>();
	
	try {
		String str="select * from comments where category=?";
		PreparedStatement p=con.prepareStatement(str);
		p.setString(1, ss.getCategory());
		ResultSet rs=p.executeQuery();
		
		String commentString="";
		System.out.println(commentString);
		while (rs.next()) {
			
			
			commentString=commentString+rs.getString(3)+"&"+rs.getInt(5)+"@"+rs.getString(2)+";";	
			rm=new Model_class();
			rm.setComments(commentString);
			
			arr.add(rm);
		}
		return arr;
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	return arr;
}

//-----------------------------nonveg-recipeComments-------------------------

public ArrayList<Model_class> getnonvegrecipeComments(){

	
	Model_class rm=null;
	ArrayList<Model_class> arr=new ArrayList<Model_class>();
	
	try {
		String str="select * from comments where category='Nonveg'";
		PreparedStatement p=con.prepareStatement(str);
		ResultSet rs=p.executeQuery();
		
		String commentString="";
		System.out.println(commentString);
		while (rs.next()) {
			
			
			commentString=commentString+rs.getString(3)+"&"+rs.getInt(5)+"@"+rs.getString(2)+";";	
			rm=new Model_class();
			rm.setComments(commentString);
			
			arr.add(rm);
		}
		return arr;
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	return arr;
}

//-------------------------like count--------
public ArrayList<Model_class> getLikeCount(){

	
	Model_class rm=null;
	ArrayList<Model_class> arr=new ArrayList<Model_class>();
	
	try {
		String str="select * from liked where liked='like'";
		PreparedStatement p=con.prepareStatement(str);
		ResultSet rs=p.executeQuery();
		
		String likeString="";
		while (rs.next()) {
			
			likeString=likeString+rs.getString(3)+"&"+rs.getInt(4)+":"+";";	
			
			rm=new Model_class();			
			rm.setLikeCount(likeString);
			arr.add(rm);
			
		}
		return arr;
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	return arr;
}


public int favorite(Model_class rm){
	
	try{
		
		String str ="select * from fav where username=? and fid=?";
		PreparedStatement ps = con.prepareStatement(str);
		ps.setString(1,rm.getUsername());
		ps.setInt(2,rm.getFoodRecipeId());
		ResultSet rs = ps.executeQuery();

		if(rs.next()){
			// here user already added the item to favourite
			
			if(rm.getFavorite().equals("1")){
				String str3 = "UPDATE `fav` SET `fav`=? WHERE `username`=? AND `fid`=?";
				PreparedStatement ps3 = con.prepareStatement(str3);
				ps3.setString(1,rm.getFavorite());
				ps3.setString(2, rm.getUsername());
				ps3.setInt(3, rm.getFoodRecipeId());
				ps3.executeUpdate();

				return 1;
		

			}else{
				String str3 = "UPDATE `fav` SET `fav`=? WHERE `username`=? AND `fid`=?";
				PreparedStatement ps3 = con.prepareStatement(str3);
				ps3.setString(1,rm.getFavorite());
				ps3.setString(2, rm.getUsername());
				ps3.setInt(3, rm.getFoodRecipeId());
				ps3.executeUpdate();

				return 0;

			}


		}
		else{



			if(rm.getFavorite().equals("1")){
				
				// here user does not have the item as favourite
				String str2 = "insert into fav (fid,username,fav,imglink) values (?, ?, ?, ?)";
				PreparedStatement ps2 = con.prepareStatement(str2,PreparedStatement.RETURN_GENERATED_KEYS);

				ps2.setInt(1,rm.getFoodRecipeId());

				ps2.setString(2, rm.getUsername());

				ps2.setString(3,rm.getFavorite());
				
				ps2.setString(4, rm.getImgLink());
	
				ps2.executeUpdate();
				
				ResultSet rs2=ps2.getGeneratedKeys();

				
				while(rs2.next()) {
					int generatedId=rs2.getInt(1);
					System.out.print("Generated ID: "+generatedId);

				}
	
		

			}
			else{
				String str3 = "UPDATE `fav` SET `fav`=? WHERE `username`=? AND `fid`=?";
				PreparedStatement ps3 = con.prepareStatement(str3);
				
				ps3.setString(1,rm.getFavorite());

				ps3.setString(2, rm.getUsername());

				ps3.setInt(3, rm.getFoodRecipeId());
				
				

				ps3.executeUpdate();

				return 0;

			}
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	return 100;

}

public ArrayList<Model_class> userAllFav(String user){


	Model_class rm=null;
	ArrayList<Model_class> favArr=new ArrayList<Model_class>();
	try {
		String str="select * from fav where username=? And fav='1'";

		PreparedStatement ps=con.prepareStatement(str);
		ps.setString(1, user);
		ResultSet rs=ps.executeQuery();
		
		
		while (rs.next()) {
			rm=new Model_class();
			rm.setFoodRecipeId(rs.getInt(2));
			rm.setImgLink(rs.getString(5));
			favArr.add(rm);
		}
		System.out.println(favArr);
		return favArr;
	}
	catch (Exception e) {
		System.out.println(982);
		e.printStackTrace();
	}
	return favArr;
}


}

	