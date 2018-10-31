package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public String getDateYMDHMS(){
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		return simpleDateFormat.format(date);
	}

	public String getDateYMD(){
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");

		return simpleDateFormat.format(date);
	}
}
