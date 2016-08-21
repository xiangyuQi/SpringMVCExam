package com.hand.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.hand.mapper.CustomerMapper;
import com.hand.model.Customer;
import com.hand.util.PageRequest;

import freemarker.core.ReturnInstruction.Return;

@Service
@Transactional
public class CustomerService {
	
	@Autowired
	private CustomerMapper mapper;
	
	public boolean validate(Customer customer){
		try {
			if(mapper.validate(customer)!=null)
			return true;
		} catch (Exception e) {
			return false;
		}
		return false;
	}
	
	public List<Customer> getAll(){
		return mapper.getAll();
	}
	
	public List<Customer> pageList(PageRequest pageInfo){
		PageHelper.startPage(pageInfo.getPageNo(),pageInfo.getPageSize());
		return getAll();
	}
	
	public boolean delete(int id){
		try {
			mapper.deletePayMent((short)id);
			mapper.deleteRental((short)id);
			mapper.delete((short)id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public void add(Customer customer){
		customer.setCreateDate(new Date());
		customer.setStoreId((byte)1);
		mapper.add(customer);
	}

	public Customer getById(int id) {
		return mapper.getById((short)id);
	}
	
	public boolean update(Customer customer){
		try {
			mapper.update(customer);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
