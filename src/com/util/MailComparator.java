package com.util;

import java.util.Comparator;

import com.dto.MailDTO;

public class MailComparator implements Comparator<MailDTO>{

	@Override
	public int compare(MailDTO mail1, MailDTO mail2){
		if(mail1.getSendDate() == null && mail2.getSendDate() == null)return 0;
		if(mail1.getSendDate() == null)return -1;
		if(mail2.getSendDate() == null)return 1;
		return mail1.getSendDate().compareTo(mail2.getSendDate());
	}
}
