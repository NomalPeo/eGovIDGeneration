package egovframework.example.sample.service;

import java.util.List;

import egovframework.vo.boardVO;

public interface boardService {

	public String insert(boardVO vo);

	public List getList();

	public int delete(String board_seq);

}
