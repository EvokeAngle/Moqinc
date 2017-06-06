package com.devon.dao.dto;

import java.util.ArrayList;
import java.util.List;

import com.devon.dao.impl.GoodsDAOImpl;
import com.devon.dao.inf.GoodsDAO;
import com.devon.util.Arith;


public class ShoppingCar {
	private List<Goods> goodsList = new ArrayList<Goods>();
	private int totalCount;
	private int totalType;
	private double totalPrice;
	private final GoodsDAOImpl goodsDAOImpl = GoodsDAOImpl.getInstance();
	
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	
	public int getTotalType() {
		return goodsList.size();
	}
	
	public void setTotalType(int totalType) {
		this.totalType = totalType;
	}
	
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	
	/**
	 * �����Ʒ������
	 * @return
	 */
	public int getTotalCount() {
		int temp = 0;
		for (Goods goods : goodsList) {
			temp = temp + goods.getNcount();
		}
		return temp;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	/**
	 * �����Ʒ�ܼ۸�
	 * @return
	 */
	public double getTotalPrice() {
		double temp = 0;
		for (Goods goods : goodsList) {
			temp = Arith.add(temp, Arith.mul(goods.getNcount(), goods.getNprice()));
		}
		return temp;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	/**
	 * �����Ʒ
	 * @param id
	 */
	public void addGoods(int nid)
	{
		Goods goods = goodsDAOImpl.getGoodsById(nid);
		boolean exist = false;
		for (Goods g : goodsList) {
			if(g.getNid()==goods.getNid())
			{
				g.setNcount(g.getNcount()+1);
				exist = true;
				break;
			}
		}
		if(!exist)
		{
			goods.setNcount(1);
			goodsList.add(goods);
		}
	}
	
	/**
	 * ɾ����Ʒ
	 * @param id
	 */
	public void removeGoods(int nid)
	{
		Goods g = null;
		for (Goods goods : goodsList) {
			if(goods.getNid()==nid)
			{
				g = goods;
			}
		}
		goodsList.remove(g);
	}
	
	/**
	 * �޸���Ʒ����
	 * @param nid
	 * @param ncount
	 */
	public void editNcount(int nid,int ncount)
	{
		for (Goods goods : goodsList) {
			if(goods.getNid()==nid)
			{
				goods.setNcount(ncount);
			}
		}
	}
	/**
	 * ��չ��ﳵ
	 */
	public void clearCar()
	{
		goodsList.clear();
	}
}
