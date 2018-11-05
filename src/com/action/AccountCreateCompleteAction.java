package com.action;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.dao.AccountDAO;
import com.dto.AccountDTO;
import com.opensymphony.xwork2.ActionSupport;

//TODO:genderなおす
public class AccountCreateCompleteAction extends ActionSupport implements SessionAware{
	private String id;
	private String password;
	private String confirmPassword;
	private String firstName;
	private String lastName;
	private String phoneNumber;
	private String birthDay;
	private String gender;

	public Map<String, Object> session;
	private AccountDAO dao = new AccountDAO();
	private AccountDTO dto = new AccountDTO();

	public String execute() throws SQLException, ParseException{
		dto.setId(session.get("id").toString() + "@imail.com");
		dto.setPassword(session.get("password").toString());
		dto.setLastName(session.get("lastName").toString());
		dto.setFirstName(session.get("firstName").toString());
		dto.setPhoneNumber(session.get("phoneNumber").toString());
		dto.setBirthDay(java.sql.Date.valueOf(session.get("birthDay").toString()));
		dto.setGender(session.get("gender").toString());
		dao.insert(dto);
		return SUCCESS;
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

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public String getGender() {
		return gender;
	}

	public void setGener(String gender) {
		this.gender = gender;
	}

	@Override
	public void setSession(Map<String, Object> session){
		this.session = session;
	}
}
