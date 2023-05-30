package com.cample.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CPProjectDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	public void connect() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.smhrd.com:1524:xe";
			String user = "seogu_0526_4";
			String password = "smhrd4";
			conn = DriverManager.getConnection(url, user, password);
			System.out.println(conn != null ? "DB연결성공" : "DB연결실패");

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("OracleDriver Error");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("입력된 DB정보 Error");
		}

	}

	public void close() {
		try {
			if (conn != null) {
				conn.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public boolean CheckMember(String id) {
		connect ();
		boolean check = false;
		try {
			String sql = "SELECT * from cp_proj where id = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			check = rs.next();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return check;
	}
	
	public int InsertMember(String id, String status, String content, String writer) {

		connect();
		int result = 0;
		try {
			String sql = "INSERT INTO cp_proj VALUES(?, ?, ?, ?)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, status);
			psmt.setString(3, content);
			psmt.setString(4, writer);

			result = psmt.executeUpdate();


		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}

		return result;

	}

	public int UpdateMember(String id, String status, String content, String writer) {
		connect();
		int result = 0;
		try {
			String sql = "UPDATE cp_proj set status = ?, content = ?, writer = ? where id = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, status);
			psmt.setString(2, content);
			psmt.setString(3, writer);
			psmt.setString(4, id);
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public int DeleteMember (String id) {
		connect();
		int result = 0;
		
		try {
			String sql = "DELETE FROM cp_proj WHERE id = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
	
	public ArrayList<CPProjectDTO> SelectAllProj (String writer) {
		connect();
		ArrayList<CPProjectDTO> projList = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM cp_proj WHERE writer = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, writer);
			
			rs = psmt.executeQuery();
			while (rs.next()) {
				CPProjectDTO proj = new CPProjectDTO();
				proj.setId(rs.getString(1));
				proj.setStatus(rs.getString(2));
				proj.setContent(rs.getString(3));
				proj.setWriter(rs.getString(4));
				
				projList.add(proj);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return projList;
		
	}

}
