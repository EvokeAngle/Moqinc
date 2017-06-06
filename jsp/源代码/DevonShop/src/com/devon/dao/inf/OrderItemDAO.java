package com.devon.dao.inf;


import java.util.List;

import com.devon.dao.dto.OrderItem;

/**
 * 
 * @author Administrator
 *
 */
public interface OrderItemDAO {
	public List<OrderItem> selectOrderItem(long norderId);
}
