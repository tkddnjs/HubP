package controller.list;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.logic.ListServiceLogic;
import service.pacade.ListService;

@WebServlet("/listAutoComplete.do")
public class ListAutoCompleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	private ListService service;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = new ListServiceLogic();

		String userId = (String) request.getSession().getAttribute("userId");
		int listOpt = Integer.parseInt(request.getParameter("listOpt"));
		PrintWriter out = response.getWriter();

		ArrayList<String> availableTags = new ArrayList<>();

		switch (listOpt) {
		case 2: // 나를\
			for (String str : service.findConnChains()) {
				availableTags.add(str);
			}
			break;
		case 1: // 내가
		case 3: // 서로
			for (String str : service.findConnChainsByUserId(userId)) {
				availableTags.add(str);
			}
			break;
		case 4: // 업체
			break;
		}
		out.println(availableTags);
		
	}

}