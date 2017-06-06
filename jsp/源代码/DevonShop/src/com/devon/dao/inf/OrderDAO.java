package com.devon.dao.inf;


import java.util.List;

import com.devon.dao.dto.Goods;
import com.devon.dao.dto.Order;

/**
 * ���������Ľӿ�
 * @author Administrator
 *
 */
public interface OrderDAO {
	/**
	 * ����ܼ�¼������ҳ��
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
	 * ��ѯ������Ʒ
	 * @param nid
	 * @return
	 */
	public Order selectSingleOrder(long nid);
	
	/**
	 * ��ö�����
	 * @param scUser	�µ���
	 * @param dgDate	�µ�����
	 * @param smcName	��Ʒ����
	 * @param sstatus	�Ƿ����
	 * @param pageNum	Ҫ��ʾ��ҳ��
	 * @return
	 */
	public List<Order> selectOrder(String scUser, String dgDateFrom, String dgDateTo, String smcName, String sstatus, int pageNum, int queryMode);
	
	/**
	 * ��˶���
	 * @param nid
	 * @param sstatus
	 * @param smsg
	 * @param daDate
	 * @param saUser
	 * @return
	 */
	public boolean checkOrder(long nid, String sstatus, String smsg, String daDate, String saUser);
	
	/**
	 * �¶���
	 * @param order
	 * @param goodsList
	 * @return
	 */
	public boolean placingOrder(Order order, List<Goods> goodsList);
	
	/**
	 * ���¶���
	 * @param nid
	 * @param spayType
	 * @param ssendType
	 * @param ssName
	 */
	public void updateOrder(long nid, String spayType, String ssendType, String ssName);
}
