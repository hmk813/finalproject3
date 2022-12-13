package com.kh.goldentime.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.goldentime.repository.VacationDao;

@Service
public class SchedulerServiceImpl implements SchedulerService {

	//휴가 의존성 주입
	@Autowired
	private VacationDao vacationDao;
	
	@Scheduled(cron = "0 0 0 1 1 ?")//매년 1월 1일 정각
	@Override
	public void updateLeaveCnt() {
		vacationDao.newYearUpdate();
	}

}
