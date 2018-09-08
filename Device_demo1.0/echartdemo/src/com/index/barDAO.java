package com.index;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class barDAO {

	Connection connection;

	public Connection getConnection() {
		try {
			String name = "root";
			String password = "123456";
			String url = "jdbc:mysql://localhost:3306/hrdb";
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url, name, password);
			if (connection != null) {
				// System.out.println("Connection Successful!"); //如果连接成功 控制台输出
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println("Connection"); //如果连接成功 控制台输出
		return connection;
	}

	public void setConnection(Connection connection) {
		this.connection = connection;
	}

	/*
	 * public List<barBean> listAll(String num) { ArrayList<barBean> list = new
	 * ArrayList<barBean>(); PreparedStatement pstmt = null; ResultSet rs =
	 * null; try { pstmt =
	 * this.getConnection().prepareStatement("SELECT * FROM bar where num=num");
	 * rs = pstmt.executeQuery(); System.out.println(rs); while (rs.next()) {
	 * barBean bar = new barBean(); bar.setName(rs.getString("name"));
	 * bar.setNum(rs.getInt("num")); list.add(bar);
	 * //System.out.println("Connection Successful!"); } } catch (Exception e) {
	 * e.printStackTrace();
	 * 
	 * } finally { try { connection.close(); } catch (Exception e) {
	 * e.printStackTrace(); } } return list; }
	 */

	public ArrayList<barBean> listSelect(String name1) {
		// TODO Auto-generated method stub
		ArrayList<barBean> list = new ArrayList<barBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = this.getConnection().prepareStatement(
					"SELECT * FROM indexbank  where  date='"
							+ name1 + "'");
			rs = pstmt.executeQuery();
			System.out.println(rs);
			while (rs.next()) {
				barBean bar = new barBean();
				bar.setareaName(rs.getString("areaname"));
				bar.setDeviceNum(rs.getInt("devicenum"));
				bar.setDate(rs.getString("date"));
				bar.setTradeNum(rs.getInt("tradenum"));
				list.add(bar);
				// System.out.println("Connection Successful!");
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;

	}
}
