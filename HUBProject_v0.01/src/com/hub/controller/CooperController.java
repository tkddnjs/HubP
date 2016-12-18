package com.hub.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hub.domain.Cooper;
import com.hub.filemanager.FileManager;
import com.hub.service.pacade.CooperService;

@Controller
@RequestMapping("cooper")
public class CooperController {

	@Autowired
	private CooperService cooperService;
	private FileManager fileManager = new FileManager();
	
	@RequestMapping(value="register.do", method=RequestMethod.GET)
	public String registerCooper() {
		return "cooper/registerCooper";
	}

	@RequestMapping(value="register.do", method=RequestMethod.POST)
	public String registerCooper(Cooper cooper, HttpServletRequest req
			, @RequestParam("cma_file") MultipartFile image, String changed) {
		String fileName;
		if(changed.equals("no")){
			fileName = "default.png";
		} else {
			String filePath = req.getServletContext().getRealPath("resources/img/cooperImg");
			fileName = fileManager.registerImage(filePath, image);
		}
		cooper.setImage(fileName);
		cooperService.registerCooper(cooper);
		return "redirect: list.do?listOpt=0";
	}

	@RequestMapping(value="modify.do", method=RequestMethod.GET)
	public ModelAndView modifyCooper(int coId) {
		ModelAndView mav = new ModelAndView("cooper/modifyCooper");
		mav.addObject("cooper", cooperService.findCooperByCoId(coId));
		return mav;
	}

	@RequestMapping(value="modify.do", method=RequestMethod.POST)
	public String modifyCooper(Cooper cooper, HttpServletRequest req
			, @RequestParam("cmb_file") MultipartFile image, String changed) {
		String fileName;
		if(changed.equals("no")){
			fileName = cooperService.findCooperByCoId(cooper.getCoId()).getImage();
		} else {
			String filePath = req.getServletContext().getRealPath("resources/img/cooperImg");
			fileName = fileManager.registerImage(filePath, image);
		}
		cooper.setImage(fileName);
		cooperService.modifyCooper(cooper);
		return "redirect: list.do?listOpt=0&modifyCooper=ok";
	}

	@RequestMapping(value="remove.do", method=RequestMethod.GET)
	public String removeCooper(int coId) {
		cooperService.removeCooper(coId);
		return "redirect: list.do?listOpt=0";
	}
	
	@RequestMapping(value="list.do", method=RequestMethod.GET)
	public ModelAndView listCooper(int listOpt, String modifyCooper) {
		ModelAndView mav = new ModelAndView("bucketlist/bucketList");
		switch(listOpt){
		case 0: 
			mav.addObject("coopers", cooperService.findAll());
			break;
		}
		mav.addObject("tabOpt", 3);
		mav.addObject("modifyCooper", modifyCooper);
		return mav;
	}
	
	@RequestMapping(value="detail.do", method=RequestMethod.GET)
	public ModelAndView detailCooper(int coId) {
		ModelAndView mav = new ModelAndView("cooper/detailCooper");
		mav.addObject("cooper", cooperService.findCooperByCoId(coId));
		return mav;
	}
}
