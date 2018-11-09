package com.action;

import com.dao.MailDAO;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteAction extends ActionSupport{
	private String id;
	private MailDAO dao = new MailDAO();

	public String execute() throws Exception{
		System.out.println("execute: DeleteAction");

		dao.updateDelete(Integer.parseInt(id));
		return SUCCESS;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
