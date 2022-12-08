package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.AttachmentDto;

public interface AttachmentDao {
	
	int sequence();//시퀀스 등록
	void insert(AttachmentDto attchmentDto);//등록
	
	List<AttachmentDto> selectList();//첨부파일 리스트 조회
	AttachmentDto selectOne(int attachmentNo);//단일조회
	
	boolean edit(AttachmentDto attachmentDto);//첨부파일 수정
	boolean delete(int attachmentNo);//첨부파일 삭제
}
