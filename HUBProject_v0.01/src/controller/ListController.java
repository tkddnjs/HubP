package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.pacade.ListService;

@Controller
@RequestMapping("list")
public class ListController {

	@Autowired
	private ListService listService;

	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public ModelAndView listUser(int listOpt, String searchWord) {
		ModelAndView mav = new ModelAndView("list.jsp");

		switch (listOpt) {
		case 1:
			
//			mav.addObject("users", listService.findUsersByConnChains(connChains));
			break;
		case 2:
			break;
		case 3:
			break;

		}

		return mav;
	}

}
