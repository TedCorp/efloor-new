<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<section class="content" style="width: 98%;">
	<table style="width:100%; height: 30px;">
		<tr>
			<th id = "CashReceiptPublication_TaxCancel_1_th" style="text-align: center; width: 33.33%; background:#e1e1e1;" onclick="CashReceiptPublication_TaxCancel_1()">
				<div>원본 문서선택</div>
			</th>
			<th id = "CashReceiptPublication_TaxCancel_2_th" style="text-align: center; width: 33.33%%;" onclick="CashReceiptPublication_TaxCancel_2()">
				<div>취소 유형선택</div>
			</th>
			<th id = "CashReceiptPublication_TaxCancel_3_th" style="text-align: center; width: 33.33%%;" onclick="CashReceiptPublication_TaxCancel_3()">
				<div>취소 문서작성</div>
			</th>
		</tr>
	</table>
	<div id="CashReceiptPublication_TaxCancel_1">
		<br>
		<section style="width: 100%;">
			111
		</section>
	</div>
	<div id="CashReceiptPublication_TaxCancel_2" style="display:none;">
		<br>
		<section style="width: 100%;">
			222
		</section>
	</div>
	<div id="CashReceiptPublication_TaxCancel_3" style="display:none;">
		<br>
		<section style="width: 100%;">
			333
		</section>
	</div>
</section>
<script type="text/javascript">
	
function CashReceiptPublication_TaxCancel_1(){
	$("#CashReceiptPublication_TaxCancel_1").removeAttr("style");	//1번 사용페이지
	$("#CashReceiptPublication_TaxCancel_2").css({"display":"none"});
	$("#CashReceiptPublication_TaxCancel_3").css({"display":"none"});
	$("#CashReceiptPublication_TaxCancel_1_th").css({"background":"#e1e1e1"});
	$("#CashReceiptPublication_TaxCancel_2_th").css({"background":"white"});
	$("#CashReceiptPublication_TaxCancel_3_th").css({"background":"white"});
}
function CashReceiptPublication_TaxCancel_2(){
	$("#CashReceiptPublication_TaxCancel_2").removeAttr("style");	//2번 사용페이지
	$("#CashReceiptPublication_TaxCancel_1").css({"display":"none"});
	$("#CashReceiptPublication_TaxCancel_3").css({"display":"none"});
	$("#CashReceiptPublication_TaxCancel_2_th").css({"background":"#e1e1e1"});
	$("#CashReceiptPublication_TaxCancel_1_th").css({"background":"white"});
	$("#CashReceiptPublication_TaxCancel_3_th").css({"background":"white"});
}
function CashReceiptPublication_TaxCancel_3(){
	$("#CashReceiptPublication_TaxCancel_3").removeAttr("style");	//3번 사용페이지
	$("#CashReceiptPublication_TaxCancel_1").css({"display":"none"});
	$("#CashReceiptPublication_TaxCancel_2").css({"display":"none"});
	$("#CashReceiptPublication_TaxCancel_3_th").css({"background":"#e1e1e1"});
	$("#CashReceiptPublication_TaxCancel_1_th").css({"background":"white"});
	$("#CashReceiptPublication_TaxCancel_2_th").css({"background":"white"});
}

</script>