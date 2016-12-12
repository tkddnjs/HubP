package com.hub.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hub.domain.Follow;
import com.hub.service.pacade.FollowService;

@Controller
@RequestMapping("follow")
public class FollowController {

	@Autowired
	private FollowService followService;
	
//	@RequestMapping(value="request.do", method=RequestMethod.POST)
//	public String requestFollow(HttpSession session, String followId){
//		Follow follow = new Follow();
//		follow.setUserId((String)session.getAttribute("userId"));
//		follow.setFollowId(followId);
//		follow.setConfirm(true);
//		followService.registerFollow(follow);
//		return "redirect: list/list.do";
//	}
	
	@RequestMapping(value="request.do", method=RequestMethod.POST)
	public void requestFollow(Follow follow){
		follow.setConfirm(true);
		followService.requestFollow(follow);
	}
	
	@RequestMapping(value="confirm.do", method=RequestMethod.POST)
	public String confirmFollow(Follow follow){
		followService.confirmFollow(follow);
		return "redirect: listAll.do";
	}
	
	@RequestMapping(value="remove.do", method=RequestMethod.POST)
	public String removeFollow(Follow follow){
		followService.removeFollow(follow);
		return "redirect: listAll.do";
	}
	
	@RequestMapping(value="listAll.do", method=RequestMethod.GET)
	public ModelAndView listAllFollows(HttpSession session){
		//ModelAndView mav = new ModelAndView("follow/listFollow");
		ModelAndView mav = new ModelAndView("bucketlist/bucketList");
		String userId = (String)session.getAttribute("userId");
		List<Follow> fList = new ArrayList<>();
		fList.addAll(followService.findRequestedFollows(userId));
		fList.addAll(followService.findAll(userId));
		mav.addObject("follows", fList);
		return mav;
	}
	
	@RequestMapping(value="listRelation.do", method=RequestMethod.POST)
	public ModelAndView listFollowsByRelation(HttpSession session, int listOpt){
		ModelAndView mav = new ModelAndView("follow/listFollow");
		String userId = (String)session.getAttribute("userId");
		mav.addObject("follows", followService.findFollowsByRelation(userId, listOpt));
		return mav;
	}
	
	@RequestMapping(value="autoComplete.do", method=RequestMethod.POST)
	public void autoCompleteFollows(HttpServletResponse resp, String userId){
		List<String> followList = new ArrayList<>();
		
		for(Follow follow : followService.findAll(userId)){
			followList.add(follow.getFollowId());
		}
		
		try {
			PrintWriter out = resp.getWriter();
			out.println(followList);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
