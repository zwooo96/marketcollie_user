<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-top: 100px; margin-bottom: 20px; display: flex; justify-content: center; flex-direction: column; align-items: center">
<div style="width: 70%; font-weight: bold; font-size: 20pt; ">
<hr>
상품문의
</div>

<div style="width: 70%; margin-top: 20px; color: #bebebe; font-size: 9pt; ">
상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.<br/>
배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 1:1문의에 남겨주세요.
</div>

</div>

<div class="itemQnaDiv">
	 <table class="tab">
	  <thead>
		<tr class="titleTab">
			<th class="tabTh" style="width: 50px">번호</th>
			<th class="tabTh">제목</th>
			<th class="tabTh" style="width: 100px">답변유무</th>
			<th class="tabTh" style="width: 150px">아이디</th>
			<th class="tabTh" style="width: 150px">작성일</th>
		</tr>
	 </thead>
	<tbody>
		<c:if test="${ empty qna_list }">
		<tr>
		<td colspan="5">문의 내역이 없습니다.</td>
		</tr>
		</c:if>
		<c:forEach var="item_qna" items="${ qna_list }">
			<tr id="itemQnaTr${ item_qna.item_qna_num }" class="tableContent" onclick="qnaToggle(${ item_qna.item_qna_num })">
				<td class="tabTd"><c:out value="${ item_qna.idx }"/>
				<td class="tabTd"><c:out value="${ item_qna.item_qna_subject }"/></td>
				<td class="tabTd"><c:out value="${ item_qna.item_qna_flag }"/></td>
				<td class="tabTd"><c:out value="${ item_qna.id }"/></td>
				<td class="tabTd"><c:out value="${ item_qna.input_date }"/></td>
			</tr>
		</c:forEach>
	 </tbody>
	</table>
</div>


<div>

<div id="pagination">
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	    <li class="page-item ${paging.pre_page eq '0' ? 'disabled':'active'}">
		 	<a class="page-link" onclick="movePage('${paging.field_name}','${paging.field_value}', ${paging.next_page});" aria-label="Previous">
	        	<span aria-hidden="true">&laquo;</span>
	      	</a>
	    </li>
	    <c:forEach begin="${paging.start_page}" end="${paging.end_page}" step="1" var="cnt" >
		    <li class="page-item">
		    	<a class="page-link" onclick="movePage('${paging.field_name}','${paging.field_value}',${cnt});">
		    		<c:out value="${cnt}" />
		    	</a>
		    </li>
	    </c:forEach>
	    <li class="page-item ${paging.current_page eq paging.end_page ? 'disabled':'active'}">
	      <a class="page-link"  onclick="movePage('${paging.field_name}','${paging.field_value}', ${paging.next_page});" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
</div>

</div>