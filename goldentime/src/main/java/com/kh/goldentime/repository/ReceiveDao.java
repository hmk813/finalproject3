package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.vo.ReceiveVO;

public interface ReceiveDao {
	void insert(ReceiveVO vo);
	void insert2(ReceiveVO vo);
	boolean edit(ReceiveVO vo);
	List<ReceiveVO> list();
}
