package com.kh.goldentime.repository;

import com.kh.goldentime.entity.AttachmentDto;

public interface AttachmentDao {
	
	int sequence();//시퀀스 등록
	void insert(AttachmentDto attchmentDto);//등록
	AttachmentDto find(int attachmentNo);//조회
	
	
}
