<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/layout/inc/taglib.jsp" %>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- 세금계산서 발행 -->

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
.tablestyle1 {
	width:100%;
	border-color: red;
	color: red;
	text-align: center;
}

.tablestyle2 {
	width:100%;
	border-color: blue;
	color: blue;
	text-align: center;
}
.tablestyle3 {
	width: 100%;
	border-color: #999999;
	text-align: center;
}
.tablestyle4 {
	width:100%;
	border-color: #999999;
	text-align: center;
}
.tablestyle5 {
	width: 90%;
	text-align: center;
}
.tablestyle1 > tbody > tr > td > input[type=text] {
	color: black;
	width: 98%;
	margin: 3px 3px 3px 3px;
}
.tablestyle2 > tbody > tr > td > input[type=text] {
	color: black;
	width: 98%;
	margin: 3px 3px 3px 3px;
}
.tablestyle3 > tbody > tr > td > input[type=text] {
	color: black;
	width: 98%;
	margin: 3px 3px 3px 3px;
}
.tablestyle4 > tbody > tr > td > input[type=text] {
	color: black;
	width: 95%;
	margin: 3px 3px 3px 3px;
}
table {
	margin:1px 1px 1px 1px;
}
.tabletdwidthfive {
	width: 50%;
}
.tabletdwidthtwo {
	width: 20%;
}
.tabletdwidtheight {
	width: 80%;
}

/* 버튼 이미지 */
.rounded {
 	border-radius: 10px;
}
.gray {
	background: #eee;}
.blue {
	background: #355689;}
.btn-two {
	color: white; 
	margin: 0px 10px 0px 0px;
	padding: 5px 10px;
	display: inline-block;
	border: 1px solid rgba(0,0,0,0.21);
	border-bottom-color: rgba(0,0,0,0.34);
	text-shadow:0 1px 0 rgba(0,0,0,0.15);
	box-shadow: 0 1px 0 rgba(255,255,255,0.34) inset, 
              0 2px 0 -1px rgba(0,0,0,0.13), 
              0 3px 0 -1px rgba(0,0,0,0.08), 
              0 3px 13px -1px rgba(0,0,0,0.21);
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
.MuchTable {
	width : 100%;
	border-color: blue;
	border: 1px solid #444444;
    border-collapse: collapse;
}
.MuchTable > tbody > tr > td {
	text-align: center;
	vertical-align: middle;
	border: 1px solid #99bbc7;
	width: 500px;
}
.MuchTable > tbody > tr > td > input {
	border:none;
	background: transparent;
}
#selectTableType2_th > .MuchTable > tr > input[type=text] {
	width : auto;
	color: black;
	margin: 3px 3px 3px 3px;
}
</style>


<c:set var="strActionUrl" value="${contextPath }/adm/memberSalCntMgr" />
<c:set var="strMethod" value="get" />

<!-- 최상단 -->
<section class="content-header" style="width: 80%;margin-right: auto; margin-left: auto;">
	<!-- <h5>
		<strong>매출관리&nbsp;>&nbsp;세금계산서 발행</strong>
	</h5> -->
	<h1>
		매입 / 매출 관리
		<small>세금계산서 발행</small>
   </h1>
</section>
<section class="content" style="width: 80%;">
	<div class="box">
		<!-- /.box-header -->
		<div class="box-body">
			<div class="box-body" style="white-space:nowrap;overflow-x:scroll;">
				<table style="width:100%; height: 30px">
					<tr>
						<th id = "selectTableType1_th" style="text-align: center; width: 50%; background:#e1e1e1;" onclick="selectTableType1()">
							<div>세금계산서 발행</div>
						</th>
						<th id = "selectTableType2_th" style="text-align: center; width: 50%;" onclick="selectTableType2()">
							<div>세금계산서 대량 발행</div>
						</th>
					</tr>
				</table>
				<div id="selectTableType1">
					<br><%@ include file="./TaxBillPublication_Single.jsp" %>
				</div>
				<div id="selectTableType2" style="display:none;">
					<br><%@ include file="TaxBillPublication_Much.jsp" %>
				</div>
			</div>
		</div>		
	</div>
</section>
		
		
<script type="text/javascript">
	function selectTableType1(){
		$("#selectTableType1").removeAttr("style");
		$("#selectTableType2").css({"display":"none"});
		$("#selectTableType1_th").css({"background":"#e1e1e1"});
		$("#selectTableType2_th").css({"background":"white"});
	}
	function selectTableType2(){
		alert("서비스 준비중입니다.");
		return false;
		
		$("#selectTableType2").removeAttr("style");
		$("#selectTableType1").css({"display":"none"});
		$("#selectTableType2_th").css({"background":"#e1e1e1"});
		$("#selectTableType1_th").css({"background":"white"});
	}
</script>

