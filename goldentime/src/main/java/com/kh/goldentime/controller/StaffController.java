package com.kh.goldentime.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.goldentime.constant.SessionConstant;
import com.kh.goldentime.entity.StaffDto;
import com.kh.goldentime.error.TargetNotFoundException;
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
		
		return "staff/mypage";
	
	}

//	//비밀번호 변경
//	@GetMapping("/password")
//	public String password() {
//		return "staff/password";
//	}
//	
//	@PostMapping("/password")
//	public String password(HttpSession session,
//			@RequestParam String beforePw,//사용자가 입력한 비밀번호
//			@RequestParam String afterPw) {//사용자가 바꿀 비밀번호
//		String staffId = (String) session.getAttribute(SessionConstant.ID);
//		try { //비밀번호검사
//			StaffDto staffDto = staffDao.selectOne(afterPw);
//			boolean passwordMatch = beforePw.equals(staffDto.getStaffPw());
//			if(!passwordMatch) {
//				throw new Exception();
//			}
//		}
//		
			
////			//비밀번호 변경
////			staffDao.changePassword(staffId, afterPw);
////			return "redirect:password_result";
////			}
//			
//			catch(Exception e) {
//				return "redirect:password?error";
//		}
//	}
//		
//			@GetMapping("/password_result")
//			public String passwordResult() {
//				return "staff/passwordResult";
//			}
//}

@GetMapping("/download")
@ResponseBody
public ResponseEntity<ByteArrayResource> download(
									@RequestParam String staffId) throws IOException {
	//[1] 파일 찾기
	File directory = new File("C:/upload");
	File target = new File(directory, staffId);
	
	if(target.exists()) {//파일 존재
		//[2] 해당 파일의 내용을 불러온다(apache commons io 의존성 필요)
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		
		//[3] 사용자에게 보낼 응답 생성
		//- header에는 보낼 파일의 정보를, body에는 보낼 파일의 내용을 첨부
		return ResponseEntity.ok()
		.header("Content-Encoding", "UTF-8")
		.header("Content-Length", String.valueOf(data.length))
		.header("Content-Disposition", "attachment; filename="+staffId)
		.header("Content-Type", "application/octet-stream")
		.body(resource);
	}
	else {//파일 없음
		//1) 우리가 정한 예외를 발생시키는 방법
		throw new TargetNotFoundException("프로필 없음");
		}
	}
}
