package com.koreait.basic.board.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardDTO {

    private int iboard;
    private int page; //몇 페이지 하는지..
    private int startIdx; //시작지점
    private int rowCnt; // 몇 열 할 것인지
    private int searchType;
    private String searchText;

//    public void setPage(int page){
//        this.page = page;
//        this.startIdx= (page - 1) * rowCnt;
//    }
}
