<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>

<table>
<tr>
<td>번호</td>
<td>제목</td>
<td>답변 여부</td>
<td>아이디</td>
<td>문의 날짜</td>
</tr>
<c:if test="${ empty qna_list }">
<tr>
<td colspan="5">문의 내역이 없습니다.</td>
</tr>
</c:if>
<c:forEach var="i" begin="1" end="${ qna_list.size() }" step="1">

<tr id="itemQnaTr${ qna_list[i-1].item_qna_num }">
<td>${ i }</td>
<td>${ qna_list[i-1].item_qna_subject }</td>
<td>${ qna_list[i-1].item_qna_flag }</td>
<td>${ qna_list[i-1].id }</td>
<td>${ qna_list[i-1].input_date }</td>
</tr>

</c:forEach>
</table>

</div>