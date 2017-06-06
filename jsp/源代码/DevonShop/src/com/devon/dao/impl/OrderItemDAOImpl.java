package com.devon.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.devon.dao.db.ConnOracle;
import com.devon.dao.dto.OrderItem;
import com.devon.dao.inf.OrderItemDAO;

public class OrderItemDAOImpl implements OrderItemDAO{

	private static OrderItemDAOImpl orderItemDAOImpl = new OrderItemDAOImpl();
	
	private OrderItemDAOImpl(){
		
	}

	public static OrderItemDAOImpl getInstance(){
		return orderItemDAOImpl;
	}
	
	public List<OrderItem> selectOrderItem(long norderId){
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		StringBuffer sb_sql = new StringBuffer("select * from t_order_item where norderId=?");
		Connection connection = ConnOracle.getConn();
		PreparedStatement pStmt = null;
		ResultSet resultSet = null;
		try {
			pStmt = connection.prepareStatement(sb_sql.toString());
			pStmt.setLong(1, norderId);
			resultSet = pStmt.executeQuery();
			while(resultSet.next()){
				OrderItem orderItem = new OrderItem();
				orderItem.setNid(resultSet.getString("NID"));
				orderItem.setNorderId(resultSet.getString("NORDERID"));
				orderItem.setNmcId(resultSet.getString("NMCID"));
				orderItem.setSmcName(resultSet.getString("SMCNAME"));
				orderItem.setSdescription(resultSet.getString("SDESCRIPTION"));
				orderItem.setSimg(resultSet.getString("SIMG"));
				orderItem.setNcount(resultSet.getString("NCOUNT"));
				orderItem.setNprice(resultSet.getString("NPRICE"));
				orderItem.setNtotalPrice(resultSet.getString("NTOTALPRICE"));
				orderItemList.add(orderItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return orderItemList;
	}
}
