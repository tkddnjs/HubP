package controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.logic.UserServiceLogic;
import service.pacade.UserService;

@WebServlet("/modifyUser.do")
public class ModifyUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService service;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = new UserServiceLogic();
		
	}

}
