package com.devon.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.devon.dao.db.ConnOracle;
import com.devon.dao.dto.McType;
import com.devon.dao.inf.McTypeDAO;

public class McTypeDAOImpl implements McTypeDAO{
	
	private static McTypeDAOImpl mcTypeDAOImpl = new McTypeDAOImpl();
	
	private McTypeDAOImpl(){
		
	}

	public static McTypeDAOImpl getInstance(){
		return mcTypeDAOImpl;
	}

	public List<List<McType>> getOption(){

		Connection connection = ConnOracle.getConn();
		//Connection connection = DatabaseConnecter.getConnect();
		String sql_ParentName = "select nid,sname from t_mc_type where npid = 0";
		String sql_ChildName = "select nid,sname,npid from t_mc_type where npid = ?";
		
		ResultSet resultSet_ParentName = null;
		ResultSet resultSet_ChildName = null;
		PreparedStatement pStmt_ParentName = null;
		PreparedStatement pStmt_ChildName = null;
		List<List<McType>> typeList = new ArrayList<List<McType>>();
		try {
			// 查找所有父类别的名称
			pStmt_ParentName = connection.prepareStatement(sql_ParentName);
			resultSet_ParentName = pStmt_ParentName.executeQuery();
			while(resultSet_ParentName.next()){
				String parentId = resultSet_ParentName.getString("nid");
				String parentName = resultSet_ParentName.getString("sname");
				List<McType> temp = new ArrayList<McType>();
				McType mcType_p = new McType();
				mcType_p.setNid(parentId);
				mcType_p.setSname(parentName);
				temp.add(mcType_p);
				// 查找父类别下的子类别
				pStmt_ChildName = connection.prepareStatement(sql_ChildName);
				pStmt_ChildName.setString(1, parentId);
				resultSet_ChildName = pStmt_ChildName.executeQuery();
				while(resultSet_ChildName.next()){
					String childId = resultSet_ChildName.getString("nid");
					String childName = resultSet_ChildName.getString("sname");
					String childPid = resultSet_ChildName.getString("npid");
					McType mcType_c = new McType();
					mcType_c.setNid(childId);
					mcType_c.setSname(childName);
					mcType_c.setNpid(childPid);
					temp.add(mcType_c);
				}
				typeList.add(temp);
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
		return typeList;
	}
	
	public List<List<McType>> getMcTypeList(){
		Connection connection = ConnOracle.getConn();
		//Connection connection = DatabaseConnecter.getConnect();
		String sql_ParentName = "select nid,sname,npid from t_mc_type where npid = 0";
		String sql_ChildName = "select nid,sname,sname from t_mc_type where npid = ?";
		
		ResultSet resultSet_ParentName = null;
		ResultSet resultSet_ChildName = null;
		PreparedStatement pStmt_ParentName = null;
		PreparedStatement pStmt_ChildName = null;
		List<List<McType>> typeList = new ArrayList<List<McType>>();
		try {
			// 查找所有父类别的名称
			pStmt_ParentName = connection.prepareStatement(sql_ParentName);
			resultSet_ParentName = pStmt_ParentName.executeQuery();
			while(resultSet_ParentName.next()){
				String nid = resultSet_ParentName.getString("nid");
				String sname = resultSet_ParentName.getString("sname");
				McType mcType = new McType();
				mcType.setNid(nid);
				mcType.setSname(sname);
				mcType.setNpid("0");
				List<McType> temp = new ArrayList<McType>();
				temp.add(mcType);
				// 查找父类别下的子类别
				pStmt_ChildName = connection.prepareStatement(sql_ChildName);
				pStmt_ChildName.setString(1, nid);
				resultSet_ChildName = pStmt_ChildName.executeQuery();
				while(resultSet_ChildName.next()){
					String c_nid = resultSet_ChildName.getString("nid");
					String c_sname = resultSet_ChildName.getString("sname");
					McType c_mcType = new McType();
					c_mcType.setNid(c_nid);
					c_mcType.setSname(c_sname);
					c_mcType.setNpid(nid);
					temp.add(c_mcType);
				}
				typeList.add(temp);
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
		return typeList;
	}

	public boolean updateMcType(McType mcType){
		boolean isSuccess = true;
		Connection connection = ConnOracle.getConn();
		
		String nid = mcType.getNid();
		String sname = mcType.getSname();
		String npid = mcType.getNpid();
		String sql = null;
		PreparedStatement pStmt = null;
		// 修改sname
		if(sname != null && !"".equals(sname)){
			sql = "update t_mc_type set sname=? where nid=?";
			try {
				pStmt = connection.prepareStatement(sql);
				pStmt.setString(1, sname);
				pStmt.setInt(2, Integer.parseInt(nid));
				isSuccess = pStmt.execute();
			} catch (SQLException e) {
				e.printStackTrace();
				isSuccess = false;
			}finally{

			}
		}
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public boolean isRepeatedSname(McType mcType){
		boolean isRepeatedSname = false;
		Connection connection = ConnOracle.getConn();
		
		//String nid = mcType.getNid();
		String npid = mcType.getNpid();
		String sname = mcType.getSname();
		// 在同级(以小类角度)中找是否重复
		String sql_c = "select * from t_mc_type where npid=? and sname=?";
		// 在父级（以小类角度）中找是否重复
		String sql_p = "select * from t_mc_type t1, t_mc_type t2 where t1.npid=t2.nid and t1.npid=? and ?=t2.sname";

		PreparedStatement pStmt = null;
		ResultSet resultSet = null;
		try {
			pStmt = connection.prepareStatement(sql_c);
			pStmt.setInt(1, Integer.parseInt(npid));
			pStmt.setString(2, sname);
			resultSet = pStmt.executeQuery();
			if(resultSet.next()){
				isRepeatedSname = true;
				return isRepeatedSname;
			}

			pStmt = connection.prepareStatement(sql_p);
			pStmt.setInt(1, Integer.parseInt(npid));
			pStmt.setString(2, sname);
			resultSet = pStmt.executeQuery();
			if(resultSet.next()){
				isRepeatedSname = true;
				return isRepeatedSname;
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
		return isRepeatedSname;
	}
	
	public boolean insertMcType(McType mcType){
		boolean isSuccess = true;
		
		Connection connection = ConnOracle.getConn();
		String sql = "insert into t_mc_type values(seq_t_mc_type.nextval,?,?)";
		PreparedStatement pStmt = null;
		try {
			pStmt = connection.prepareStatement(sql);
			pStmt.setString(1, mcType.getSname());
			pStmt.setInt(2, Integer.parseInt(mcType.getNpid()));
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
	
	public boolean deleteMcTypeWithMc(int nid){
		boolean isSuccess = true;
		
		Connection connection = ConnOracle.getConn();
		// 删除类别
		String sql_mcType = "delete t_mc_type where nid=? or npid=?";
		// 删除旗下商品
		String sql_mc = "delete t_mc where nmaxid=? or nminid=?";
		PreparedStatement pStmt = null;
		try {
			pStmt = connection.prepareStatement(sql_mcType);
			pStmt.setInt(1, nid);
			pStmt.setInt(2, nid);
			isSuccess = pStmt.execute();
			pStmt = connection.prepareStatement(sql_mc);
			pStmt.setInt(1, nid);
			pStmt.setInt(2, nid);
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
}






