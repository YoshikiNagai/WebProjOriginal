package com.interceptor;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginCheckInterceptor extends AbstractInterceptor implements SessionAware{

	public Map<String, Object> session;

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		System.out.println("!------- Login check interceptor !");
		//Before
		//もしもログインしていない状態なのにメール画面にいたら出る
		if(session != null && !session.containsKey("account")){
			System.out.println("!!------ Exit mail !");
			return "error";
		}

		//Action
		String retString = arg0.invoke();

		//After


		System.out.println("!------- Login check interceptor end !");
		return retString;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
