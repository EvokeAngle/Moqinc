package com.devon.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 数据库连接器
 * @author Administrator
 *
 */
public class DatabaseConnecter {
	
	private static Connection connection;
	
	//private static String url = "jdbc:oracle:thin:@:1521:oracle";
	private static String url = "jdbc:oracle:thin:@:1521:orcl";
	private static String user = "devon";
	private static String password = "devon"; 

	/**
	 * 测试与数据库的连接
	 * @param isCloseIt		true:测试完成后,关闭连接; false:测试完成后,不关闭连接
	 * @return		返回null:连接成功; 返回非null:连接失败,可取得返回的字符串中相应的失败原因
	 */
	public static String testConnect(boolean  isCloseIt){
		String result = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			result = "驱动器没找到!";
			e.printStackTrace();
		} catch (SQLException e) {
			result = "数据库连接失败,请检查配置或联系管理员!";
			e.printStackTrace();
		} finally {
			if(isCloseIt == true && connection != null){
				try {
					connection.close();
					connection = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return result;
	}
	
	/**
	 * 用户登录时执行此方法,可判断用户名与密码的正确性
	 * @param programUser		软件登录用户名
	 * @param programPassword		软件登录密码
	 * @return		null:密码验证成功; 非null:连接失败,可取得返回的字符串中相应的失败原因
	 */
	public static String connectDatabase(String programUser, String programPassword){
		// 先测试连接
		String result = testConnect(false);
		// 连接失败,返回错误信息
		if(result != null){
			return result;
		}
		// 连接成功
		String sql_UserIsExist = "select * from employeeinfo where employeeName=?";

		try {
			// 根据用户名遍历数据库
			PreparedStatement preStm_UserIsExist = connection.prepareStatement(sql_UserIsExist);
			preStm_UserIsExist.setString(1, programUser);
			ResultSet resultSet = preStm_UserIsExist.executeQuery();
			// 用户名不存在
			if(!resultSet.next()){
				return "该用户名不存在!";
			// 用户名存在
			}else{
				// 取得数据库中用户名对应的密码
				String password = resultSet.getString(3);
				// 密码匹配正确
				if(password.equals(programPassword)){
					return null;
				// 密码匹配不正确
				}else{
					return "密码不正确!";
				}
			}
		} catch (SQLException e) {
			try {
				connection.close();
				connection = null;
			} catch (SQLException e1) {
				e1.printStackTrace();
				return "数据库连接失败!";
			}
			e.printStackTrace();
			return "数据库连接失败!";
		}
	}
	
	public static Connection getConnect(){
		Connection connection = null;
		try {
			//Class.forName("oracle.jdbc.driver.OracleDriver");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} 

		return connection;
	}

	public static void setUrl(String url, String user, String password){
		DatabaseConnecter.url = url;
		DatabaseConnecter.user = user;
		DatabaseConnecter.password = password; 
	}
}







/*	/**
 * 用户登录时执行此方法,可判断用户名与密码的正确性
 * @param programUser		软件登录用户名
 * @param programPassword		软件登录密码
 * @return		null:密码验证成功; 非null:连接失败,可取得返回的字符串中相应的失败原因
 *//*
public static String connectDatabase(String programUser, String programPassword){
	// 先测试连接
	String result = testConnect(false);
	// 连接失败,返回错误信息
	if(result != null){
		return result;
	}
	// 连接成功
	String sql_UserIsExist = "select * from user where username =?";
	String sql_UserAndPswIsMatch = "select * from user where username =? and password =?";
	try {
//		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 先查找用户名是否存在
		PreparedStatement preStm_UserIsExist = connection.prepareStatement(sql_UserIsExist);
		preStm_UserIsExist.setString(1, programUser);
		ResultSet resultSet = preStm_UserIsExist.executeQuery();
		while(!resultSet.next()){
			return "该用户名不存在!";
		}
		// 用户名存在,判断密码是否正确
		PreparedStatement preStm_UserAndPswIsMatch = connection.prepareStatement(sql_UserAndPswIsMatch);
		preStm_UserAndPswIsMatch.setString(1, programUser);
		preStm_UserAndPswIsMatch.setString(2, programPassword);
		resultSet = preStm_UserAndPswIsMatch.executeQuery();
		while(!resultSet.next()){
			return "密码不正确!";
		}
		// 用户名,密码都ok
		return null;
//	} catch (ClassNotFoundException e) {
//		result = "驱动器没找到!";
//		e.printStackTrace();
	} catch (SQLException e) {
		try {
			connection.close();
			connection = null;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		e.printStackTrace();
	}
}*/