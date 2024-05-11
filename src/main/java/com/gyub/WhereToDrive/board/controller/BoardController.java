package com.gyub.WhereToDrive.board.controller;

import com.gyub.WhereToDrive.board.entity.Board;
import com.gyub.WhereToDrive.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Slf4j
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

    @GetMapping("/boardForm")
    public String boardForm() {
        log.info("boardForm 메서드 실행");
        return "board/write";
    }


    @GetMapping("/{bid}")
    public String findById(Model model, @PathVariable("bid") int bid) throws Exception {
        log.info("findById 메서드 실행");
        model.addAttribute("boardContent", boardService.findById(bid));
        return "board/detail";
    }


    @GetMapping("/editForm/{bid}")
    public String editForm(@PathVariable("bid") int bid, Model model) throws Exception {
        model.addAttribute("boardContent", boardService.findById(bid));
        return "board/edit";
    }

    @RequestMapping(value = "/saveBoard", method = RequestMethod.POST)
    public String saveBoard(@ModelAttribute("boardVO") Board boardVO, @RequestParam("mode") String mode, RedirectAttributes rttr) throws Exception {

        if (mode.equals("edit")) {
            boardService.update(boardVO);
        } else {
            boardService.insert(boardVO);
        }
        return "redirect:/boards";
    }

    @RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
    public String deleteBoard(RedirectAttributes rttr, @RequestParam("bid") int bid) throws Exception {
        boardService.delete(bid);
        return "redirect:/board/getBoardList";

    }


}
	
	
