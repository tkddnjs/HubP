package com.hub.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hub.domain.Post;
import com.hub.service.pacade.PostService;

@Controller
@RequestMapping("post")
public class PostController {

	@Autowired
	private PostService postService;
	
	@RequestMapping(value="send.do", method=RequestMethod.GET)
	public String sendPost(){
		return "post/sendPost";
	}
	
	@RequestMapping(value="send.do", method=RequestMethod.POST)
	public String sendPost(Post post){
		Date date = new Date();
		post.setSendTime(new java.sql.Date(date.getTime()));
		postService.sendPost(post);
		return "post/listPost";
	}
	
	@RequestMapping(value="remove.do", method=RequestMethod.POST)
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
