package com.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class AccountCreateConfirmAction extends ActionSupport implements SessionAware{
	//	入力項目
	private String id;
	private String password;
	private String confirmPassword;
	private String firstName;
	private String lastName;
	private String phoneNumber;
	private String birthDay;
	private String gender;

	public Map<String, Object> session;
	private String errorMessage;


	public String execute(){
		if(textCheck(id, password, firstName, lastName, phoneNumber, birthDay)){
			session.put("id", id);
			session.put("password", password);
			session.put("firstName", firstName);
			session.put("lastName", lastName);
			session.put("phoneNumber", phoneNumber);
			session.put("birthDay", birthDay);
			session.put("gender", gender);
		}else{
			errorMessage = "未入力の項目があります。";
			return ERROR;
		}
		return SUCCESS;
	}

	private boolean textCheck(String...strings){
		for(String string: strings){
			if(string.equals(""))return false;
		}
		return true;
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

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}


}
