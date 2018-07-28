package com.cruid.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cruid.model.UserStatus;

public interface IUserStatusRepository  extends JpaRepository<UserStatus, Long> {}
