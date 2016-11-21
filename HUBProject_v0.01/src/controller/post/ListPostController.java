package controller.post;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Post;
import service.logic.PostServiceLogic;
import service.pacade.PostService;

@WebServlet("/listPost.do")
public class ListPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PostService service;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		service = new PostServiceLogic();
		List<Post> list = service.findAll(userId);
		
		request.setAttribute("posts", list);
		request.getRequestDispatcher("Post/listPost.jsp").forward(request, response);
	}

}
