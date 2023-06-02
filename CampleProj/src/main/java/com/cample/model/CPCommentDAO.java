package com.cample.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CPCommentDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	public void connect() {
		
		try {
			// jdbc를 사용하기 위한 드라이버클래스를 동적으로 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 데이터베이스 연결
			// localhost : 데이터베이스 서버의 주소
			// 1521 : 데이터베이스 서버의 포트번호
			String url = "jdbc:oracle:thin:@project-db-stu.smhrd.com:1524:xe";
			String user = "seogu_0526_4";
			String password = "smhrd4";
			conn=DriverManager.getConnection(url,user,password);
			
			System.out.println(conn!=null?"db 연결 성공":"db 연결 실패");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println("OracleDriver Error");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println("입력된 DB정보 Error");
		}
	}
	
	public void close() {
		try {
			if(conn !=null) {conn.close();}
			if(psmt !=null) {psmt.close();}
			if(rs!=null) {rs.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	
	/*
	 * public int commentUpload(CPCommentDTO dto, String num) { connect(); int
	 * cnt=0; try { String sql="insert into comments(comments,num) values(?,?)";
	 * psmt=conn.prepareStatement(sql); psmt.setString(1, dto.getComments());
	 * psmt.setString(2, num); cnt=psmt.executeUpdate(); } catch (Exception e) { //
	 * TODO: handle exception }finally { close(); } return cnt; }
	 */

	
	public int commentUpload(CPCommentDTO dto, String num, String name) {
		connect();
		int cnt=0;
		try {
			String sql="insert into comments(comments,num,name) values(?,?,?)";
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, dto.getComments());
			psmt.setString(2, num);
			psmt.setString(3, name);
			cnt=psmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			close();
		}
		return cnt;
	}
	
	/*
	 * ArrayList<CPCommentDTO> boardlist = null;
	 * 
	 * public ArrayList<CPCommentDTO> selall(){ connect(); boardlist=new
	 * ArrayList<>();
	 * 
	 * try { String sql="select * from comments2"; psmt =
	 * conn.prepareStatement(sql);
	 * 
	 * rs=psmt.executeQuery();
	 * 
	 * 
	 * 
	 * while (rs.next()) { CPCommentDTO mDto = new CPCommentDTO();
	 * 
	 * mDto.setComments(rs.getString("comments"));
	 * 
	 * 
	 * 
	 * boardlist.add(mDto); } } catch (Exception e) { e.printStackTrace(); } finally
	 * { close(); } return boardlist;
	 * 
	 * }
	 */
	ArrayList<CPCommentDTO> boardlist = null;
	public ArrayList<CPCommentDTO> getcomments(String num) {
		
		connect();
		boardlist=new ArrayList<>();
		try {
			String sql="select * from comments where num=?";
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, num);
			rs=psmt.executeQuery();
			
			while (rs.next()) {
				CPCommentDTO mDto = new CPCommentDTO();
				
				mDto.setComments(rs.getString("comments"));
				mDto.setName(rs.getString("name"));

				boardlist.add(mDto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}finally {
			close();
		}
		return boardlist;
	}
	
}

