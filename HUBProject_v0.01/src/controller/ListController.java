package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.pacade.ListService;

@Controller
@RequestMapping("list")
public class ListController {

	@Autowired
	private ListService listService;
	
	
}
