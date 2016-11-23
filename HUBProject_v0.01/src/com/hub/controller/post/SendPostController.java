package com.hub.controller.post;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hub.domain.Post;
import com.hub.service.logic.PostServiceLogic;
import com.hub.service.pacade.PostService;

@WebServlet("/sendPost.do")
public class SendPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PostService service;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String userId = (String) session.getAttribute("userId");
		
		req.setAttribute("userId", userId);
		req.getRequestDispatcher("Post/sendPost.jsp").forward(req, resp);
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = new PostServiceLogic();
		
		HttpSession session = request.getSession();

		Post post = new Post();
		post.setSenderId((String) session.getAttribute("userId"));
		post.setContent(request.getParameter("inputMassage"));
		post.setReceiverId(request.getParameter("receiverId"));
		
		service.sendPost(post);
		
		response.sendRedirect("listPost.do");
//		request.getRequestDispatcher("Post/listPost.jsp").forward(request, response);
		
	}

}
