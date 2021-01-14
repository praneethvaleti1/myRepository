package com.collegemgmtservice.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.collegemgmtservice.model.User;

public interface UserRepository extends CrudRepository<User, String>{
	List<User> findAll();
}
