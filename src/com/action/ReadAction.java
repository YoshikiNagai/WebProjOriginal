package com.action;

import com.opensymphony.xwork2.ActionSupport;

public class ReadAction extends ActionSupport{
	private String test;

	public String execute(){
		return SUCCESS;
	}

	public String getTest() {
		return test;
	}

	public void setTest(String test) {
		this.test = test;
	}
}
