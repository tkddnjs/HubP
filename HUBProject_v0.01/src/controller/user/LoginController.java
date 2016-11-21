package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.User;
import service.logic.UserServiceLogic;
import service.pacade.UserService;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserService service;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = new UserServiceLogic();
		String userId = request.getParameter("userId");
		String pw = request.getParameter("password");
		HttpSession session = request.getSession();
		session.invalidate();
		
		User user = new User();
		user.setUserId(userId);
		user.setPw(pw);
		
		if(service.login(user)){
			boolean isAdmin = service.getIsAdmin();
			if(isAdmin == false){
				session = request.getSession();
				session.setAttribute("userId", userId);
				response.sendRedirect("bucketlist/list.do");
			}else{
				session = request.getSession();
				session.setAttribute("userId", userId);
				response.sendRedirect("cooperList.jsp");
			}
		}else{
			response.sendRedirect("HUBMain.jsp");
		}
	}
}











