package com.devon.dao.inf;


import java.util.List;


import com.devon.dao.dto.Mc;
/**
 * ��Ʒ�����Ľӿ�
 * @author Administrator
 *
 */
public interface McDAO {
	/**
	 * ����ܼ�¼������ҳ��
	 * @param nmaxId
	 * @param nminId
	 * @param keywords
	 * @return
	 */
	public int[] getResult(String nmaxId, String nminId, String keywords);
	
	/**
	 * �����Ʒ��
	 * @param nmaxId
	 * @param nminId
	 * @param keywords
	 * @param pageNum
	 * @return
	 */
	public List<Mc> selectMc(String nmaxId, String nminId, String keywords, int pageNum);
	
	/**
	 * ��õ�����Ʒ
	 * @param nid
	 * @return
	 */
	public Mc selectSingleMc(int nid);
	
	/**
	 * ������Ʒ
	 * @param mc
	 * @return
	 */
	public boolean updateMc(Mc mc);
	
	/**
	 * �����Ʒ
	 * @param mc
	 * @return
	 */
	public boolean insertMc(Mc mc);
	
	/**
	 * ɾ����Ʒ
	 * @param nid
	 * @param contextPath
	 * @return
	 */
	public boolean deleteMc(int nid, String contextPath);
	
	/**
	 * ɾ����ƷͼƬ
	 * @param nid
	 */
	public void deleteMcSimg(int nid);
}
