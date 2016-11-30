package com.hub.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
		return "list.do";
	}
	
	@RequestMapping(value="remove.do", method=RequestMethod.POST)
	public String removePost(int[] checks){
		for(int i : checks){
			postService.removePost(i);
		}
		return "list.do";
	}
	
	@RequestMapping(value="list.do", method=RequestMethod.GET)
	public ModelAndView listPost(HttpSession session, int listOpt, String followId){
		ModelAndView mav = new ModelAndView("post/listPost");
		String userId = (String) session.getAttribute("userId");
		List<Post> posts = new ArrayList<>();
		switch(listOpt){
		case 1:
			posts = postService.findAll(userId);
			break;
		case 2:
			posts = postService.findPosts(userId, followId);
			break;
		case 3:
			posts = postService.findReceivePosts(userId);
			break;
		case 4:
			posts = postService.findSendPosts(userId);
			break;
		}
		mav.addObject("posts", posts);
		return mav;
	}
	
	public ModelAndView detailPost(int postId){
		ModelAndView mav = new ModelAndView("post/detail");
		Post post = postService.findPostByPostId(postId);
		mav.addObject("post", post);
		return mav;
	}
}
