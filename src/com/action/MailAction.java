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
		//ログインしてないときの処理（sessionにidがないときの処理）
		if(session.get("account") == null){
			System.out.println("-------- Need login");
			return ERROR;
		}

		//login済みなので情報を取ってくる
		AccountDTO account = (AccountDTO)session.get("account");

		//送信フラグがたっているときメール送信処理を行う
		if(sendFlg == 1){
			System.out.println("-------- Send mail");
			dto.setFrom(account.getId());
			dto.setTo(to);
			dto.setTitle(title);
			dto.setText(text);
			mailDAO.insert(dto);
		}

		//ログインIDのメールリストを取得する
		System.out.println("-------- Get mail list");
		mailList = mailDAO.selectWhereTo(account.getId());

		return SUCCESS;
	}

	public ArrayList<MailDTO> getMailList(){
		return this.mailList;
	}

	public void setMailList(ArrayList<MailDTO> mailList) {
		this.mailList = mailList;
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
