package com.kh.goldentime.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.goldentime.vo.OperationInformationVO;

public interface OperationDao {
	
	List<OperationInformationVO>  selectList();
}
