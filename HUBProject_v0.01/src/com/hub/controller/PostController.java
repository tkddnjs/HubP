package com.hub.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hub.domain.Post;
import com.hub.service.pacade.PostService;

@Controller
@RequestMapping("post")
public class PostController {

	@Autowired
	private PostService postService;
	
	public ModelAndView sendPost(HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	public String sendPost(Post post){
		
		
		return "";
	}
	
	public String removePost(int postId){
		
		return "";
	}
	
	public ModelAndView listPost(HttpSession session, int listOpt, String followId){
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	public ModelAndView detailPost(int postId){
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
}
