package servlet;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DBCon;

import dao.ProductDao;


@WebServlet("/DelProductsServlet")
public class DelProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
            String id = request.getParameter("id");
            if (id != null) {
                ProductDao productDao = new ProductDao(DBCon.getConnection());
                boolean isDeleted = productDao.deleteProductById(Integer.parseInt(id));
                if (isDeleted) {
                    response.sendRedirect("DelProduct.jsp");
                } else {
                    out.println("<h3>Failed to delete product. Please try again.</h3>");
                }
            } else {
                response.sendRedirect("DelProduct.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
