package com.kh.goldentime.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.goldentime.constant.SessionConstant;
import com.kh.goldentime.entity.StaffDto;
import com.kh.goldentime.repository.AttachmentDao;
import com.kh.goldentime.repository.AttendanceDao;
import com.kh.goldentime.repository.StaffDao;
import com.kh.goldentime.repository.VacationDao;

@Controller
public class MypageController {

	@Autowired
	private AttachmentDao attachmentDao;

	@Autowired
	private StaffDao staffDao;

	@Autowired
	private AttendanceDao attendanceDao;

	@Autowired
	private VacationDao vacationDao;

	@GetMapping("/")
	public String login() {
		return "/staff/login";
	}

	@PostMapping("/login")
	public String login(@ModelAttribute StaffDto inputDto,
			HttpSession session) {
		StaffDto findDto = staffDao.selectOne(inputDto.getStaffId());
		if(findDto == null) {
			return "redirect:login?error";
		}

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		boolean passwordMatch = encoder.matches(inputDto.getStaffPw(), findDto.getStaffPw());
	//			inputDto.getStaffPw().equals(findDto.getStaffPw()); 
		if(passwordMatch) {
			session.setAttribute(SessionConstant.ID, inputDto.getStaffId());
			session.setAttribute(SessionConstant.GRADE, findDto.getStaffGrade());

			return "redirect:/staff/mypage";
		}
		else {
			return "redirect:/staff/login?error";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute(SessionConstant.ID);
		session.removeAttribute(SessionConstant.GRADE);
		return "redirect:/staff/login";
	}


	@RequestMapping("/staff/mypage")
	public String mypage(HttpSession session, Model model) {
		//세션에 들어있는 아이디를 꺼낸다
		String loginId = (String) session.getAttribute(SessionConstant.ID);

		//아이디를 이용하여 직원 정보를 불러온다
		StaffDto staffDto = staffDao.selectOne(loginId);

		//불러온 회원 정보를 모델에 첨부한다
		model.addAttribute("staffDto",staffDto);
		model.addAttribute("attendanceDto",attendanceDao.todaywork(staffDto.getStaffId()));
		model.addAttribute("vacationStaffVO", vacationDao.list(staffDto.getStaffId()));
		
		//반환한 로그인 아이디로 직원 이미지 테이블에서 첨부파일 번호를 조회한 후 모델에 넣음
		int attachmentNo = attachmentDao.selectStaffAttachment(loginId);
		model.addAttribute("attachmentNo", attachmentNo);
		
		return "/staff/mypage";
	}

	@GetMapping("/staff/password")
	public String password() {
		return "/staff/password";
	}

	@PostMapping("/staff/password")
	public String password(
			HttpSession session, 
			@RequestParam String beforePw,//사용자가 입력한 기존비밀번호
			@RequestParam String afterPw) {//사용자가 입력한 바꿀비밀번호
		String staffId = (String) session.getAttribute(SessionConstant.ID);
		StaffDto staffDto = staffDao.selectOne(staffId);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		boolean passwordMatch = encoder.matches(beforePw,staffDto.getStaffPw());

		if(passwordMatch) {
			String newPw = encoder.encode(afterPw);
			staffDao.changePassword(staffId, newPw);
			return "/staff/mypage";
		}
		else {
			return "redirect:/staff/password?error";
	}
}		

	@GetMapping("/password_result")
	public String passwordResult() {
		return "/staff/passwordResult";
	}	

}