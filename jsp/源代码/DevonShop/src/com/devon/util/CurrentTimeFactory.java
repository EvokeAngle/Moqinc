package com.devon.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CurrentTimeFactory {
	
	public static final int FORMAT_TIME = 0;
	public static final int FORMAT_NUMBER = 1;

	public static String getCurrentTime(int formatMode){
		Date date = new Date();
		SimpleDateFormat sdf = null;
		if(formatMode == 0){
			sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		}else if(formatMode == 1){
			sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		}

		String currentTime = sdf.format(date);
		
		return currentTime;
	}
	
	public static String currTimeSub10(){
		Date date = new Date();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy");
		SimpleDateFormat sdf2 = new SimpleDateFormat("MM");
		SimpleDateFormat sdf3 = new SimpleDateFormat("dd");
		int currYear = Integer.parseInt(sdf1.format(date)) - 10;
		String currMonth = sdf2.format(date);
		String currDate = sdf3.format(date);
		String currTime = currYear + "-" + currMonth + "-" + currDate;
		return currTime;
	}
}
