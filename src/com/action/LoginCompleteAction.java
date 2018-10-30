package com.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.dao.AccountDAO;
import com.dto.AccountDTO;
import com.opensymphony.xwork2.ActionSupport;

public class LoginCompleteAction extends ActionSupport implements SessionAware{
	private String id;
	private String password;
	private Map<String, Object> session;

	public String execute() throws Exception{
		AccountDAO dao = new AccountDAO();
		AccountDTO dto = dao.selectWhereId(id);
		if(dto.getId().equals(id) && dto.getPassword().equals(password)){
			session.put("account", dto);
			return SUCCESS;
		}
		return ERROR;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
