package com.kh.goldentime;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.Pbkdf2PasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class SecurityTest {
	
	@Test
	public void test3() { //우리가 사용하는 형태!!!
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String origin = "hello everyone";
		String encrypt = encoder.encode(origin);//암호화
		log.debug("origin = {}", origin);
		log.debug("encrypt = {}", encrypt);
		
		log.debug("판정 = {}", encoder.matches(origin, encrypt));
		
	}
}


