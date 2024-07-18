package com.electra.model;

public class CategoryModel {
	private String categoryId;
	private String categoryName;
	private String categoryImage;
	
	
	public CategoryModel(String categoryName, String categoryImage) {
		super();
		this.categoryName = categoryName;
		this.categoryImage = categoryImage;
	}

	public CategoryModel() {
		
	}
	
	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public String getCategoryImage() {
		return categoryImage;
	}


	public void setCategoryImage(String categoryImage) {
		this.categoryImage = categoryImage;
	}
	
	
}


