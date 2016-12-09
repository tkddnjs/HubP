package com.hub.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hub.domain.User;
import com.hub.filemanager.FileManager;
import com.hub.service.pacade.UserService;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;
	
	private FileManager fileManager = new FileManager();
	
	@RequestMapping(value="register.do", method=RequestMethod.GET)
	public String registerUser(){
		return "user/registerUser";
	}
	
	// parameter 추가
	@RequestMapping(value="register.do", method=RequestMethod.POST)
	public String registerUser(User user, HttpServletRequest req
								, @RequestParam("image") MultipartFile image){
		
		String filePath = req.getServletContext().getRealPath("resources/img/userImg");
		String fileName = fileManager.registerImage(filePath, image);
		user.setPicture(fileName);
		userService.registerUser(user);
		return "HUBMain";
	}
	
	@RequestMapping(value="modify.do", method=RequestMethod.GET)
	public ModelAndView modifyUser(String userId){
		ModelAndView mav = new ModelAndView("user/modifyUser");
		mav.addObject("user", userService.findUserByUserId(userId));
		return mav;
	}
	
	@RequestMapping(value="modify.do", method=RequestMethod.POST)
	public String modifyUser(User user){
		userService.modifyUser(user);
		return "redirect: detail.do?userId="+user.getUserId();
	}

	// 설계 문서 수정 => session 추가
	@RequestMapping(value="remove.do", method=RequestMethod.GET)
	public String removeUser(String userId, HttpSession session){
		session.invalidate();
		userService.removeUser(userId);
		return "HUBMain";
	}

	// parameter 변경 (String userId => HttpSession session, String userId)
	@RequestMapping(value="detail.do", method=RequestMethod.GET)	
	public ModelAndView detailUser(String myId, String userId){
		ModelAndView mav = null;
		
		if(userId.equals(myId)){
			mav = new ModelAndView("user/detailUser");
		} else {
			mav = new ModelAndView("list/detailUser");
		}
		mav.addObject("user", userService.findUserByUserId(userId));
		return mav;
	}
	
	@RequestMapping(value="check.do", method=RequestMethod.GET)
	public void checkId(String userId, HttpServletResponse resp){
		try {
			PrintWriter out = resp.getWriter();
			if(userService.findUserByUserId(userId) == null){
				out.println("OK");
			} else {
				out.println("Duplicated");
			}
		} catch (IOException e) {
			e.printStackTrace();
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
			return "redirect:/cooper/list.do?listOpt=0";
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
