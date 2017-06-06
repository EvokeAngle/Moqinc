package com.devon.dao.inf;


import java.util.List;

import com.devon.dao.dto.Goods;
import com.devon.dao.dto.Order;

/**
 * 订单操作的接口
 * @author Administrator
 *
 */
public interface OrderDAO {
	/**
	 * 获得总记录数及总页数
	 * @param scUser
	 * @param dgDateFrom
	 * @param dgDateTo
	 * @param smcName
	 * @param sstatus
	 * @param queryMode
	 * @return
	 */
	public int[] getResult(String scUser, String dgDateFrom, String dgDateTo, String smcName, String sstatus, int queryMode);
	
	/**
	 * 查询单件商品
	 * @param nid
	 * @return
	 */
	public Order selectSingleOrder(long nid);
	
	/**
	 * 获得订单集
	 * @param scUser	下单人
	 * @param dgDate	下单日期
	 * @param smcName	商品名称
	 * @param sstatus	是否审核
	 * @param pageNum	要显示的页码
	 * @return
	 */
	public List<Order> selectOrder(String scUser, String dgDateFrom, String dgDateTo, String smcName, String sstatus, int pageNum, int queryMode);
	
	/**
	 * 审核订单
	 * @param nid
	 * @param sstatus
	 * @param smsg
	 * @param daDate
	 * @param saUser
	 * @return
	 */
	public boolean checkOrder(long nid, String sstatus, String smsg, String daDate, String saUser);
	
	/**
	 * 下订单
	 * @param order
	 * @param goodsList
	 * @return
	 */
	public boolean placingOrder(Order order, List<Goods> goodsList);
	
	/**
	 * 更新订单
	 * @param nid
	 * @param spayType
	 * @param ssendType
	 * @param ssName
	 */
	public void updateOrder(long nid, String spayType, String ssendType, String ssName);
}
