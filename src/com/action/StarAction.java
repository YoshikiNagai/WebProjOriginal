package com.action;

import com.dao.MailDAO;
import com.opensymphony.xwork2.ActionSupport;

public class StarAction extends ActionSupport{
	private int result;
	private String id;
	private MailDAO dao = new MailDAO();

	public String execute() throws Exception{
		System.out.println("execute: StarAction");

		result = dao.updateStar(Integer.parseInt(id));
		return SUCCESS;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
