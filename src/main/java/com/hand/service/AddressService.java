package com.hand.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.mapper.AddressMapper;
import com.hand.model.Address;

@Service
@Transactional
public class AddressService {
	@Autowired
	private AddressMapper mapper;
	
	public List<Address> getAll(){
		return mapper.getAll();
	}
}
