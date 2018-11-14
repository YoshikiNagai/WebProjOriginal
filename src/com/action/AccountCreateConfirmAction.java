package com.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.dao.AccountDAO;
import com.opensymphony.xwork2.ActionSupport;

public class AccountCreateConfirmAction extends ActionSupport implements SessionAware{
	//	入力項目
	private String id;
	private String password;
	private String passwordConfirm;
	private String firstName;
	private String lastName;
	private String phoneNumber;
	private String birthDay;
	private String gender;

	public Map<String, Object> session;
	private Map<String, String> errorMessage = new HashMap<>();

	public String execute(){

		if(textCheck(id, password, firstName, lastName, phoneNumber, birthDay) && !validation()){
			session.put("id", id);
			session.put("password", password);
			session.put("firstName", firstName);
			session.put("lastName", lastName);
			session.put("phoneNumber", phoneNumber);
			session.put("birthDay", birthDay);
			session.put("gender", gender);
		}else{
			return ERROR;
		}
		return SUCCESS;
	}

	private boolean validation(){
		boolean result = false;
		AccountDAO dao = new AccountDAO();

		//Id check
		if(id.length() < 6 || 30 < id.length()){
			errorMessage.put("id", "IDは6文字以上30文字以下で入力してください");
			result = true;
		}
		try {
			if(dao.selectWhereId(id.toString()) != null){
				errorMessage.put("id", "既にIDが存在しています");
				result = true;
			}
		} catch (Exception e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		//Password Check
		if(password.length() < 8 || 30 < password.length()){
			errorMessage.put("password", "パスワードは8文字以上30文字以下で入力してください");
			result = true;
		}

		//		確認入力と違う場合
		//TODO:パス確認要追記
		if(!password.equals(passwordConfirm)){
			System.out.println(password +","+ passwordConfirm);
			errorMessage.put("passwordConfirm","パスワードが違います");
			result = true;
		}

		if(firstName.length() > 10){
			errorMessage.put("firstName", "名は10文字以下で入力してください");
			result = true;
		}

		if(lastName.length() > 10){
			errorMessage.put("lastName", "姓は10文字以下で入力してください");
			result = true;
		}

		if(!phoneNumber.matches("[0-9]{1,15}")){
			errorMessage.put("phoneNumber", "電話番号の長さが不正です");
			result = true;
		}

		if(!birthDay.matches("[0-9]{4}-[0-1][0-9]-[0-3][0-9]")){
			errorMessage.put("birthDay", "誕生日は2018-01-01の形式で入力してください");
			result = true;
		}
		return result;
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

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
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



	public Map<String, String> getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(Map<String, String> errorMessage) {
		this.errorMessage = errorMessage;
	}




}
