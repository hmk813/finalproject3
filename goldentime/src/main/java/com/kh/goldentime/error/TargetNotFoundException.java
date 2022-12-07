package com.kh.goldentime.error;

import lombok.NoArgsConstructor;

//사용자 지정 예외 클래스
//- JVM이 인지하지 못하지만 문제가 되는 상황을 알려주기 위한 클래스
//- 상속을 통한 자격 획득

@NoArgsConstructor
public class TargetNotFoundException extends RuntimeException{
	public TargetNotFoundException(String message) {
	super(message);
	}
}
