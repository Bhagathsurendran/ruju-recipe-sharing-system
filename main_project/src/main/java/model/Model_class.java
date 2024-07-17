package model;

public class Model_class {
	
	int id,calorie,foodRecipeId;
	//---user---
	String username,fullname,email,password,type;
	//---recipie---
	String foodname,recipe,category,imgLink,recipeDes,recipeName,ingredients,needed,duration,videoLink,favorite,userlogo;
	
	String comments,liked,likeCount;
	Object commentArray;
	
	public String getUserlogo() {
		return userlogo;
	}
	public void setUserlogo(String userlogo) {
		this.userlogo=userlogo;
	}
	
	public String getFavorite() {
		return favorite;
	}
	public void setFavorite(String favorite) {
		this.favorite=favorite;
	}
	
	public String getVideoLink() {
		return videoLink;
	}
	public void setVideoLink(String videoLink) {
		this.videoLink=videoLink;
	}
	
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration=duration;
	}
	
	public String getNeeded() {
		return needed;
	}
	public void setNeeded(String needed) {
		this.needed=needed;
	}
	
	public String getIngredients() {
		return ingredients;
	}
	public void setIngredients(String ingredients) {
		this.ingredients=ingredients;
	}
	
	
	public String getRecipeName() {
		return recipeName;
	}
	public void setRecipeName(String recipeName) {
		this.recipeName=recipeName;
	}
	
	
	public String getRecipeDes() {
		return recipeDes;
	}
	public void setRecipeDes(String recipeDes) {
		this.recipeDes = recipeDes;
	}
	
	
	public Object getCommentArray() {
		return commentArray;
	}
	public void setCommentArray(Object commentArray) {
		this.commentArray = commentArray;
	}
	
	//-------id-------
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	//-------username----
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	//--------fullname----------
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	//----------email---------
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	//-------password--------
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	//--------type---------
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	//----------------recipie--------------------
	
	public String getFoodname() {
		return foodname;
	}
	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
	
	public int getCalorie() {
		return calorie;
	}
	public void setCalorie(int calorie) {
		this.calorie = calorie;
	}
	
	public String getRecipe() {
		return recipe;
	}
	public void setRecipe(String recipe) {
		this.recipe = recipe;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	public String getLiked() {
		return liked;
	}
	public void setLiked(String liked) {
		this.liked = liked;
	}
	
	public int getFoodRecipeId() {
		return foodRecipeId;
	}
	public void setFoodRecipeId(int foodRecipeId) {
		this.foodRecipeId = foodRecipeId;
	}
	
	public String getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(String likeCount) {
		this.likeCount = likeCount;
	}
	
	public String getImgLink() {
		return imgLink;
	}
	public void setImgLink(String imgLink) {
		this.imgLink = imgLink;
	}
	
	
}
