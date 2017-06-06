package com.devon.dao.inf;


import java.util.List;

import com.devon.dao.dto.McType;

/**
 * ��Ʒ�������Ľӿ�
 * @author Administrator
 *
 */
public interface McTypeDAO {
	
	/**
	 * ��ô�С���
	 * @return
	 */
	public List<List<McType>> getOption();
	
	/**
	 * ��ô�С���
	 * @return
	 */
	public List<List<McType>> getMcTypeList();

	/**
	 * ������Ʒ�������
	 * @param mcType
	 * @return
	 */
	public boolean updateMcType(McType mcType);
	
	/**
	 * �� ���Ƿ������ͬ���������
	 * @param mcType
	 * @return
	 */
	public boolean isRepeatedSname(McType mcType);
	
	/**
	 * �����Ʒ���
	 * @param mcType
	 * @return
	 */
	public boolean insertMcType(McType mcType);
	
	/**
	 * ɾ ����Ʒ���
	 * @param nid
	 * @return
	 */
	public boolean deleteMcTypeWithMc(int nid);
}
