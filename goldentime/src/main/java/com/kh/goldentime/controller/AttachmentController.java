package com.kh.goldentime.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.kh.goldentime.entity.AttachmentDto;
import com.kh.goldentime.repository.AttachmentDao;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController

public class AttachmentController {

	
	private File dir = new File(System.getProperty("user.home"), "/upload");
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@GetMapping("/home")
	public String home() {
		return "home";
	}
	
	@PostMapping("/home")
	public String upload(@RequestParam String uploader,
			@RequestParam MultipartFile attachment) throws IllegalStateException, IOException {
		System.out.println("uploader = " + uploader);
		//attachment 분석
		System.out.println("content type = " + attachment.getContentType());
		System.out.println("name = " + attachment.getName());
		System.out.println("original file name = " + attachment.getOriginalFilename());
		System.out.println("size = " + attachment.getSize());
		
		//사용자가 올린 파일 저장
		File directory = new File("C:/upload");//업로드할 폴더 선택
		
		directory.mkdirs();//폴더 생성 명령
		File target = new File(directory, attachment.getOriginalFilename());//저장될 파일 생성 구문
		attachment.transferTo(target); //실제 저장 처리
		
		return "redirect:home";
	}
	
	//업로드
	@PostMapping("/upload")
	public String upload(@RequestParam MultipartFile attach) throws IllegalStateException, IOException {
		
	//DB에 저장
	int attachmentNo = attachmentDao.sequence();
	attachmentDao.insert(AttachmentDto.builder()
				.attachmentNo(attachmentNo)
				.attachmentName(attach.getOriginalFilename())
				.attachmentType(attach.getContentType())
				.attachmentSize(attach.getSize())
			.build());
	
	//파일 저장
	dir.mkdirs(); //폴더를 생성한다
	
	File target = new File(dir, String.valueOf(attachmentNo));
	attach.transferTo(target);
	
	return ServletUriComponentsBuilder.fromCurrentContextPath()
																	.path("/download/").path(String.valueOf(attachmentNo))
																	.toUriString();
	}

	//다운로드
	@GetMapping("/download/{attachmentNo}")
	public ResponseEntity<ByteArrayResource> download(
			@PathVariable int attachmentNo) throws IOException {
		AttachmentDto attachmentDto = attachmentDao.find(attachmentNo);
		if(attachmentDto == null) {
			throw new IllegalArgumentException();
		}
		
		File target = new File(dir,String.valueOf(attachmentDto.getAttachmentNo()));
		if(!target.exists()) {
			throw new IllegalArgumentException();
		}
		
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		
		return ResponseEntity.ok()
				.header(
						HttpHeaders.CONTENT_ENCODING,
						StandardCharsets.UTF_8.name()
						)
				.header(
						HttpHeaders.CONTENT_TYPE,
						attachmentDto.getAttachmentType()
					)
				.header(
						HttpHeaders.CONTENT_DISPOSITION,
						ContentDisposition.attachment()
							.filename(
									attachmentDto.getAttachmentName(), 
									StandardCharsets.UTF_8
						).build().toString()
				)
				.contentLength(attachmentDto.getAttachmentSize())
				.body(resource);
		}

}