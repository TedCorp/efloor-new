<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/layout/inc/taglib.jsp" %>

<!-- 매출 조회 -->
<%@ include file="TaxInvoiceCheck_Common.jsp" %>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.popbill.api.IssueResponse"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.taxinvoice.MgtKeyType"%>
<%@page import="com.popbill.api.taxinvoice.TISearchResult"%>
<%@page import="com.popbill.api.taxinvoice.Taxinvoice"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceDetail"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceAddContact"%>


<%

	String datepickerStr = (String)request.getAttribute("datepickerStr");
	String datepickerEnd = (String)request.getAttribute("datepickerEnd");
	String schTxt = (String)request.getAttribute("schTxt");
	String PAY_GUBN = (String)request.getAttribute("PAY_GUBN");
	String payType = (String)request.getAttribute("payType");
	String pageNumber = (String)request.getAttribute("pageNumber");
	
	String CorpNum = "1234567890";
	MgtKeyType KeyType;
	String MgtKeyTypeCheck = "";
	if(payType.equals("Sales")){
		KeyType = MgtKeyType.SELL;
		MgtKeyTypeCheck = "SELL";
	} else {
		KeyType = MgtKeyType.BUY;
		MgtKeyTypeCheck = "BUY";
	}
	String DType = PAY_GUBN;
	String SDate = datepickerStr.replaceAll("-", "");
	String EDate = datepickerEnd.replaceAll("-", "");
	String[ ] State = null;
	String[ ] Type = null;
	String[ ] TaxType = null;
	String[ ] IssueType = null;
	Boolean LateOnly = null;
	String TaxRegIDType = null;
	String TaxRegID = null;
	String TaxRegIDYN = null;
	String QString = schTxt;
	int Page = Integer.parseInt(pageNumber);
	int Page2 = 1;
	int PerPage = 10;
	int PerPage2 = 700;
	String Order = "D";
	String InterOPYN = null;
	String[ ] RegType = null;
	String[ ] CloseDownState = null;
	String MgtKey = null;
	
	TISearchResult tisearchresult = null;
	TISearchResult tisearchresult2 = null;
	
	try {
		tisearchresult = taxinvoiceService.Search(CorpNum,KeyType,DType,SDate,EDate,State,Type,TaxType,IssueType,LateOnly,TaxRegIDType,TaxRegID,TaxRegIDYN,QString,Page,PerPage,Order,InterOPYN,RegType,CloseDownState,MgtKey);
		tisearchresult2 = taxinvoiceService.Search(CorpNum,KeyType,DType,SDate,EDate,State,Type,TaxType,IssueType,LateOnly,TaxRegIDType,TaxRegID,TaxRegIDYN,QString,Page2,PerPage2,Order,InterOPYN,RegType,CloseDownState,MgtKey);
    } catch (PopbillException pe) {
        // 예외 발생 시, pe.getCode() 로 오류 코드를 확인하고, pe.getMessage()로 오류 메시지를 확인합니다.
        System.out.println("오류 코드 " + pe.getCode());
        System.out.println("오류 메시지 " + pe.getMessage());
    }
	
	int maxSupplyCostTotal = 0;
	int maxTaxTotal = 0;
	int maxTotal = 0;
	
	for(int i = 0 ; i < tisearchresult2.getList().size() ; i++){
		maxSupplyCostTotal = maxSupplyCostTotal + Integer.parseInt(tisearchresult2.getList().get(i).getSupplyCostTotal());
		maxTaxTotal = maxTaxTotal + Integer.parseInt(tisearchresult2.getList().get(i).getTaxTotal());
	}
	maxTotal = maxSupplyCostTotal + maxTaxTotal;
	
	
	//날짜 포멧
    SimpleDateFormat fDate1 = new SimpleDateFormat("yyyyMMdd"); //같은 형식으로 맞춰줌
    SimpleDateFormat fDate2 = new SimpleDateFormat("yyyyMMddHHmmss"); //같은 형식으로 맞춰줌
    SimpleDateFormat fDate3 = new SimpleDateFormat("yyyy.MM.dd"); //같은 형식으로 맞춰줌
    
    int pageCount = Integer.parseInt(tisearchresult.getPageCount());
    int pageNumNum = Integer.parseInt(tisearchresult.getPageNum());
    
    int pageNumNumone = (pageNumNum/10);
    int pageNumNumone2 = (pageNumNum/10)+1;
    if(pageNumNumone == 0){
    	pageNumNumone = 1;
    }else {
    	pageNumNumone = (pageNumNumone*10)+1;
    }
    
%>
<style>
.content .box .paging_new{margin-top:30px}
.content .box .paging_new ul{display:flex;flex-direction:row;justify-content:center;align-items:center}
.content .box .paging_new li{width:30px;height:30px;}
.content .box .paging_new li a{display:block;width:30px;line-height:30px;font-size:14px;font-weight:500;color:#333;text-align:center;}
.content .box .paging_new li i{display:block;width:30px;height:30px}
.content .box .paging_new li.on a{background:#111;color:#fff;}
.content .box .paging_new li.start .ic{background:url("${contextPath}/resources/resources2/images/icon_page_start.png") no-repeat 50% 50%}
.content .box .paging_new li.end .ic{background:url("${contextPath}/resources/resources2/images/icon_page_end.png") no-repeat 50% 50%}
.content .box .paging_new li.prev .ic{background:url("${contextPath}/resources/resources2/images/icon_page_prev.png") no-repeat 50% 50%}
.content .box .paging_new li.next .ic{background:url("${contextPath}/resources/resources2/images/icon_page_next.png") no-repeat 50% 50%}

table.table>thead>tr>th {
    text-align: center;
    vertical-align: middle;
}
.tablesettingkey{
	width:5%; 
	text-align: center;
}
.tablesettingvalue{
	width:20%; 
	text-align: center;
}
/* 버튼 이미지 */
.rounded {
 	border-radius: 10px;
}
.gray {
	background: #eee;}
.btn-two {
	color: white; 
	margin: 0px 0px 0px 3px;
	padding: 2px 10px;
	display: inline-block;
	border: 1px solid rgba(0,0,0,0.21);
	border-bottom-color: rgba(0,0,0,0.34);
	text-shadow:0 1px 0 rgba(0,0,0,0.15);
}
.changeColor {      
	background-color: #fbfbfb;
}
#my_modal {
	display: none;
	width: 40%;
	height : 50%;
	padding: 20px 80px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}
</style>


<c:set var="strActionUrl" value="${contextPath }/adm/memberSalCntMgr" />
<c:set var="strMethod" value="get" />

<head></head>

<!-- 최상단 -->
<section class="content-header">
	<!-- <h5>
		<strong>매출관리&nbsp;>&nbsp;매출 조회</strong>
	</h5> -->
	<h1>
		매입 / 매출 관리
		<small>매입 / 매출 조회</small>
	</h1>
</section>

<section class="content">
	<!-- 검색 박스 -->
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">검색 조건</h3>

			<div class="box-tools pull-right">
				<button type="button" class="btn btn-box-tool" data-widget="collapse">
					<i class="fa fa-minus"></i>
				</button>
				<button type="button" class="btn btn-box-tool" data-widget="remove">
					<i class="fa fa-remove"></i>
				</button>
			</div>
		</div>
		<!-- /.box-header -->
		
		<div class="box-body">
			<spform:form class="form-horizontal" name="memberSalCntMgrForm" id="memberSalCntMgrForm" method="GET" action="">
				<div class="box-body">
					<div class="form-group">
						<label for="datepickerStr" class="col-sm-1 control-label">구분</label>
						<div class="col-sm-1">
							<select name="PAY_GUBN" class="form-control select2">
								<option value="I" <%if(PAY_GUBN.equals("I")){%> selected <%} %>>발행일자</option>
								<option value="W" <%if(PAY_GUBN.equals("W")){%> selected <%} %>>작성일자</option>
							</select>
						</div>
						<div class="col-sm-1">
							<div class="input-group bootstrap-datepicker datepicker" style = "margin: 5px 0 0 0;">
								<input type="radio" name = "payType" value = "Sales" <%if(payType.equals("Sales")){%> checked <%} %>>매출
								&nbsp;
								<input type="radio" name = "payType" value = "buy" <%if(payType.equals("buy")){%> checked <%} %>>매입
							</div>
						</div>
					</div>
					<div class="form-group">						
						<label for="datepickerStr" class="col-sm-1 control-label">날짜</label>
						<div class="col-sm-2">
							<div class="input-group bootstrap-datepicker datepicker">
								<input type="text" class="form-control pull-left" name="datepickerStr" id="datepickerStr" value="${datepickerStr }" readonly="readonly">
								<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
								
							</div>
						</div>
						<div class="col-sm-2">
							<div class="input-group bootstrap-datepicker datepicker">
								<input type="text" class="form-control pull-left" name="datepickerEnd" id="datepickerEnd" value="${datepickerEnd }" readonly="readonly">
								<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
							</div>
						</div>
						<div class="col-sm-5">
							<div class="input-group bootstrap-datepicker datepicker" style="width: 100%">
								<span>
									<a href="#" class="btn-two rounded" style="color: black; width: 10%; text-align: center; padding: 8px 0px;" onclick="bungi(1)">1분기</a>
									<a href="#" class="btn-two rounded" style="color: black; width: 10%; text-align: center; padding: 8px 0px;" onclick="bungi(2)">2분기</a>
									<a href="#" class="btn-two rounded" style="color: black; width: 10%; text-align: center; padding: 8px 0px;" onclick="bungi(3)">3분기</a>
									<a href="#" class="btn-two rounded" style="color: black; width: 10%; text-align: center; padding: 8px 0px;" onclick="bungi(4)">4분기</a>
									<a href="#" class="btn-two gray rounded" style="color: black; padding: 8px 0px; width: 10%; text-align: center;" onclick="firsthalfyear()">상반기</a>
									<a href="#" class="btn-two gray rounded" style="color: black; padding: 8px 0px; width: 10%; text-align: center;" onclick="secondhalfyear()">하반기</a>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group">						
						<label for="MEMB_GUBN" class="col-sm-1 control-label">거래처</label>
						
						<div class="col-sm-3">
							<div class="input-group">
								<input type="search" class="form-control" name="schTxt" placeholder="거래처명 또는 사업자등록번호" value="${param.schTxt }">
								<span class="input-group-btn">
									<button type="submit" class="btn btn-success pull-right">검색</button>
								</span>
							</div>
						</div>
					</div>
					<div class="box-header with-border">
						<h3 class="box-title"></h3>
						<div class="box-tools">
							<span><strong>검색결과[ <span style="color:red;"><fmt:formatNumber value="<%=tisearchresult.getTotal() %>"/></span> 건 ]</strong></span>
							&ensp;<button type="button" class="btn btn-sm btn-success pull-right" id="btnExcel">엑셀</button>
						</div>
					</div>
				</div>
				<input type="hidden" id = "pageNumber" name = "pageNumber">
			</spform:form>
		</div>
		<!-- /.box-body -->
	</div>
	<!-- 검색 박스 -->
	
	<!-- 정렬 박스 -->
	<div class="box box-default">
		<div class="box-body">
			<div class="box-body">
				<div class="form-group">
					<!-- <label class="col-sm-1 control-label">▷Summary</label><br><br> -->
					<div class="col-sm-12">
						<table style="width:100%;">
							<tr>
								<th class="tablesettingkey">건수</th> <th class="tablesettingvalue"><span style="color:red;"><fmt:formatNumber value="<%=tisearchresult.getTotal() %>"/></span>&ensp;건</th>
								<th class="tablesettingkey">공급가액</th> <th class="tablesettingvalue"><span style="color:red;"><fmt:formatNumber value="<%=maxSupplyCostTotal %>"/></span>&ensp;원</th>
								<th class="tablesettingkey">세액</th> <th class="tablesettingvalue"><span style="color:red;"><fmt:formatNumber value="<%=maxTaxTotal %>"/></span>&ensp;원</th>
								<th class="tablesettingkey">합계</th> <th class="tablesettingvalue"><span style="color:red;"><fmt:formatNumber value="<%=maxTotal %>"/></span>&ensp;원</th>
							</tr>
						</table>
					</div>				
				</div>
			</div>
		</div>
	</div>
	<!-- /.정렬 박스 -->
	
	<div class="box">
		
		<!-- /.box-header -->
		<div class="box-body">
			<div class="box-body" style="white-space:nowrap;overflow-x:scroll;">
				<table class="table table-bordered" style="background-color: #ededed;">
					<colgroup>
						<col width="2%" />
						<col width="3%"/>
						<col width="8%"/>
						<col width="8%"/>
						<col width="8%"/>
						<col width="8%"/>
						<!-- <col width="8%"/> -->
						<col width="3%"/>
						<col width="8%"/>
						<col width="8%"/>
						<col width="8%"/>
					</colgroup>
					<thead>
						<tr>
							<th>No</th>
							<th>구분</th>
							<th>작성일자</th>
							<th>발행일자</th>
							<th>전송일자</th>
							<th>거래처</th>
							<!-- <th>상태코드</th> -->
							<!-- <th>등록번호</th> -->
							<th>과세형태</th>
							<th>공급가액</th>
							<th>세액</th>
							<th>합계</th>
						</tr>
					</thead>
					<tbody style="background-color: white; text-align: center;">
						<%for(int i = 0 ; i < tisearchresult.getList().size() ; i++){ %>
							<tr onclick = "onDetail('<%=MgtKeyTypeCheck%>','<%=tisearchresult.getList().get(i).getInvoicerMgtKey()%>')">
								<td><%=(Integer.parseInt(tisearchresult.getPageNum())*10)-9+i %></td>
								<td style = "text-align-last: center;">
									<%if(payType.equals("Sales")){%>
										매출
									<%} else { %>
										매입
									<%} %>
								</td>
								<td style = "text-align-last: center;">
									<%if(tisearchresult.getList().get(i).getWriteDate() == null){%>
										대기중
									<%} else { %>
										<%=fDate3.format(fDate1.parse(tisearchresult.getList().get(i).getWriteDate())) %>
									<%}%>
								</td>
								<td style = "text-align-last: center;">
									<%if(tisearchresult.getList().get(i).getIssueDT() == null){%>
										대기중
									<%} else { %>
										<%=fDate3.format(fDate2.parse(tisearchresult.getList().get(i).getIssueDT())) %>
									<%}%>
								</td>
								<td style = "text-align-last: center;">
									<%if(tisearchresult.getList().get(i).getNTSSendDT() == null){%>
										대기중
									<%} else { %>
										<%=fDate3.format(fDate2.parse(tisearchresult.getList().get(i).getNTSSendDT())) %>
									<%}%>
								</td>
								<td style = "text-align-last: start;"><%=tisearchresult.getList().get(i).getInvoiceeCorpName() %></td>
								<%-- <td style = "text-align-last: start;"><%=tisearchresult.getList().get(i).getStateCode() %></td> 상태코드--%>
								<%-- <td style = "text-align-last: start;"><%=tisearchresult.getList().get(i).getInvoicerMgtKey() %></td> --%>
								<td style = "text-align-last: center;"><%=tisearchresult.getList().get(i).getTaxType() %></td>
								<td style = "text-align-last: end;"><fmt:formatNumber value="<%=tisearchresult.getList().get(i).getSupplyCostTotal() %>"/></td>
								<td style = "text-align-last: end;"><fmt:formatNumber value="<%=tisearchresult.getList().get(i).getTaxTotal() %>"/></td>
								<td style = "text-align-last: end;"><fmt:formatNumber value="<%=Integer.parseInt(tisearchresult.getList().get(i).getSupplyCostTotal()) + Integer.parseInt(tisearchresult.getList().get(i).getTaxTotal()) %>"/></td>
							</tr>
						<%} %>
					</tbody>
				</table>
				<div style=" text-align: center; ">
				<%if(1 < Integer.parseInt(tisearchresult.getPageCount())){%>
					<span onclick="pageAjax(1)"><<</span>&emsp;
				<% }
				if(1 < Integer.parseInt(tisearchresult.getPageNum())){%>
					<span onclick="pageAjax(<%=(Integer.parseInt(tisearchresult.getPageNum())-1)%>)"><</span>&emsp;
				<% } %>
				<%-- <%for(int i = 1 ; i <= Integer.parseInt(tisearchresult.getPageCount()) ; i++ ){ %>
					<%if(i == Integer.parseInt(tisearchresult.getPageNum())){%>
						<span style="color: #3498ff;"><b><%=i %></b></span>&emsp;
					<%} else {%>
						<span onclick="pageAjax(<%=i %>)"><b><%=i %></b></span>&emsp;
					<%} %>
				<% } %> --%>
				<%for(int i = pageNumNumone ; i <= pageNumNumone+9 ; i++ ){ 
					if((int)i == ((int)Integer.parseInt(tisearchresult.getPageCount())+1)){
						break;
					}
				%>
					<%if(i == Integer.parseInt(tisearchresult.getPageNum())){%>
						<span style="color: #3498ff;"><b><%=i %></b></span>&emsp;
					<%} else {%>
						<span onclick="pageAjax(<%=i %>)"><b><%=i %></b></span>&emsp;
					<%} %>
				<% } %>
				<%if(!tisearchresult.getPageCount().equals(tisearchresult.getPageNum())){%>
					<span onclick="pageAjax(<%=(Integer.parseInt(tisearchresult.getPageNum())+1)%>)">></span>&emsp;
				<% } %>
				<%if(1 < Integer.parseInt(tisearchresult.getPageCount())){%>
					<span onclick="pageAjax(<%=tisearchresult.getPageCount()%>)">>></span>
				<%} %>
				</div>
			</div>
		</div>
	</div>
</section>

<form id="excelFrm" method="get" action="${contextPath }/adm/memberSalCntMgr/excelDown"></form>

<script type="text/javascript">
$(document).ready(function(){
	changeColor();
})

//페이지 넘기는
function pageAjax(pageNumber){
	document.getElementById("pageNumber").value = pageNumber;
	document.getElementById("memberSalCntMgrForm").submit();
}

function changeColor(){	
	$('.table tbody tr').mouseover(function(){
		$(this).addClass('changeColor');	
	}).mouseout(function() {	   
		$(this).removeClass('changeColor');	
	});
}

function onDetail(MgtKeyTypeCheck, MgtKey) {
	if(MgtKey === "null" || MgtKey === null || MgtKey === ""){
		alert("key가 등록되지 않은 계산서입니다.");
		return false;
	}
	
	window.open("${contextPath}/adm/TaxInvoiceCheck/detail?MgtKeyTypeCheck="+MgtKeyTypeCheck+"&MgtKey="+MgtKey ,"target","toolbar=no,status=no,menubar=no,resizable=yes, location=no, top=150,left=500,width=940,height=700,scrollbars=no");
};

//1분기
function bungi(bungi){
	var now = new Date();
	var year = now.getFullYear();
	var startday;
	var endday;
	if(bungi === 1) {
		startday = "-01-01";
		endday = "-03-31";
	} else if(bungi === 2) {
		startday = "-04-01";
		endday = "-06-30";
	} else if(bungi === 3) {
		startday = "-07-01";
		endday = "-09-30";
	} else if(bungi === 4) {
		startday = "-10-01";
		endday = "-12-31";
	}
	document.getElementById("datepickerStr").value =  year+startday;
	document.getElementById("datepickerEnd").value =  year+endday;
}
//상반기
function firsthalfyear(){
	var now = new Date();
	var year = now.getFullYear();
	var startday = "-01-01";
	var endday = "-06-30";
	document.getElementById("datepickerStr").value =  year+startday;
	document.getElementById("datepickerEnd").value =  year+endday;
}
//하반기
function secondhalfyear(){
	var now = new Date();
	var year = now.getFullYear();
	var startday = "-07-01";
	var endday = "-12-31";
	document.getElementById("datepickerStr").value =  year+startday;
	document.getElementById("datepickerEnd").value =  year+endday;
}

$(function() {
	//Date picker
	$('#datepickerStr').datepicker({
		autoclose: true,
		format: 'yyyy-mm-dd'
	});
	$('#datepickerEnd').datepicker({
		autoclose: true,
		format: 'yyyy-mm-dd'
	});
	
	// 엑셀
    $("#btnExcel").click(function() {    	
    	alert("서비스 준비중입니다.");
    	return false;
    	
    	/* var strAction = "${contextPath }/adm/memberSalCntMgr/excelDown";
    	var realAction =  "${strActionUrl }";
    	
        $("#memberSalCntMgrForm").attr("action", strAction);
        $("#memberSalCntMgrForm").submit();
        
        //원래대로
        $("#memberSalCntMgrForm").attr("action",realAction); */        
    });
});

//정렬 주문일 & 주문자명 클릭시 , 목록수 변경시
function fn_order_by(str){	
	var frm=document.getElementById("sortingForm");
	
	if(str != ""){
		frm.MEMB_ORD_GUBUN.value=str;
	}
	frm.submit();
}
</script>