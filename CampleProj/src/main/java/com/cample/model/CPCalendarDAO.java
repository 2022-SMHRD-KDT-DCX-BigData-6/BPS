package com.cample.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CPCalendarDAO {

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

	public int InsertCalendar(String calendar_title, String calendar_start, String calendar_end, String calendar_id, String calendar_key) {
		connect();

		try {

			String sql = "INSERT INTO cp_calendar VALUES(?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, calendar_title);
			psmt.setString(2, calendar_start);
			psmt.setString(3, calendar_end);
			psmt.setString(4, calendar_id);
			psmt.setString(5, calendar_key);
			

			int result = psmt.executeUpdate();

			return result;

		} catch (SQLException e) {
			// TODO: handle exception
		}

		return 0;
	}

	public ArrayList<CPCalendarDTO> selectAllCalendar(String calendar_id) {
		connect();

		ArrayList calendarList = new ArrayList<>();
		try {

			String sql = "SELECT * FROM cp_calendar WHERE calendar_id=?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, calendar_id);

			rs = psmt.executeQuery();

			while (rs.next()) {
				CPCalendarDTO cpDto = new CPCalendarDTO();
				cpDto.setCalendar_title(rs.getString("calendar_title"));
				cpDto.setCalendar_start(rs.getString("calendar_start"));
				cpDto.setCalendar_end(rs.getString("calendar_end"));
				cpDto.setCalendar_key(rs.getString("calendar_key"));

				calendarList.add(cpDto);
			}
		} catch (SQLException e) {

		} finally {
			close();
		}

		return calendarList;

	}

	public int DeleteCalendar(String calendar_key) {
		connect();

		try {

			String sql = "DELETE FROM cp_calendar WHERE calendar_key=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, calendar_key);

			int result = psmt.executeUpdate();

			return result;

		} catch (SQLException e) {
			// TODO: handle exception
		}

		return 0;
	}

	public int UpdateCalendar(String calendar_key, String calendar_start, String calendar_end) {
		connect();

		try {
			String sql = "UPDATE cp_calendar SET calendar_start = ?, calendar_end = ? WHERE calendar_key=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, calendar_start);
			psmt.setString(2, calendar_end);
			psmt.setString(3, calendar_key);

			int result = psmt.executeUpdate();

			return result;

		} catch (SQLException e) {
			// TODO: handle exception
		}

		return 0;
	}

}
