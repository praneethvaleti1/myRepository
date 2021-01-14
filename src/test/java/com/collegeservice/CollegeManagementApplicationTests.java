package com.collegeservice;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@ContextConfiguration
public class CollegeManagementApplicationTests {

	private static final Logger logger = LoggerFactory.getLogger(CollegeManagementApplicationTests.class);
	@Test
	public void contextLoads() {
		logger.info("Running  Tests for College Service");
	}

}
