package kr.co.gogreat.controller.member;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.gogreat.domain.admin.AdminMember;
import kr.co.gogreat.model.service.admin.AdminManagementService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@Autowired
	private AdminManagementService admService;
	
	@RequestMapping("/")
	public String loginForm() {
		return "/login_form";
	}
	
	@RequestMapping("/logout")
	public String logout( HttpSession session ) {
		session.invalidate();
		return "/login_form";
	}

	@RequestMapping("/check")
	public String memberInfoCheck( HttpServletRequest request, HttpSession session, Model model ) {
		
		String id = request.getParameter("id") != null ? request.getParameter("id") : "";
		String password = request.getParameter("password") != null ? request.getParameter("password") : "";
		String url = "/login_form";
		
		AdminMember adm = admService.getAdminMember(new AdminMember(id, password));
		
		//String resultid = adm.getId();
		
		if(adm != null) {
			session.setAttribute("adm", adm);
			//String tempid = adm.getId();
/*			if(resultid.equals("demo")){
				url = "redirect:/admin/demodashboard";
				
			}
			else{*/
				url = "redirect:/admin/dashboard";
		//	}
			
		}else {
			model.addAttribute("message", "로그인 정보가 잘못되었습니다");
		}
				
		return url;
	}
	
}









