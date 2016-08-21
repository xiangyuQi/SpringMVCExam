package com.hand.mapper;

import java.util.List;

import com.hand.model.Customer;

public interface CustomerMapper {
	
	public Short validate(Customer customer);
	
	public Customer getById(Short id);
	
	public List<Customer> getAll();
	
	public void update(Customer customer);
	
	public void add(Customer customer);
	
	public void delete(Short id);
	
	public void deletePayMent(Short id);
	
	public void deleteRental(Short id);
	
}
