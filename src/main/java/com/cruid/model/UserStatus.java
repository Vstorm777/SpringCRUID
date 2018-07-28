package com.cruid.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "userStatus")
public class UserStatus {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="userStatusId")
	private Long id;
	public Long getId() { return id; }  
	public void setId(Long val) { id = val;}		
	
	
	private String val;
	public String getVal() { return val; }  
	public void setVal(String v) { val = v;}

}