<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/layout/inc/taglib.jsp" %>

<!-- 매입조회 -->

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
</style>


<c:set var="strActionUrl" value="${contextPath }/adm/memberSalCntMgr" />
<c:set var="strMethod" value="get" />



<!-- 최상단 -->
<section class="content-header">
	<h5>
		<strong>매출관리&nbsp;>&nbsp;매출 조회</strong>
		하드코딩상태
	</h5>
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
						<label for="datepickerStr" class="col-sm-1 control-label">기간</label>
						<div class="col-sm-2">
							<select name="PAY_GUBN" class="form-control select2">
								<option value="W">작성일자</option>
								<option value="I">발행일자</option>
							</select>
						</div>
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
						<label for="MEMB_GUBN" class="col-sm-1 control-label">거래처</label>
						
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
						<div class="box-tools">
							<span><strong>검색결과[ <span style="color:red;"><fmt:formatNumber value="${11890234}"/></span> 건 ]</strong></span>
							&ensp;<button type="button" class="btn btn-sm btn-success pull-right" id="btnExcel">엑셀</button>
						</div>
					</div>
				</div>
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
					<label class="col-sm-1 control-label">▷Summary</label><br><br>
					<div class="col-sm-12">
						<table style="width:100%;">
							<tr>
								<th class="tablesettingkey">건수</th> <th class="tablesettingvalue"><span style="color:red;"><fmt:formatNumber value="${5555555}"/></span>&ensp;건</th>
								<th class="tablesettingkey">공급가액</th> <th class="tablesettingvalue"><span style="color:red;"><fmt:formatNumber value="${845678}"/></span>&ensp;원</th>
								<th class="tablesettingkey">세액</th> <th class="tablesettingvalue"><span style="color:red;"><fmt:formatNumber value="${523452345}"/></span>&ensp;원</th>
								<th class="tablesettingkey">합계</th> <th class="tablesettingvalue"><span style="color:red;"><fmt:formatNumber value="${235453544}"/></span>&ensp;원</th>
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
						<tr>
							<th>No</th>
							<th>구분</th>
							<th>작성<br>일자</th>
							<th>발행<br>일자</th>
							<th>전송<br>일자</th>
							<th>거래처</th>
							<th>등록<br>번호</th>
							<th>과세<br>형태</th>
							<th>품목</th>
							<th>공급<br>가액</th>
							<th>세액</th>
							<th>합계</th>
						</tr>
					</thead>
					<tbody style="background-color: white; text-align: center;">
						<tr>
							<td>1</td>
							<td>매출</td>
							<td>2022.08.01</td>
							<td>2022.08.02</td>
							<td>2022.08.03</td>
							<td>(주)테드</td>
							<td>220-88-35324</td>
							<td>과세</td>
							<td>서비스</td>
							<td>1,000</td>
							<td>100</td>
							<td>1,100</td>
						</tr>
						<tr>
							<td>2</td>
							<td>매출</td>
							<td>2022.08.01</td>
							<td>2022.08.02</td>
							<td>2022.08.03</td>
							<td>(주)테드2</td>
							<td>220-88-35325</td>
							<td>면세</td>
							<td>서비스</td>
							<td>6,000</td>
							<td>300</td>
							<td>2,100</td>
						</tr>
						<tr>
							<td>3</td>
							<td>매출</td>
							<td>2022.08.01</td>
							<td>2022.08.02</td>
							<td>2022.08.03</td>
							<td>(주)테드2</td>
							<td>220-88-35325</td>
							<td>영세</td>
							<td>서비스</td>
							<td>3,000</td>
							<td>200</td>
							<td>1,500</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		
		<paging:PageFooter totalCount="${ totalCnt }" rowCount="${ rowCnt }">
			<First><Previous><AllPageLink><Next><Last>
		</paging:PageFooter>
	</div>
</section>

<form id="excelFrm" method="get" action="${contextPath }/adm/memberSalCntMgr/excelDown"></form>

<script type="text/javascript">

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
    	var strAction = "${contextPath }/adm/memberSalCntMgr/excelDown";
    	var realAction =  "${strActionUrl }";
    	
        $("#memberSalCntMgrForm").attr("action", strAction);
        $("#memberSalCntMgrForm").submit();
        
        //원래대로
        $("#memberSalCntMgrForm").attr("action",realAction);        
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

	