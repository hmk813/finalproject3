package com.kh.goldentime.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.goldentime.repository.OperationDao;
import com.kh.goldentime.vo.OperationInformationVO;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RequestMapping("/rest")
@RestController
public class OperationRestController {
	@Autowired
	OperationDao operationDao;
	
	@GetMapping("/operationlist")
	public List<OperationInformationVO>  selectList(){
		return operationDao.selectList();
	}
	
	@GetMapping("/opertaionlist/{operationNo}")
	public OperationInformationVO selectOne(@PathVariable int operationNo) {
		operationNo = 21;
		return operationDao.selectOne(operationNo);
	}
}
