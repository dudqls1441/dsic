package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

		int cnt = this.memberService.create(map);
		System.out.println("map.id  : " + map.get("id").toString());
		Map<String, Object> member = this.memberService.selectMember(map.get("id").toString());
		System.out.println("member : " + member);
		if (cnt == 1) {
			mav.addObject("code", "create_success");
			mav.addObject("name", member.get("NAME")); // 홍길동님(user4) 회원 가입을 축하합니다.
			mav.addObject("id", member.get("ID"));
		} else {
			mav.addObject("code", "create_fail");
		}
		mav.addObject("cnt", cnt);
		mav.addObject("url", "/members/msg");
		mav.setViewName("redirect:/members/msg.do");
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

	/**
	 * 새로고침 방지, EL에서 param으로 접근
	 * 
	 * @return
	 */
	@RequestMapping(value = "/members/msg.do", method = RequestMethod.GET)
	public ModelAndView msg(String url) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName(url); // forward

		return mav; // forward
	}

	/**
	 * 로그인 ....세션
	 * 
	 * @return
	 */
	// http://localhost:9091/members/login.do
	@RequestMapping(value = "/members/login.do", method = RequestMethod.POST)
	public ModelAndView login_cookie_proc(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			String id, String pw, @RequestParam(value = "id_save", defaultValue = "") String id_save,
			@RequestParam(value = "pw_save", defaultValue = "") String pw_save,
			@RequestParam(value = "return_url", defaultValue = "") String return_url) {
		ModelAndView mav = new ModelAndView();
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("ID", id);
	    map.put("PW", pw);
	    System.out.println("id   : " +map.get("ID")  +  "    pw  :  "  +map.get("PW"));
	    int cnt = this.memberService.checkLogin(map);
	    System.out.println("cnt   : " +cnt);

		return null;
	}
}
