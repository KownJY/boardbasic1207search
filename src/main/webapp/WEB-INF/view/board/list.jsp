<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/res/css/board/list.css">
<div>
    <table id="boardTable">
        <tr>
            <th>no</th>
            <th>title</th>
            <th>hits</th>
            <th>writer</th>
            <th>reg-datetime</th>
        </tr>

        <c:forEach items="${requestScope.list}" var="item">
            <tr class="record" onclick="moveToDetail(${item.iboard});">

                <td><c:out value="${item.iboard}"></c:out></td>
                <td><c:out value="${item.title}"></c:out></td>
                <td><c:out value="${item.hit}"></c:out></td>
                <td><c:out value="${item.writerNm}"></c:out></td>
                <td><c:out value="${item.rdt}"></c:out></td>

            </tr>
        </c:forEach>
    </table>
</div>

<script src="/res/js/board/list.js"></script>