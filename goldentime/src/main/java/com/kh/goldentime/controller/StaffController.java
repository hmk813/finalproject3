package com.kh.goldentime.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.goldentime.constant.SessionConstant;
import com.kh.goldentime.entity.StaffDto;
import com.kh.goldentime.repository.StaffDao;

@Controller
@RequestMapping("/staff")
public class StaffController {

	@Autowired
	private StaffDao staffDao;
	
	@GetMapping("/login")
	public String login() {
		return "staff/login";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute StaffDto inputDto,
			HttpSession session) {
		StaffDto findDto = staffDao.selectOne(inputDto.getStaffId());
		if(findDto == null) {
			return "redirect:login?error";
		}
		
		//inputDto 사용자가 입력한 정보, findDto DB조회결과
		boolean passwordMatch = 
				inputDto.getStaffPw().equals(findDto.getStaffPw()); 
		if(passwordMatch) {
			session.setAttribute(SessionConstant.ID, inputDto.getStaffId());
			session.setAttribute(SessionConstant.GRADE, findDto.getStaffGrade());
	
			return "redirect:/";
		}
		else {
			return "redirect:login?error";
		}
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute(SessionConstant.ID);
		session.removeAttribute(SessionConstant.GRADE);
		return "redirect:/";
	}
	
	//마이페이지 -현재 로그인한 회원의 정보를 화면에 출력한다
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		
		//세션에 들어있는 아이디를 꺼낸다
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		
		//아이디를 이용하여 직원 정보를 불러온다
		StaffDto staffDto = staffDao.selectOne(loginId);
		
		//불러온 회원 정보를 모델에 첨부한다
		model.addAttribute("staffDto",staffDto);
		
		return "staff/detail";
	
	}

	//비밀번호 변경
	@GetMapping("/password")
	public String password() {
		return "staff/password";
	}
	
	@PostMapping("/password")
	public String password(HttpSession session,
			@RequestParam String beforePw,//사용자가 입력한 비밀번호
			@RequestParam String afterPw) {//사용자가 바꿀 비밀번호
		String staffId = (String) session.getAttribute(SessionConstant.ID);
		try { //비밀번호검사
			StaffDto staffDto = staffDao.selectOne(afterPw);
			boolean passwordMatch = beforePw.equals(staffDto.getStaffPw());
			if(!passwordMatch) {
				throw new Exception();
			}
			
			//비밀번호 변경
			staffDao.changePassword(staffId, afterPw);
			return "redirect:password_result";
			}
			
			catch(Exception e) {
				return "redirect:password?error";
		}
	}
		
			@GetMapping("/password_result")
			public String passwordResult() {
				return "staff/passwordResult";
			}
}