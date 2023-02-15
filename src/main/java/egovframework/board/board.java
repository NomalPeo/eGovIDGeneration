package egovframework.board;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.boardService;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.vo.boardVO;

@Controller
public class board {
	
	@Resource(name="boardService")
	private boardService boardService;
	
	@Resource(name="egovIdGnrService")
	private EgovIdGnrService egovIdgnrservice;
	
	@RequestMapping(value="/main.do")
	public String main() {
		return "main";
	}
	
	@RequestMapping(value="boardwrite.do")
	public String boardWrite() {
		return "boardWrite/boardWrite";
	}
	
	@RequestMapping(value="boardwriteSave.do")
	public String boardWriteSave(boardVO vo) throws FdlException {
		String board_seq = egovIdgnrservice.getNextStringId();
		vo.setBoard_seq(board_seq);
		boardService.insert(vo);
		return "redirect:/boardList.do";
	}
	
	@RequestMapping(value="boardList.do")
	public String boardList(Model model, boardVO vo) {
		List<boardVO> list2 = boardService.getList();
		
		model.addAttribute("list",list2);
		return "boardList/boardList";
	}
	
	@RequestMapping(value="boarddel.do")
	public String boarddel(HttpServletRequest request) {
		String[] ckd = request.getParameterValues("chk");
		int lenght = ckd.length;
		for(int i=0; i<lenght; i++) {
			boardService.delete(ckd[i]);
		}
		return "redirect:/boardList.do";
	}
	
}
