package com.kh.goldentime.controller;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.goldentime.entity.AttachmentDto;
import com.kh.goldentime.repository.AttachmentDao;

@RestController
@RequestMapping("/attachment")
public class AttachmentController {
	
	//의존성 주입
	@Autowired
	private AttachmentDao attachmentDao;
	
	//사원 첨부파일
	@GetMapping("/download/staff")
	public ResponseEntity<ByteArrayResource> downloadStaff(@RequestParam int attachmentNo) throws IOException {
		//첨부파일 번호로 DB조회
		AttachmentDto attachmentDto = attachmentDao.selectAttachment(attachmentNo);
		//조회 결과가 없는 경우 에러
		if(attachmentDto == null) return ResponseEntity.notFound().build();
		
		//조회 결과 있으면 첨부파일 다운로드 상위경로 설정
		File directory = new File("D:/upload/final/staff");
		//디렉토리 생성
		directory.mkdirs();
		
		//첨부파일 다운로드 하위경로 설정
		File target = new File(directory, String.valueOf(attachmentNo));
		//File경로 byte 배열로 읽기
		byte[] data = FileUtils.readFileToByteArray(target);
		//byte 배열로...
		ByteArrayResource resource = new ByteArrayResource(data);
		
		//ResponseEntity 반환
		//인코딩방식, 파일크기, 배치방식, 형식정보 반환
		return ResponseEntity.ok()
				.header("Content-Encoding", "UTF-8")
				.header("Content-Length", String.valueOf(attachmentDto.getAttachmentSize()))
				.header("Content-Disposition", "attachment; filename=" + attachmentDto.getAttachmentName())
				.header("Content-Type", attachmentDto.getAttachmentType())
				.body(resource);
	}
	
	
}