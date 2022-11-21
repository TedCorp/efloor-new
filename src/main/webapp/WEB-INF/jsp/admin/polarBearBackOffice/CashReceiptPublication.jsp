<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/layout/inc/taglib.jsp" %>

<style>

.MuchTable {
	width : 100%;
	height: 60px;
	border-color: blue;
	border: 1px solid #444444;
    border-collapse: collapse;
}

.MuchTable > tbody > tr > td {
	text-align: center;
	vertical-align: middle;
	border: 1px solid #99bbc7;
}
.MuchTable > tbody > tr > td > input {
	border:none;
	background:transparent;
	width : 100%;
}


.SingleTable {
	width : 70%;
	height: 400px;
	border-color: black;
	border: 0px solid black;
    border-collapse: collapse;
    margin-left: auto;
}
.SingleTable > tbody > tr > td {
	text-align: left;
	vertical-align: middle;
	border: 0px solid black;
}
.SingleTable > tbody > tr > th {
	text-align: center;
	/* vertical-align: middle; */
	text-align : right;
	border: 0px solid black;
}
.SingleTable > tbody > tr > td > input[type=text] {
	border: 1px solid #ccc;
	border-color: #d7d7d7;
    border-top-style: outset;
    border-left-style: double;
    width: 50%;
}
.rounded {
 	border-radius: 10px;
}
.gray {
	background: #eee;
}
.blue {
	background: #355689;
}
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

</style>


<!-- 최상단 -->
<section class="content-header" style="margin-right: auto; margin-left: auto;">
	<!-- <h5>
		<strong>매출관리&nbsp;>&nbsp;현금영수증 발행</strong>
	</h5> -->
	<h1>
      매입 / 매출 관리
      <small>현금영수증 발행</small>
   </h1>
</section>
<section class="content" style="width: 100%;">
	<div class="box">
		<!-- /.box-header -->
		<div class="box-body">
			<div class="box-body" style="white-space:nowrap;overflow-x : unset;">
				<table style="width:100%; height: 50px;">
					<tr>
						<th id = "selectTableType1_th" style="text-align: center; width: 33.33%; background:#e1e1e1;" onclick="selectTableType1()">
							<div>현금영수증 발행</div>
						</th>
						<th id = "selectTableType2_th" style="text-align: center; width: 33.33%%;" onclick="selectTableType2()">
							<div>취소 현금영수증 작성</div>
						</th>
						<th id = "selectTableType3_th" style="text-align: center; width: 33.33%%;" onclick="selectTableType3()">
							<div>현금영수증 대량 등록</div>
						</th>
					</tr>
				</table>
				<div id="selectTableType1">
					<br><%@ include file="CashReceiptPublication_Single.jsp" %>
				</div>
				<div id="selectTableType2" style="display:none;">
					<br><%@ include file="CashReceiptPublication_TaxCancel.jsp" %>
				</div>
				<div id="selectTableType3" style="display:none;">
					<br><%@ include file="CashReceiptPublication_Much.jsp" %>
				</div>
			</div>
		</div>		
	</div>
</section>


<script type="text/javascript">
	function selectTableType1(){
		$("#selectTableType1").removeAttr("style");	//1번 사용페이지
		$("#selectTableType2").css({"display":"none"});
		$("#selectTableType3").css({"display":"none"});
		$("#selectTableType1_th").css({"background":"#e1e1e1"});
		$("#selectTableType2_th").css({"background":"white"});
		$("#selectTableType3_th").css({"background":"white"});
	}
	function selectTableType2(){
		alert("서비스 준비중입니다.");
		return false;
		
		$("#selectTableType2").removeAttr("style");	//2번 사용페이지
		$("#selectTableType1").css({"display":"none"});
		$("#selectTableType3").css({"display":"none"});
		$("#selectTableType2_th").css({"background":"#e1e1e1"});
		$("#selectTableType1_th").css({"background":"white"});
		$("#selectTableType3_th").css({"background":"white"});
	}
	function selectTableType3(){
		alert("서비스 준비중입니다.");
		return false;
		
		$("#selectTableType3").removeAttr("style");	//3번 사용페이지
		$("#selectTableType1").css({"display":"none"});
		$("#selectTableType2").css({"display":"none"});
		$("#selectTableType3_th").css({"background":"#e1e1e1"});
		$("#selectTableType1_th").css({"background":"white"});
		$("#selectTableType2_th").css({"background":"white"});
	}
</script>