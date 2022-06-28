package com.jafa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jafa.dao.SampleMapper;
import com.jafa.dao.SampleMapper2;

@Service
public class SampleTxServiceImpl implements SampleTxService {

	@Autowired
	SampleMapper mapper;
	
	@Autowired
	SampleMapper2 mapper2;
	
	@Transactional
	@Override
	public void addData(String value) {
		System.out.println("mapper2");
		mapper2.insertCol(value);
		
		System.out.println("mapper1");
		mapper.insertCol(value);
	}

}
