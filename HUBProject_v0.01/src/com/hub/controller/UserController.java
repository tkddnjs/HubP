package com.hub.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hub.domain.User;
import com.hub.service.pacade.UserService;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="register.do", method=RequestMethod.GET)
	public String registerUser(){
		return "User/registerUser";
	}
	
	// parameter 추가
	@RequestMapping(value="register.do", method=RequestMethod.POST)
	public String registerUser(User user, String[] connChains){
		List<String> connChainList = new ArrayList<>();
		for(String connChain : connChains){
			if(!connChain.equals("")){
				connChainList.add(connChain);
			}
		}
		userService.registerUser(user);
		return "HUBMain";
	}
	
	@RequestMapping(value="modify.do", method=RequestMethod.GET)
	public ModelAndView modifyUser(HttpSession session){
		ModelAndView mav = new ModelAndView("User/modifyUser");
		String userId = (String) session.getAttribute("userId");
		mav.addObject("user", userService.findUserByUserId(userId));
		return mav;
	}
	
	@RequestMapping(value="modify.do", method=RequestMethod.POST)
	public String modifyUser(User user){
		userService.modifyUser(user);
		return "redirect: /user/detail.do";
	}

	// 설계 문서 수정 => session 추가
	@RequestMapping(value="remove.do", method=RequestMethod.GET)
	public String removeUser(String userId, HttpSession session){
		session.invalidate();
		userService.removeUser(userId);
		return "redirect: HUBMain";
	}
	
	@RequestMapping(value="detail.do", method=RequestMethod.POST)	
	public ModelAndView detailUser(String userId){
		ModelAndView mav = new ModelAndView("User/detailUser");
		mav.addObject("user", userService.findUserByUserId(userId));
		return mav;
	}
	
	@RequestMapping(value="check.do", method=RequestMethod.GET)
	public String checkId(String userId){
		if(userService.findUserByUserId(userId) == null){
			return "OK";
		} else {
			return "Duplicated";
		}
	}

	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String login(HttpSession session, User user){
		if(!userService.login(user)){
			return "HUBMain";
		}
		boolean isAdmin = userService.getIsAdmin();
		
		session.setAttribute("userId", user.getUserId());
		session.setAttribute("isAdmin", isAdmin);
		
		if(isAdmin == true){
			return "redirect:/cooper/list.do";
		} else {
			return "redirect:/bucketlist/list.do";		
		}
	}
	
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate();
		return "HUBMain";
	}
}
