package com.devon.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * ���ݿ�������
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
	 * ���������ݿ������
	 * @param isCloseIt		true:������ɺ�,�ر�����; false:������ɺ�,���ر�����
	 * @return		����null:���ӳɹ�; ���ط�null:����ʧ��,��ȡ�÷��ص��ַ�������Ӧ��ʧ��ԭ��
	 */
	public static String testConnect(boolean  isCloseIt){
		String result = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			result = "������û�ҵ�!";
			e.printStackTrace();
		} catch (SQLException e) {
			result = "���ݿ�����ʧ��,�������û���ϵ����Ա!";
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
	 * �û���¼ʱִ�д˷���,���ж��û������������ȷ��
	 * @param programUser		�����¼�û���
	 * @param programPassword		�����¼����
	 * @return		null:������֤�ɹ�; ��null:����ʧ��,��ȡ�÷��ص��ַ�������Ӧ��ʧ��ԭ��
	 */
	public static String connectDatabase(String programUser, String programPassword){
		// �Ȳ�������
		String result = testConnect(false);
		// ����ʧ��,���ش�����Ϣ
		if(result != null){
			return result;
		}
		// ���ӳɹ�
		String sql_UserIsExist = "select * from employeeinfo where employeeName=?";

		try {
			// �����û����������ݿ�
			PreparedStatement preStm_UserIsExist = connection.prepareStatement(sql_UserIsExist);
			preStm_UserIsExist.setString(1, programUser);
			ResultSet resultSet = preStm_UserIsExist.executeQuery();
			// �û���������
			if(!resultSet.next()){
				return "���û���������!";
			// �û�������
			}else{
				// ȡ�����ݿ����û�����Ӧ������
				String password = resultSet.getString(3);
				// ����ƥ����ȷ
				if(password.equals(programPassword)){
					return null;
				// ����ƥ�䲻��ȷ
				}else{
					return "���벻��ȷ!";
				}
			}
		} catch (SQLException e) {
			try {
				connection.close();
				connection = null;
			} catch (SQLException e1) {
				e1.printStackTrace();
				return "���ݿ�����ʧ��!";
			}
			e.printStackTrace();
			return "���ݿ�����ʧ��!";
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
 * �û���¼ʱִ�д˷���,���ж��û������������ȷ��
 * @param programUser		�����¼�û���
 * @param programPassword		�����¼����
 * @return		null:������֤�ɹ�; ��null:����ʧ��,��ȡ�÷��ص��ַ�������Ӧ��ʧ��ԭ��
 *//*
public static String connectDatabase(String programUser, String programPassword){
	// �Ȳ�������
	String result = testConnect(false);
	// ����ʧ��,���ش�����Ϣ
	if(result != null){
		return result;
	}
	// ���ӳɹ�
	String sql_UserIsExist = "select * from user where username =?";
	String sql_UserAndPswIsMatch = "select * from user where username =? and password =?";
	try {
//		Class.forName("oracle.jdbc.driver.OracleDriver");
		// �Ȳ����û����Ƿ����
		PreparedStatement preStm_UserIsExist = connection.prepareStatement(sql_UserIsExist);
		preStm_UserIsExist.setString(1, programUser);
		ResultSet resultSet = preStm_UserIsExist.executeQuery();
		while(!resultSet.next()){
			return "���û���������!";
		}
		// �û�������,�ж������Ƿ���ȷ
		PreparedStatement preStm_UserAndPswIsMatch = connection.prepareStatement(sql_UserAndPswIsMatch);
		preStm_UserAndPswIsMatch.setString(1, programUser);
		preStm_UserAndPswIsMatch.setString(2, programPassword);
		resultSet = preStm_UserAndPswIsMatch.executeQuery();
		while(!resultSet.next()){
			return "���벻��ȷ!";
		}
		// �û���,���붼ok
		return null;
//	} catch (ClassNotFoundException e) {
//		result = "������û�ҵ�!";
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