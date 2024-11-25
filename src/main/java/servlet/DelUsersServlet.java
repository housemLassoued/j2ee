package servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DBCon;
import dao.UserDao;


@WebServlet("/DelUsersServlet")
public class DelUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            String id = request.getParameter("id");
            if (id != null) {
                UserDao userDao = new UserDao(DBCon.getConnection());
                boolean isDeleted = userDao.deleteUserById(Integer.parseInt(id));
                 if (isDeleted) {
                    response.sendRedirect("DelUser.jsp");
                } else {
                    response.getWriter().write("<h3>Failed to delete User. Please try again.</h3>");
                }
            } else {
                response.sendRedirect("DelUser.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("<h3>Error: " + e.getMessage() + "</h3>");
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
