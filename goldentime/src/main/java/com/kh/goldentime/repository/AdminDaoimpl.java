package com.kh.goldentime.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.vo.AdminAttendSearchVO;
import com.kh.goldentime.vo.AdminAttendanceVO;

@Repository
public class AdminDaoimpl implements AdminDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<AdminAttendanceVO> attendanceList(AdminAttendanceVO adminAttendanceVO) {
		return sqlSession.selectList("admin.attendanceSearchList", adminAttendanceVO);
	}
	
	// 추상 메소드 오버라이딩 - 자유게시글 조회
	   @Override
	   public List<AdminAttendanceVO> searchFreeboard(AdminAttendSearchVO adminAttendSearchVO) {
	      // 검색 조회인지 판정
	      boolean isSearch = adminAttendSearchVO.isSearch();
	      if(isSearch) { // 검색 조회일 경우
	         return selectSearch(adminAttendSearchVO); // 검색 조회 메소드 결과 반환
	      }
	      else { // 검색 조회가 아닐 경우(전체 조회일 경우)
	         return selectAll(adminAttendSearchVO); // 전체 조회 메소드 결과 반환
	      }
	   }
	   
	   // 추상 메소드 오버라이딩 - 자유게시글 검색 조회
	   @Override
	   public List<AdminAttendanceVO> selectSearch(AdminAttendSearchVO adminAttendSearchVO) {
	      // 바인딩 변수를 저장할 Map 생성
	      Map<String, String> param = new HashMap<>();
	      // 바인딩 변수로 사용할 값 저장
	      param.put("beginMade", adminAttendSearchVO.getBeginMade());
	      param.put("endMade", adminAttendSearchVO.getEndMade());
	      param.put("staffName", adminAttendSearchVO.getStaffName());
	      param.put("rownumStart", String.valueOf(adminAttendSearchVO.rownumStart()));
	      param.put("rownumEnd", String.valueOf(adminAttendSearchVO.rownumEnd()));
	      // Map을 바인딩 변수로 하여 검색 조회 후 결과 반환
	      return sqlSession.selectList("admin.searchList", param);
	   }
	   
	   // 추상 메소드 오버라이딩 - 자유게시글 전체 조회
	   @Override
	   public List<AdminAttendanceVO> selectAll(AdminAttendSearchVO adminAttendSearchVO) {
	      // 바인딩 변수를 저장할 Map 생성
	      Map<String, String> param = new HashMap<>();
	      // 바인딩 변수로 사용할 값 저장
	      param.put("rownumStart", String.valueOf(adminAttendSearchVO.rownumStart()));
	      param.put("rownumEnd", String.valueOf(adminAttendSearchVO.rownumEnd()));
	      // 게시글 전체 조회 후 결과 반환
	      return sqlSession.selectList("admin.attendanceAllList", param);
	   }
	   
	   // 추상 메소드 오버라이딩 - 자유게시글 게시글 총 갯수 반환
	   @Override
	   public int countFreeboard(AdminAttendSearchVO adminAttendSearchVO) {
	      // 검색 조회인지 여부에 따라 다른 메소드 실행
	      if(adminAttendSearchVO.isSearch()) { // 검색 조회라면
	         return searchCountFreeboard(adminAttendSearchVO);
	      }
	      else { // 전체 조회라면
	         return allCountFreeboard();
	      }
	   }
	   
	   // 추상 메소드 오버라이딩 - 자유게시글 검색 조회시 게시글 총 갯수 반환
	   @Override
	   public int searchCountFreeboard(AdminAttendSearchVO adminAttendSearchVO) {
	      // 바인딩 변수를 저장할 Map 생성
	      Map<String, String> param = new HashMap<>();
	      // 바인딩 변수로 사용할 값 저장
	      param.put("beginMade", adminAttendSearchVO.getBeginMade());
	      param.put("endMade", adminAttendSearchVO.getEndMade());
	      param.put("staffName", adminAttendSearchVO.getStaffName());
	      param.put("rownumStart", String.valueOf(adminAttendSearchVO.rownumStart()));
	      param.put("rownumEnd", String.valueOf(adminAttendSearchVO.rownumEnd()));
	      return sqlSession.selectOne("admin.searchCount", param);
	   }
	   
	   // 추상 메소드 오버라이딩 - 자유게시글 전체 조회시 게시글 총 갯수 반환
	   @Override
	   public int allCountFreeboard() {
	      return sqlSession.selectOne("admin.allCount");
	   }

	

	
	
}
