package com.example.DaPhone.Repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.DaPhone.Entity.Bill;
import com.example.DaPhone.Entity.User;

@Repository
public interface UserRepo  extends JpaRepository<User, Long>{

	Page<User> findAll(Specification<User> specification, Pageable pageable);

}
