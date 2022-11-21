<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<hr>
<div style = "width: 719px; height: 502px; position: sticky; background: #dfe7ff1f; left: 700px; top: 111px;">
<form action="${contextPath }/adm/CashReceiptPublication/Single" method="POST" id = "form" style="position: unset; margin: 0px 0 0 -100px;">

	<input type="hidden" name = "franchiseCorpNum" value = "1234567890">
	<table class = "SingleTable">
		<!-- <tr>
			<th><span style="color:red">*</span>사업자 정보</th>
			<td>
				<input type="hidden" name = "franchiseCorpNum" value = "1234567890">
			</td>
		</tr> -->
		<tr>
			<th><span style="color:red">*</span>거래구분</th>
			<td>&emsp;&emsp;
				<input type="radio" name="tradeUsage" id="phone" value = "소득공제용" checked><label for="phone">소득공제용</label>&emsp;
				<input type="radio" name="tradeUsage" id="sanum" value = "지출증빙용"><label for="sanum">지출중빙용</label>
			</td>
		</tr>
		<tr>
			<th></th>
			<td>&emsp;&emsp;</td>
		</tr>
		<tr>
			<th><span style="color:red">*</span>거래유형</th>
			<td>&emsp;&emsp;
				<input type="radio" name = "tradeOpt" value = "일반" checked><label>일반</label>
			</td>
		</tr>
		<tr>
			<th><span style="color:red">*</span>식별번호</th>
			<td>&emsp;&emsp;
				<input type="text" name = "identityNum" id = "identityNum">
				
				<input type="hidden" id = "identityNum1" value = "${obj.COMPUNYNUM }">
				<input type="hidden" id = "identityNum2" value = "${obj.PNUM }">
				
				
			</td>
		</tr>
		<tr>
			<th></th>
			<td>&emsp;&emsp;</td>
		</tr>
		<tr>
			<th><span style="color:red">*</span>과세형태</th>
			<td>&emsp;&emsp;
				<input type="radio" value = "과세" id = "taxType1" name = "taxationType" checked><label for="taxType1">과세</label> 
				<input type="radio" value = "비과세" id = "taxType2" name = "taxationType"><label for="taxType2">비과세</label>
			</td>
		</tr>
		<tr>
			<th><span style="color:red">*</span>합계</th>
			<td>&emsp;&emsp;
				<input type="text" name = "totalAmount" id = "totalAmount" value = "${obj.ORDER_AMT+obj.DLVY_AMT }">
			</td>
		</tr>
		<tr>
			<th><span style="color:red">*</span>공급가액</th>
			<td>&emsp;&emsp;
				<input type="text" name = "supplyCost" id = "supplyCost">
			</td>
		</tr>
		<tr>
			<th><span style="color:red">*</span>세액</th>
			<td>&emsp;&emsp;
				<input type="text" name = "tax" id = "tax">
				<input type = "hidden" name = "serviceFee" value = "0" id = "봉사료">
			</td>
		</tr>
		<tr>
			<th>주문자</th>
			<td>&emsp;&emsp;
				<input type="text" name = "customerName" id = "customerName" value = "${obj.REGP_ID }">
			</td>
		</tr>
		<tr>
			<th>상품명</th>
			<td>&emsp;&emsp;
				<input type="text" name = "itemName" id = "itemName" value = "${obj.PD_NAME }">
			</td>
		</tr>
		<tr>
			<th>주문번호</th>
			<td>&emsp;&emsp;
				<input type="text" name = "orderNumber" id = "orderNumber" value = "${obj.ORDER_NUM }">
			</td>
		</tr>
	</table>
	<br>
	<div style="text-align: center;">&emsp;&emsp;
		<!-- <a href="#" class="btn-two gray rounded" style="color: black;">초기화</a>
		<a href="#" class="btn-two blue rounded" style="padding: 10px 25px;" onclick="submit();">발급</a> -->
		
		<a href="#" class="btn btn-default left-10" onclick = "resetform()">
			초기화 
		</a>
		<button type="button" class="btn btn-primary left-10" onclick="submit();">
			<i class="fa fa-save"></i> <span>발급</span>
		</button>
	</div>
</form>
</div>

<div id = "change1" style="position: absolute; top: 170px; left: 765px;">
	<span id = "change1">연말정산시 소득공제를 위해 발행합니다.</span>
</div>

<div>
	<span id = "change2" style = "position: absolute; top: 271px; left: 765px;">휴대폰/주민등록/카드번호를 입력하여 주시기 바랍니다.</span>
</div>

<script>

$(document).ready(function(){
	/* 식별번호 채워넣는부분 */
	let identityNum1 = document.getElementById("identityNum1").value;
	let identityNum2 = document.getElementById("identityNum2").value;
	
	if(identityNum1 === null || identityNum1 === ""){
		//사업자번호가 없을경우
		document.getElementById("identityNum").value = identityNum2;
	} else if (identityNum2 === null || identityNum2 === ""){
		//핸드폰번호가 없을경우
		document.getElementById("identityNum").value = identityNum1;
	}
	/* 식별번호 채워넣는부분 */
	
	/* 공급가액,세액 채워넣는부분 */
	let totalAmount = document.getElementById("totalAmount").value;
	/* 공급가액 = 합계 / 1.1
	세액(부가세 or 부가가치세) = 합계 / 11 */
	
	let test = document.getElementById("supplyCost").value = (totalAmount/1.1);
	document.getElementById("tax").value = (totalAmount-test);
	
	/* 공급가액,세액 채워넣는부분 */
});

const displayYn = document.querySelector("#dispayYn");
/* displayYn.style.display = "none"; */

const phone = document.querySelector("#phone");
const sanum = document.querySelector("#sanum");

phone.addEventListener("click", displayChange);
sanum.addEventListener("click", displayChange);

function displayChange(e){
	let change1 = document.querySelector("#change1");
	let change2 = document.querySelector("#change2");
	if(e.target.id === "sanum"){
		change1.innerHTML = "경비처리시 증빙자료로 이용하기 위해 발행합니다.";
		change2.innerHTML = "휴대폰/주민등록/사업자/카드번호를 입력하여 주시기 바랍니다.";
	}else{
		change1.innerHTML = "연말정산시 소득공제를 위해 발행합니다.";
		change2.innerHTML = "휴대폰/주민등록/카드번호를 입력하여 주시기 바랍니다.";
	}
}

function resetform(){
	document.getElementById('identityNum').value = "";
	document.getElementById('totalAmount').value = "";
	document.getElementById('supplyCost').value = "";
	document.getElementById('tax').value = "";
	document.getElementById('customerName').value = "";
	document.getElementById('itemName').value = "";
	document.getElementById('orderNumber').value = "";
}

//발급
function submit(){
	
	let confirmAnswer = confirm("발급 하시겠습니까?");
	
	if(confirmAnswer){
		var form = document.getElementById("form");
		form.submit();
	} else {
		
	}
}


</script>
