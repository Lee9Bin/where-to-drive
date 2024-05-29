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
    public Pagination makePageNavigation(Map<String, String> map, Search search) throws Exception {
        Pagination pageNavigation = new Pagination();

        int naviSize = 10;
        int sizePerPage = 15;
        int currentPage = Integer.parseInt(map.get("pgno"));

        pageNavigation.setCurrentPage(currentPage);
        pageNavigation.setNaviSize(naviSize);

        Map<String, Object> param = new HashMap<>();
        String key = search.getKey();

        if ("userid".equals(key))
            key = "reg_id";
        else if ("title".equals(key))
            key = "title";

        param.put("key", key == null ? "" : key);
        param.put("word", search.getWord() == null ? "" : search.getWord());

        int totalCount = boardMapper.getTotalBoardCount(param);
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
    public List<Board> listArticle(Map<String, String> map, Search search) throws Exception {
        Map<String, Object> param = new HashMap<>();
        String key = search.getKey();
        if ("userid".equals(key))
            key = "reg_id";
        else if ("title".equals(key))
            key = "title";
        param.put("key", key == null ? "" : key);
        param.put("word", search.getWord() == null ? "" : search.getWord());
        int pgNo = Integer.parseInt(map.get("pgno") == null ? "1" : map.get("pgno"));
        int start = pgNo *15 - 15;
        param.put("start", start);
        param.put("listsize", 15);

        return boardMapper.listBoard(param);
    }


}



