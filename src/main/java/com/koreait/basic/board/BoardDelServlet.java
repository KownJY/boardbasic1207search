package com.koreait.basic.board;

import com.koreait.basic.Utils;
import com.koreait.basic.board.model.BoardDTO;
import com.koreait.basic.board.model.BoardEntity;
import com.koreait.basic.board.model.BoardVO;
import com.koreait.basic.dao.BoardDAO;
import com.koreait.basic.user.model.UserEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/board/del")
public class BoardDelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        int iboard = Utils.getParameterInt(req,"iboard");
        int writer = Utils.getLoginUserPk(req);

        BoardEntity entity = new BoardEntity();
        entity.setIboard(iboard);
        entity.setWriter(writer);

        int result= BoardDAO.delBoard(entity);

        if(result == 0){
            req.setAttribute("err","로그인이 필요합니다.....");
            req.getRequestDispatcher("/board/detail?iboard =" + iboard).forward(req,res);
            return;
        }


        res.sendRedirect("/board/list");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    }
}
