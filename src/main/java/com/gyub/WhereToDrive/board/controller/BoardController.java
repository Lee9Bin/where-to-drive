package com.gyub.WhereToDrive.board.controller;

import com.gyub.WhereToDrive.board.model.BoardVO;
import com.gyub.WhereToDrive.board.service.BoardService;
import com.gyub.WhereToDrive.common.Search;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/getBoardList", method = RequestMethod.GET)

	public String getBoardList(Model model

			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			, @RequestParam(required = false, defaultValue = "title") String searchType
			, @RequestParam(required = false) String keyword,
			@ModelAttribute("search") Search search
			) throws Exception {

		
		//�˻�
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		//��ü �Խñ� ����
		int listCnt = boardService.getBoardListCnt(search);

		//�˻�
		search.pageInfo(page, range, listCnt);

		//����¡
		model.addAttribute("pagination", search);

		//�Խñ� ȭ�� ���
		model.addAttribute("boardList", boardService.getBoardList(search));
		return "board/index";

	}
	
	@RequestMapping("/boardForm")
	public String boardForm(@ModelAttribute("boardVO") BoardVO vo, Model model, HttpServletRequest request) {
		return "board/boardForm";
	}

	
	@RequestMapping(value = "/getBoardContent", method = RequestMethod.GET)
	public String getBoardContent(Model model, @RequestParam("bid") int bid) throws Exception {
		model.addAttribute("boardContent", boardService.getBoardContent(bid));	
		return "board/boardContent";
	}
	

	@RequestMapping(value = "/editForm", method = RequestMethod.GET)
	public String editForm(@RequestParam("bid") int bid, @RequestParam("mode") String mode, Model model) throws Exception {
		model.addAttribute("boardContent", boardService.getBoardContent(bid));
		model.addAttribute("mode", mode);
		model.addAttribute("boardVO", new BoardVO());
		return "board/boardForm";
	}
	
	@RequestMapping(value = "/saveBoard", method = RequestMethod.POST)
	public String saveBoard(@ModelAttribute("boardVO") BoardVO boardVO
			, @RequestParam("mode") String mode
			, RedirectAttributes rttr) throws Exception {

		if (mode.equals("edit")) {
			boardService.updateBoard(boardVO);
		} else {
			boardService.insertBoard(boardVO);
		}
		return "redirect:/board/getBoardList";
	}
	
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)

	public String deleteBoard(RedirectAttributes rttr, @RequestParam("bid") int bid) throws Exception {

		boardService.deleteBoard(bid);

		return "redirect:/board/getBoardList";

	}
	
	
}
	
	
