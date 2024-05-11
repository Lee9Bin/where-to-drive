package com.gyub.WhereToDrive.board.controller;

import com.gyub.WhereToDrive.board.entity.Board;
import com.gyub.WhereToDrive.board.service.BoardService;
import com.gyub.WhereToDrive.member.entity.MemberVO;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


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


    @GetMapping("/edit/{bid}")
    public String editForm(@PathVariable("bid") int bid, Model model) throws Exception {
        log.info("bid {}",bid
        );
        model.addAttribute("boardContent", boardService.findById(bid));
        return "board/edit";
    }

    @PostMapping("/edit")
    public String update(@ModelAttribute Board boardVO) throws Exception {
        log.info(boardVO.toString());
        boardService.update(boardVO);
        return "redirect:/boards";
    }

    @PostMapping("/insert")
    public String insert(@ModelAttribute Board boardVO) throws Exception {
        log.info(boardVO.toString());
        boardService.insert(boardVO);
        return "redirect:/boards";
    }

    @PostMapping(value = "/delete/{bid}")
    public String deleteBoard(@PathVariable("bid") int bid, HttpSession session) throws Exception {
        log.info(((MemberVO)session.getAttribute("member")).getMemberId());
        boardService.delete(bid);
        return "redirect:/boards";
    }
}
	
	
