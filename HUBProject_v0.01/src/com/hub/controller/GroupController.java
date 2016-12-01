package com.hub.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hub.domain.Group;
import com.hub.service.pacade.GroupService;

@Controller
@RequestMapping("group")
public class GroupController {

	@Autowired
	private GroupService groupService;

	@RequestMapping(value="register.do", method=RequestMethod.GET)
	public ModelAndView registerGroup(HttpSession session) {
		ModelAndView mav = new ModelAndView("group/registerGroup");
		mav.addObject("userId", (String) session.getAttribute("userId"));
		return mav;
	}

	@RequestMapping(value="register.do", method=RequestMethod.POST)
	public String registerGroup(Group group) {
		groupService.registerGroup(group);
		return "redirect: /group/list.do?listOpt=0";
	}

	@RequestMapping(value="join.do", method=RequestMethod.GET)
	public String joinGroup(HttpSession session, int groupId) {
		groupService.joinGroup(groupId, (String) session.getAttribute("userId"));
		return "redirect: /group/detail.do?groupId="+groupId;
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
		return "redirect: /group/detail.do?groupId="+group.getGroupId();
	}

	@RequestMapping(value="remove.do", method=RequestMethod.GET)
	public String removeGroup(int groupId) {
		groupService.removeGroup(groupId);
		return "redirect: /group/list.do?listOpt=0";
	}

	@RequestMapping(value="exit.do", method=RequestMethod.GET)
	public String exitGroup(HttpSession session, int groupId) {
		groupService.exitGroup(groupId, (String) session.getAttribute("userId"));
		return "redirect: /group/list.dolistOpt=0";
	}

	@RequestMapping(value="list.do", method=RequestMethod.GET)
	public ModelAndView listGroup(HttpSession session, int listOpt, String searchWord) {
		ModelAndView mav = new ModelAndView("group/listGroup");

		switch (listOpt) {
		// 전체 모임방 찾기
		case 0:
			mav.addObject("groups", groupService.findAll());
			break;
		// 모임방 이름으로 찾기
		case 1:
			mav.addObject("groups", groupService.findGroupsByGroupName(searchWord));
			break;
		// 연결고리로 찾기
		case 2:
			mav.addObject("groups", groupService.findGroupsByConnChain(searchWord));
			break;
		// 지역 이름으로 찾기
		case 3:
			mav.addObject("groups", groupService.findGroupsByLocal(searchWord));
			break;
		// 내가 속한 모임방 찾기
		case 4:
			mav.addObject("groups", groupService.findGroupsByUserId((String) session.getAttribute("userId")));
			break;
		}
		return mav;
	}
	@RequestMapping(value="detail.do", method=RequestMethod.GET)
	public ModelAndView detailGroup(int groupId) {
		ModelAndView mav = new ModelAndView("group/detailGroup");
		mav.addObject("group", groupService.findGroupByGroupId(groupId));
		return mav;
	}
}
