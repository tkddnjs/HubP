package controller.list;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Bucketlist;
import domain.Cooper;
import domain.User;
import service.logic.ListServiceLogic;
import service.pacade.ListService;

@WebServlet("/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ListService service;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("List/list.jsp").forward(req, resp);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = new ListServiceLogic();
		
		int listOpt = Integer.parseInt(request.getParameter("listOpt"));
		String connChain = request.getParameter("connChain");
		List<String> connChains  = new ArrayList<>();
		
		connChains.add(connChain);
		
//		switch (listOpt){
//			case 2 :	// 나를 
//				List<User> users = service.findUsersByConnChains(connChains);
//				request.setAttribute("users", users);
//				break;
//			case 1 : 	// 내가
//			case 3 :	// 서로
//				List<Bucketlist> bucketlists= service.findBucketlistsByConnChains(connChains);
//				request.setAttribute("bucketlists", bucketlists);
//				break;
//			case 4 :	// 업체
//				List<Cooper> coopers = service.findCoopersByConnChains(connChains);
//				request.setAttribute("coopers", coopers);
//				break;
//		}
		
		request.setAttribute("listOpt", listOpt);
		request.setAttribute("connChain", connChain);
		request.getRequestDispatcher("List/list.jsp").forward(request, response);
	}

}
