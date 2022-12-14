package com.kh.goldentime.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import com.kh.goldentime.entity.AttachmentDto;
import com.kh.goldentime.entity.StaffDto;
import com.kh.goldentime.error.TargetNotFoundException;
import com.kh.goldentime.repository.AttachmentDao;
import com.kh.goldentime.repository.StaffDao;
import com.kh.goldentime.vo.StaffSearchVO;

@Controller
@RequestMapping("/staff")
public class StaffController {

	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private StaffDao staffDao;
	
	
	@GetMapping("test")
	public String test() {
		return "staff/test";
	}

	//첨부파일 의존성
	@Autowired
	private AttachmentDao attachmentDao;
	
	//첨부파일 업로드 다운로드 경로
	private final File directory = new File("D:/upload/final/staff");
	
	@GetMapping("/join")
	public String join() {
		return "staff/join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute StaffDto staffDto, @RequestParam List<MultipartFile> staffImg, 
			HttpSession session) throws IllegalStateException, IOException {
		
		staffDao.insert(staffDto);//DB등록
		
		//첨부파일 DB연결
		for(MultipartFile file : staffImg) {
			//첨부파일 시퀀스
			int attachmentNo = attachmentDao.sequence();
			//DB등록
			attachmentDao.insert(AttachmentDto.builder()
						.attachmentNo(attachmentNo)
						.attachmentName(file.getOriginalFilename())
						.attachmentType(file.getContentType())
						.attachmentSize(file.getSize())
					.build());
			//디렉토리 생성
			directory.mkdirs();
			//파일저장
			File target = new File(directory, String.valueOf(attachmentNo));
			file.transferTo(target);//파일 전송
			
			//직원 첨부파일 연결테이블 정보 저장
			attachmentDao.insertStaffImg(staffDto.getStaffId(), attachmentNo);
		}
		
		session.setAttribute("loginId", staffDto.getStaffId());
		
		return "redirect:mypage";
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
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		boolean passwordMatch = encoder.matches(inputDto.getStaffPw(), findDto.getStaffPw());
	//			inputDto.getStaffPw().equals(findDto.getStaffPw()); 
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
		return "redirect:staff/login";
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
		
		//반환한 회원 아이디로 직원 이미지 테이블에서 첨부파일 번호를 조회한 후 모델에 넣어놔
		int attachmentNo = attachmentDao.selectStaffAttachment(loginId);
		model.addAttribute("attachmentNo", attachmentNo);
		System.out.println(attachmentNo);
		
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
		StaffDto staffDto = staffDao.selectOne(staffId);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		boolean passwordMatch = encoder.matches(beforePw,staffDto.getStaffPw());
		
		if(passwordMatch) {
			String newPw = encoder.encode(afterPw);
			staffDao.changePassword(staffId, newPw);
			return "staff/mypage";
		}
		else {
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