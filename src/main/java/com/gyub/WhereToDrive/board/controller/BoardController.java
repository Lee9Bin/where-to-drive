package com.gyub.WhereToDrive.board.controller;

import com.gyub.WhereToDrive.board.entity.Board;
import com.gyub.WhereToDrive.board.service.BoardService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping(value = "/boards")
@RequiredArgsConstructor
public class BoardController {

    private final BoardService boardService;

    @GetMapping
    public String findByAll(Model model) throws Exception {
        model.addAttribute("boardList", boardService.findByAll());
        return "board/index";
    }

    @RequestMapping("/boardForm")
    public String boardForm(@ModelAttribute("boardVO") Board vo, Model model, HttpServletRequest request) {
        return "board/boardForm";
    }


    @RequestMapping(value = "/getBoardContent", method = RequestMethod.GET)
    public String getBoardContent(Model model, @RequestParam("bid") int bid) throws Exception {
        model.addAttribute("boardContent", boardService.findById(bid));
        return "board/boardContent";
    }


    @RequestMapping(value = "/editForm", method = RequestMethod.GET)
    public String editForm(@RequestParam("bid") int bid, @RequestParam("mode") String mode, Model model) throws Exception {
        model.addAttribute("boardContent", boardService.findById(bid));
        model.addAttribute("mode", mode);
        model.addAttribute("boardVO", new Board());
        return "board/boardForm";
    }

    @RequestMapping(value = "/saveBoard", method = RequestMethod.POST)
    public String saveBoard(@ModelAttribute("boardVO") Board boardVO, @RequestParam("mode") String mode, RedirectAttributes rttr) throws Exception {

        if (mode.equals("edit")) {
            boardService.update(boardVO);
        } else {
            boardService.insert(boardVO);
        }
        return "redirect:/board/getBoardList";
    }

    @RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
    public String deleteBoard(RedirectAttributes rttr, @RequestParam("bid") int bid) throws Exception {
        boardService.delete(bid);
        return "redirect:/board/getBoardList";

    }


}
	
	
