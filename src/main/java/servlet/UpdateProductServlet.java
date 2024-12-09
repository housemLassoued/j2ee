package servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import connection.DBCon;
import dao.ProductDao;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
	            int id = Integer.parseInt(request.getParameter("id"));
	            String name = request.getParameter("name");
	            String category = request.getParameter("category");
	            double price = Double.parseDouble(request.getParameter("price"));
	            String image = request.getParameter("image");

	            ProductDao productDao = new ProductDao(DBCon.getConnection());
	            boolean isUpdated = productDao.updateProduct(id, name, category, price, image);

	            if (isUpdated) {
	                response.sendRedirect("Admin.jsp?message=Product updated successfully");
	            } else {
	                response.sendRedirect("Admin.jsp?error=Failed to update product");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("Admin.jsp?error=An unexpected error occurred. Please try again.");
	        }

}}
