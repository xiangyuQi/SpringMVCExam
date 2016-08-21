package com.hand.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.hand.model.Customer;
import com.hand.service.CustomerService;
import com.hand.util.PageRequest;
import com.hand.util.ResponseUtils;

@RequestMapping("/customer")
@Controller
public class CustomerAction {

	@Autowired
	private CustomerService service;
	
	@RequestMapping("validate")
	public String validate(HttpServletRequest request, HttpServletResponse response){
		String firstName = request.getParameter("firstName");
		Customer customer = new Customer();
		customer.setFirstName(firstName);
		if(service.validate(customer)){
			System.out.println("1332");
			request.getSession().setAttribute("user", "login");
			return "index";
		}else {
			return "login";
		}
	}
	
	@RequestMapping("/list")
	public void list(PageRequest pageInfo ,HttpServletResponse response){
		if(pageInfo.getPageNo() <1 ){
			pageInfo.setPageNo(1);
		}
		pageInfo.setPageSize(10);
		List<Customer> lists = service.pageList(pageInfo);
		PageInfo<Customer> page = new PageInfo<Customer>(lists);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();   
		String text = "{\"totalPages\":"+page.getPages()
		+",\"pageNo\":"+(page.getPageNum()>page.getPages()?page.getPages():page.getPageNum())
		+",\"lists\":"+gson.toJson(lists)+"}";
		ResponseUtils.renderJson(response, text);
	}
	@RequestMapping("del/{id}")
	@ResponseBody
	public String del(@PathVariable("id")int customerId){
		service.delete(customerId);
		return "删除成功";
	}
		
	@RequestMapping("/add")
	@ResponseBody
	public void add(Customer customer,HttpServletResponse response){
		Map<String, String> map = new HashMap<String, String>();
		service.add(customer);
		map.put("msg", "添加成功");
		String text =new Gson().toJson(map);
		ResponseUtils.renderJson(response, text);
	}
	
	@RequestMapping("/get/{id}")
	public void get(@PathVariable("id")int id,HttpServletResponse response){
		Customer customer = service.getById(id);
		ResponseUtils.renderJson(response, new Gson().toJson(customer));
	}
	
	@RequestMapping("/update")
	public void update(Customer customer ,HttpServletResponse response){
		Map<String, String> msg = new HashMap<String, String>();
		if(service.update(customer)){
			msg.put("msg", "更新成功");
		}else 
			msg.put("msg", "更新失败");
		ResponseUtils.renderJson(response, new Gson().toJson(msg));
	}
}
