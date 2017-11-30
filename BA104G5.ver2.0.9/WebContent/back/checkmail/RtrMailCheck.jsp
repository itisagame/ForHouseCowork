<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.realtor.model.*"%>

<%
	RealtorService realtorSvc = new RealtorService();
	List<RealtorVO> list = realtorSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>

<!-- 後端include -->
<jsp:include page="/back/backend/backend_page.jsp" flush="true" />
<!-- 後端include -->

<!-- 一定要留住的<div> ================================================================================== -->
<div class="col-xs-12 col-sm-10 maincontext">
	<!-- 一定要留住的<div> ================================================================================== -->

	<!-- 以下是你可以放的內容 ================================================================================== -->

	<div class="container cooper_house">
		<div class="row">
			<div class="col-xs-12 col-sm-12 table_bgcolor">
				<table class="table table-hover table_main">
					<caption class="title_pr">
						審核房仲註冊<a href='#house_jump' data-toggle="modal"
							class="btn btn_cooper modal_jump cooper_ann_href"> 暫放 </a>
					</caption>
					<thead>
						<tr class="col_title">
							<th>房仲編號</th>
							<th>房仲姓名</th>
							<th>房仲ID</th>
							<th>房仲狀態</th>
							<th colspan="2">修改房仲狀態</th>

						</tr>
					</thead>
					<tbody>
						<%@ include file="page_checkmail/page1.file"%>
						<c:forEach var="realtorVO" items="${list}" begin="<%=pageIndex%>"
							end="<%=pageIndex+rowsPerPage-1%>">
							<tr class="col_name" align='center' valign='middle'
								${(realtorVO.rtr_no==param.rtr_no) ? 'bgcolor=#CCCCFF':''}>
								<!--將修改的那一筆加入對比色而已-->
								<td>${realtorVO.rtr_no}</td>
								<td>${realtorVO.rtr_name}</td>
								<td>${realtorVO.rtr_id}</td>
								<td>${realtorVO.rtr_state}</td>

								<td>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/back/checkmail/checkmail.do"
										style="margin-bottom: 0px;">
										<input type="submit" class="btn btn_cooper cooper_ann_href"
											value="通過"> <input type="hidden" name="rtr_no"
											value="${realtorVO.rtr_no}"> <input type="hidden"
											name="rtr_id" value="${realtorVO.rtr_id}"> <input
											type="hidden" name="rtr_name" value="${realtorVO.rtr_name}">
										<input type="hidden" name="requestURL"
											value="<%=request.getServletPath()%>">
										<!--送出本網頁的路徑給Controller-->
										<input type="hidden" name="whichPage" value="<%=whichPage%>">
										<!--送出當前是第幾頁給Controller-->
										<input type="hidden" name="action" value="onRtr">
									</FORM>
								</td>
								<td>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/back/checkmail/checkmail.do"
										style="margin-bottom: 0px;">
										<input type="submit" class="btn btn_cooper cooper_ann_href"
											value="停權"> <input type="hidden" name="rtr_no"
											value="${realtorVO.rtr_no}"> <input type="hidden"
											name="rtr_id" value="${realtorVO.rtr_id}"> <input
											type="hidden" name="rtr_name" value="${realtorVO.rtr_name}">
										<input type="hidden" name="requestURL"
											value="<%=request.getServletPath()%>">
										<!--送出本網頁的路徑給Controller-->
										<input type="hidden" name="whichPage" value="<%=whichPage%>">
										<!--送出當前是第幾頁給Controller-->
										<input type="hidden" name="action" value="offRtr">
									</FORM>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%@include file="page_checkmail/page2.file"%>
			</div>
		</div>
	</div>
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<!-- 以上是你可以放的內容 ================================================================================== -->

	<!-- 一定要留住的</div> ================================================================================== -->
</div>
<!-- 一定要留住的</div> ================================================================================== -->