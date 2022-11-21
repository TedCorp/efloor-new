<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/layout/inc/taglib.jsp" %>

<!-- 현금영수증 조회 -->

<%@ include file="TaxBillCheckCommon.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.cashbill.CBSearchResult"%>
<%@page import="com.popbill.api.cashbill.Cashbill"%>

<%
	//리스트 조회
	String CorpNum = "1234567890";
	String DType = "R";
	String SDate = (String)request.getAttribute("datepickerStr");
	String EDate = (String)request.getAttribute("datepickerEnd");
	String[] State = null;
	String[] TradeType = null;
	String[] TradeUsage = null;
	String[] TradeOpt = null;
	String[] TaxationType = null;
	String QString = null;
	int Page = Integer.parseInt(String.valueOf(request.getAttribute("pageNumber")));
	int Page2 = 1;
	int PerPage = 10;
	int PerPage2 = 1000;
	String Order = null;
	String FranchiseTaxRegID = null;
	CBSearchResult cbSearchResult = null;
	CBSearchResult cbSearchResult2 = null;
	
	//리스트
	try {
		cbSearchResult = cashbillService.search(CorpNum, DType, SDate, EDate, State, TradeType, TradeUsage, TaxationType, Page, PerPage, Order);
		cbSearchResult2 = cashbillService.search(CorpNum, DType, SDate, EDate, State, TradeType, TradeUsage, TaxationType, Page2, PerPage2, Order);
    } catch (PopbillException pe) {
        System.out.println("오류코드 " + pe.getCode());
        System.out.println("오류메시지 " + pe.getMessage());
        throw pe;
    }
	
	
	//위에서 리턴되는 문서번호 가져와서 밑에 mgtkey 에 넣고 결과값 배열에 돌리면서 넣은후 뿌려줘야함
	
	//상세정보 확인
	//String MgtKey = "TB0000061";
	String MgtKey = null;
	
	ArrayList<Cashbill> list = new ArrayList<Cashbill>();
	//ArrayList<Cashbill> list2 = new ArrayList<Cashbill>();
	
	for(int i = 0; i < cbSearchResult.getList().size() ; i++){
		
		Cashbill cashbill = null; 
		MgtKey = cbSearchResult.getList().get(i).getMgtKey();
		try {
			cashbill = cashbillService.getDetailInfo(CorpNum, MgtKey);
	    } catch (PopbillException pe) {
	        System.out.println("오류코드 " + pe.getCode());
	        System.out.println("오류메시지 " + pe.getMessage());
	        throw pe;
		}
		list.add(i, cashbill);
	}
	
	int maxSupplyCostTotal = 0;
	int maxTaxTotal = 0;
	int maxTotal = 0;
	
	for(int i = 0; i < cbSearchResult2.getList().size() ; i++){
		Cashbill cashbill2 = null; 
		MgtKey = cbSearchResult2.getList().get(i).getMgtKey();
		try {
			cashbill2 = cashbillService.getDetailInfo(CorpNum, MgtKey);
	    } catch (PopbillException pe) {
	        System.out.println("오류코드 " + pe.getCode());
	        System.out.println("오류메시지 " + pe.getMessage());
	        throw pe;
		}
		//list2.add(i, cashbill2);
		maxSupplyCostTotal = maxSupplyCostTotal + Integer.parseInt(cashbill2.getTotalAmount());
		maxTaxTotal = maxTaxTotal + Integer.parseInt(cashbill2.getTax());
	}
	maxTotal = maxSupplyCostTotal + maxTaxTotal;
	//문서번호 셋팅
	/* String UesrID = null;
	
	Response responseSetMgtKey = null;
	String Itemkey = cbSearchResult.getList().get(3).getItemKey();
	MgtKey = "TB0000064";
	try {
		responseSetMgtKey  = cashbillService.assignMgtKey(CorpNum,Itemkey,MgtKey,UesrID);
    } catch (PopbillException pe) {
        System.out.println("오류코드 " + pe.getCode());
        System.out.println("오류메시지 " + pe.getMessage());
        throw pe;
    } */
	
	/* for(int i = 2; i < cbSearchResult.getList().size() ; i++){
		MgtKey = "TB000006"+toString().valueOf(i) ;
	} */
	
	int pageCount = Integer.parseInt(cbSearchResult.getPageCount());
    int pageNumNum = Integer.parseInt(cbSearchResult.getPageNum());
    
    int pageNumNumone = (pageNumNum/10);
    int pageNumNumone2 = (pageNumNum/10)+1;
    if(pageNumNumone == 0){
    	pageNumNumone = 1;
    }else {
    	pageNumNumone = (pageNumNumone*10)+1;
    }

    SimpleDateFormat fDate1 = new SimpleDateFormat("yyyyMMdd"); //같은 형식으로 맞춰줌
    SimpleDateFormat fDate3 = new SimpleDateFormat("yyyy.MM.dd"); //같은 형식으로 맞춰줌
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
table.table>thead>.headtr>td {
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
.aodlqdor{
	text-align: end;
}
.chdrmador{
	text-align: end;
}
.changeColor {      
	background-color: #fbfbfb;
}
</style>


<c:set var="strActionUrl" value="${contextPath }/adm/memberSalCntMgr" />
<c:set var="strMethod" value="get" />



<!-- 최상단 -->
<section class="content-header">
	<!-- <h5>
		<strong>매출관리&nbsp;>&nbsp;현금영수증 조회</strong>
	</h5> -->
	<h1>
		매입 / 매출 관리
		<small>현금영수증 조회</small>
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
			<spform:form class="form-horizontal" name="TaxBillCheckForm" id="TaxBillCheckForm" method="GET" action="">
				<div class="box-body">
					<div class="form-group">						
						<label for="datepickerStr" class="col-sm-1 control-label">구분</label>
						<div class="col-sm-2">
							<select name="PAY_GUBN" class="form-control select2" onchange="chageSelectType()">
								<option value="W">매입</option>
								<option value="I">매출</option>
							</select>
						</div>
					</div>
					<div class="form-group">						
						<label for="datepickerStr" class="col-sm-1 control-label">기간</label>
						
						<div class="col-sm-2">
							<div class="input-group bootstrap-datepicker datepicker">
								<input type="text" class="form-control pull-left" name="datepickerStr" id="datepickerStr" value="${obj.datepickerStr }" readonly="readonly">
								<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="input-group bootstrap-datepicker datepicker">
								<input type="text" class="form-control pull-left" name="datepickerEnd" id="datepickerEnd" value="${obj.datepickerEnd }" readonly="readonly">
								<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="input-group bootstrap-datepicker datepicker">
								<span>
									<a href="#" class="btn-two gray rounded" style="color: black; padding: 6px 10px;" onclick="firsthalfyear()">상반기</a>
									<a href="#" class="btn-two gray rounded" style="color: black; padding: 6px 10px;" onclick="secondhalfyear()">하반기</a>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group">						
						<label for="MEMB_GUBN" class="col-sm-1 control-label">검색</label>
						
						<div class="col-sm-5">
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
						<!-- <div class="col-sm-2">
							<select name="PAY_GUBN" class="form-control select2" onchange="chageSelectType()">
								<option value="W">매입</option>
								<option value="I">매출</option>
							</select>
						</div> -->
						<div class="box-tools">
							<span><strong>검색결과[ <span style="color:red;"><fmt:formatNumber value="<%=cbSearchResult.getTotal() %>"/></span> 건 ]</strong></span>
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
					<div class="col-sm-12">
						<table style="width:100%;">
							<tr>
								<th class="tablesettingkey">건수</th> <th class="tablesettingvalue"><span style="color:red;"><fmt:formatNumber value="<%=cbSearchResult.getTotal() %>"/></span>&ensp;건</th>
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
					<thead>
						<tr class="headtr">
							<td><strong>No</strong></td>
							<td class = "aodlq"><strong>매입일시</strong></td>
							<td class = "issueDT"><strong>매출일시</strong></td>
							<td class = "identityNum"><strong>식별번호</strong></td>
							<td class = "rkaodwja"><strong>가맹점</strong></td>
							<td><strong>공급가</strong></td>
							<td><strong>부가세</strong></td>
							<td><strong>봉사료</strong></td>
							<td class = "aodlqdor"><strong>매입액</strong></td>
							<td class = "chdrmador"><strong>총금액</strong></td>
							<td><strong>승인번호</strong></td>
							<td><strong>발급수단</strong></td>
							<td><strong>거래구분</strong></td>
							<td class = "rhdwprnqns"><strong>공제구분</strong></td>
						</tr>
					</thead>
					<tbody style="background-color: white; text-align: center;">
						<%for(int i=0;i<cbSearchResult.getList().size();i++){ %>
							<tr onclick = "onDetail('<%=cbSearchResult.getList().get(i).getMgtKey()%>')">
								<td>
									<%=(Integer.parseInt(cbSearchResult.getPageNum())*10)-9+i %>
								</td>
								<td class = "aodlq"><%=fDate3.format(fDate1.parse(cbSearchResult.getList().get(i).getTradeDate())) %></td>
								<td class = "issueDT"><%=cbSearchResult.getList().get(i).getIssueDT() %></td>
								<td class = "identityNum"><%=cbSearchResult.getList().get(i).getIdentityNum() %></td>
								<td class = "rkaodwja"><%=list.get(i).getFranchiseCorpName() %><%-- <%=cbSearchResult.getList().get(i).getCustomerName() %> --%></td>
								<td style = "text-align-last: end;"><fmt:formatNumber value="<%=list.get(i).getSupplyCost() %>"/></td>
								<td style = "text-align-last: end;"><fmt:formatNumber value="<%=list.get(i).getTax() %>"/></td>
								<td style = "text-align-last: end;"><fmt:formatNumber value="<%=list.get(i).getServiceFee() %>"/></td>
								<td class = "aodlqdor" style = "text-align: end;"><fmt:formatNumber value="<%=cbSearchResult.getList().get(i).getTotalAmount() %>"/></td>
								<td class = "chdrmador" style = "text-align: end;"><fmt:formatNumber value="<%=cbSearchResult.getList().get(i).getTotalAmount() %>"/></td>
								<td><%=cbSearchResult.getList().get(i).getConfirmNum() %></td>
								<td>12 ????</td>
								<td><%=cbSearchResult.getList().get(i).getTradeUsage() %></td>
								<td class = "rhdwprnqns"><%=list.get(i).getTaxationType() %></td>
							</tr>
						<%} %>
					</tbody>
				</table>
				<div style=" text-align: center; ">
					<%if(1 < Integer.parseInt(cbSearchResult.getPageCount())){%>
					<span onclick="pageAjax(1)"><<</span>&emsp;
					<% }
					if(1 < Integer.parseInt(cbSearchResult.getPageNum())){%>
						<span onclick="pageAjax(<%=(Integer.parseInt(cbSearchResult.getPageNum())-1)%>)"><</span>&emsp;
					<% } %>
					<%for(int i = pageNumNumone ; i <= pageNumNumone+9 ; i++ ){ 
						if((int)i == ((int)Integer.parseInt(cbSearchResult.getPageCount())+1)){
							break;
						}
					%>
						<%if(i == Integer.parseInt(cbSearchResult.getPageNum())){%>
							<span style="color: #3498ff;"><b><%=i %></b></span>&emsp;
						<%} else {%>
							<span onclick="pageAjax(<%=i %>)"><b><%=i %></b></span>&emsp;
						<%} %>
					<% } %>
					
					<%if(!cbSearchResult.getPageCount().equals(cbSearchResult.getPageNum())){%>
						<span onclick="pageAjax(<%=(Integer.parseInt(cbSearchResult.getPageNum())+1)%>)">></span>&emsp;
					<% } %>
					<%if(1 < Integer.parseInt(cbSearchResult.getPageCount())){%>
						<span onclick="pageAjax(<%=cbSearchResult.getPageCount()%>)">>></span>
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
	chageSelectType();
})

function changeColor(){	
	$('.table tbody tr').mouseover(function(){
		$(this).addClass('changeColor');	
	}).mouseout(function() {	   
		$(this).removeClass('changeColor');	
	});
}

function onDetail(MgtKey) {
	if(MgtKey === "null" || MgtKey === null || MgtKey === ""){
		alert("key가 등록되지 않은 계산서입니다.");
		return false;
	}
	//alert(MgtKey);
	window.open("${contextPath}/adm/TaxBillCheck/detail?MgtKey="+MgtKey ,"target","toolbar=no,status=no,menubar=no,resizable=yes, location=no, top=150,left=600,width=550,height=700,scrollbars=no");
};

function pageAjax(pageNumber){
	document.getElementById("pageNumber").value = pageNumber;
	document.getElementById("TaxBillCheckForm").submit();
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

//매입 매출 select 변경시 실행
function chageSelectType(){
	var PAYGUBN = $('select[name="PAY_GUBN"]').val();
	//alert(PAYGUBN);
	
	if(PAYGUBN === "W"){
		//생기기
		$(".aodlq").removeAttr('style');
		$(".rkaodwja").removeAttr('style');
		$(".aodlqdor").removeAttr('style');
		$(".rhdwprnqns").removeAttr('style');
		$(".identityNum").removeAttr('style');

		//없애기
		$(".issueDT").attr('style', 'display:none;');
		$(".chdrmador").attr('style', 'display:none;');
	} else if(PAYGUBN === "I") {
		//생기기
		$(".issueDT").removeAttr('style');
		$(".chdrmador").removeAttr('style');
		
		//없애기
		$(".aodlq").attr('style', 'display:none;');
		$(".rkaodwja").attr('style', 'display:none;');
		$(".aodlqdor").attr('style', 'display:none;');
		$(".rhdwprnqns").attr('style', 'display:none;');
		$(".identityNum").attr('style', 'display:none;');
	}
	
}



</script>
