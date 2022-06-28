package com.jafa.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.jafa.AppTest;

public class SampleTxServiceImplTest extends AppTest {

	@Autowired
	SampleTxService service;
	
	@Test
	public void testTx() {
		service.addData("HELLOWORLD");
		
		
		
		
	}

}
