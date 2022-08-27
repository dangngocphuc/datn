package com.example.DaPhone.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.DaPhone.Entity.User;
import com.example.DaPhone.Model.Response;
import com.example.DaPhone.Request.UserRequest;
import com.example.DaPhone.Service.UserService;
@RestController
@RequestMapping(path = "/api/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	@GetMapping(value = "")
	public ResponseEntity<Response<User>> getUsers(UserRequest userParam) {
		int page = userParam.getPageIndex() - 1;
		int size = userParam.getPageSize();
		Sort sortable = null;
		if (userParam.getSortField() != null && !userParam.getSortField().equalsIgnoreCase("null")) {
			if (userParam.getSortOrder().equals("ascend")) {
				sortable = Sort.by(userParam.getSortField()).ascending();
			}
			if (userParam.getSortOrder().equals("descend")) {
				sortable = Sort.by(userParam.getSortField()).descending();
			}
		} else {
			sortable = Sort.by("userID").descending();
		}
		Pageable pageable = PageRequest.of(page, size, sortable);
		Page<User> pageBrandPage = userService.findUser(userParam, pageable);
		List<User> lists = pageBrandPage.toList();
		Long count = (long) pageBrandPage.getTotalElements();
		return new ResponseEntity<Response<User>>(new Response<User>(count, lists), HttpStatus.OK);
	}

	@PostMapping(value = "/save")
	public ResponseEntity<Response<User>> saveUser(@RequestBody User user) {
		if (user != null) {
			return new ResponseEntity<Response<User>>(new Response<User>(userService.saveUser(user)), HttpStatus.OK);
		}
		return new ResponseEntity<Response<User>>(new Response<User>("loi", "10001"), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{id}")
	public ResponseEntity<Response<User>> getUser(@PathVariable(name = "id") Long id) {
		return new ResponseEntity<Response<User>>(new Response<User>(userService.findUserById(id)), HttpStatus.OK);
	}

	@DeleteMapping(value = "/delete/{id}")
	public ResponseEntity<Response<User>> deleteUser(@PathVariable(name = "id") Long id) {
		userService.deleteUser(id);
		return new ResponseEntity<Response<User>>(new Response<User>("xoa thanh cong", "200"), HttpStatus.OK);
	}
}
