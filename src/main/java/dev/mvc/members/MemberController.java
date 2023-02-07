package dev.mvc.members;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

//	http://localhost:8080/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView createPost() {
		ModelAndView mav = new ModelAndView();

		List<String> list = this.memberService.selectId();
		System.out.println("test  :  " + list);
		mav.setViewName("/index");

		return mav;
	}

//	http://localhost:8080/members/toLogin.do
	@RequestMapping(value = "/members/toLogin.do", method = RequestMethod.GET)
	public ModelAndView toLogin() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/members/login_form");

		return mav;
	}

//		http://localhost:8080/members/toCreate.do
	@RequestMapping(value = "/members/toCreate.do", method = RequestMethod.GET)
	public ModelAndView toCreate() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/members/create");

		return mav;
	}

//	http://localhost:8080/members/create.do
	@RequestMapping(value = "/members/create.do", method = RequestMethod.POST)
	public ModelAndView create(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/members/create");

		return mav;
	}

//		http://localhost:8080/members/checkId.do
	@ResponseBody
	@RequestMapping(value = "/members/checkId.do", method = RequestMethod.GET)
	public String checkId(String id) {

		int cnt = this.memberService.checkId(id);
		
	    JSONObject json = new JSONObject();
	    json.put("cnt", cnt);
	   
	    return json.toString();
	}
}
