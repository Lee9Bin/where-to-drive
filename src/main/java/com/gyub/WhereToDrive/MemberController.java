package com.gyub.WhereToDrive;

import java.util.Locale;

import com.gyub.WhereToDrive.member.service.MemberService;
import com.gyub.WhereToDrive.member.entity.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping(value = "/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MemberService service;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(User user, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post login");

		HttpSession session = req.getSession();
		User login = service.login(user);

		if (login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/login";
		} else {
			session.setAttribute("member", login);
		}

		return "redirect:/";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "/member/login";
	}

	// ȸ������ get
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get join");
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String postRegister(User user, Model model) throws Exception {
		logger.info("post join");

		int result = service.idChk(user);
		try {
			if (result == 1) {
				System.out.println("���̵� �ߺ��Ǿ���.");
				model.addAttribute("msg","ȸ������ ���� �ٽýõ��ϼ���.");
			    model.addAttribute("url","/member/join");
			    return "/member/redirect";
			} else if (result == 0) {
				System.out.println("ȸ������ ����");
				model.addAttribute("msg","ȸ������ �����Դϴ�.");
		        model.addAttribute("url","/member/login");
				service.register(user);
				return "/member/redirect";
			}
			// ��⿡��~ �Էµ� ���̵� �����Ѵٸ� -> �ٽ� ȸ������ �������� ���ư���
			// �������� �ʴ´ٸ� -> register
			model.addAttribute("msg","����ó��");
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "/member/redirect";
	}

	// ���̵� �ߺ� üũ
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(User user) throws Exception {
		logger.info("IdChk() ����");
		int result = service.idChk(user);
		return result;
	}

}