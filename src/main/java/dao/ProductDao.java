package dao;
import Model.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Product;

public class ProductDao {
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
	public ProductDao(Connection con) {
		super();
		this.con = con;
	}
	public List<Product> getAllProducts() {
        List<Product> book = new ArrayList<>();
        try {

            query = "select * from products";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                book.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> book = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select * from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("id"));
                        row.setName(rs.getString("name"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getDouble("price")*item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        book.add(row);
                    }

                }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println(e.getMessage());
            }
            return book;
        }
	
	
	public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select price from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum+=rs.getDouble("price")*item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }
	public Product getSingleProduct(int id) {
		 Product row = null;
	        try {
	            query = "select * from products where id=? ";

	            pst = this.con.prepareStatement(query);
	            pst.setInt(1, id);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next()) {
	            	row = new Product();
	                row.setId(rs.getInt("id"));
	                row.setName(rs.getString("name"));
	                row.setCategory(rs.getString("category"));
	                row.setPrice(rs.getDouble("price"));
	                row.setImage(rs.getString("image"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }

	        return row;
	    }
	public boolean addProduct(int id, String name, String category, double price, String image) {
		boolean isAdded = false;
		try {
	        String query = "INSERT INTO products (id, name, category, price, image) VALUES (?, ?, ?, ?, ?)";
	        pst = this.con.prepareStatement(query);
	        pst.setInt(1, id);
	        pst.setString(2, name);
	        pst.setString(3, category);
	        pst.setDouble(4, price);
	        pst.setString(5, image);

	        int rowsAffected = pst.executeUpdate();
	        isAdded = rowsAffected > 0; 
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return isAdded;
	}
	
	public boolean deleteProductById(int id) {
		 boolean isDeleted = false;
	        String query = "DELETE FROM products WHERE id=?";
	        try (PreparedStatement pst = this.con.prepareStatement(query)) {
				pst.setInt(1, id);
	            int rowsAffected = pst.executeUpdate();
	            isDeleted = rowsAffected > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return isDeleted;
	}
	public boolean updateProduct(int id, String name, String category, double price, String image) {
		 boolean isUpdated = false;
		    String query = "UPDATE products SET name=?, category=?, price=?, image=? WHERE id=?";
		    try (PreparedStatement pst = this.con.prepareStatement(query)) {
		        pst.setString(1, name);
		        pst.setString(2, category);
		        pst.setDouble(3, price);
		        pst.setString(4, image);
		        pst.setInt(5, id);

		        int rowsAffected = pst.executeUpdate();
		        isUpdated = rowsAffected > 0;
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return isUpdated;
	}
	
        }
	

