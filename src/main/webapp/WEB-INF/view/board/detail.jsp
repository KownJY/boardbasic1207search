<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/res/css/board/detail.css">
<%--글번호 글제목 글내용 조회수 작성자이름 등록일시--%>

<div>
<%--    내가 쓴 글이면 버튼 나타나기--%>
    
    <c:if test="${sessionScope.loginUser.iuser == requestScope.data.writer}">
        <div><a href="/board/del?iboard=${requestScope.data.iboard}"><button>삭제</button></a> </div>
        <div><a href="/board/regmod?iboard=${requestScope.data.iboard}"><button>수정</button></a> </div>
    </c:if>

    <div> 글번호 : ${data.iboard}</div>
    <div> 글제목 : ${data.title}</div>
    <div> 글내용 : ${data.ctnt}</div>
    <div> 조회수 : ${data.hit}</div>
    <div> 내용 : ${data.writerNm}</div>
    <div> 작성일시 : ${data.rdt}</div>

</div>






