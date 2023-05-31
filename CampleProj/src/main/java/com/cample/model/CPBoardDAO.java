package com.cample.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CPBoardDAO {

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
			String url="jdbc:oracle:thin:@project-db-stu.smhrd.com:1524:xe";
			String user="seogu_0526_4";
			String password="smhrd4";
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
	 * public int boardUpload(boardDTO dto) { connect(); int cnt=0; try { String
	 * sql="insert into webboard2(num,title,writer,filename,content,b_date) values(?,?,?,?,?,?)"
	 * ; psmt=conn.prepareStatement(sql); psmt.setString(1, dto.getNum());
	 * psmt.setString(2, dto.getTitle()); psmt.setString(3, dto.getWriter());
	 * psmt.setString(4, dto.getFilename()); psmt.setString(5, dto.getContent());
	 * psmt.setString(6, dto.getB_date()); cnt=psmt.executeUpdate(); } catch
	 * (Exception e) { // TODO: handle exception }finally { close(); } return cnt; }
	 */
	public int boardUpload(CPBoardDTO dto, String campus) {
		connect();
		int cnt=0;
		try {
			String sql="insert into cp_board(num,title,writer,content,campus) values(?,?,?,?,?)";
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, dto.getNum());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getWriter());
			
			psmt.setString(4, dto.getContent());
			psmt.setString(5, campus);
			
			
			
			
			cnt=psmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			close();
		}
		return cnt;
	}
	
	/*
	 * public int boardUpload2(boardDTO dto) { connect(); int cnt=0; try { String
	 * sql="insert into webboard3(num,title,writer,filename,content,b_date) values(?,?,?,?,?,?)"
	 * ; psmt=conn.prepareStatement(sql); psmt.setString(1, dto.getNum());
	 * psmt.setString(2, dto.getTitle()); psmt.setString(3, dto.getWriter());
	 * psmt.setString(4, dto.getFilename()); psmt.setString(5, dto.getContent());
	 * psmt.setString(6, dto.getB_date()); cnt=psmt.executeUpdate(); } catch
	 * (Exception e) { // TODO: handle exception }finally { close(); } return cnt; }
	 */
	
	
	 
	
	/*
	 * ArrayList<boardDTO> boardlist = null; public ArrayList<boardDTO> selall(){
	 * connect(); boardlist=new ArrayList<>();
	 * 
	 * try { String sql="select * from webboard2"; psmt =
	 * conn.prepareStatement(sql);
	 * 
	 * rs = psmt.executeQuery();
	 * 
	 * while (rs.next()) { boardDTO mDto = new boardDTO();
	 * mDto.setNum(rs.getString("num")); mDto.setTitle(rs.getString("title"));
	 * mDto.setWriter(rs.getString("writer"));
	 * mDto.setFilename(rs.getString("filename"));
	 * mDto.setContent(rs.getString("content"));
	 * mDto.setB_date(rs.getString("b_date"));
	 * 
	 * boardlist.add(mDto); } } catch (Exception e) { e.printStackTrace(); } finally
	 * { close(); } return boardlist;
	 * 
	 * }
	 */
	
	/*
	 * ArrayList<boardDTO> boardlist = null; public ArrayList<boardDTO> selall(){
	 * connect(); boardlist=new ArrayList<>();
	 * 
	 * try { String sql="select * from webboard4"; psmt =
	 * conn.prepareStatement(sql);
	 * 
	 * rs = psmt.executeQuery();
	 * 
	 * while (rs.next()) { boardDTO mDto = new boardDTO();
	 * mDto.setNum(rs.getString("num")); mDto.setTitle(rs.getString("title"));
	 * mDto.setWriter(rs.getString("writer"));
	 * mDto.setContent(rs.getString("content"));
	 * 
	 * 
	 * boardlist.add(mDto); } } catch (Exception e) { e.printStackTrace(); } finally
	 * { close(); } return boardlist;
	 * 
	 * }
	 */
	
	ArrayList<CPBoardDTO> boardlist = null;
	
	public ArrayList<CPBoardDTO> selall(String campus){
		connect();
		boardlist=new ArrayList<>();
		
		try {
			String sql="select * from cp_board where campus=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, campus);
			rs=psmt.executeQuery();

			rs = psmt.executeQuery();

			while (rs.next()) {
				CPBoardDTO mDto = new CPBoardDTO();
				mDto.setNum(rs.getString("num"));
				mDto.setTitle(rs.getString("title"));
				mDto.setWriter(rs.getString("writer"));
				mDto.setContent(rs.getString("content"));
				
				

				boardlist.add(mDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return boardlist;
		
	}
	
	
	 
	
	
	/*
	 * public boardDTO getboard(String num) { boardDTO mDto = null; connect(); try {
	 * String sql="select * from webboard2 where num=?";
	 * psmt=conn.prepareStatement(sql); psmt.setString(1, num);
	 * rs=psmt.executeQuery(); if(rs.next()) {
	 * System.out.println("======================"); mDto = new boardDTO();
	 * 
	 * mDto.setNum(rs.getString("num")); mDto.setTitle(rs.getString("title"));
	 * mDto.setWriter(rs.getString("writer"));
	 * mDto.setFilename(rs.getString("filename"));
	 * mDto.setContent(rs.getString("content"));
	 * mDto.setB_date(rs.getString("b_date")); } } catch (Exception e) { // TODO:
	 * handle exception } return mDto; }
	 */
	
	public CPBoardDTO getboard(String num) {
		CPBoardDTO mDto = null;
		connect();
		try {
			String sql="select * from cp_board where num=?";
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, num);
			rs=psmt.executeQuery();
			if(rs.next()) {
				System.out.println("======================");
				mDto = new CPBoardDTO();
				
				mDto.setNum(rs.getString("num"));
				mDto.setTitle(rs.getString("title"));
				mDto.setWriter(rs.getString("writer"));
				mDto.setContent(rs.getString("content"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return mDto;
	}
	
	/*
	 * public boardDTO getboard2(String num) { boardDTO mDto = null; connect(); try
	 * { String sql="select * from webboard3 where num=?";
	 * psmt=conn.prepareStatement(sql); psmt.setString(1, num);
	 * rs=psmt.executeQuery(); if(rs.next()) {
	 * System.out.println("======================"); mDto = new boardDTO();
	 * 
	 * mDto.setNum(rs.getString("num")); mDto.setTitle(rs.getString("title"));
	 * mDto.setWriter(rs.getString("writer"));
	 * mDto.setFilename(rs.getString("filename"));
	 * mDto.setContent(rs.getString("content"));
	 * mDto.setB_date(rs.getString("b_date")); } } catch (Exception e) { // TODO:
	 * handle exception } return mDto; }
	 */
	
	
}
