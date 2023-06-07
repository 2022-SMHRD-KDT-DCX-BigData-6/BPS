package com.cample.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CPMemberDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	public void connect() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-cgi.smhrd.com:1524:xe";
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

	public int InsertMember(String mem_id, String mem_pw, String mem_name, String mem_college) {

		connect();

		try {
			String sql = "INSERT INTO cp_member VALUES(?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_id);
			psmt.setString(2, mem_pw);
			psmt.setString(3, mem_name);
			psmt.setString(4, mem_college);

			int result = psmt.executeUpdate();

			return result;

		} catch (SQLException e) {
			// TODO: handle exception
		}

		return 0;

	}

	public CPMemberDTO selectMember(String mem_id, String mem_pw) {
		connect();

		try {
			String sql = "SELECT * FROM cp_member WHERE mem_id = ? AND mem_pw = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_id);
			psmt.setString(2, mem_pw);

			rs = psmt.executeQuery();

			if (rs.next()) {
				return new CPMemberDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("SQL문법 Error");
		} finally {
			close();
		}

		return null;

	}

}
