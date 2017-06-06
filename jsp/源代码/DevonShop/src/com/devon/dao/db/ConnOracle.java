package com.devon.dao.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnOracle {

	public static Connection getConn() {
		Connection conn = null;
		Context context = null;
		try {
			context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return conn;
	}

	public static void tryClose(ResultSet rs, Statement st, Connection conn) {

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (st != null) {
			try {
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
