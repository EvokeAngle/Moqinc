package com.devon.dao.inf;


import java.util.List;


import com.devon.dao.dto.Mc;
/**
 * 商品操作的接口
 * @author Administrator
 *
 */
public interface McDAO {
	/**
	 * 获得总记录数和总页数
	 * @param nmaxId
	 * @param nminId
	 * @param keywords
	 * @return
	 */
	public int[] getResult(String nmaxId, String nminId, String keywords);
	
	/**
	 * 获得商品集
	 * @param nmaxId
	 * @param nminId
	 * @param keywords
	 * @param pageNum
	 * @return
	 */
	public List<Mc> selectMc(String nmaxId, String nminId, String keywords, int pageNum);
	
	/**
	 * 获得单件商品
	 * @param nid
	 * @return
	 */
	public Mc selectSingleMc(int nid);
	
	/**
	 * 更新商品
	 * @param mc
	 * @return
	 */
	public boolean updateMc(Mc mc);
	
	/**
	 * 添加商品
	 * @param mc
	 * @return
	 */
	public boolean insertMc(Mc mc);
	
	/**
	 * 删除商品
	 * @param nid
	 * @param contextPath
	 * @return
	 */
	public boolean deleteMc(int nid, String contextPath);
	
	/**
	 * 删除商品图片
	 * @param nid
	 */
	public void deleteMcSimg(int nid);
}
