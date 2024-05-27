package com.gyub.WhereToDrive.board.service;


import com.gyub.WhereToDrive.board.entity.Board;
import com.gyub.WhereToDrive.board.mapper.BoardMapper;
import com.gyub.WhereToDrive.common.Pagination;
import com.gyub.WhereToDrive.common.Search;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

    private final BoardMapper boardMapper;

    @Override
    public List<Board> findByAll() throws Exception {
        return boardMapper.findByAll();
    }

    @Override
    public Board findById(int bid) throws Exception {
        boardMapper.upHit(bid);
        return boardMapper.findById(bid);
    }

    @Override
    public void insert(Board boardVO) throws Exception {
        boardMapper.insert(boardVO);
    }

    @Override
    public void update(Board boardVO) throws Exception {
        boardMapper.update(boardVO);
    }

    @Override
    public void delete(int bid) throws Exception {
        boardMapper.delete(bid);
    }

    @Override
    public Pagination makePageNavigation(Map<String, String> map) throws Exception {
        Pagination pageNavigation = new Pagination();

        int naviSize = 10;
        int sizePerPage = 15;
        int currentPage = Integer.parseInt(map.get("pgno"));

        pageNavigation.setCurrentPage(currentPage);
        pageNavigation.setNaviSize(naviSize);
        Map<String, Object> param = new HashMap<String, Object>();
        String key = map.get("key");
        if ("userid".equals(key))
            key = "user_id";
        param.put("key", key == null ? "" : key);
        param.put("word", map.get("word") == null ? "" : map.get("word"));
        int totalCount = boardMapper.getTotalBoardCount(param);
        System.out.println(totalCount);
        pageNavigation.setTotalCount(totalCount);
        int totalPageCount = (totalCount - 1) / sizePerPage + 1;
        pageNavigation.setTotalPageCount(totalPageCount);
        boolean startRange = currentPage <= naviSize;
        pageNavigation.setStartRange(startRange);
        boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
        pageNavigation.setEndRange(endRange);
        pageNavigation.makeNavigator();

        return pageNavigation;
    }
    @Override
    public List<Board> listArticle(Map<String, String> map) throws Exception {
        Map<String, Object> param = new HashMap<String, Object>();
        String key = map.get("key");
        if("userid".equals(key))
            key = "b.user_id";
        param.put("key", key == null ? "" : key);
        param.put("word", map.get("word") == null ? "" : map.get("word"));
        int pgNo = Integer.parseInt(map.get("pgno") == null ? "1" : map.get("pgno"));
        int start = pgNo *15 - 15;
        param.put("start", start);
        param.put("listsize", 15);

        return boardMapper.listBoard(param);
    }


}



