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

import com.hub.service.pacade.ListService;

@Controller
@RequestMapping("list")
public class ListController {

	@Autowired
	private ListService listService;

	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public ModelAndView listUser(int listOpt, String searchWord) {
		ModelAndView mav = new ModelAndView("bucketlist/bucketList");
		switch (listOpt) {
//		페이지만 return
		case 0:
			break;
//		나를 도와줄 수 있는 사용자 목록
		case 2:
			mav.addObject("users", listService.findUsersByConnChain(searchWord));
			break;
//		내가 or 서로 도와줄 수 있는 사용자 목록
		case 1:
		case 3:
			mav.addObject("bucketlists", listService.findBucketlistsByConnChain(searchWord));
			break;
//		업체 목록
//		case 4:
//			mav.addObject("coopers", listService.findCoopersByConnChain(searchWord));
//			break;
		}
		mav.addObject("listOpt", listOpt);
		mav.addObject("tabOpt", 2);
		mav.addObject("searchWord", searchWord);
		return mav;
	}
	
	// 설계문서 변경 필요 => parameter 추가(HttpSession session, int listOpt), return type변경
	@RequestMapping(value="listAutoComplete.do", method=RequestMethod.POST)
	public void autoComplete(HttpSession session, int listOpt, HttpServletResponse resp){
		String userId = (String) session.getAttribute("userId");
		session.setAttribute("listOpt", listOpt);
		ArrayList<String> availableTags = new ArrayList<>();
		switch(listOpt){
		case 1: // 내가
		case 3: // 서로
			for(String str : listService.findConnChainsByUserId(userId)){
				availableTags.add(str);
			}
			break;
		case 2: // 나를
//		case 4: // 업체
			for(String str : listService.findConnChains()){
				availableTags.add(str);
			}
			break;
		}
		try {
			PrintWriter out = resp.getWriter();
			out.println(availableTags);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
