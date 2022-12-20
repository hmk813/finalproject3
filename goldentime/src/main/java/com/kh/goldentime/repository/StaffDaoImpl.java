package com.kh.goldentime.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.DepartmentDto;
import com.kh.goldentime.entity.StaffDto;
import com.kh.goldentime.vo.StaffSearchVO;

@Repository
public class StaffDaoImpl implements StaffDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Override//목록
	public List<StaffDto> list() {
		return sqlSession.selectList("staff.list");
	}
	
	@Override//수정
	public boolean edit(StaffDto staffDto) {
		int count = sqlSession.update("staff.edit", staffDto);
		return count > 0;
	}
	
	@Override//등록
	public void insert(StaffDto staffDto) {
		String staffPw = staffDto.getStaffPw();
		String enc = encoder.encode(staffPw);
		staffDto.setStaffPw(enc);
		
		sqlSession.insert("staff.insert",staffDto);	
	}

	@Override//목록
	public List<StaffDto> selectList(StaffSearchVO staffSearchVO) {
		//검색 조회인지 판정
		boolean isSearch = staffSearchVO.isSearch();
		if(isSearch) {//검색 조회일 경우
			return selectSearch(staffSearchVO);
		}
		else {//검색 조회가 아닐 경우(전체 조회일 경우)
			return selectAll(staffSearchVO);
		}
	}
	
	@Override//검색조회
	public List<StaffDto> selectSearch(StaffSearchVO staffSearchVO) {
		Map<String, String> param = new HashMap<>();
		param.put("type", staffSearchVO.getType());
		param.put("keyword", staffSearchVO.getKeyword());
		param.put("startRow", String.valueOf(staffSearchVO.startRow()));
		param.put("endRow", String.valueOf(staffSearchVO.endRow()));
		return sqlSession.selectList("staff.searchList", param);
	}
	
	@Override//직원 전체조회
	public List<StaffDto> selectAll(StaffSearchVO staffSearchVO) {
		Map<String, String> param = new HashMap<>();
		param.put("startRow", String.valueOf(staffSearchVO.startRow()));
		param.put("endRow", String.valueOf(staffSearchVO.endRow()));
		return sqlSession.selectList("staff.list", param);
	}

	@Override//단일조회(직원 상세, 마이페이지)
	public StaffDto selectOne(String staffId) {
		return sqlSession.selectOne("staff.one",staffId);
	}

	@Override//수정
	public boolean update(StaffDto staffDto) {
		int count = sqlSession.update("staff.edit", staffDto);
		return count > 0;
	}

	@Override//개인정보 변경
	public boolean changeInformation(StaffDto staffDto) {
		int count = sqlSession.update("staff.information", staffDto);
		return count > 0;
	}
	
	@Override//비밀번호 변경
	public boolean changePassword(String staffId, String afterPw) {
		
		Map<String, String> param = new HashMap<>();
		param.put("staffId", staffId);
		param.put("afterPw", afterPw);
		int count = sqlSession.update("staff.password", param);
		return count>0;
	}
	
	@Override//삭제
	public boolean delete(String staffId) {
		int count = sqlSession.delete("staff.delete", staffId);
		return count > 0;
	}

	@Override//직원 수
	public int count(StaffSearchVO staffSearchVO) {
		if(staffSearchVO.isSearch()) {//검색 조회라면
			return searchCount(staffSearchVO);
		}
		else {//전체 조회라면
			return listCount(staffSearchVO);
		}
	}

	@Override//검색 조회 시 직원 수
	public int searchCount(StaffSearchVO staffSearchVO) {
		Map<String, String> param = new HashMap<>();
		param.put("type", staffSearchVO.getType());
		param.put("keyword", staffSearchVO.getKeyword());
		return sqlSession.selectOne("staff.searchCount", param);
	}
	
	@Override//전체 조회 시 직원 수
	public int listCount(StaffSearchVO staffSearchVO) {
		return sqlSession.selectOne("staff.allCount", staffSearchVO);
	}
	
	@Override//부서 조회
	public List<DepartmentDto> selectDepartment() {
		return sqlSession.selectList("staff.selectDepartment");
	}

	@Override
	public List<StaffDto> staffList() {
		return sqlSession.selectList("staff.staffList");
	}
}