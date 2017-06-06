package com.devon.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

import com.devon.dao.db.ConnOracle;

/**
 * �������������,���ų���Ϊ19λ
 * @author Devon
 *
 */
public class OrderIdFactory {
	
	/**
	 * �������19λ����
	 * @return		�ַ�����ʾ��ʽ��19λ����
	 */
	public static String createId(){
		String currentTime = CurrentTimeFactory.getCurrentTime(CurrentTimeFactory.FORMAT_NUMBER);
		StringBuffer stringBuffer = new StringBuffer(currentTime);
		Random random = new Random();
		for (int i = 0; i < 2; i++) {

			int r = random.nextInt(9);
			stringBuffer.append(r);
		}
		
		String id = stringBuffer.toString();
		Connection connection = ConnOracle.getConn();
		String sql = "select * from t_order where nid=?";
		PreparedStatement pStmt= null;
		ResultSet resultSet = null;
		try {
			pStmt = connection.prepareStatement(sql);
			pStmt.setLong(1, Long.parseLong(id));
			resultSet = pStmt.executeQuery();
			// �Ѵ��ڿ���
			if(resultSet.next()){
				createId();
			} 
		} catch (SQLException e) {
			e.printStackTrace();
			createId();
		} finally{
			if(resultSet != null){
				try {
					resultSet.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pStmt != null){
				try {
					pStmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(connection != null){
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return id;

	}
	
}
