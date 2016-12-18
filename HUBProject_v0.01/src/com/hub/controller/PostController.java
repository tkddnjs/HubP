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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hub.domain.Post;
import com.hub.service.pacade.PostService;

@Controller
@RequestMapping("post")
public class PostController {

	@Autowired
	private PostService postService;
	
	/*@RequestMapping(value="send.do", method=RequestMethod.GET)
	public String sendPost(){
		return "post/sendPost";
	}*/
	
	@RequestMapping(value="send.do", method=RequestMethod.POST)
	public void sendPost(Post post, HttpServletResponse resp){
		postService.sendPost(post);
		
		try {
			PrintWriter out = resp.getWriter();
			out.print("ok");
		} catch (IOException e) {
		}
	}
	
	@RequestMapping(value="remove.do", method=RequestMethod.POST)
	public String removePost(int[] checks, int listOpt, String followId, String userId){
		for(int i : checks){
			postService.removePost(i);
		}
		if(followId == null){
			return "redirect: list.do?listOpt="+listOpt;
		} else {
			return "redirect: ../user/detail.do?myId="+userId+"&userId="+followId;
		}
	}
	
	@RequestMapping(value="list.do", method=RequestMethod.GET)
	public ModelAndView listPost(HttpSession session, int listOpt, String followId){
		ModelAndView mav = new ModelAndView("bucketlist/bucketList");
		String userId = (String) session.getAttribute("userId");
		List<Post> posts = new ArrayList<>();
		switch(listOpt){
		case 1:
			posts = postService.findAll(userId);
			break;
		case 2:
			posts = postService.findPosts(userId, followId);
			break;
		}
		mav.addObject("posts", posts);
		mav.addObject("tabOpt", 6);
		return mav;
	}
	
	public ModelAndView detailPost(int postId){
		ModelAndView mav = new ModelAndView("post/detail");
		Post post = postService.findPostByPostId(postId);
		mav.addObject("post", post);
		return mav;
	}
}
