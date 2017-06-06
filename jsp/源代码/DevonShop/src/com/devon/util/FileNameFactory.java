package com.devon.util;

import java.util.Random;

public class FileNameFactory {

	public static String createRandomFileName(String oldFileName){
		String currenttime = String.valueOf(System.currentTimeMillis());
		String temp = currenttime + new Random().nextInt(100);
		String newFileName = temp + oldFileName.substring(oldFileName.lastIndexOf("."));
		return newFileName;
	}
}
