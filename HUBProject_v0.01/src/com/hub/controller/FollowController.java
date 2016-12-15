package com.hub.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hub.domain.Follow;
import com.hub.service.pacade.FollowService;

@Controller
@RequestMapping("follow")
public class FollowController {

	@Autowired
	private FollowService followService;
	
	@RequestMapping(value="request.do", method=RequestMethod.POST)
	public String requestFollow(Follow follow){
		follow.setConfirm(true);
		int result = followService.requestFollow(follow);
		if(result==4){
			return "redirect: ../bucketlist/list.do";
		}
		return "redirect: ../bucketlist/list.do";
	}
	
	@RequestMapping(value="confirm.do", method=RequestMethod.POST)
	public String confirmFollow(Follow follow){
		followService.confirmFollow(follow);
		return "redirect: ../bucketlist/list.do";
	}
	
	@RequestMapping(value="remove.do", method=RequestMethod.POST)
	public String removeFollow(Follow follow){
		followService.removeFollow(follow);
		return "redirect: ../bucketlist/list.do";
	}
	
	@RequestMapping(value="listAll.do", method=RequestMethod.GET)
	public void listAllFollows(HttpServletResponse response, String userId){
		List<Follow> fList = new ArrayList<>();
		fList.addAll(followService.findRequestedFollows(userId));
		fList.addAll(followService.findAll(userId));
		try {
			PrintWriter out = response.getWriter();
			out.print(fList);
			
		} catch (IOException e) {
		}
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
	
	@RequestMapping(value="check.do", method=RequestMethod.POST)
	public void checkFollows(HttpServletResponse resp, String userId, String followId){
		try {
			PrintWriter out = resp.getWriter();
			
			if(followService.checkFollowRequested(userId, followId)){
				out.print("available");
			} else {
				out.print("already");
			}
		} catch (IOException e) {
		}
	}
	
	public Follow findFollowById(String userId, String followId){
		return followService.findFollowById(userId, followId);
	}
}
