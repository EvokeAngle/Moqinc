package com.devon.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.devon.dao.db.ConnOracle;
import com.devon.dao.dto.Goods;
import com.devon.dao.inf.GoodsDAO;
import com.devon.util.Constant;



public class GoodsDAOImpl implements GoodsDAO {
	
	private static GoodsDAOImpl goodsDAOImpl = new GoodsDAOImpl();
	private static final int PAGESIZE = 10;
	
	private GoodsDAOImpl(){
		
	}

	public static GoodsDAOImpl getInstance(){
		return goodsDAOImpl;
	}
	
	public Goods getGoodsById(int nid) {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		Goods goods = new Goods();
		StringBuffer buffer = new StringBuffer(
				"select * from t_mc where nid= " + nid);
		try {
			conn = ConnOracle.getConn();
			st = conn.createStatement();
			rs = st.executeQuery(buffer.toString());
			while (rs.next()) {
				goods.setNid(rs.getInt("nid"));
				goods.setSname(rs.getString("sname"));
				goods.setSimg(rs.getString("simg"));
				goods.setNprice(rs.getDouble("nprice"));
				goods.setSdescription(rs.getString("sdescription"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnOracle.tryClose(rs, st, conn);
		}
		// TODO 自动生成方法存根
		return goods;
	}

	public List getGoodsList(String name, int currentpage) {
		// TODO 自动生成方法存根
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		List list = new ArrayList();
		StringBuffer condition = new StringBuffer();
		StringBuffer query = new StringBuffer();
		if (name != null && !"".equals(name)) {
			condition.append("and name like '%").append(name).append("%'");
		}
		query
				.append("select * from (select rownum rn,id,name,price from t_goods where 1= 1");
		query.append(condition.toString()).append(") where ");
		query.append(" rn>").append((currentpage - 1) * Constant.pagesize);
		query.append("  and rownum <=").append(Constant.pagesize);
		try {
			conn = ConnOracle.getConn();
			st = conn.createStatement();
			rs = st.executeQuery(query.toString());
			while (rs.next()) {
				Goods goods = new Goods();
				goods.setNid(rs.getInt("id"));
				goods.setSname(rs.getString("name"));
				goods.setNprice(rs.getDouble("price"));
				list.add(goods);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnOracle.tryClose(rs, st, conn);
		}
		// TODO 自动生成方法存根
		return list;
	}


}
