package com.electra.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.electra.controller.dbController.DbController;
import com.electra.model.CategoryModel;
import com.electra.stringUtils.StringUtils;

public class CategoryDao {
	public int addCategory( CategoryModel category) {		
		try (Connection con = DbController.getCon()){	
//			check for existing category name
			PreparedStatement checkCatName = con.prepareStatement(StringUtils.GET_CATEGORY_NAME);
			checkCatName.setString(1, category.getCategoryName());
			ResultSet catNamers = checkCatName.executeQuery();
			catNamers.next();
			if(catNamers.getInt(1) > 0) {
				return -2;
			}
			
			PreparedStatement pst = con.prepareStatement(StringUtils.INSERT_CATEGORY);
			pst.setString(1, category.getCategoryName());
			pst.setString(2, category.getCategoryImage());
			int rowCount = pst.executeUpdate();
			return rowCount > 0 ? 1 : 0;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
			return -1;
		}
	}
//	method to get all the categories details from database
	public List<CategoryModel> getAllCategories(){
		List<CategoryModel> allCategory = new ArrayList<>();
		try(Connection con = DbController.getCon()){
			PreparedStatement ps = con.prepareStatement(StringUtils.GET_ALL_CATEGORIES);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				String categoryName = rs.getString("category_name");
				String categoryImage = rs.getString("category_image");
				String categoryId = rs.getString("category_id");
				CategoryModel categoryModel = new CategoryModel();
				categoryModel.setCategoryName(categoryName);
				categoryModel.setCategoryImage(categoryImage);
				categoryModel.setCategoryId(categoryId);
				allCategory.add(categoryModel);
			}
		
		} 
		catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
		}
		return allCategory;
	}
	
}
