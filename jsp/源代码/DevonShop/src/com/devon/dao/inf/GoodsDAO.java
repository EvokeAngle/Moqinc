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
 * ���ﳵ��Ʒ�����Ľ�Ʒ
 * @author Administrator
 *
 */
public interface GoodsDAO {
	/**
	 * ����nid�����Ʒ
	 * @param nid
	 * @return
	 */
	public Goods getGoodsById(int nid);

	/**
	 * ������Ʒ����ҳ�������Ʒ��
	 * @param name
	 * @param currentpage
	 * @return
	 */
	public List getGoodsList(String name, int currentpage) ;
	
}
