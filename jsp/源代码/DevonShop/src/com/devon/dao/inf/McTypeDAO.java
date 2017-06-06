package com.devon.dao.inf;


import java.util.List;

import com.devon.dao.dto.McType;

/**
 * 商品类别操作的接口
 * @author Administrator
 *
 */
public interface McTypeDAO {
	
	/**
	 * 获得大小类别
	 * @return
	 */
	public List<List<McType>> getOption();
	
	/**
	 * 获得大小类别
	 * @return
	 */
	public List<List<McType>> getMcTypeList();

	/**
	 * 更新商品类别名称
	 * @param mcType
	 * @return
	 */
	public boolean updateMcType(McType mcType);
	
	/**
	 * 判 断是否存在相同的类别名称
	 * @param mcType
	 * @return
	 */
	public boolean isRepeatedSname(McType mcType);
	
	/**
	 * 添别商品类别
	 * @param mcType
	 * @return
	 */
	public boolean insertMcType(McType mcType);
	
	/**
	 * 删 除商品类别
	 * @param nid
	 * @return
	 */
	public boolean deleteMcTypeWithMc(int nid);
}
