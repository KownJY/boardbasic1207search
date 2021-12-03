<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021-12-02
  Time: 오후 2:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <form action="/board/regmod" method="post">
        <div><label>제목 : <input type="text" name="title"></label></div>
        <div><label>내용 : <textarea name="ctnt"> </textarea> </label></div>

        <div>
            <input type="submit" value="등록">
            <input type="reset" value="초기화">
        </div>
    </form>
</div>