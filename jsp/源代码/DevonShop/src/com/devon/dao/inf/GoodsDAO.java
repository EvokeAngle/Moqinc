package com.devon.dao.inf;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.devon.dao.db.ConnOracle;
import com.devon.dao.dto.Goods;
import com.devon.util.Constant;

/**
 * 购物车商品操作的接品
 * @author Administrator
 *
 */
public interface GoodsDAO {
	/**
	 * 根据nid获得商品
	 * @param nid
	 * @return
	 */
	public Goods getGoodsById(int nid);

	/**
	 * 根据商品名及页数获得商品集
	 * @param name
	 * @param currentpage
	 * @return
	 */
	public List getGoodsList(String name, int currentpage) ;
	
}
