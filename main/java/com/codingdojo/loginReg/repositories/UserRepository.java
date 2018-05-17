package com.codingdojo.loginReg.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.loginReg.models.User;

@Repository
public interface UserRepository  extends CrudRepository<User, Long>{
	User findByUsername(String username);
}
