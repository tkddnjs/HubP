package com.hub.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hub.domain.Bucketlist;
import com.hub.service.pacade.BucketlistService;

@Controller
@RequestMapping("bucketlist")
public class BucketlistController {
	
	
	@Autowired
	private BucketlistService bucketlistService;
	
	@RequestMapping(value="register.do", method=RequestMethod.GET)
	public ModelAndView registerBucketlist(HttpSession session){
		ModelAndView mav = new ModelAndView("bucketlist/registerBucketlist");
		mav.addObject("userId", session.getAttribute("userId"));
		return mav;
	}
	
	@RequestMapping(value="register.do", method=RequestMethod.POST)
	public String registerBucketlist(Bucketlist bucketlist){
		bucketlistService.registerBucketlist(bucketlist);
		return "redirect: list.do";
	}
	
	@RequestMapping(value="modify.do", method=RequestMethod.GET)
	public ModelAndView modifyBucketlist(int bucketlistId){
		ModelAndView mav = new ModelAndView("bucketlist/modifyBucketlist");
		mav.addObject("bucketlist", bucketlistService.findBucketlistByBucketlistId(bucketlistId));
		return mav;
	}
	
	@RequestMapping(value="modify.do", method=RequestMethod.POST)
	public String modifyBucketlist(Bucketlist bucketlist){
		bucketlistService.modifyBucketlist(bucketlist);
		return "redirect: list.do";
	}
	
	@RequestMapping(value="remove.do", method=RequestMethod.GET)
	public String removeBucketlist(int bucketlistId){
		bucketlistService.removeBucketlist(bucketlistId);
		return "redirect: list.do";
	}
	
	// 설계문서에 변수 추가 => HttpSession session, sequenceDiagram 수정
	@RequestMapping(value="detail.do", method=RequestMethod.GET)
	public ModelAndView detailBucketlist(HttpSession session, int bucketlistId){
		ModelAndView mav = null;
		
		Bucketlist bucketlist = bucketlistService.findBucketlistByBucketlistId(bucketlistId);
		String userId = (String) session.getAttribute("userId");
		
		if(bucketlist.getUserId().equals(userId)){
			mav = new ModelAndView("bucketlist/detailBucketlist");
		} else {
			mav = new ModelAndView("List/detailBucketlist");
		}

		mav.addObject("bucketlist", bucketlist);
		return mav;
	}
	
	@RequestMapping(value="list.do", method=RequestMethod.GET)
	public ModelAndView listBucketlist(HttpSession session){
		ModelAndView mav = new ModelAndView("bucketlist/bucketList");
		String userId = (String) session.getAttribute("userId");
		mav.addObject("bucketlists", bucketlistService.findAll(userId));
		return mav;
	}
}

