package com.electra.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.electra.controller.dbController.DbController;

import com.electra.model.ProductModel;
import com.electra.stringUtils.StringUtils;

public class ProductDao {
	public int addProduct(ProductModel product ) {
		try(Connection con = DbController.getCon()){
			
//			check for existing product name
			PreparedStatement checkPName = con.prepareStatement(StringUtils.GET_PRODUCT_NAME);
			checkPName.setString(1,product.getProductName());
			ResultSet pNamers = checkPName.executeQuery();
			pNamers.next();
			if(pNamers.getInt(1)>0) {
				return -2; // product already exist
			}
			
			PreparedStatement pst = con.prepareStatement(StringUtils.INSERT_PRODUCT);
			pst.setInt(1,product.getProductCategoryId() );
			pst.setString(2, product.getProductName() );
			pst.setDouble(3,product.getProductPrice());
			pst.setString(4,product.getProductImage());
			pst.setInt(5,product.getStock() );
			pst.setInt(6,product.getTrendingItem());
			pst.setInt(7,product.getFeaturedItem());
			pst.setString(8, product.getProductDescriptionTitle1());
			pst.setString(9, product.getProductDescriptionTitle2());
			pst.setString(10, product.getProductDescriptionTitle3());
			pst.setString(11, product.getProductDescriptionTitle4());
			pst.setString(12, product.getProductDescriptionTitle5());
			pst.setString(13, product.getProductDescriptionText1());
			pst.setString(14, product.getProductDescriptionText2());
			pst.setString(15, product.getProductDescriptionText3());
			pst.setString(16, product.getProductDescriptionText4());
			pst.setString(17, product.getProductDescriptionText5());
			int rowCount = pst.executeUpdate();
			return rowCount > 0 ? 1:0;
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
			return -1;
		}
	}
	
	
	public int getProductId(String productName) {
		try(Connection con = DbController.getCon()){
			PreparedStatement ps = con.prepareStatement(StringUtils.GET_PRODUCTID);
			ps.setString(1, productName);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				int productID = rs.getInt("product_id");
				return productID;
			}
			return -10;
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
			return -5;
		}

}
	public List<ProductModel> getAllProdcuts(){		
		 List<ProductModel> allProduct = new ArrayList <>();
		 Connection con = null;
		  PreparedStatement ps = null;
		    ResultSet rs = null;
		 try{
			 con = DbController.getCon();
			  ps = con.prepareStatement(StringUtils.GET_ALL_PRODUCTS_WITH_CATEGORYNAME);
			 rs = ps.executeQuery();
			 while(rs.next()) {
				 int productId = rs.getInt("product_id");
				 int productCategoryId = rs.getInt("product_category_id");
				 String productName = rs.getString("product_name");
				 double productPrice = rs.getDouble("product_price");
				 String productImage = rs.getString("product_image");
				 int stock = rs.getInt("stock");
				 int trendingItem = rs.getInt("trending_item");
				 int featuredItem = rs.getInt("featured_item");
				 String title1 = rs.getString("desc_title1");
				 String title2 = rs.getString("desc_title2");
				 String title3 = rs.getString("desc_title3");
				 String title4 = rs.getString("desc_title4");
				 String title5 = rs.getString("desc_title5");
				 String text1 = rs.getString("desc_text1");
				 String text2 = rs.getString("desc_text2");
				 String text3 = rs.getString("desc_text3");
				 String text4 = rs.getString("desc_text4");
				 String text5 = rs.getString("desc_text5");
				 String categoryName = rs.getString("category_name");
				
				 ProductModel productModel = new ProductModel(productId,productCategoryId,productName,productImage,productPrice,stock,trendingItem,featuredItem,categoryName,title1,title2,title3,title4,title5,text1,text2,text3,text4,text5);
				 allProduct.add(productModel);
			 }
		 }catch (SQLException | ClassNotFoundException ex) {
				ex.printStackTrace();
				 ex.getMessage();
			}
		 finally {
		        try {
		            if (rs != null) rs.close();
		            if (ps != null) ps.close();
		            if (con != null) con.close();
		        } catch (SQLException ex) {
		            ex.printStackTrace();
		        }
		    }
		 
		 return allProduct;
	}
	public int deleteProduct(int productId) {
		try(Connection con = DbController.getCon()){
			PreparedStatement ps = con.prepareStatement(StringUtils.DELETE_PRODUCT_FROM_PRODUCTID);
			ps.setInt(1, productId);
			int rowCount = ps.executeUpdate();
			return rowCount > 0 ? 1:0;
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
			return -1;
		}
	}
	
	public ProductModel getProductDetailById(String productId) {
		ProductModel singleProduct = null;
		try(Connection con = DbController.getCon()){
			PreparedStatement ps = con.prepareStatement(StringUtils.GET_PRODUCT_DETAILS_BY_ID);
			ps.setString(1, productId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				 String sProductId = productId;
				 int iProductId = Integer.parseInt(sProductId);
				 int productCategoryId = rs.getInt("product_category_id");
				 String productName = rs.getString("product_name");
				 double productPrice = rs.getDouble("product_price");
				 String productImage = rs.getString("product_image");
				 int stock = rs.getInt("stock");
				 int trendingItem = rs.getInt("trending_item");
				 int featuredItem = rs.getInt("featured_item");
				 String title1 = rs.getString("desc_title1");
				 String title2 = rs.getString("desc_title2");
				 String title3 = rs.getString("desc_title3");
				 String title4 = rs.getString("desc_title4");
				 String title5 = rs.getString("desc_title5");
				 String text1 = rs.getString("desc_text1");
				 String text2 = rs.getString("desc_text2");
				 String text3 = rs.getString("desc_text3");
				 String text4 = rs.getString("desc_text4");
				 String text5 = rs.getString("desc_text5");
				 String categoryName = rs.getString("category_name");
				singleProduct = new ProductModel(iProductId,productCategoryId,productName,productImage,productPrice,stock,trendingItem,featuredItem,categoryName,title1,title2,title3,title4,title5,text1,text2,text3,text4,text5);
				
			}
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
			
		}
		return singleProduct;
	}
	public int getProductStock(int productId) {
		try(Connection con = DbController.getCon()){
			PreparedStatement ps = con.prepareStatement(StringUtils.GET_PRODUCT_STOCK);
			ps.setInt(1, productId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				int stock = rs.getInt("stock");
				return stock;
			}
			return -10;
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
			return -5;
		}
	}
	public void updateProductStock(int productId, int newQuantity) {
		try(Connection con = DbController.getCon()){
			PreparedStatement ps = con.prepareStatement(StringUtils.UPDATE_PRODUCT_STOCK);
			ps.setInt(1, newQuantity);
			ps.setInt(2, productId);
			ps.executeUpdate();
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
			
		}
	}
	public List<ProductModel> searchProduct(String searchParameter){
		List<ProductModel> products = new ArrayList<>();
		 Connection con = null;
		  PreparedStatement ps = null;
		    ResultSet rs = null;
		 try{
			 con = DbController.getCon();
			  ps = con.prepareStatement(StringUtils.SEARCH_PRODUCT_BY_TEXT);
			  ps.setString(1, "%"+searchParameter+"%");
			 rs = ps.executeQuery();
			 while(rs.next()) {
				 int productId = rs.getInt("product_id");
				 int productCategoryId = rs.getInt("product_category_id");
				 String productName = rs.getString("product_name");
				 double productPrice = rs.getDouble("product_price");
				 String productImage = rs.getString("product_image");
				 int stock = rs.getInt("stock");
				 int trendingItem = rs.getInt("trending_item");
				 int featuredItem = rs.getInt("featured_item");
				 String title1 = rs.getString("desc_title1");
				 String title2 = rs.getString("desc_title2");
				 String title3 = rs.getString("desc_title3");
				 String title4 = rs.getString("desc_title4");
				 String title5 = rs.getString("desc_title5");
				 String text1 = rs.getString("desc_text1");
				 String text2 = rs.getString("desc_text2");
				 String text3 = rs.getString("desc_text3");
				 String text4 = rs.getString("desc_text4");
				 String text5 = rs.getString("desc_text5");
				 String categoryName = rs.getString("category_name");
				
				 ProductModel productModel = new ProductModel(productId,productCategoryId,productName,productImage,productPrice,stock,trendingItem,featuredItem,categoryName,title1,title2,title3,title4,title5,text1,text2,text3,text4,text5);
				 products.add(productModel);
			 }
		 }catch (SQLException | ClassNotFoundException ex) {
				ex.printStackTrace();
				 ex.getMessage();
			}
		 finally {
		        try {
		            if (rs != null) rs.close();
		            if (ps != null) ps.close();
		            if (con != null) con.close();
		        } catch (SQLException ex) {
		            ex.printStackTrace();
		        }
		    }
		 
		 return products;
	}
	
	
	public int editProduct(ProductModel product, int prodctId ) {
		try(Connection con = DbController.getCon()){
			
//			check for existing product name
			PreparedStatement checkPName = con.prepareStatement(StringUtils.GET_PRODUCT_NAME_UPDATE);
			checkPName.setString(1,product.getProductName());
			checkPName.setInt(2, prodctId);
			ResultSet pNamers = checkPName.executeQuery();
			pNamers.next();
			if(pNamers.getInt(1)>0) {
				return -2; // product already exist
			}
			
			PreparedStatement pst = con.prepareStatement(StringUtils.UPDATE_PRODUCT);
			pst.setInt(1,product.getProductCategoryId() );
			pst.setString(2, product.getProductName() );
			pst.setDouble(3,product.getProductPrice());
			pst.setString(4,product.getProductImage());
			pst.setInt(5,product.getStock() );
			pst.setInt(6,product.getTrendingItem());
			pst.setInt(7,product.getFeaturedItem());
			pst.setString(8, product.getProductDescriptionTitle1());
			pst.setString(9, product.getProductDescriptionTitle2());
			pst.setString(10, product.getProductDescriptionTitle3());
			pst.setString(11, product.getProductDescriptionTitle4());
			pst.setString(12, product.getProductDescriptionTitle5());
			pst.setString(13, product.getProductDescriptionText1());
			pst.setString(14, product.getProductDescriptionText2());
			pst.setString(15, product.getProductDescriptionText3());
			pst.setString(16, product.getProductDescriptionText4());
			pst.setString(17, product.getProductDescriptionText5());
			pst.setInt(18, prodctId);
			int rowCount = pst.executeUpdate();
			return rowCount > 0 ? 1:0;
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
			return -1;
		}
	}
}
