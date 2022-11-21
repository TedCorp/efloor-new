<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/layout/inc/taglib.jsp" %>


<!-- bootstrap datepicker -->
<link rel="stylesheet" href="${contextPath }/resources/adminlte/plugins/timepicker/bootstrap-timepicker.css">
<link rel="stylesheet" href="${contextPath }/resources/adminlte/plugins/timepicker/bootstrap-timepicker.min.css">

<!-- bootstrap datepicker -->
<script src="${contextPath }/resources/adminlte/plugins/timepicker/bootstrap-timepicker.js"></script>
<script src="${contextPath }/resources/adminlte/plugins/timepicker/bootstrap-timepicker.min.js"></script>

<c:set var="strActionUrl" value="${contextPath }/adm/orderDltMgr/" />
<c:set var="strMethod" value="post" />

<section class="content-header">
	<h1>
		주문삭제내역	
		<small>주문삭제내역 목록</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
		<li class="active">Here</li>
	</ol>
</section>

<section class="content">
	<!-- Horizontal Form -->			
			<!-- 주문 정보 시작 -->
			<div class="box box-info">
			<div class="box-header with-border">
				<h3 class="box-title">삭제주문정보</h3>
				<button type="button" class="btn btn-success btn-sm pull-right" id="btnExcel" style="margin-left:5px;">엑셀</button>
			</div>
			<!-- /.box-header -->	
				<!-- box-body -->
				<div class="box-body">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">주문번호</label>
						<div class="col-sm-4">${tb_odinfoxm.ORDER_NUM }</div>
						<label for="inputEmail3" class="col-sm-2 control-label">주문자</label>
						<div class="col-sm-4">${tb_odinfoxm.MEMB_NM }</div>						
					</div><br/>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">주문일자</label>
						<div class="col-sm-4">${tb_odinfoxm.ORDER_DATE }</div>
						<label for="inputEmail3" class="col-sm-2 control-label">배송비 결제 여부</label>
						<div class="col-sm-4">${tb_odinfoxm.DAP_YN }</div>
					</div><br/>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label"></label>
						<div class="col-sm-4"></div>
						<label for="inputEmail3" class="col-sm-2 control-label">쿠폰 사용 여부</label>
						<div class="col-sm-4">${tb_odinfoxm.CPON_YN }</div>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- 주문 정보 끝 -->
			
			<!-- 주문상품 정보 시작 -->
			<div class="box box-info">
			<div class="box-header with-border">
				<h3 class="box-title">주문 정보</h3>
			</div>
				<!-- /.box-header -->
				<div class="box-body">
					<c:set var="totalAmt" value="0"/>
					<table class="table table-bordered">
						<colgroup>
							<col style="with:10px" />
							<col />
							<col style="with:50px" />
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>상품명</th>
								<th style="width:14%">수량</th>
								<th>할인가격</th>
								<th>가격</th>
							</tr>
						</thead>
						<c:forEach items="${tb_odinfoxm.list }" var="list" varStatus="loop">
							<tr>
								<td>${loop.count }</td>
								<td>${list.PD_NAME } 
									<c:if test="${ list.PD_CUT_SEQ ne null }">(세절방식 : ${ list.PD_CUT_SEQ})</c:if>
									<c:if test="${ list.OPTION_CODE ne null }">(색상 : ${ list.OPTION_CODE})</c:if>
								</td>
								<td>${list.ORDER_QTY }</td>
								<td><fmt:formatNumber>${list.PDDC_VAL }</fmt:formatNumber></td>
								<td><fmt:formatNumber>${list.ORDER_AMT }</fmt:formatNumber></td>
								<c:set var= "totalAmt" value="${totalAmt + list.ORDER_AMT}"/>
							</tr>
						</c:forEach>
						<tr>
							<th colspan="4" style="text-align:right;">상품 합계 </th>
							<td colspan="4" style="text-align:right"> <fmt:formatNumber><c:out value="${totalAmt}"/></fmt:formatNumber> </td>
						</tr>
						<tr>
							<th colspan="4" style="text-align:right;">배송비 </th>
							<td colspan="4" style="text-align:right"> 
								<c:set var = "dlvyAmt" value="${tb_odinfoxm.DLVY_AMT }"/>								
								<fmt:formatNumber><c:out value="${dlvyAmt}"/></fmt:formatNumber>
							</td>
						</tr>
						<tr>
							<th colspan="4" style="text-align:right;">총 합계 </th>
							<td colspan="4" style="text-align:right"> <fmt:formatNumber><c:out value="${totalAmt + dlvyAmt}"/></fmt:formatNumber> </td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 주문상품 정보 끝 -->
			
		<spform:form name="orderFrm" id="orderFrm" method="${strMethod }" action="${strActionUrl }" class="form-horizontal">
			<input type="hidden" id="ORDER_NUM" name="ORDER_NUM" value="${tb_odinfoxm.ORDER_NUM }" /><!-- 주문번호 -->
			
			<!-- 배송지 정보 시작 -->
			<div class="box box-info">
			<div class="box-header with-border">
				<h3 class="box-title">배송지 정보</h3>
				<div class="pull-right">
					<jsp:include page="/common/comCodForm">
						<jsp:param name="COMM_CODE" value="DLAR_GUBN" />
						<jsp:param name="name" value="DLAR_GUBN" />
						<jsp:param name="value" value="${tb_oddlaixm.DLAR_GUBN }" />
						<jsp:param name="type" value="radio" />
						<jsp:param name="top" value="선택" />
					</jsp:include>
				</div>
			</div>
			<!-- /.box-header -->
	
				<!-- box-body -->
				<form class="form-horizontal">
				<div class="box-body">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">* 받으시는 분</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="RECV_PERS" name="RECV_PERS" value="${tb_oddlaixm.RECV_PERS }" required readonly maxlength="20"/>
						</div>
					</div><br/>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">* 주소</label>
						
						<div class="col-sm-9">
							<div class="form-group">
								<div class="col-sm-2">
									<input type="text" class="form-control" id="POST_NUM" name="POST_NUM" value="${tb_oddlaixm.POST_NUM }" required readonly maxlength="6"/>
								</div>
								<div class="col-sm-3">
									<input type="button" class="btn btn-block btn-warning btn-xs" value="우편번호검색" >
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<input type="text" class="form-control" id="BASC_ADDR" name="BASC_ADDR" value="${tb_oddlaixm.BASC_ADDR }" required readonly maxlength="100"/>
									<input type="text" class="form-control" id="DTL_ADDR" name="DTL_ADDR" value="${tb_oddlaixm.DTL_ADDR }" required readonly maxlength="100"/>
								</div>
							</div>
						</div>
						
					</div><br/>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">일반전화</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="RECV_TELN" name="RECV_TELN" value="${tb_oddlaixm.RECV_TELN }" required readonly/>
						</div>
						<label for="inputEmail3" class="col-sm-1 control-label">* 휴대전화</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="RECV_CPON" name="RECV_CPON" value="${tb_oddlaixm.RECV_CPON }" required readonly/>
						</div>
					</div><br/>
					<div class="form-group">					
						<input type="hidden" id="DLAR_DATE" name="DLAR_DATE" value="${tb_oddlaixm.DLAR_DATE }" /><!-- 출고일 -->
						<input type="hidden" id="DLAR_TIME" name="DLAR_TIME" value="${tb_oddlaixm.DLAR_TIME }" /><!-- 출고/배송 시간 -->
						
						 <c:if test = '${tb_oddlaixm.DLAR_GUBN=="DLAR_GUBN_05" }' >
							<label for="inputEmail3" class="col-sm-2 control-label">현장출고일시</label>
							<div class="col-sm-2">
								<div class="input-group bootstrap-datepicker datepicker col-sm-9" style="float: inherit;">		
									<input type="text" class="form-control pull-left" name="datepicker_dlar" id="datepicker_dlar" value="" readonly>
									<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
								</div>
							</div>
							<div class="col-sm-2" style="padding-left:0px;padding-right:0px;padding-top:4px;padding-buttom:4px;">
								<select id="DLAR_TIME_CHK_01" class="form-control input-sm" readonly>
									<option value="PM 1시~2시" <c:if test = '${tb_oddlaixm.DLAR_TIME =="PM 1시~2시" }'>selected="selected"</c:if>>PM 1시~2시</option>
									<option value="PM 2시~3시" <c:if test = '${tb_oddlaixm.DLAR_TIME =="PM 2시~3시" }'>selected="selected"</c:if>>PM 2시~3시</option>
									<option value="PM 3시~4시" <c:if test = '${tb_oddlaixm.DLAR_TIME =="PM 3시~4시" }'>selected="selected"</c:if>>PM 3시~4시</option>
									<option value="PM 4시~6시" <c:if test = '${tb_oddlaixm.DLAR_TIME =="PM 4시~6시" }'>selected="selected"</c:if>>PM 4시~6시</option>
					        	</select>
							</div>
						</c:if>
						 
						 <c:if test = '${tb_oddlaixm.DLAR_GUBN!="DLAR_GUBN_05" }' >
							<label for="inputEmail3" class="col-sm-2 control-label">* 배송일시</label>
							<div class="col-sm-2">
								<div class="input-group bootstrap-datepicker datepicker col-sm-9" style="float: inherit;">		
									<input type="text" class="form-control pull-left" name="datepicker_dlar" id="datepicker_dlar" value="" readonly>
									<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
								</div>
							</div>
							<div class="col-sm-2">
								<select name="DLAR_TIME_CHK_02" id="DLAR_TIME_CHK_02" class="form-control input-sm" readonly>
									<option value="nothing">선택</option>
									<option value="오전" <c:if test = '${tb_oddlaixm.DLAR_TIME =="오전" }'>selected="selected"</c:if>>오전</option>
									<option value="오후" <c:if test = '${tb_oddlaixm.DLAR_TIME =="오후" }'>selected="selected"</c:if>>오후</option>
									<option value="5시~6시" <c:if test = '${tb_oddlaixm.DLAR_TIME =="5시~6시" }'>selected="selected"</c:if>>5시~6시</option>
					        	</select>
							</div>
						</c:if>
						
					</div><br/>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">배송 메세지</label>
						<div class="col-sm-9">
							<textarea rows="5" class="form-control" id="DLVY_MSG" name="DLVY_MSG" required readonly>${tb_oddlaixm.DLVY_MSG }</textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">관리자 참조설명</label>
						<div class="col-sm-9">
							<textarea rows="5" class="form-control" id="ADM_REF" name="ADM_REF" readonly>${tb_oddlaixm.ADM_REF }</textarea>
							<h6 style="color:red">* 관리자 참조설명은 회원관리에서 변경할 수 있습니다.</h6>
						</div>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- 배송지 정보 끝 -->
			
			<!-- 주문 상태 및 결제 정보 시작 -->
			<div class="box box-info">
			<div class="box-header with-border">
				<h3 class="box-title">주문 상태 및 결제 정보</h3>
			</div>
			<!-- /.box-header -->
	
				<!-- box-body -->
				<form class="form-horizontal">
				<div class="box-body">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-1 control-label">주문상태</label>
						<div class="col-sm-2" readonly>
							<jsp:include page="/common/comCodForm">
								<jsp:param name="COMM_CODE" value="ORDER_CON" />
								<jsp:param name="name" value="ORDER_CON" />
								<jsp:param name="value" value="${tb_odinfoxm.ORDER_CON }" />
								<jsp:param name="type" value="select" />
								<jsp:param name="top" value="선택" />
							</jsp:include>
						</div>
						<div class="col-sm-2" readonly>
							<jsp:include page="/common/comCodForm">
								<jsp:param name="COMM_CODE" value="CNCL_CON" />
								<jsp:param name="name" value="CNCL_CON" />
								<jsp:param name="value" value="${tb_odinfoxm.CNCL_CON }" />
								<jsp:param name="type" value="select" />
								<jsp:param name="top" value="선택" />
							</jsp:include>
							<jsp:include page="/common/comCodForm">
								<jsp:param name="COMM_CODE" value="RFND_CON" />
								<jsp:param name="name" value="RFND_CON" />
								<jsp:param name="value" value="${tb_odinfoxm.RFND_CON }" />
								<jsp:param name="type" value="select" />
								<jsp:param name="top" value="선택" />
							</jsp:include>
						</div>
						<c:if test="${tb_odinfoxm.ORDER_CON eq 'ORDER_CON_04'}">
							<label for="inputEmail3" class="col-sm-1 control-label">취소사유</label>
							<div class="col-sm-3">
								${tb_odinfoxm.CNCL_MSG }
							</div>
						</c:if>
					</div><br/>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-1 control-label">결제 수단</label>
						<div class="col-sm-2" readonly><%-- ${tb_odinfoxm.PAY_METD_NM } --%>
							<jsp:include page="/common/comCodForm">
								<jsp:param name="COMM_CODE" value="PAY_METD" />
								<jsp:param name="name" value="PAY_METD" />
								<jsp:param name="value" value="${tb_odinfoxm.PAY_METD }" />
								<jsp:param name="type" value="select" />
								<jsp:param name="top" value="선택" />
							</jsp:include>
						</div>
						<label for="inputEmail3" class="col-sm-1 control-label">결제 일시</label>
						<input type="hidden" name="PAY_DTM" id="PAY_DTM" value="${tb_odinfoxm.PAY_DTM }"/>
						<div class="col-sm-2">
							<div class="input-group bootstrap-datepicker datepicker col-sm-10" style="float: inherit;">		
								<input type="text" class="form-control pull-left" name="datepicker" id="datepicker" value="" readonly>
								<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
							</div>
						</div>
						<div class="col-sm-2" style="padding-left:0px;padding-right:0px;padding-top:4px;padding-buttom:4px;">
							<div class="input-group bootstrap-timepicker timepicker col-sm-10" style="float: inherit;">		
								<input type="text" class="form-control pull-left" name="timepicker" id="timepicker" value="" readonly>
								<span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
					        </div>	
						</div>
						<label for="inputEmail3" class="col-sm-1 control-label">결제 상태</label>
						<div class="col-sm-3">
						</div>
					</div><br/>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-1 control-label">배송 정보</label>
						<div class="col-sm-2" readonly>
							<jsp:include page="/common/comCodForm">
								<jsp:param name="COMM_CODE" value="DLVY_COM" />
								<jsp:param name="name" value="DLVY_COM" />
								<jsp:param name="value" value="${tb_odinfoxm.DLVY_COM }" />
								<jsp:param name="type" value="select" />
								<jsp:param name="top" value="선택" />
							</jsp:include>
						</div>
						<label for="inputEmail3" class="col-sm-1 control-label">운송장번호</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="DLVY_TDN" name="DLVY_TDN" value="${tb_odinfoxm.DLVY_TDN }" readonly />
						</div>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<input type="hidden" name="PAY_AMT"/>
			<!-- 주문 상태 및 결제 정보 끝 -->
			</spform:form>
			
			<div class="box-footer">
				<a href="${contextPath}/adm/orderBakMgr" class="btn btn-default pull-right"><i class="fa fa-list"></i> 목록</a>
				<!-- <a onclick="javascript:fn_save();" class="btn btn-primary pull-right" style="margin-right: 5px;"><i class="fa fa-save"></i> 저장</a> -->
			</div>
			<!-- /.box-footer -->	
	<!-- /.box -->
</section>
 
<script type="text/javascript">
$(document).ready(function() {
	fn_disabled();
	
	$("#ORDER_CON").change(function(e) {
		fn_disabled();
	});
	
	//Date picker
	$('#datepicker_dlar').datepicker({
		autoclose: true,
		format: 'yyyy-mm-dd'
	}); 
	$('#datepicker').datepicker({
		autoclose: true,
		format: 'yyyy-mm-dd'
	}); 
	$('#timepicker').timepicker({
		timeFormat : "H:i:s"
	});
	
	//현장출고일시/배송일시 표시
	var dlar_date = ${tb_oddlaixm.DLAR_DATE}+"";
    
	if(dlar_date!=""&&dlar_date!=null){
		$('#datepicker_dlar').datepicker("setDate"
				,new Date(dlar_date.substr(0,4),dlar_date.substr(4,2)-1,dlar_date.substr(6,2)));
	}
	 	
	//결제일시 표시
	var dtmToString = $('#PAY_DTM').val();

	dtmToString = dtmToString.split("-").join("")
	dtmToString = dtmToString.split(":").join("");
	dtmToString = dtmToString.split(" ").join("");
	dtmToString = dtmToString.substring(0,14);
	
	var hour = dtmToString.substring(8,10);
	var minute = dtmToString.substring(10,12);
    var whatTm ="";
    
    if(hour>12){
    	hour = hour-12;
    	whatTm = "PM";
	}else if(hour==12){
		whatTm = "PM";
	}else if (hour == 0){
		whatTm = "AM";
	}else{
		whatTm = "AM";
	}
	if(dtmToString=="" || hour == "" || minute =="" ){
		$('#datepicker').val("");
		$('#timepicker').val("");
	}else {
		$('#datepicker').datepicker("setDate"
				,new Date(dtmToString.substring(0,4),dtmToString.substring(4,6)-1,dtmToString.substring(6,8)));
		$('#timepicker').val(hour+":"+minute+" "+whatTm);
	}
});

//엑셀
$("#btnExcel").click(function() {	
	var form = document.createElement("form");

	form.target = "_blank";
	form.method = "get";
	form.action = "${contextPath }/adm/orderBakMgr/detailExcelDown";

	document.body.appendChild(form);

	var input_id = document.createElement("input");
	input_id.setAttribute("type", "hidden");
	input_id.setAttribute("name", "ORDER_NUM");
	input_id.setAttribute("value", "${tb_odinfoxm.ORDER_NUM }");

	form.appendChild(input_id);
	form.submit();    
});

function fn_disabled(){
	//주문 취소시
	if($("#ORDER_CON").val()=="ORDER_CON_04"){
		$("#CNCL_CON").show();
		$("#RFND_CON").hide();
		$("#RFND_CON").val("");
		$("#CNCL_CON").val("CNCL_CON_01");
		// $("#CNCL_CON option:eq(1)").attr("selected", "selected");
		// $("#CNCL_CON option:eq(1)").prop("selected", true);
	//환불시
	}else if($("#ORDER_CON").val()=="ORDER_CON_07"){
		$("#CNCL_CON").hide();
		$("#CNCL_CON").val("");
		$("#RFND_CON").show();
	}else{
		$("#CNCL_CON").val("");
		$("#RFND_CON").val("");
		$("#CNCL_CON").hide();
		$("#RFND_CON").hide();
	}
}
</script>