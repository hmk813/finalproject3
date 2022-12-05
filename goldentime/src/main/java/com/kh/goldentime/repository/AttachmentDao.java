package com.kh.goldentime.repository;

import com.kh.goldentime.entity.AttachmentDto;

public interface AttachmentDao {

	int sequence();
	void save(AttachmentDto attachmentDto);
	AttachmentDto find(int attchmentNo);
}
