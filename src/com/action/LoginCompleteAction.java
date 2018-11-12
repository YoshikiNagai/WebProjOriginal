package com.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.dao.AccountDAO;
import com.dto.AccountDTO;
import com.opensymphony.xwork2.ActionSupport;

public class LoginCompleteAction extends ActionSupport implements SessionAware{
	private String id;
	private String password;
	private Map<String, Object> session;
	private Map<String, String> errorMessage = new HashMap<>();

	public String execute() throws Exception{
		System.out.println("-------- Try login , id  : " + id + ", password : " + password);
		AccountDAO dao = new AccountDAO();
		AccountDTO dto = dao.selectWhereId(id);

		//login validation
		if(dto == null){
			System.out.println("-------- No exists ID");
			errorMessage.put("id", "IDが存在しません");
			return ERROR;
		}
		if(!dto.getPassword().equals(password)){
			System.out.println("-------- Incorrect password");
			errorMessage.put("password","パスワードが間違っています");
		}
		if(dto.getId().equals(id) && dto.getPassword().equals(password)){
			System.out.println("-------- Login user :" + dto.getId());
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

	public Map<String, String> getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(Map<String, String> errorMessage) {
		this.errorMessage = errorMessage;
	}

}
