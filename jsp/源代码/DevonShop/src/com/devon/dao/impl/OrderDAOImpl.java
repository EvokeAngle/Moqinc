package com.devon.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Savepoint;
import java.util.ArrayList;
import java.util.List;

import com.devon.dao.db.ConnOracle;
import com.devon.dao.dto.Goods;
import com.devon.dao.dto.Order;
import com.devon.dao.dto.User;
import com.devon.dao.inf.OrderDAO;
import com.devon.util.Arith;

public class OrderDAOImpl implements OrderDAO{

	private static final int PAGESIZE = 10;
	private static OrderDAOImpl orderDAOImpl = new OrderDAOImpl();
	public static final int QUERY_FOR_VAGUE = 1;
	public static final int QUERY_FOR_EXACT = 2;
	
	private OrderDAOImpl(){
		
	}

	public static OrderDAOImpl getInstance(){
		return orderDAOImpl;
	}
	
	public int[] getResult(String scUser, String dgDateFrom, String dgDateTo, String smcName, String sstatus, int queryMode){
		List<Order> orderList = selectOrder(scUser, dgDateFrom, dgDateTo, smcName, sstatus, 0, queryMode);
		int recordTotal = orderList.size();
		int pageTotal = 0;
		if(recordTotal == 0){
			pageTotal = 0;
		}else{
			pageTotal = (recordTotal - 1)/PAGESIZE + 1;
		}
		return new int[]{recordTotal, pageTotal};
	}
	
	public Order selectSingleOrder(long nid){
		StringBuffer sb_sql = new StringBuffer("select * from t_order where nid=?");
		Connection connection = ConnOracle.getConn();
		Order order = new Order();
		PreparedStatement pStmt = null;
		ResultSet resultSet = null;
		try {
			pStmt = connection.prepareStatement(sb_sql.toString());
			pStmt.setLong(1, nid);
			resultSet = pStmt.executeQuery();
			while(resultSet.next()){
				order.setNid(resultSet.getString("NID"));
				order.setScUser(resultSet.getString("SCUSER"));
				String dgDate = resultSet.getString("DGDATE");
				if(dgDate != null && !"".equals(dgDate)){
					dgDate = dgDate.substring(0, 19);
				}
				order.setDgDate(dgDate);
				order.setSpayType(resultSet.getString("SPAYTYPE"));
				order.setSsendType(resultSet.getString("SSENDTYPE"));
				order.setNmcTypeSize(resultSet.getString("NMCTYPESIZE"));
				order.setNmcSize(resultSet.getString("NMCSIZE"));
				order.setNtotalPrice(resultSet.getString("NTOTALPRICE"));
				order.setSstatus(resultSet.getString("SSTATUS"));
				order.setSmsg(resultSet.getString("SMSG"));
				order.setSaUser(resultSet.getString("SAUSER"));
				String daDate = resultSet.getString("DADATE");
				if(daDate != null && !"".equals(daDate)){
					daDate = daDate.substring(0, 19);
				}
				order.setDaDate(daDate);
				order.setSsName(resultSet.getString("SSNAME"));
				order.setSsAddress(resultSet.getString("SSADDRESS"));
				order.setSsCode(resultSet.getString("SSCODE"));
				order.setSsPhone(resultSet.getString("SSPHONE"));
				order.setSsEmail(resultSet.getString("SSEMAIL"));
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
		return order;
	}
	
	/**
	 * 
	 * @param scUser	下单人
	 * @param dgDate	下单日期
	 * @param smcName	商品名称
	 * @param sstatus	是否审核
	 * @param pageNum	要显示的页码
	 * @return
	 */
	public List<Order> selectOrder(String scUser, String dgDateFrom, String dgDateTo, String smcName, String sstatus, int pageNum, int queryMode){
		List<Order> orderList = new ArrayList<Order>();
		StringBuffer sb_sql = new StringBuffer("select nid,scuser,ssendtype,dgdate,spaytype,sstatus,rownum rn from (select distinct t1.nid,t1.scuser,t1.ssendtype,t1.dgdate,t1.spaytype,t1.sstatus from t_order t1, t_order_item t2 where t1.nid=t2.norderid) where 1=1");
		if(scUser != null && !"".equals(scUser)){
			if(queryMode == 1){
				sb_sql.append(" and scUser like '%" + scUser + "%'");
			}else if(queryMode == 2){
				sb_sql.append(" and scUser ='" + scUser + "'");
			}

		}
		if(dgDateFrom != null && !"".equals(dgDateFrom)){
			sb_sql.append(" and dgDate>=to_date('" + dgDateFrom + "','yyyy-MM-dd')");
		}
		if(dgDateTo != null && !"".equals(dgDateTo)){
			sb_sql.append(" and dgDate<=to_date('" + dgDateTo + "','yyyy-MM-dd')");
		}
		if(smcName != null && !"".equals(smcName)){
			sb_sql.append(" and smcName like '%" + smcName + "%'");
		}
		if(sstatus != null && !"".equals(sstatus)){
			sb_sql.append(" and sstatus=" + sstatus);
		}
		if(pageNum != 0){
			int begin = (pageNum - 1) * PAGESIZE + 1;
			int end = PAGESIZE * pageNum;
			StringBuffer sb_sqlForPage = new StringBuffer();
			sb_sqlForPage.append("select * from (").append(sb_sql).append(" and rownum<=" + end + ") where rn>=" + begin);
			// 把最后拼成的分页赋给sb_sql
			sb_sql = sb_sqlForPage;
		}
		Connection connection = ConnOracle.getConn();
		PreparedStatement pStmt = null;
		ResultSet resultSet = null;
		try {
			pStmt = connection.prepareStatement(sb_sql.toString());
			resultSet = pStmt.executeQuery();
			while(resultSet.next()){
				Order order = new Order();
				order.setNid(resultSet.getString("nid"));
				order.setScUser(resultSet.getString("scuser"));
				order.setSsendType(resultSet.getString("ssendtype"));
				String dgDate = resultSet.getString("dgdate");
				if(dgDate != null && !"".equals(dgDate)){
					dgDate = dgDate.substring(0, 19);
				}
				order.setDgDate(dgDate);
				
				order.setSpayType(resultSet.getString("spaytype"));
				order.setSstatus(resultSet.getString("sstatus"));
				orderList.add(order);
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
		
		return orderList;
	}
	
	public boolean checkOrder(long nid, String sstatus, String smsg, String daDate, String saUser){
		Connection connection = ConnOracle.getConn();
		String sql = "update t_order set sstatus=?,smsg=?,daDate=to_date(?,'yyyy-MM-dd hh24:mi:ss'),saUser=? where nid=?";
		PreparedStatement pStmt = null;
		try {
			pStmt = connection.prepareStatement(sql);
			pStmt.setString(1, sstatus);
			pStmt.setString(2, smsg);
			pStmt.setString(3, daDate);
			pStmt.setString(4, saUser);
			pStmt.setLong(5, nid);
			pStmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return true;
	}
	
	public boolean placingOrder(Order order, List<Goods> goodsList){
		Connection connection = ConnOracle.getConn();
		String sql_order = "insert into t_order (nid,scuser,dgdate,spaytype,ssendtype,nmctypesize,nmcsize,ntotalprice,ssname,ssaddress,sscode,ssphone,ssemail,sstatus) values(?,?,to_date(?,'yyyy-MM-dd hh24:mi:ss'),?,?,?,?,?,?,?,?,?,?,?)";
		String sql_orderItem = "insert into t_order_item values(seq_t_order_item.nextval,?,?,?,?,?,?,?,?)";
		PreparedStatement pStmt_order = null;
		PreparedStatement pStmt_orderItem = null;
		Savepoint savepoint = null;
		try {
			connection.setAutoCommit(false);
			pStmt_order = connection.prepareStatement(sql_order);
			pStmt_order.setLong(1, Long.parseLong(order.getNid()));
			pStmt_order.setString(2, order.getScUser());
			pStmt_order.setString(3, order.getDgDate());
			pStmt_order.setString(4, order.getSpayType());
			pStmt_order.setString(5, order.getSsendType());
			pStmt_order.setInt(6, Integer.parseInt(order.getNmcTypeSize()));
			pStmt_order.setInt(7, Integer.parseInt(order.getNmcSize()));
			pStmt_order.setString(8, order.getNtotalPrice());
			pStmt_order.setString(9, order.getSsName());
			pStmt_order.setString(10, order.getSsAddress());
			pStmt_order.setString(11, order.getSsCode());
			pStmt_order.setString(12, order.getSsPhone());
			pStmt_order.setString(13, order.getSsEmail());
			pStmt_order.setString(14, "0");
			pStmt_order.execute();
			
			//savepoint = connection.setSavepoint();
			
			pStmt_orderItem = connection.prepareStatement(sql_orderItem);
			for (Goods goods : goodsList) {
				pStmt_orderItem.setLong(1, Long.parseLong(order.getNid()));
				pStmt_orderItem.setInt(2, goods.getNid());
				pStmt_orderItem.setString(3, goods.getSname());
				pStmt_orderItem.setString(4, goods.getSdescription());
				pStmt_orderItem.setString(5, goods.getSimg());
				pStmt_orderItem.setString(6, goods.getNcount() + "");
				pStmt_orderItem.setString(7, goods.getNprice() + "");
				pStmt_orderItem.setString(8, Arith.mul(goods.getNcount(), goods.getNprice()) + "");
				pStmt_orderItem.execute();
			}
			connection.commit();
			connection.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
			/*try {
				connection.rollback(savepoint);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}finally{
				try {
					connection.setAutoCommit(true);
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}*/
		}finally{
			try {
				connection.setAutoCommit(true);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		return true;
		
	}
	
	public void updateOrder(long nid, String spayType, String ssendType, String ssName){
		Connection connection = ConnOracle.getConn();
		String sql = "update t_order set spayType=?,ssendType=?,ssName=? where nid=?";
		PreparedStatement pStmt = null;
		try {
			pStmt = connection.prepareStatement(sql);
			pStmt.setString(1, spayType);
			pStmt.setString(2, ssendType);
			pStmt.setString(3, ssName);
			pStmt.setLong(4, nid);
			pStmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}