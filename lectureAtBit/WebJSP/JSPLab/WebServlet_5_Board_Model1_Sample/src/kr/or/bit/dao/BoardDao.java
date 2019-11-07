package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.bit.dto.Board;

//CRUD 함수 > ConnectionPool > 함수단위 연결, 반환
public class BoardDao {
	DataSource ds = null;

	public BoardDao() throws NamingException {
		Context context = new InitialContext();
		ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
	}

	// 글쓰기 (원본글)
	public int writeok(Board boarddata) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			conn = ds.getConnection();
			String sql = "insert into jspboard(idx, writer, pwd, subject, content, email, homepage, writedate, readnum,filename,filesize,refer)"
					+ " values(jspboard_idx.nextval,?,?,?,?,?,?,sysdate,0,?,0,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, boarddata.getWriter());
			pstmt.setString(2, boarddata.getPwd());
			pstmt.setString(3, boarddata.getSubject());
			pstmt.setString(4, boarddata.getContent());
			pstmt.setString(5, boarddata.getEmail());
			pstmt.setString(6, boarddata.getHomepage());
			pstmt.setString(7, boarddata.getFilename());

			// 계층형 게시판
			// refer(참조값) , step , depth
			// 1. 원본글 : refer 생성? , step(0) default, depth(0) default
			// 2. 답변글 : refer 생성? , step +1 , depth +1
			int refermax = getMaxRefer();
			int refer = refermax + 1;
			pstmt.setInt(8, refer);
			System.out.println("refer : " + refer);
			row = pstmt.executeUpdate();
			System.out.println("row : " + row);
		} catch (Exception e) {

		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return row;
	}

//글쓰기(erfer) 값 생성하기
	public int getMaxRefer() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int refer_max = 0;
		try {
			conn = ds.getConnection();
			String sql = "select nvl(max(refer),0) from jspboard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				refer_max = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();// 반납이요^^
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return refer_max;
	}

	// 게시물 목록보기
	public List<Board> list(int cpage, int pagesize) {
		/*
		 * [1][2][3][4][5][다음] [이전][6][7][8][9][10][다음] [이전][11][12]
		 * 
		 * [1] page 크기 > pagesize 정의 totaldata > 54건 pagesize = 5; 규칙 >
		 * totalpagecount=11; (전체페이지 개수)
		 * 
		 * int cpage >> currentpage(현재 페이지 번호) >>1page, 2page
		 * 
		 * 현재 데이터 100건 cpage:1, pagesize:5 >start(시작 글번호)1 ~end(글번호)5 cpage:2,
		 * pagesize:5 >start(시작 글번호)6 ~end(글번호)10 cpage:11, pagesize:5 >start(시작 글번호)51
		 * ~end(글번호)55 -5개씩 묵어서 11번째 묶음을 보여주세요
		 */
		/*
		 * SELECT * FROM ( SELECT ROWNUM rn , idx , writer , email, homepage, pwd ,
		 * subject , content, writedate, readnum , filename, filesize , refer , depth ,
		 * step FROM ( SELECT * FROM jspboard ORDER BY refer DESC , step ASC ) ) WHERE
		 * rn BETWEEN 1 AND 5;
		 * 
		 * -------------------------------------- select * from ( select rownum rn , idx
		 * , writer , email, homepage, pwd , subject , content, writedate, readnum
		 * ,filename, filesize , refer , depth , step from ( SELECT * FROM jspboard
		 * ORDER BY refer DESC , step ASC ) where rownum <= 10 --endrow ) where rn >= 6;
		 * --firstrow
		 * 
		 */
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = null;
		try {
			conn = ds.getConnection();
			String sql = "select * from "
					+ "(select rownum rn,idx,writer,email,homepage,pwd,subject , content, writedate, readnum "
					+ ",filename,filesize,refer,depth,step "
					+ " from ( SELECT * FROM jspboard ORDER BY refer DESC , step ASC ) " + " where rownum <= ?" + // endrow
					") where rn >= ?"; // startrow
			pstmt = conn.prepareStatement(sql);
			//공식같은 로직
			int start = cpage * pagesize - (pagesize - 1); // 1 * 5 - (5 - 1) >> 1
			int end = cpage * pagesize; // 1 * 5 >> 5
			//
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);

			rs = pstmt.executeQuery();
			// System.out.println("rs:" + rs);
			list = new ArrayList<Board>();
			while (rs.next()) {
				Board board = new Board();
				board.setIdx(rs.getInt("idx"));
				board.setSubject(rs.getString("subject"));
				board.setWriter(rs.getString("writer"));
				board.setWritedate(rs.getDate("writedate"));
				board.setReadnum(rs.getInt("readnum"));

				// 계층형
				board.setRefer(rs.getInt("refer"));
				board.setStep(rs.getInt("step"));
				board.setDepth(rs.getInt("depth"));

				list.add(board);
			}
		} catch (Exception e) {

		} finally {

			try {

				pstmt.close();
				rs.close();

				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		System.out.println(list.size());
		return list;

	}

	// 게시물 총 건수 구하기
	public int totalBoardCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalcount = 0;
		try {
			conn = ds.getConnection(); // dbcp 연결객체 얻기
			String sql = "select count(*) cnt from jspboard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalcount = rs.getInt("cnt");
			}
		} catch (Exception e) {

		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();// 반환 connection pool 에 반환하기
			} catch (Exception e) {

			}
		}
		return totalcount;
	}
}