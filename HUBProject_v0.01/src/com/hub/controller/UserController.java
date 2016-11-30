package com.hub.controller;

import java.io.BufferedInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
		return "user/registerUser";
	}
	
	// parameter 추가
	@RequestMapping(value="register.do", method=RequestMethod.POST)
	public String registerUser(User user, HttpServletRequest req, @RequestParam("image") MultipartFile image){
		String fileName = registerImage(req.getServletContext().getRealPath("resources/img/userImg"), image);
		user.setPicture(fileName);
		userService.registerUser(user);
		return "HUBMain";
	}
	
	@RequestMapping(value="modify.do", method=RequestMethod.GET)
	public ModelAndView modifyUser(HttpSession session){
		ModelAndView mav = new ModelAndView("user/modifyUser");
		String userId = (String) session.getAttribute("userId");
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
		return "redirect: HUBMain";
	}
	
	@RequestMapping(value="detail.do", method=RequestMethod.GET)	
	public ModelAndView detailUser(String userId){
		ModelAndView mav = new ModelAndView("user/detailUser");
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
	
	public String registerImage(String saveDir, MultipartFile image){
		OutputStream out = null;
		int size = (int) image.getSize();
		String originalName = image.getOriginalFilename();
		int length = originalName.length();
		String fileType = originalName.substring(length-4, length);
		DateFormat dataFormat = new SimpleDateFormat("yyyymmddHHmmss");
		Date date = new Date();
		StringBuilder fileName = new StringBuilder();
		fileName.append(originalName.substring(0, length-4));
		fileName.append(dataFormat.format(date));
		fileName.append(fileType);
		
		try {
			out = new FileOutputStream(saveDir + "/" + fileName.toString());
			BufferedInputStream bis = new BufferedInputStream(image.getInputStream());
			byte [] buffer = new byte[size];
			int read;
			while ((read = bis.read(buffer)) > 0){
				out.write(buffer, 0, read);
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			IOUtils.closeQuietly(out);
		}
		
		return fileName.toString();
	}
}
