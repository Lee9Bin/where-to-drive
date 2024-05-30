package com.gyub.WhereToDrive.board.controller;

import com.gyub.WhereToDrive.board.entity.Board;
import com.gyub.WhereToDrive.board.service.BoardService;
import com.gyub.WhereToDrive.common.Pagination;
import com.gyub.WhereToDrive.common.Search;
import com.gyub.WhereToDrive.member.entity.User;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


@Slf4j
@Controller
@RequestMapping(value = "/boards")
@RequiredArgsConstructor
public class BoardController {

    private final BoardService boardService;

    @GetMapping
    public String findByAll(@RequestParam Map<String, String> map, @ModelAttribute Search search, Model model) throws Exception {
        List<Board> list = boardService.listArticle(map, search);
        Pagination pagination = boardService.makePageNavigation(map, search);

        model.addAttribute("boardList", list);
        model.addAttribute("navigation", pagination);
        model.addAttribute("pgno", map.get("pgno"));
        model.addAttribute("key", search.getKey());
        model.addAttribute("word", search.getWord());

        return "board/list";
    }

    @GetMapping("/write")
    public String boardForm() {
        log.info("boardForm 메서드 실행");
        return "board/write";
    }

    @PostMapping("/write")
    public String write(@ModelAttribute Board boardVO) throws Exception {
        log.info("잘들어오나?{}",boardVO);
        boardService.insert(boardVO);
        return "redirect:/boards";
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

    @PostMapping(value = "/delete/{bid}")
    public String deleteBoard(@PathVariable("bid") int bid, HttpSession session) throws Exception {
        log.info(((User)session.getAttribute("member")).getId());
        boardService.delete(bid);
        return "redirect:/boards";
    }
}
	
	
