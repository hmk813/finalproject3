package com.kh.goldentime.repository;

import com.kh.goldentime.entity.AttachmentDto;

public interface AttachmentDao {
	
	int sequence();//시퀀스 등록
	void insert(AttachmentDto attchmentDto);//첨부파일 등록
	
	AttachmentDto selectAttachment(int attachmentNo);//첨부파일 조회

	boolean delete(int attachmentNo);//첨부파일 삭제
	
	void insertStaffImg(String staffId, int attachmentNo);//직원 첨부파일 등록
	int selectStaffAttachment(String staffId);//직원 아이디와 연결된 첨부파일 조회
	boolean deleteStaffAttachment(int attachmentNo);//직원 수정 시 첨부파일 재등록을 위한 삭제
}
