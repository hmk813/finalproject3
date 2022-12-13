package com.kh.goldentime.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.goldentime.vo.OperationInformationVO;

public interface OperationDao {
	
	//목록 조회 
	List<OperationInformationVO>  selectList();
	//단일 조회 
	OperationInformationVO selectOne(int operationNo);
}
