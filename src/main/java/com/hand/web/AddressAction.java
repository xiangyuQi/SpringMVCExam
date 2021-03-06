package com.hand.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.hand.model.Address;
import com.hand.service.AddressService;
import com.hand.util.ResponseUtils;

@Controller
@RequestMapping("/address")
public class AddressAction {

	@Autowired
	private AddressService service;
	
	@RequestMapping("/list")
	public void list( HttpServletResponse response){
		List<Address> addresses = service.getAll();
		Gson gson = new Gson();
		String text  = gson.toJson(addresses);
		ResponseUtils.renderJson(response, text);
	}
	
}
