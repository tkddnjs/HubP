package com.hub.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import com.hub.domain.Follow;
import com.hub.domain.Group;
import com.hub.service.pacade.GroupService;

@Controller
@RequestMapping("group")
public class GroupController {

	@Autowired
	private GroupService groupService;
	@Autowired
	private FollowController followContoller;
	

	@RequestMapping(value="register.do", method=RequestMethod.GET)
	public ModelAndView registerGroup(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("group/registerGroup");

		mav.addObject("userId", (String) session.getAttribute("userId"));	
		
		return mav;
	}

	@RequestMapping(value="register.do", method=RequestMethod.POST)
	public String registerGroup(Group group) {
		
		groupService.registerGroup(group);
		return "redirect:/group/list.do?listOpt=0";
	}

	@RequestMapping(value="join.do", method=RequestMethod.GET)
	public String joinGroup(HttpSession session, int groupId, int maxPeople, int joinPeople) {
		
		String userId = (String) session.getAttribute("userId");
		if(maxPeople==joinPeople){
			return "redirect:/group/list.do?listOpt=0";
		}else{
			// 이미 그룹에 참여한 경우
			for(Group g : groupService.findGroupsByUserId(userId)){
				if(g.getGroupId() == groupId){
					// alert창으로 경고 어떻게 해줄 지 고민해보기
					return "redirect:/group/list.do?listOpt=1&userId=" + userId;
				}
			}
			groupService.joinGroup(groupId, userId);
			return "redirect:/group/list.do?listOpt=1&userId=" + userId;
		}
	}

	// 문서 수정 필요 => parameter 변경
	@RequestMapping(value="modify.do", method=RequestMethod.GET)
	public ModelAndView modifyGroup(HttpSession session, int groupId) {
		ModelAndView mav = new ModelAndView("group/modifyGroup");
		mav.addObject("corrector", (String) session.getAttribute("userId"));
		mav.addObject("group", groupService.findGroupByGroupId(groupId));
		return mav;
	}

	@RequestMapping(value="modify.do", method=RequestMethod.POST)
	public String modifyGroup(Group group) {
		groupService.modifyGroup(group);
		return "redirect:/group/list.do?userId="+ group.getManagerId() + "&listOpt=1&modifyGroup=ok";
	}

	@RequestMapping(value="remove.do", method=RequestMethod.GET)
	public String removeGroup(HttpSession session, int groupId) {
		String userId = (String)session.getAttribute("userId");
		List<String> list = groupService.findJoinUsersByGroupId(groupId);
		list.remove(userId);
		for(String followId :list){
			Follow follow = followContoller.findFollowById(userId, followId);
			if(follow.getRelation()==4){
				followContoller.removeFollow(follow);
			}
		}
		groupService.removeGroup(groupId);
		return "redirect:/group/list.do?listOpt=0";
	}

	@RequestMapping(value="exit.do", method=RequestMethod.GET)
	public String exitGroup(HttpSession session, int groupId) {
		groupService.exitGroup(groupId, (String) session.getAttribute("userId"));
		return "redirect:/group/list.do?listOpt=0";
	}

	@RequestMapping(value="list.do", method=RequestMethod.GET)
	public ModelAndView listGroup(HttpSession httpSession, int listOpt, String modifyGroup) {
		ModelAndView mav = new ModelAndView("bucketlist/bucketList");
		String userId = (String)httpSession.getAttribute("userId");
		switch (listOpt) {
		// 전체 모임방 찾기
		case 0:
			mav.addObject("groups", groupService.findAll(userId));
			break;
		// 내가 속한 모임방 찾기
		case 1:
			mav.addObject("groups", groupService.findGroupsByUserId(userId));
			break;
		}
		mav.addObject("listOpt", listOpt);
		mav.addObject("modifyGroup", modifyGroup);
		mav.addObject("tabOpt", 4);
		return mav;
	}
	
	/*@RequestMapping(value="detail.do", method=RequestMethod.GET)
	public ModelAndView detailGroup(int groupId) {
		ModelAndView mav = new ModelAndView("group/detailGroup");
		
		Group group = groupService.findGroupByGroupId(groupId);
		
		mav.addObject("group", group);
		mav.addObject("totalJoinUsers", group.getJoinPeople().size());
		
		return mav;
	}*/
}
