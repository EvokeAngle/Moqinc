package com.devon.dao.impl;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.devon.dao.db.ConnOracle;
import com.devon.dao.dto.Mc;
import com.devon.dao.inf.McDAO;
import com.devon.util.DatabaseConnecter;

public class McDAOImpl implements McDAO{
	
	private static McDAOImpl mcDAOImpl = new McDAOImpl();
	private static final int PAGESIZE = 10;
	
	private McDAOImpl(){
		
	}

	public static McDAOImpl getInstance(){
		return mcDAOImpl;
	}
	
	public int[] getResult(String nmaxId, String nminId, String keywords){
		List<Mc> mcList = selectMc(nmaxId, nminId, keywords, 0);
		int recordTotal = mcList.size();
		int pageTotal = 0;
		if(recordTotal == 0){
			pageTotal = 0;
		}else{
			pageTotal = (recordTotal - 1)/PAGESIZE + 1;
		}
		
		return new int[]{recordTotal, pageTotal};
	}
	
	public List<Mc> selectMc(String nmaxId, String nminId, String keywords, int pageNum){
		
		Connection connection = ConnOracle.getConn();
		//Connection connection = DatabaseConnecter.getConnect();
		
		String sql = "select t1.nid nid,simg,t1.sname sname,nprice,smcTag,t2.sname maxType,t3.sname minType,dcDate,sdescription,rownum rn from t_mc t1, t_mc_type t2, t_mc_type t3 where t1.nmaxid=t2.nid(+) and t1.nminid=t3.nid(+)";
		
		if(nmaxId != null && !"0".equals(nmaxId) && !"".equals(nmaxId)){
			sql = sql + " and t1.nmaxId=" + nmaxId;
		}
		if(nminId != null && !"0".equals(nminId) && !"".equals(nminId)){
			sql = sql + " and t1.nminId=" + nminId;
		}
		if(keywords != null && !"".equals(keywords)){
			sql = sql + " and t1.sname like '%" + keywords + "%'";
		}
		// !=0 按页取数据
		if(pageNum != 0){
			int begin = (pageNum - 1) * PAGESIZE + 1;
			int end = PAGESIZE * pageNum;

			sql = "select * from (" + sql + " and rownum<= " + end + ") where rn>=" + begin;
		}

		ResultSet resultSet = null;
		PreparedStatement pStmt = null;
		List<Mc> mcList = new ArrayList<Mc>();
		try {
			pStmt = connection.prepareStatement(sql);
			resultSet = pStmt.executeQuery();
			while(resultSet.next()){
				String vnid = resultSet.getString("nid");
				String vsimg = resultSet.getString("simg");
				String vsname = resultSet.getString("sname");
				String vnprice = resultSet.getString("nprice");
				String vsmcTag = resultSet.getString("smcTag");
				String vnmaxId = resultSet.getString("maxType");
				String vnminId = resultSet.getString("minType");
				String vdcDate = resultSet.getString("dcDate");
				if(vdcDate != null && !"".equals(vdcDate)){
					vdcDate = vdcDate.substring(0, 19);
				}
				String vsdescription = resultSet.getString("sdescription");
				Mc mc = new Mc();
				mc.setNid(vnid);
				mc.setSimg(vsimg);
				mc.setSname(vsname);
				mc.setNprice(vnprice);
				mc.setSmcTag(vsmcTag);
				mc.setNmaxId(vnmaxId);
				mc.setNminId(vnminId);
				mc.setDcDate(vdcDate);
				mc.setSdescription(vsdescription);
				mcList.add(mc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return mcList;
	}
	
	public Mc selectSingleMc(int nid){
		Connection connection = ConnOracle.getConn();
		String sql = "select * from t_mc where nid=?";
		PreparedStatement pStmt = null;
		ResultSet resultSet = null;
		Mc mc = new Mc();
		try {
			pStmt = connection.prepareStatement(sql);
			pStmt.setInt(1, nid);
			resultSet = pStmt.executeQuery();
			if(resultSet.next()){
				mc.setNid(nid + "");
				mc.setSname(resultSet.getString("sname"));
				mc.setSdescription(resultSet.getString("sdescription"));
				mc.setNprice(resultSet.getString("nprice"));
				mc.setSimg(resultSet.getString("simg"));
				mc.setSmcTag(resultSet.getString("smcTag"));
				String dcDate = resultSet.getString("dcDate");
				if(dcDate != null && !"".equals(dcDate)){
					dcDate = dcDate.substring(0, 19);
				}
				mc.setDcDate(dcDate);
				mc.setNmaxId(resultSet.getString("nmaxId"));
				mc.setNminId(resultSet.getString("nminId"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return mc;
	}
	
	public boolean updateMc(Mc mc){
		boolean isSuccess = true;
		
		Connection connection = ConnOracle.getConn();
		//String sql = "update t_mc set sname=?,sdescription=?,nprice=?,simg=?,smcTag=?,dcDate=?,nmaxId=(select nid from t_mc_type where sname=?),nminId=(select nid from t_mc_type where sname=?) where nid=?";
		String sql = "update t_mc set sname=?,sdescription=?,nprice=?,simg=?,smcTag=?,dcDate=?,nmaxId=?,nminId=? where nid=?";
		PreparedStatement pStmt = null;
		try {
			pStmt = connection.prepareStatement(sql);
			pStmt.setString(1, mc.getSname());
			pStmt.setString(2, mc.getSdescription());
			pStmt.setString(3, mc.getNprice());
			pStmt.setString(4, mc.getSimg());
			pStmt.setString(5, mc.getSmcTag());
			pStmt.setString(6, mc.getDcDate());
			pStmt.setString(7, mc.getNmaxId());
			pStmt.setString(8, mc.getNminId());
			pStmt.setInt(9, Integer.parseInt(mc.getNid()));
			isSuccess = pStmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			isSuccess = false;
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isSuccess;
	}
	
	public boolean insertMc(Mc mc){
		boolean isSuccess = true;
		
		Connection connection = ConnOracle.getConn();
		String sql = "insert into t_mc values(seq_t_mc.nextval,?,?,?,?,?,?,?,?)";
		//String sql = "insert into t_mc values(seq_t_mc.nextval,?,?,?,?,?,?,select nid from t_mc_type where sname=?,select nid from t_mc_type where sname=?)";
		//String sql = "insert into t_mc values(seq_t_mc.nextval," + mc.getSname() + "," + mc.getSdescription() + "," + mc.getNprice() + "," + mc.getSimg()+"," +mc.getSmcTag()+"," + mc.getDcDate()+",select nid from t_mc_type where sname=" + mc.getNmaxId() + ",select nid from t_mc_type where sname=" + mc.getNminId()+")";
		PreparedStatement pStmt = null;
		try {
			pStmt = connection.prepareStatement(sql);
			pStmt.setString(1, mc.getSname());
			pStmt.setString(2, mc.getSdescription());
			pStmt.setString(3, mc.getNprice());
			pStmt.setString(4, mc.getSimg());
			pStmt.setString(5, mc.getSmcTag());
			pStmt.setString(6, mc.getDcDate());
			pStmt.setInt(7, Integer.parseInt(mc.getNmaxId()));
			pStmt.setInt(8, Integer.parseInt(mc.getNminId()));
			isSuccess = pStmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			isSuccess = false;
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return isSuccess;
	}
	
	public boolean deleteMc(int nid, String contextPath){
		boolean isSuccess = true;
		
		Connection connection = ConnOracle.getConn();
		String sql_imgPath = "select simg from t_mc where nid=?";
		String sql_del = "delete from t_mc where nid=?";
		PreparedStatement pStmt = null;
		ResultSet resultSet = null;
		try {
			// 找出该商品所对应的图片路径,并删除之
			pStmt = connection.prepareStatement(sql_imgPath);
			pStmt.setInt(1, nid);
			resultSet = pStmt.executeQuery();
			String imgPath = null;
			while(resultSet.next()){
				imgPath = contextPath + "/" + resultSet.getString("simg");
			}
			File file = new File(imgPath);
			file.delete();
			// 删除数据库记录
			pStmt = connection.prepareStatement(sql_del);
			pStmt.setInt(1, nid);
			isSuccess = pStmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			isSuccess = false;
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isSuccess;
	}
	
	public void deleteMcSimg(int nid){
		Connection connection = ConnOracle.getConn();
		String sql_t_mc = "update t_mc set simg='' where nid=?";
		String sql_t_order_item = "update t_order_item set simg='' where nmcid=?";
		PreparedStatement pStmt = null;
		ResultSet resultSet = null;
		try {
			pStmt = connection.prepareStatement(sql_t_mc);
			pStmt.setInt(1, nid);
			pStmt.execute();

			pStmt = connection.prepareStatement(sql_t_order_item);
			pStmt.setInt(1, nid);
			pStmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}


