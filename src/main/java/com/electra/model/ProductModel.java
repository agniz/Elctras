package com.electra.model;

public class ProductModel {
	private int productId; //primary key and auto increment in database
	private int productCategoryId; // foreign key from category table (category_id)
	private String productName;
	private String productImage;
	private double productPrice;
	private int stock;
	private int trendingItem;
	private int featuredItem;
	private String productCategoryName;
	private String productDescriptionTitle1;
	private String productDescriptionTitle2;
	private String productDescriptionTitle3;
	private String productDescriptionTitle4;
	private String productDescriptionTitle5;
	private String productDescriptionText1;
	private String productDescriptionText2;
	private String productDescriptionText3;
	private String productDescriptionText4;
	private String productDescriptionText5;
	
//	call this to add product
	public ProductModel( int productCategoryId, String productName, String productImage,
			double productPrice, int stock, int trendingItem, int featuredItem, String productDescriptionTitle1,
			String productDescriptionTitle2, String productDescriptionTitle3, String productDescriptionTitle4,
			String productDescriptionTitle5, String productDescriptionText1, String productDescriptionText2,
			String productDescriptionText3, String productDescriptionText4, String productDescriptionText5) {
		super();
		
		this.productCategoryId = productCategoryId;
		this.productName = productName;
		this.productImage = productImage;
		this.productPrice = productPrice;
		this.stock = stock;
		this.trendingItem = trendingItem;
		this.featuredItem = featuredItem;
		this.productDescriptionTitle1 = productDescriptionTitle1;
		this.productDescriptionTitle2 = productDescriptionTitle2;
		this.productDescriptionTitle3 = productDescriptionTitle3;
		this.productDescriptionTitle4 = productDescriptionTitle4;
		this.productDescriptionTitle5 = productDescriptionTitle5;
		this.productDescriptionText1 = productDescriptionText1;
		this.productDescriptionText2 = productDescriptionText2;
		this.productDescriptionText3 = productDescriptionText3;
		this.productDescriptionText4 = productDescriptionText4;
		this.productDescriptionText5 = productDescriptionText5;
	}
	
//	call this if want to add productCategoryName also

	public ProductModel(int productId, int productCategoryId, String productName, String productImage,
			double productPrice, int stock, int trendingItem, int featuredItem, String productCategoryName,
			String productDescriptionTitle1, String productDescriptionTitle2, String productDescriptionTitle3,
			String productDescriptionTitle4, String productDescriptionTitle5, String productDescriptionText1,
			String productDescriptionText2, String productDescriptionText3, String productDescriptionText4,
			String productDescriptionText5) {
		super();
		this.productId = productId;
		this.productCategoryId = productCategoryId;
		this.productName = productName;
		this.productImage = productImage;
		this.productPrice = productPrice;
		this.stock = stock;
		this.trendingItem = trendingItem;
		this.featuredItem = featuredItem;
		this.productCategoryName = productCategoryName;
		this.productDescriptionTitle1 = productDescriptionTitle1;
		this.productDescriptionTitle2 = productDescriptionTitle2;
		this.productDescriptionTitle3 = productDescriptionTitle3;
		this.productDescriptionTitle4 = productDescriptionTitle4;
		this.productDescriptionTitle5 = productDescriptionTitle5;
		this.productDescriptionText1 = productDescriptionText1;
		this.productDescriptionText2 = productDescriptionText2;
		this.productDescriptionText3 = productDescriptionText3;
		this.productDescriptionText4 = productDescriptionText4;
		this.productDescriptionText5 = productDescriptionText5;
	}



	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(int productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getTrendingItem() {
		return trendingItem;
	}

	public void setTrendingItem(int trendingItem) {
		this.trendingItem = trendingItem;
	}

	public int getFeaturedItem() {
		return featuredItem;
	}

	public void setFeaturedItem(int featuredItem) {
		this.featuredItem = featuredItem;
	}

	public String getProductDescriptionTitle1() {
		return productDescriptionTitle1;
	}

	public void setProductDescriptionTitle1(String productDescriptionTitle1) {
		this.productDescriptionTitle1 = productDescriptionTitle1;
	}

	public String getProductDescriptionTitle2() {
		return productDescriptionTitle2;
	}

	public void setProductDescriptionTitle2(String productDescriptionTitle2) {
		this.productDescriptionTitle2 = productDescriptionTitle2;
	}

	public String getProductDescriptionTitle3() {
		return productDescriptionTitle3;
	}

	public void setProductDescriptionTitle3(String productDescriptionTitle3) {
		this.productDescriptionTitle3 = productDescriptionTitle3;
	}

	public String getProductDescriptionTitle4() {
		return productDescriptionTitle4;
	}

	public void setProductDescriptionTitle4(String productDescriptionTitle4) {
		this.productDescriptionTitle4 = productDescriptionTitle4;
	}

	public String getProductDescriptionTitle5() {
		return productDescriptionTitle5;
	}

	public void setProductDescriptionTitle5(String productDescriptionTitle5) {
		this.productDescriptionTitle5 = productDescriptionTitle5;
	}

	public String getProductDescriptionText1() {
		return productDescriptionText1;
	}

	public void setProductDescriptionText1(String productDescriptionText1) {
		this.productDescriptionText1 = productDescriptionText1;
	}

	public String getProductDescriptionText2() {
		return productDescriptionText2;
	}

	public void setProductDescriptionText2(String productDescriptionText2) {
		this.productDescriptionText2 = productDescriptionText2;
	}

	public String getProductDescriptionText3() {
		return productDescriptionText3;
	}

	public void setProductDescriptionText3(String productDescriptionText3) {
		this.productDescriptionText3 = productDescriptionText3;
	}

	public String getProductDescriptionText4() {
		return productDescriptionText4;
	}

	public void setProductDescriptionText4(String productDescriptionText4) {
		this.productDescriptionText4 = productDescriptionText4;
	}

	public String getProductDescriptionText5() {
		return productDescriptionText5;
	}

	public void setProductDescriptionText5(String productDescriptionText5) {
		this.productDescriptionText5 = productDescriptionText5;
	}

	public String getProductCategoryName() {
		return productCategoryName;
	}

	public void setProductCategoryName(String productCategoryName) {
		this.productCategoryName = productCategoryName;
	}
	
	


	
	
}
