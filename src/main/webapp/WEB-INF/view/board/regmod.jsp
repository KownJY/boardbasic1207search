<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021-12-02
  Time: 오후 2:08
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <form action="/board/regmod" method="post">
        <input type="hidden" name="iboard" value="${requestScope.data.iboard}">
        <div><label>제목 : <input type="text" name="title" value="<c:out value="${requestScope.data.title}"/>"></label>
        </div>
        <div><label>내용 : <textarea name="ctnt"><c:out value="${requestScope.data.ctnt}"></c:out> </textarea> </label>
        </div>

        <div>
            <input type="submit" value="${title}">
            <input type="reset" value="초기화">
        </div>
    </form>
</div>


