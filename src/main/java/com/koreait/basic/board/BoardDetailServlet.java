package com.koreait.basic.board;

import com.koreait.basic.Utils;
import com.koreait.basic.board.model.BoardDTO;
import com.koreait.basic.board.model.BoardEntity;
import com.koreait.basic.board.model.BoardVO;
import com.koreait.basic.dao.BoardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/board/detail")
public class BoardDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {


        int ibaord = Utils.parseStringToInt(req.getParameter("iboard"),0);

        BoardDTO dto = new BoardDTO();
        dto.setIboard(ibaord);

        BoardVO data = BoardDAO.selBoardDetail(dto);
//        if(dto.getIboard() == data.getIboard() || dto == null){
//
//           data = BoardDAO.updBoardHitUp(dto);
//        }
//
        if(Utils.getLoginUserPk(req) != data.getWriter()){
             BoardDAO.updBoardHitUp(dto);
        }

        req.setAttribute("data",data);
        Utils.displayView("detail","board/detail",req,res);

    // 로그인 한 사람의 피케값과 데이터에 들어잇는 라이터값이 다르다면 0
        // 혹은 비로그인상태시 히트값 증가

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {


    }
}
