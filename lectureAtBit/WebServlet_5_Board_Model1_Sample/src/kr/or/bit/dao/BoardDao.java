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
import kr.or.bit.dto.Reply;

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

			row = pstmt.executeUpdate();

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
			// 공식같은 로직
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

	// 게시물 상세보기
	public Board getContent(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;

		try {
			conn = ds.getConnection();
			String sql = "select * from jspboard where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				String writer = rs.getString("writer");

				String email = rs.getString("email");
				String homepage = rs.getString("homepage");
				String pwd = rs.getString("pwd");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String filename = rs.getString("filename");

				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int filesize = rs.getInt("filesize");

				// 계층형
				int refer = rs.getInt("refer");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");

				board = new Board(idx, writer, pwd, subject, content, writedate, readnum, filename, filesize, homepage,
						email, refer, depth, step);

			}
		} catch (Exception e) {
			e.getMessage();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return board;
	}

	// 게시글 조회수 증가
	public boolean getReadNum(String idx) {
		// update jspboard set readnum = readnum + 1 where idx=?
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try {
			conn = ds.getConnection();
			String sql = "update jspboard set readnum = readnum + 1 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);

			int row = pstmt.executeUpdate();
			if (row > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();// 반환
			} catch (Exception e) {

			}
		}
		return result;
	}

	// 게시글 삭제하기
	public int deleteOk(String idx, String pwd) {
		// 일반게시판: 삭제...

		// 계층형 게시판: 답글
		/*
		 * 1.원본글(답글이 있는경우) 2.원본글(답글이 없는 경우) : 그냥 삭제
		 * 
		 * 원본글 (답글이 있는 경우) case 1: 원본글이 삭제되면 답변글 있으면 삭제(같은 refer delete) case 2: (네이버)
		 * 원본글만 삭제 -> 나머지 처리(텍스트 형태(원본글 삭제표시)) (refer depth) case 3: 삭제시 삭제되었음믈 표시 ( 게시판
		 * 설계(delok : 삭제여부 컬럼 :1) >> 삭제 :0 >> update 삭제:! case 4: 삭제 못하게 한다(답글이 있으면)
		 * refer count >1
		 * 
		 */
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		try {
			conn = ds.getConnection();

			// 비번 검증
			String sql_pwd = "select pwd from jspboard where idx=?";

			// 두개의 테이블 (FK) : 자식부터 삭제, 부모삭제
			// jspboard(pk) ,reply(fk:idx)
			// reply idx_fk=1 delete, jspboard idx =1 delete
			String sql_reply = "delete from reply where idx_fk=?";

			// 게시글 삭제
			String sql_board = "delete from jspboard where idx=?";

			pstmt = conn.prepareStatement(sql_pwd);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 삭제글은 존재
				// 사용자가 입력한 비번, DB 비번 일치여부
				if (pwd.equals(rs.getString("pwd"))) {
					// 실 삭제 처리
					// 트랜잭션(둘다 처리 or 둘다 실패)
					// 두개를 하나의 논리적 단위로
					// jdbc : auto commit
					conn.setAutoCommit(false);
					// 댓글 삭제
					pstmt = conn.prepareStatement(sql_reply);
					pstmt.setString(1, idx);
					pstmt.executeUpdate();

					// 게시글 삭제( 원본글, 답글)
					pstmt = conn.prepareStatement(sql_board);
					pstmt.setString(1, idx);
					row = pstmt.executeUpdate();

					if (row > 0) {
						conn.commit();// 두개의 delete 실반영
					}

				} else {// 비밀번호가 일치하지 않는 경우
					row = -1;
				}
			} else {// 삭제하는 글이 존재하지 않는 경우
				row = 0;
			}

		} catch (Exception e) {
			// rollback
			// 예외가 발생하면
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return row;
	}

	// 댓글 입력하기 (Table reply : fk(jspboard idx) )
	public int replywrite(int idx_fk, String writer, String userid, String content, String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			conn = ds.getConnection();
			String sql = "insert into reply(no,writer,userid,content,pwd,idx_fk) "
					+ " values(reply_no.nextval,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, userid);
			pstmt.setString(3, content);
			pstmt.setString(4, pwd);
			pstmt.setInt(5, idx_fk);

			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();// 반환
			} catch (Exception e) {

			}
		}

		return row;
	}

	// 댓글 조회하기
	public List<Reply> replylist(String idx_fk) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Reply> list = null;

		try {
			conn = ds.getConnection();
			String reply_sql = "select * from reply where idx_fk=? order by no desc";

			pstmt = conn.prepareStatement(reply_sql);
			pstmt.setString(1, idx_fk);

			rs = pstmt.executeQuery();

			list = new ArrayList<>();
			while (rs.next()) {
				int no = Integer.parseInt(rs.getString("no"));
				String writer = rs.getString("writer");
				String userid = rs.getString("userid");
				String pwd = rs.getString("pwd");
				String content = rs.getString("content");
				java.sql.Date writedate = rs.getDate("writedate");
				int idx = Integer.parseInt(rs.getString("idx_fk"));

				Reply replydto = new Reply(no, writer, userid, pwd, content, writedate, idx);
				list.add(replydto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();// 반환
			} catch (Exception e) {

			}
		}

		return list;
	}

	// 댓글 삭제하기
	public int replyDelete(String no, String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;

		try {

			String replyselect = "select pwd from reply where no=?";
			String replydelete = "delete from reply where no=?";

			conn = ds.getConnection();
			pstmt = conn.prepareStatement(replyselect);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbpwd = rs.getString("pwd");
				if (pwd.equals(dbpwd)) {
					pstmt.close();
					pstmt = conn.prepareStatement(replydelete);
					pstmt.setString(1, no);
					row = pstmt.executeUpdate();
				} else {
					row = 0;
				}
			} else {
				row = -1;
			}
		} catch (Exception e) {

		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();// 반환
			} catch (Exception e) {

			}
		}

		return row;
	}

	//게시글 상세 (답글 쓰기) 
		public int reWriteOk(Board boardata) {
			//content.jsp ->(답글)-> rewrite.jsp(입력) -> submit() -> rewriteok.jsp 
			//게시물 글쓰기(INSERT > 답글 ....) : refer , step , depth
			//내가 답글을 달려하는 하는 글의  글번호가 필요해요
			
			//refer , step , depth 설정을 하려면 기존 정보(read 글)
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int result = 0;
			try {
				conn = ds.getConnection();
				
				int idx = boardata.getIdx(); //현재 읽은 글의 글번호
				
				String writer = boardata.getWriter();
				String email = boardata.getEmail();
				String homepage = boardata.getHomepage();
				String pwd = boardata.getPwd();
				String subject = boardata.getSubject();
				String content = boardata.getContent();
				String filename = boardata.getFilename();
				int filesize = 0;
				
				//1. 답글 
				//현재 내가 읽은 글의 refer , depth , step
				String refer_depth_step_sal ="select refer , depth , step from jspboard where idx=?";
				
				//2. 위치
				//step (순서) : 나중에 쓴 답글이 위로 올라오게 하겠다
				//내가 읽은 글의 step 보다 큰 값은 +1 해서 증가 시켜 놓는다
				//refer 값으로 판단
				//ex)   원본글                 refer=1 , step=0 , depth=0 
			    //      원본글답글           refer=1 , step=1+1 >2 >3,  depth=1
				//	        원본글답글           refer=1 , step=1>2 ,       depth=1
				//      원본글답글           refer=1 , step=0+1>1    
				String step_update_sql = "update jspboard set step= step+1 where step  > ? and refer =? ";
				// "update jspboard set step= step+1 where step  > 0 and refer =1 ";
				
				//답글  insert 
				String rewrite_sql="insert into jspboard(idx,writer,pwd,subject,content,email,homepage,writedate,readnum,filename,filesize,refer,depth,step)" + 
					    		   " values(jspboard_idx.nextval,?,?,?,?,?,?,sysdate,0,?,0,?,?,?)";
				
				pstmt = conn.prepareStatement(refer_depth_step_sal);
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					int refer = rs.getInt("refer");
					int step = rs.getInt("step");
					int depth = rs.getInt("depth");
					
					pstmt = conn.prepareStatement(step_update_sql);
					pstmt.setInt(1, step);
					pstmt.setInt(2, refer);
					pstmt.executeUpdate();

					//filename,filesize,refer,depth,step
					pstmt = conn.prepareStatement(rewrite_sql);
					pstmt.setString(1, writer);
					pstmt.setString(2,pwd);
					pstmt.setString(3, subject);
					pstmt.setString(4, content);
					pstmt.setString(5, email);
					pstmt.setString(6, homepage);
					pstmt.setString(7, filename);
					
					//답변
					pstmt.setInt(8, refer);
					pstmt.setInt(9, depth+1); // 규칙 현재 읽은 글에 depth + 1
					pstmt.setInt(10, step+1); // 순서 update 통해서  자리 확보 + 1
					
					int row = pstmt.executeUpdate();
					if(row > 0) {
						result = row;
					}else {
						result = -1;
					}

				}
		
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					pstmt.close();
					rs.close();
					conn.close();//반환
				}catch (Exception e) {
					
				}
			}
			
			return result;
		}
	}