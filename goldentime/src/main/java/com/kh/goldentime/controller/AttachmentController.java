package com.kh.goldentime.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.goldentime.entity.AttachmentDto;
import com.kh.goldentime.repository.AttachmentDao;

@Controller
public class AttachmentController {
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	private File dir = new File(System.getProperty("user.home"), "/upload");
	
	@PostMapping("/upload")
	public String upload(@RequestParam MultipartFile attach) throws IllegalStateException, IOException{
		
		int attachmentNo = attachmentDao.sequence();
		attachmentDao.save(AttachmentDto.builder()
				.attachmentNo(attachmentNo)
				.attachmentName(attach.getOriginalFilename())
				.attachmentType(attach.getContentType())
				.attachmentSize(attach.getSize())
				.attachmentDate(sysdate())
			.build());
		return null;
	}

	private Date sysdate() {
		// TODO Auto-generated method stub
		return null;
	}

}
