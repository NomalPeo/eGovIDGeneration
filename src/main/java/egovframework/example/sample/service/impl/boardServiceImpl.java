package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.boardService;
import egovframework.vo.boardVO;
@Service("boardService")
public class boardServiceImpl extends EgovSampleServiceImpl implements boardService {
	
	@Resource(name="boardDAO")
	private boardDAO boardDao;

	@Override
	public String insert(boardVO vo) {
		return boardDao.insert(vo);
	}

	@Override
	public List getList() {
		return boardDao.getList();
	}

	@Override
	public int delete(String board_seq) {
		return boardDao.deleteList(board_seq);
	}
	
}
