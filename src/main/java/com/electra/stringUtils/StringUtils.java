package com.electra.stringUtils;

public class StringUtils {
//Queries
public static final String INSERT_USER = "INSERT INTO user (full_name, phone_number, password, username, email) VALUES (?, ?, ?, ?,?)";
public static final String INSERT_ADMIN_USER = "INSERT INTO user (full_name, phone_number, password, username, email,user_type) VALUES (?, ?, ?, ?,?,?)";
public static final String UPDATE_USER = "UPDATE user SET full_name = ?, phone_number = ?, username = ?, email = ? WHERE user_id = ?";
public static final String GET_USERNAME= "SELECT COUNT(*) FROM user WHERE username = ?";
public static final String GET_PHONENUMBER= "SELECT COUNT(*) FROM user WHERE phone_number = ?";
public static final String GET_EMAIL= "SELECT COUNT(*) FROM user WHERE email = ?";
public static final String GET_ALL_USER = "SELECT * FROM user";
//
public static final String GET_USERNAME_FOR_UPDATE= "SELECT COUNT(*) FROM user WHERE username = ? AND user_id !=?";
public static final String GET_PHONENUMBER_FOR_UPDATE= "SELECT COUNT(*) FROM user WHERE phone_number = ? AND user_id !=?";
public static final String GET_EMAIL_FOR_UPDATE= "SELECT COUNT(*) FROM user WHERE email = ? AND user_id !=?";
public static final String GET_PRODUCT_NAME_UPDATE = "SELECT COUNT(*) FROM product WHERE product_name = ? AND product_id !=?";
//
public static final String GET_USERID = "SELECT user_id FROM user WHERE username = ?";
public static final String GET_LOGIN_INFO = "SELECT username, password,user_type FROM user WHERE username = ? And password = ?";
public static final String 	GET_HASHED_PASSWORD = "SELECT password FROM user WHERE username = ?";
public static final String INSERT_CATEGORY = "INSERT INTO category (category_name,category_image) VALUES (?,?)";
public static final String GET_CATEGORY_NAME= "SELECT COUNT(*) FROM category WHERE category_name = ?";
public static final String GET_ALL_CATEGORIES = "SELECT category_id,category_name,category_image from category";
public static final String INSERT_PRODUCT = "INSERT INTO product(product_category_id, product_name, product_price, product_image, stock,trending_item,featured_item,desc_title1,desc_title2,desc_title3,desc_title4,desc_title5,desc_text1,desc_text2,desc_text3,desc_text4,desc_text5) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
public static final String GET_PRODUCTID = "SELECT product_id FROM product WHERE product_name = ?";
public static final String GET_PRODUCT_STOCK = "SELECT stock FROM product WHERE product_id = ?";
public static final String UPDATE_PRODUCT_STOCK = "UPDATE product SET stock= ? WHERE product_id= ?";
public static final String GET_PRODUCT_NAME = "SELECT COUNT(*) FROM product WHERE product_name = ?";
public static final String GET_ALL_PRODUCTS_WITH_CATEGORYNAME ="SELECT p.*, c.category_name FROM product p JOIN category c ON p.product_category_id = c.category_id";
public static final String DELETE_PRODUCT_FROM_PRODUCTID = "DELETE FROM product WHERE product_id = ?";		
public static final String GET_PRODUCT_DETAILS_BY_ID = "SELECT p.*, c.category_name FROM product p JOIN category c ON p.product_category_id = c.category_id WHERE p.product_id = ?;";
public static final String SEARCH_PRODUCT_BY_TEXT = "SELECT p.*, c.category_name FROM product p JOIN category c ON p.product_category_id = c.category_id WHERE p.product_name LIKE ?";
public static final String INSERT_INTO_CART = "INSERT INTO cart (user_id, product_id, product_quantity) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE product_quantity = product_quantity + VALUES(product_quantity);";
public static final String GET_CART_DETAILS = "SELECT p.product_name, p.product_price, p.product_image, c.product_quantity,c.product_id FROM product p INNER JOIN cart c ON p.product_id = c.product_id WHERE c.user_id = ?;";
public static final String DELETE_CART_ITEM = "DELETE FROM cart WHERE product_id = ? AND user_id = ?";
public static final String UPDATE_CART_QUANTITY = "UPDATE cart SET product_quantity = ? WHERE product_id = ? AND user_id = ?;";
public static final String DELETE_ALL_ITEM_FROM_CART = "DELETE FROM cart WHERE user_id = ?";
public static final String CHANGE_PASSWORD = "UPDATE user SET password= ? WHERE username= ?";
public static final String USER_DETAIL_BY_USERNAME = "SELECT * FROM user WHERE username = ?";
public static final String INSERT_INTO_ORDERS = "INSERT into orders (order_user_id, order_date, total_amount) VALUES (?, ?, ?)"; 
public static final String INSERT_INTO_ORDER_DETAIL =  "INSERT INTO order_details (order_id, order_product_id, order_quantity) VALUES (?, ?, ?)";
public static final String UPDATE_PRODUCT = "UPDATE product SET product_category_id = ?, product_name = ?, product_price = ?, product_image = ?, stock = ?, trending_item = ?, featured_item = ?, desc_title1 = ?, desc_title2 = ?, desc_title3 = ?, desc_title4 = ?, desc_title5 = ?, desc_text1 = ?, desc_text2 = ?, desc_text3 = ?, desc_text4 = ?, desc_text5 = ? WHERE product_id = ?";
public static final String GET_ORDER_DETAILS = "SELECT o.order_id, u.username, p.product_name, od.order_quantity, o.total_amount AS total, o.order_date, od.order_status, od.order_detail_id FROM `orders` o INNER JOIN `user` u ON o.order_user_id = u.user_id INNER JOIN order_details od ON o.order_id = od.order_id INNER JOIN  product p ON od.order_product_id = p.product_id;";
public static final String UPDATE_ORDER_STATUS_QUERY = "UPDATE order_details SET order_status= ? WHERE order_detail_id= ?";



//	SERVLET ROUTER
public static final String  REGISTER_SERVLET = "/RegisterServlet";
public static final String LOGIN_SERVLET = "/LoginServlet";
public static final String LOGOUT_SERVLET = "/LogoutServlet";
public static final String ADD_CATEGORY = "/AddCategoryServlet";
public static final String ADD_PRODUCT ="/AddProductServlet";
public static final String DELETE_PRODUCT_SERVLET="/DeleteProductServlet";
public static final String CART_SERVLET ="/CartServlet";
public static final String DELETE_CART_SERVLET = "/DeleteFromCartServlet";
public static final String EDIT_CART_QUANTITY_SERVLET = "/EditCartQuanityServlet";
public static final String CHANGE_PASSWORD_SERVLET = "/ChangePasswordServlet";
public static final String CHECKOUT_SERVLET = "/CheckoutServlet";
public static final String SEARCH_PRODUCT_SERVLET = "/SearchProductServlet";
public static final String EDIT_USER_SERVLET = "/EditUserServlet";
public static final String EDIT_PRODUCT_SERVLET = "/EditProductServlet";
public static final String UPDATE_ORDER_STATUS = "/UpdateOderStatus";
public static final String EDIT_ADMIN_PROFILE_SERVLET = "/EditAdminProfile";
public static final String ADMIN_CHANGE_PASSWORD_SERVLET = "/ChangeAdminProfileServlet";
public static final String REGISTER_ADMIN_SERVLET = "/RegisterAdminServlet";


// JSP ROUTE
public static final String LOGIN_PAGE = "/pages/login.jsp";
public static final String REGSITER_PAGE = "/pages/register.jsp";
public static final String HOME_PAGE ="/pages/index.jsp";
public static final String ADMIN_PAGE = "/pages/adminPanel.jsp";
public static final String ADMIN_PAGE_PROFILE = "/pages/admin.jsp";
public static final String ADD_PRODUCT_PAGE = "/pages/addProduct.jsp";
public static final String SHOP_PAGE = "/pages/shop.jsp";
public static final String CUSTOMER_PAGE = "/pages/customer.jsp";
public static final String CHECKOUT_PAGE = "/pages/checkout.jsp";
}

