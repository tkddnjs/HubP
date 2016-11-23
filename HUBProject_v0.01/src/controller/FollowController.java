package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import domain.Follow;
import service.pacade.FollowService;

@Controller
@RequestMapping("follow")
public class FollowController {

	@Autowired
	private FollowService followService;
	
	@RequestMapping(value="request.do", method=RequestMethod.POST)
	public String requestFollow(HttpSession session, String followId){
		Follow follow = new Follow();
		follow.setUserId((String)session.getAttribute("userId"));
		follow.setFollowId(followId);
		followService.registerFollow(follow);
		return "redirect: list/list.do";
	}
	
	@RequestMapping(value="confirm.do", method=RequestMethod.POST)
	public String confirmFollow(Follow follow){
		followService.confirmFollow(follow);
		return "redirect: follow/list.do";
	}
	
	@RequestMapping(value="remove.do", method=RequestMethod.POST)
	public String removeFollow(Follow follow){
		followService.removeFollow(follow);
		return "redirect: follow/list.do";
	}
	
	@RequestMapping(value="listAll.do", method=RequestMethod.POST)
	public ModelAndView listAllFollows(HttpSession session){
		ModelAndView mav = new ModelAndView("Follow/listFollow");
		String userId = (String)session.getAttribute("userId");
		List<Follow> fList = new ArrayList<>();
		fList.addAll(followService.findRequestedFollows(userId));
		fList.addAll(followService.findAll(userId));
		mav.addObject("follows", fList);
		return mav;
	}
	
	@RequestMapping(value="listRelation.do", method=RequestMethod.POST)
	public ModelAndView listFollowsByRelation(HttpSession session, int listOpt){
		ModelAndView mav = new ModelAndView("Follow/listFollow");
		Follow follow = new Follow();
		follow.setUserId((String)session.getAttribute("userId"));
		follow.setRelation(listOpt);
		mav.addObject("follows", followService.findFollowsByRelation(follow));
		return mav;
	}
}
