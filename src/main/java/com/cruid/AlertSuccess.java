package com.cruid;

public class AlertSuccess {
	public String title;
	public String msg;
	
	public AlertSuccess(String title, String msg) {
		this.title = title;
		this.msg = msg;
	}
	
	public static String getPath() { return "alert/success"; }
}
