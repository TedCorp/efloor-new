<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/layout/inc/taglib.jsp"%>

<!-- ▼ Key -->
<%@ include file="/layout/inc/mallKey.jsp"%>
<!-- ▲ Key -->
<head>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/resources2/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/resources2/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/resources2/css/211021.css">
<script type="text/javascript"
	src="${contextPath}/resources/resources2/js/jquery-ui.1.12.1.js"></script>
<script type="text/javascript"
	src="${contextPath}/resources/resources2/js/common.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://js.tosspayments.com/v1"></script>

<style type="text/css">
#daum_juso_rayerPOST_NUM {
	width: 500px !important;
	margin-left: -250px !important;
	border: 2px solid !important;
}
</style>
</head>




<!-- //Main Container -->
<div class="wrapper">
	<div class="container">
		<form method="post" name="fregisterform" id="fregisterform"
			action="${contextPath }/m/order/insert">
			<!-- 기존소스 -->
			<input type="hidden" id="ORDER_NUM" name="ORDER_NUM"
				value="${orderNum }" />


			<c:set var="devy_amt" value="0" />
			<c:if test="${ tot_amt < supplierInfo.DLVA_FCON }">
				<c:set var="devy_amt" value="${supplierInfo.DLVY_AMT }" />
			</c:if>
			<c:if test="${ tot_amt >= supplierInfo.DLVA_FCON }">
				<c:set var="devy_amt" value="0" />
			</c:if>
			<input type="hidden" id="DAP_YN" name="DAP_YN" value="Y" />
			<!-- 모두 선불로 통일 20180516 -->
			<fmt:parseNumber var="pv_amt" value="${ pv_round * 10 }"
				integerOnly="true" />
			<div class="text-right" style="display: none" id="tdPvAmt">${ pv_amt }</div>

			<!-- 기존소스 -->
			<div class="page-mycart">
				<div class="titbox">
					<div class="tit" >
						<span>결제가 취소 되었습니다</span>
					</div>
				</div>
					
				<div>
					<span style="font-size: 18px; font-weight : bold;">원인 : 현재 지원되지 않는 결제 수단입니다.</span>
					<%-- <span style="font-size: 18px; font-weight : bold;">원인 : ${message }</span> --%>
				</div>
				<br>
				<div>
					<a href="javascript:history.go(-1)" style="font-size: 20px;">다시 주문하러 가기</a>
				</div>
				
			</div>
		</form>
	</div>
</div>

<script>
	
	
   
    
</script>
