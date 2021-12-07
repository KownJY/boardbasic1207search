<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
        <link rel="stylesheet" href="/res/css/board/list.css?ver=1">
<div>
    <form action="/board/list" method="get">

            <select name="searchType">
                <option value="1" ${param.searchType == 1 ? 'selected' :''}>제목</option>
                <option value="2" ${param.searchType == 2 ? 'selected' :''}>내용</option>
                <option value="3" ${param.searchType == 3 ? 'selected' :''}>제목/내용</option>
                <option value="4" ${param.searchType == 4 ? 'selected' :''}>글쓴이</option>
                <option value="5" ${param.searchType == 5 ? 'selected' :''}>전체</option>
            </select>

        <input type="search" name="searchText" value="${param.searchText}"><input type="submit" value="검색">

    </form>
</div>
<c:choose>

    <c:when test="${requestScope.maxPageNum==0}">
        <div>글이 없습니다....</div>
    </c:when>
    <c:otherwise>

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

                    <c:set var="eachTitle" value="${fn:replace(fn:replace(item.title, '>', '&gt;'), '<', '&lt;')}" />
                    <c:set var="eachWriterNm" value="${fn:replace(fn:replace(item.writerNm, '>', '&gt;'), '<', '&lt;')}" />
                    <c:if test="${param.searchType == 1 || param.searchType == 3}">
                        <c:set var="eachTitle" value="${fn:replace( eachTitle, param.searchText, '<mark>' += param.searchText += '</mark>')}" />
                    </c:if>

                    <c:if test="${param.searchType == 4 || param.searchType == 5}">
                        <c:set var="eachWriterNm" value="${fn:replace( eachWriterNm, param.searchText, '<mark>' += param.searchText += '</mark>')}" />
                    </c:if>

                    <tr class="record" onclick="moveToDetail(${item.iboard});">

                        <td><c:out value="${item.iboard}"></c:out></td>
                        <td>${eachTitle}</td>
                        <td><c:out value="${item.hit}"></c:out></td>
                        <td>${eachWriterNm}</td>
                        <td><c:out value="${item.rdt}"></c:out></td>

                    </tr>
                </c:forEach>
            </table>
        </div>

        <div class="pageContainer">
            <c:forEach var="page" begin="1" end="${maxPageNum}">

                <c:set var="selectedPage" value="${param.page == null? 1 : param.page}"></c:set>
                <div><a href="/board/list?page=${page}"><span class="${selectedPage == page ? 'selected' : ''}"><c:out
                        value="${page}"></c:out></span></a></div>

            </c:forEach>
<%--//todo 페이지 넘어가면 풀리는 것 개선--%>

        </div>

    </c:otherwise>

</c:choose>


<script src="/res/js/board/list.js"></script>