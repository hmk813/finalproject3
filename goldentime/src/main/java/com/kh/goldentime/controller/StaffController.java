package com.kh.goldentime.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.goldentime.constant.SessionConstant;
import com.kh.goldentime.entity.StaffDto;
import com.kh.goldentime.error.TargetNotFoundException;
import com.kh.goldentime.repository.StaffDao;
import com.kh.goldentime.vo.StaffSearchVO;


@Controller
@RequestMapping("/staff")
public class StaffController {


	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private StaffDao staffDao;
	
	@GetMapping("/join")
	public String join() {
		return "staff/join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute StaffDto staffDto,
			@RequestParam MultipartFile staffProfile) throws IllegalStateException, IOException {
		
		staffDao.insert(staffDto);//DB등록
		
		if(!staffProfile.isEmpty()){//첨부파일이 있다면
		File directory = new File("C:/upload");
		directory.mkdirs();
		File target = new File(directory, staffDto.getStaffId());
		staffProfile.transferTo(target);
	}
		
//		String password = "1234";
//		String encrypt = encoder.encode(password);
//		System.out.println("encrypt");
//		System.out.println(encoder.matches(password, encrypt));
		
		return "redirect:staff/mypage";
	}
	
	@GetMapping("/join_finish")
	public String joinFinish() {
		return "staff/joinFinish";
	}

	
	@RequestMapping("/list")
	public String list(@ModelAttribute StaffSearchVO vo, Model model) {
	List<StaffDto> list = staffDao.search(vo);
	model.addAttribute("list",list);
	return "staff/list";
	}
	
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
				
			return "redirect:/staff/mypage";
		}
		else {
			return "redirect:login?error";
		}
	}
	
	//로그아웃
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
		
		return "/staff/mypage";
	
	}
	
	//비밀번호 변경
	@GetMapping("/password")
	public String password() {
		return "staff/password";
	}
	
	@PostMapping("/password")
	public String password(
			HttpSession session, 
			@RequestParam String beforePw,//사용자가 입력한 기존비밀번호
			@RequestParam String afterPw) {//사용자가 입력한 바꿀비밀번호
		String staffId = (String) session.getAttribute(SessionConstant.ID);
		
		try {
			
			//비밀번호 검사(복호화)
			StaffDto staffDto = staffDao.selectOne(staffId);
			boolean passwordMatch = encoder.matches(beforePw, staffDto.getStaffPw());
			
			//비밀번호 암호화 과정
			String password = "12345";
			String encrypt = encoder.encode(password);
			
			System.out.println("encrypt");
			System.out.println(encoder.matches(password, encrypt));
			

//		System.out.println(beforePw);
//		System.out.println(afterPw);
		
		if(!passwordMatch) {
				//return "redirect:password?error";
				throw new Exception();
			}
			
			//비밀번호 변경
			staffDao.changePassword(staffId, afterPw);
			return "redirect:password_result";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:password?error";
		}
	}
	
	@GetMapping("/password_result")
	public String passwordResult() {
		return "staff/passwordResult";
	}
		
	
	//개인정보 변경 기능(자기자신)
	@GetMapping("/information")
	public String information(HttpSession session,Model model) {
		String staffId = (String) session.getAttribute(SessionConstant.ID);
		StaffDto staffDto = staffDao.selectOne(staffId);
		model.addAttribute("staffDto", staffDto);
		return "staff/information";
			
	}
	
	@PostMapping("/information")
	public String information(HttpSession session,
			@ModelAttribute StaffDto inputDto) {
		String staffId = (String)session.getAttribute(SessionConstant.ID);
		inputDto.setStaffId(staffId);
		
		//비밀번호 검사
		StaffDto findDto = staffDao.selectOne(staffId);
		boolean passwordMatch = 
				inputDto.getStaffPw().equals(findDto.getStaffPw());
		
		//비밀번호 검사 통과했다면 개인정보 처리 가능
		if(passwordMatch) {
			staffDao.changeInformation(inputDto);
			return "redirect:mypage";
		}
		else { //비밀번호 불일치
			return "redirect:information?error";
		}
	}
		

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
