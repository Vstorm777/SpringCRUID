package com.cruid.model;

import javax.persistence.*;
import javax.validation.constraints.*;


@Entity
@Table(name = "\"user\"")
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="userId", updatable = false, nullable = false)
	private Long id;
	public Long getId() { return id; }  
	public void setId(Long val) { id = val;}		
	
	
	@NotEmpty(message = "Нужно заполнить")	
	@Size(min = 5, max = 50, message="Кол-во символов от 5 до 50")
	private String name;
	public String getName() { return name; }  
	public void setName(String val) { name = val;}
		
	
	@NotEmpty(message = "Нужно заполнить")	
	//@Pattern(regexp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message="Email не правильный")
	private String email;
	public String getEmail() { return email; }  
	public void setEmail(String val) { email = val;}
	
	
	private boolean emailConfirm;
	public boolean getEmailConfirm() { return emailConfirm; }  
	public void setEmailConfirm(boolean val) { emailConfirm = val;}

	
	@OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_status_id", nullable = false)
	private UserStatus userStatus;
	public UserStatus getUserStatus() { return userStatus; }  
	public void setUserStatus(UserStatus val) { userStatus = val; }
}
