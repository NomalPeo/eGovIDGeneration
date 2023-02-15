package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.vo.boardVO;

@Repository("boardDAO")
public class boardDAO extends EgovAbstractDAO{
	
	

	public String insert(boardVO vo) {
		return (String) insert("boardWriteSave",vo);
	}

	public List getList() {
		return list("boardList");
	}

	public int deleteList(String board_seq) {
		return delete("boardDel",board_seq);
	}
	
}
