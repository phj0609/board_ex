package com.jafa.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.jafa.AppTest;

public class SampleServiceImplTest extends AppTest {

	@Autowired
	SampleService service;
	
	@Test
	public void test() throws Exception {
		Integer doAdd = service.doAdd("10", "12");
		System.out.println(doAdd); 
	}

}
