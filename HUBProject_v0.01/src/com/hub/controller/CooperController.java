package com.hub.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hub.domain.Cooper;
import com.hub.service.pacade.CooperService;

@Controller
@RequestMapping("cooper")
public class CooperController {

	@Autowired
	private CooperService cooperService;

	@RequestMapping(value="register.do", method=RequestMethod.GET)
	public String registerCooper() {
		return "cooper/registerCooper";
	}

	@RequestMapping(value="register.do", method=RequestMethod.POST)
	public String registerCooper(Cooper cooper) {
		cooperService.registerCooper(cooper);
		return "redirecr: /cooper/list.do";
	}

	@RequestMapping(value="modify.do", method=RequestMethod.GET)
	public ModelAndView modifyCooper(int coId) {
		ModelAndView mav = new ModelAndView("cooper/modifyCooper");
		mav.addObject("cooper", cooperService.findCoopersByCoId(coId));
		return mav;
	}

	@RequestMapping(value="modify.do", method=RequestMethod.POST)
	public String modifyCooper(Cooper cooper) {
		cooperService.modifyCooper(cooper);
		return "redirect: /cooper/detail.do";
	}

	@RequestMapping(value="remove.do", method=RequestMethod.GET)
	public String removeCooper(int coId) {
		cooperService.removeCooper(coId);
		return "redirect: /cooper/list.do";
	}
	
	@RequestMapping(value="list.do", method=RequestMethod.GET)
	public ModelAndView listCooper(int listOpt, String searchWord) {
		ModelAndView mav = new ModelAndView("cooper/listCooper");
		mav.addObject("coopers", cooperService.findAll());
		return mav;
	}
	
	@RequestMapping(value="detail.do", method=RequestMethod.GET)
	public ModelAndView detailCooper(int coId) {
		ModelAndView mav = new ModelAndView("cooper/detailCooper");
		mav.addObject("cooper", cooperService.findCoopersByCoId(coId));
		return mav;
	}
}
