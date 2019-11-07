package kr.or.bit.service;

import java.util.List;

import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;

//JSP 요청하는 객체 (Singleton)
public class BoardService {
	private static BoardService instance = new BoardService();

	private BoardService() {
	};

	public static BoardService getInstance() {

		return instance;
	}

	// 서비스 요청(글쓰기)
	public int writeOk(Board boarddata) throws Exception {
		BoardDao dao = new BoardDao();
		int result = dao.writeok(boarddata);
		return result;
	}

	public List<Board> list(int cpage, int pagesize) throws Exception {
		BoardDao dao = new BoardDao();
		return dao.list(cpage, pagesize);
	}

	// 서비스 요청(글목록 게시물 총 건수)
	public int totalBoardCount() throws Exception {
		BoardDao dao = new BoardDao();
		return dao.totalBoardCount();
	}
}
