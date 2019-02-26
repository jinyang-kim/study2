﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>study</title>
<%-- <link rel="stylesheet" href="<%=cp%>/resources/common.css" type="text/css"/> --%>
<style type="text/css">
*{
    margin: 0; padding: 0;
}
body {
    font-size: 13px; font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
a{
    color: #000000;
    text-decoration: none;
    cursor: pointer;
}
a:active, a:hover {
    text-decoration: underline;
    color: tomato;
}
.title {
    font-weight: bold;
    font-size:15px;
    margin-bottom:10px;
    font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
.btn {
    color:#333;
    font-weight:500;
    font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    border:1px solid #cccccc;
    background-color:#fff;
    text-align:center;
    cursor:cursor;
    padding:3px 10px 5px;
    border-radius:4px;
}
.btn:active, .btn:focus, .btn:hover {
    background-color:#e6e6e6;
    border-color: #adadad;
    color: #333;
}
.boxTF {
    border:1px solid #999999;
    padding:3px 5px 5px;
    border-radius:4px;
    background-color:#ffffff;
    font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
.selectField {
    border:1px solid #999999;
    padding:2px 5px 4px;
    border-radius:4px;
    font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
</style>
<script type="text/javascript">
	function deleteBoard() {
		if(confirm("게시글을 삭제하시겠습니까?")) {
			var url = "<%=cp%>/sbbs/delete.do?num=${dto.num}&page=${page}";
			location.href = url;
		}
	}
</script>
</head>

<body>

<table style="width: 600px; margin: 30px auto 0px; border-spacing: 0px;">
<tr height="40"> 
	<td align="left" class="title">
		<h3><span>|</span> 게시판</h3>
	</td>
</tr>
</table>

<table style="width: 600px; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
    <td colspan="2" align="center">
	   ${dto.subject}
    </td>
</tr>

<tr height="35" style="border-bottom: 1px solid #cccccc;">
    <td width="50%" align="left" style="padding-left: 5px;">
       이름 : ${dto.name }
    </td>
    <td width="50%" align="right" style="padding-right: 5px;">
        ${dto.created } | 조회 ${dto.hitCount}
    </td>
</tr>

<tr style="border-bottom: 1px solid #cccccc;">
  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
      ${dto.content}
   </td>
</tr>

<tr height="35" style="border-bottom: 1px solid #cccccc;">
    <td colspan="2" align="left" style="padding-left: 5px;">
       이전글 : 
   <c:if test="${not empty preReadDto}">
   	<a href="<%=cp%>/sbbs/article.do?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
   </c:if>
    </td>
</tr>

<tr height="35" style="border-bottom: 1px solid #cccccc;">
    <td colspan="2" align="left" style="padding-left: 5px;">
    다음글 :
    <c:if test="${not empty nextReadDto}">
   	<a href="<%=cp%>/sbbs/article.do?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
   </c:if>
    </td>
</tr>

<tr height="35" style="border-bottom: 1px solid #cccccc;">
    <td colspan="2" align="right">
    From : ${dto.ipAddr}
    </td>
</tr>
</table>

<table style="width: 600px; margin: 0px auto 20px; border-spacing: 0px;">
<tr height="45">
    <td width="300" align="left">
        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/sbbs/update.do?num=${dto.num}&page=${page}'">수정</button>
        <button type="button" class="btn" onclick="deleteBoard()">삭제</button>
    </td>

    <td align="right">
        <button type="button" class="btn" onclick="javascirpt:location.href='<%=cp%>/sbbs/list.do?${query}'">리스트</button>
    </td>
</tr>
</table>

</body>
</html>
