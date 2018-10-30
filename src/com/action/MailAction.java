package com.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.dao.MailDAO;
import com.dto.AccountDTO;
import com.dto.MailDTO;
import com.opensymphony.xwork2.ActionSupport;

public class MailAction extends ActionSupport implements SessionAware{
	public Map<String, Object> session;
	private MailDAO mailDAO = new MailDAO();
	private ArrayList<MailDTO> mailList = new ArrayList<>();
	private MailDTO dto = new MailDTO();
	private int sendFlg = 0;

	private String to;
	private String title;
	private String text;

	//TODO:例外がば
	public String execute() throws Exception{
		System.out.println("execute: MailAction");
		//TODO:ログインしてないときの処理（sessionにidがないときの処理）
		if(session.get("account") == null){
			return ERROR;
		}
		//test code
		//send mail
		if(sendFlg == 1){
			System.out.println("execute: insert");
			dto.setTo(to);
			dto.setTitle(title);
			dto.setText(text);
			mailDAO.insert(dto);
		}
		//get mail list
		AccountDTO dto = (AccountDTO)session.get("account");
		String id = dto.getId();
		mailList = mailDAO.selectWhereTo(id);
		//test code end

		return SUCCESS;
	}

	public ArrayList<MailDTO> getMailList(){
		return this.mailList;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setSendFlg(int sendFlg) {
		this.sendFlg = sendFlg;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}


}
