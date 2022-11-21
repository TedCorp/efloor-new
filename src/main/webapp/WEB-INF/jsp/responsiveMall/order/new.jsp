<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/layout/inc/taglib.jsp"%>

<!-- ▼ Key -->
<%@ include file="/layout/inc/mallKey.jsp"%>
<!-- ▲ Key -->

<head>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/resources2/css/reset.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/resources2/css/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/resources2/css/211021.css">
<script type="text/javascript" src="${contextPath}/resources/resources2/js/jquery-ui.1.12.1.js"></script>
<script type="text/javascript" src="${contextPath}/resources/resources2/js/common.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://js.tosspayments.com/v1"></script>

<style type="text/css">
#daum_juso_rayerPOST_NUM {
	width: 500px !important;
	margin-left: -250px !important;
	border: 2px solid !important;
}

.TaxBillTableCss {
	table-layout: auto;
	width: 100%;
	border: 1px solid #ebebeb;
	border-collapse: collapse;
}

.TaxBillTableCss>tbody>tr>th {
	background-color: #f7f7f7;
	border: 1px solid #ebebeb;
}

.TaxBillTableCss>tbody>tr>td {
	border: 1px solid #ebebeb;
}

.TaxBillTableCss>tbody>tr>td>input[type=text] {
	height: 40px;
}
.test123444 > input[type=radio]){
	display: list-item;
	text-indent: -9999px;
	width : 0;
	height : 0;
	-webkit-appearance : none;
	-moz-appearance : none;
	appearance : none;
}
</style>
</head>

<script src="${contextPath}/resources/js/addr_island.js?v=${DATE}"></script>
<script type="text/javascript">
	$(function() {
		// 로그인 체크   
		if ("${USER.MEMB_ID}" == "") {
			/*  alert("로그인이 필요합니다.");
			 location.href = "${contextPath}/m/user/loginForm";
			 return false; */
		} else {
			fn_dlarGubn();
		}

		// 선불&착불
		$("#DAP_YN").change(function() {
			var orderSum = parseInt($("#ORDER_SUM").val()); //주문금액
			var dlvyAmt = ${supplierInfo.DLVY_AMT}; //배송비

			if ($(this).val() == 'N') {
				dlvyAmt = 0;
			}

			var totAmt = orderSum + dlvyAmt;

			$("#tdTotAmt").text(number_format(String(totAmt)) + "원");
			$("#ORDER_AMT").val(totAmt);
		});

		// 주문하기
		$("#btnSave").click(function(){
			
			let checktype = $("input[name='PAY_METD']:checked").val();
			let checktype1 = $("input[name='APPLICATIONDOCUMENTSTYPE']:checked").val();
			let checktype2 = $("input[name='DEDUCTIONORPROOFBUSINESS']:checked").val();
			
			//계좌이체 > 현금영수증 > 개인소득공제
			let pnumber1 = $("input[name='PNUM_CASHRECEIPT_1']").val();
			let pnumber2 = $("input[name='PNUM_CASHRECEIPT_2']").val();
			let pnumber3 = $("input[name='PNUM_CASHRECEIPT_3']").val();
			
			//계좌이체 > 현금영수증 > 개인소득공제
			let COMPUNYNUM1 = $("input[name='COMPUNYNUM_CASHRECEIPT_1']").val();
			let COMPUNYNUM2 = $("input[name='COMPUNYNUM_CASHRECEIPT_2']").val();
			let COMPUNYNUM3 = $("input[name='COMPUNYNUM_CASHRECEIPT_3']").val();
			
			//계좌이체 > 세금계산서
			let COMPUNYNUM = $("input[name='INVOICEECORPNUM_TAXINVOICE']").val();
			let COMPUNYNAME = $("input[name='INVOICEECORPNAME_TAXINVOICE']").val();
			let INVOICEECEONAME = $("input[name='INVOICEECEONAME_TAXINVOICE']").val();
			let POSTALCODE = $("input[name='POSTALCODE_TAXINVOICE']").val();
			let INVOICEEADDR = $("input[name='ADDR1']").val() + $("input[name='ADDR2']").val();
			let INVOICEEBIZTYPE = $("input[name='INVOICEEBIZTYPE_TAXINVOICE']").val();
			let INVOICEEBIZCLASS = $("input[name='INVOICEEBIZCLASS_TAXINVOICE']").val();
			let INVOICEECONTACTNAME = $("input[name='INVOICEECONTACTNAME_TAXINVOICE']").val();
			let INVOICEEEMAIL1 = $("input[name='INVOICEEEMAIL_TAXINVOICE1']").val();
			let INVOICEEEMAIL2 = $("input[name='INVOICEEEMAIL_TAXINVOICE2']").val();
			let INVOICEETEL1 = $("select[name='INVOICEETEL_TAXINVOICE1'] option:selected").val();
			let INVOICEETEL2 = $("input[name='INVOICEETEL_TAXINVOICE2']").val();
			let INVOICEETEL3 = $("input[name='INVOICEETEL_TAXINVOICE3']").val();
			$("#INVOICEEADDR_TAXINVOICE").val(INVOICEEADDR);
			
			//220928용덕	만약 계좌이체일경우 추가
			if(checktype === 'SC0030') {
				//alert(11111);
				if(checktype1 === '현금영수증') {
					if(checktype2 === '개인소득공제') {
						if(pnumber1 === '' 
								|| pnumber1 === null 
								|| pnumber2 === '' 
								|| pnumber2 === null 
								|| pnumber3 === '' 
								|| pnumber3 === null) {
							alert('휴대전화 번호를 입력해주세요');
							return false;
						}
					} else if(checktype2 === '사업자증빙') {
						if(COMPUNYNUM1 === '' 
								|| COMPUNYNUM1 === null 
								|| COMPUNYNUM2 === '' 
								|| COMPUNYNUM2 === null 
								|| COMPUNYNUM3 === '' 
								|| COMPUNYNUM3 === null) {
							alert('사업자 번호를 입력해주세요');
							return false;
						}
					}
				} else if(checktype1 === '세금계산서') {
					if(COMPUNYNUM === '' || COMPUNYNUM === null) {
						alert('사업자번호를 입력해주세요');
						return false;
					}
					if(COMPUNYNAME === '' || COMPUNYNAME === null) {
						alert('회사명을 입력해주세요');
						return false;
					}
					if(INVOICEECEONAME === '' || INVOICEECEONAME === null) {
						alert('대표자명을 입력해주세요');
						return false;
					}
					if(POSTALCODE === '' || POSTALCODE === null) {
						alert('우편번호를 입력해주세요');
						return false;
					}
					if(INVOICEEADDR === '' || INVOICEEADDR === null) {
						alert('사업자 소재지를 입력해주세요');
						return false;
					}
					if(INVOICEEBIZTYPE === '' || INVOICEEBIZTYPE === null) {
						alert('업태를 입력해주세요');
						return false;
					}
					if(INVOICEEBIZCLASS === '' || INVOICEEBIZCLASS === null) {
						alert('업종을 입력해주세요');
						return false;
					}
					if(INVOICEECONTACTNAME === '' || INVOICEECONTACTNAME === null) {
						alert('담당자명을 입력해주세요');
						return false;
					}
					if(INVOICEEEMAIL1 === '' 
							|| INVOICEEEMAIL1 === null 
							|| INVOICEEEMAIL2 === '' 
							|| INVOICEEEMAIL2 === null) {
						alert('이메일을 입력해주세요');
						return false;
					}
					if(INVOICEETEL1 === '' 
							|| INVOICEETEL1 === null 
							|| INVOICEETEL2 === '' 
							|| INVOICEETEL2 === null 
							|| INVOICEETEL3 === '' 
							|| INVOICEETEL3 === null) {
						alert('휴대전화 번호를 입력해주세요');
						return false;
					}
				}
			}
			
			//필수입력 체크
			if($("#RECV_PERS").val() == "") {
				alert("받으시는분은 필수 입력 항목입니다.");
				$("#RECV_PERS").focus();
				return;
			}
			
			if($("#POST_NUM").val() == "") {
				alert("우편번호는 필수 입력 항목입니다.\n주소검색을 클릭하여 우편번호를 입력하세요.");
				$("#POST_NUM").focus();
				return;
			}
			
			if($("#DTL_ADDR").val() == "") {
				alert("주소는 필수 입력 항목입니다.\n상세주소를 입력하세요.");
				$("#DTL_ADDR").focus();
				return;
			}
			
			if($("#RECV_CPON1").val() == "" || $("#RECV_CPON2").val() == "" || $("#RECV_CPON3").val() == "") {
				alert("휴대폰번호는 필수 입력 항목입니다.");
				$("#RECV_CPON1").focus();
				return;
			}
			var orderAmt = $("#ORDER_AMT").val();
			var dlvyAmt = $("#devy_tot").val();
			
			// 쿠폰사용체크
			var cpon = $("#CPON_YN").val();
			var dlvyCnt = $("#DLVY_CPON").val();
			/* if(cpon == "Y" && dlvyCnt > 0){
			   $("#DLVY_AMT").val(0);               //배송비 0원            
			}else{
			   $("#CPON_YN").val("N");            
			} */
			
			if(orderAmt > 5000000) {
				alert("총 구매 금액이 5,000,000원을 넘을 수 없습니다.");
				return;
			}
			
			$("#DLVY_AMT").val(dlvyAmt);
			
			$("#ORDER_AMT").val(parseInt($("#tdTotAmt").text().replace(/,/g, '').replace('원', '')));
			
			if(!confirm('결제를 진행하시겠습니까?')) return;
			
			$.ajax({
				type: "POST",
				url: "${contextPath}/m/order/insert",
				data: $("#fregisterform").serialize(),
				success: function(data) {
					pay();
				},
				error: function(jqXHR, textStatus, errorThrown) {
					alert("결제 모듈을 불러오는 중 에러가 발생했습니다. 잠시 후애 다시 시도 해 주세요.");
				}
			});
			/* if(!confirm('결제를 진행하시겠습니까?')) return;
						
			$('#RECV_TELN').val($('#RECV_TELN1').val()+"-"+$('#RECV_TELN2').val()+"-"+$('#RECV_TELN3').val());
			$('#RECV_CPON').val($('#RECV_CPON1').val()+"-"+$('#RECV_CPON2').val()+"-"+$('#RECV_CPON3').val());
						
			// 주문서 등록
			document.getElementById("fregisterform").submit();  */
		});
		
		// 주문취소
		$("#btnCancel").click(function() {
			window.history.back();
		});
		
		//배송시간 defualt
		//fn_dlarGubn();
		fn_dlarTime();
		fn_dlarDate();
	});

	function LPad(digit, size, attatch) {
		var add = "";
		digit = digit.toString();

		if (digit.length < size) {
			var len = size - digit.length;
			for (i = 0; i < len; i++) {
				add += attatch;
			}
		}
		return add + digit;
	}

	function makeoid() {
		var now = new Date();
		var years = now.getFullYear();
		var months = LPad(now.getMonth() + 1, 2, "0");
		var dates = LPad(now.getDate(), 2, "0");
		var hours = LPad(now.getHours(), 2, "0");
		var minutes = LPad(now.getMinutes(), 2, "0");
		var seconds = LPad(now.getSeconds(), 2, "0");
		var timeValue = years + months + dates + hours + minutes + seconds;
		document.getElementById("LGD_OID").value = "test_" + timeValue;
		document.getElementById("LGD_TIMESTAMP").value = timeValue;
	}

	// 배송지정보 구분
	function fn_dlarGubn() {
		//현장출고 [폴라베어기준 안씀]
		if ($("input:radio[name='DLAR_GUBN']:checked").val() == 'DLAR_GUBN_05') {
			$('#dlarGugn5').show();
			$('#dlarGugn1234').hide();
			$('input[name="DLAR_DATE"]').val($('#DLAR_DATE_CHK').val());
		} else {
			$('#dlarGugn5').hide();
			$('#dlarGugn1234').show();
			$('input[name="DLAR_DATE"]').val('');
		}

		// 주문자정보와 동일 추가 (20221027장보라)
		let checkbox = document.getElementById('orderSame'); 	 // 1. checkbox element 찾기
		let is_checked = checkbox.checked;					 // 2. checked 속성을 체크
		if (is_checked == true) {
			$('input[name="DLAR_GUBN"]').val('ORDER_SAME');
		} else {
			$('input[name="DLAR_GUBN"]').val('DLAR_GUBN_01');
		}
		
		//배송지 구분별 배송지정보
		$.ajax({
			type : "POST",
			dataType : 'json',
			url : '${contextPath}/m/order/deliveryAddr.json',
			data : $("#fregisterform").serialize(),
			success : function(data) {
				//최근배송지 또는 받는사람이 없을경우 
				if (data.recv_PERS == "" && $("input:radio[name='DLAR_GUBN']:checked").val() == "DLAR_GUBN_03") {
					alert("주문내역이 없습니다.");
				}
				//초기화
				$('#RECV_TELN1').val("");
				$('#RECV_TELN2').val("");
				$('#RECV_TELN3').val("");
				$('#RECV_CPON1').val("");
				$('#RECV_CPON2').val("");
				$('#RECV_CPON3').val("");

				// 배송지 정보            
				$('#RECV_PERS').val(data.recv_PERS);
				$('#POST_NUM').val(data.post_NUM == '00000' ? '' : data.post_NUM);
				$('#BASC_ADDR').val(data.basc_ADDR != null ? data.basc_ADDR.trim() : "");
				$('#DTL_ADDR').val(data.dtl_ADDR != null ? data.dtl_ADDR.trim() : "");
				$('#RECV_TELN').val(data.recv_TELN);
				$('#RECV_CPON').val(data.recv_CPON);

				if (data.post_NUM != null) {
					fn_addrIsland(data.post_NUM);
				}

				//전화번호
				var recvTeln = data.recv_TELN;
				if (recvTeln) {
					var slRecvTeln = recvTeln.split("-");
					$('#RECV_TELN1').val(slRecvTeln[0]);
					$('#RECV_TELN2').val(slRecvTeln[1]);
					$('#RECV_TELN3').val(slRecvTeln[2]);
				}

				//핸드폰번호
				var recvCpon = data.recv_CPON;
				if (recvCpon) {
					var slRecvCpon = recvCpon.split("-");
					$('#RECV_CPON1').val(slRecvCpon[0]);
					$('#RECV_CPON2').val(slRecvCpon[1]);
					$('#RECV_CPON3').val(slRecvCpon[2]);
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("처리중 에러가 발생했습니다. 관리자에게 문의 하세요.(error:"+ textStatus + ")");
			}
		});
	}

	// 출고&배송시간
	function fn_dlarTime() {
		if ($("input:radio[name='DLAR_GUBN']:checked").val() == 'DLAR_GUBN_05') {
			$('input[name="DLAR_TIME"]').val($('#DLAR_TIME_CHK_01').val());
		} else {
			$('input[name="DLAR_TIME"]').val($('#DLAR_TIME_CHK_02').val());
		}
	}

	// 출고일자 (명일/당일)
	function fn_dlarDate() {
		if ($("input:radio[name='DLAR_GUBN']:checked").val() == 'DLAR_GUBN_05') {
			$('input[name="DLAR_DATE"]').val(
					$(':radio[name="DLAR_DATE_CHK"]:checked').val());
		} else {
			$('input[name="DLAR_DATE"]').val('');
		}
	}

	// 배송비쿠폰 체크
	function fn_deli_calculate() {
		var orderSum = parseInt($("#ORDER_SUM").val()); //주문금액
		var dlva_fcon = $
		{
			supplierInfo.DLVA_FCON
		}
		; //무료배송금액
		var cponCnt = parseInt($("#DLVY_CPON").val()); //배송비쿠폰 갯수
		var dlvyAmt = ${supplierInfo.DLVY_AMT}; //기본 배송비
		var dlvyAdd = ${addShipping}; //추가 배송비
		var zipcode = $("#POST_NUM").val()

		if (zipcode.length < 1) {
			alert("배송주소를 먼저 입력해주세요.");
			return;
		}

		if (addr_Island(zipcode)) {
			dlvyAmt = dlvyAmt + dlvyAdd;
		}

		//주문금액별 무료배송 체크
		if (orderSum > dlva_fcon) {
			alert("이미 무료배송 상태입니다.");
			$("input:checkbox[name='CPON_YN']").prop("checked", false);
			return;
		} else {
			//체크박스선택여부
			if ($("input:checkbox[name='CPON_YN']").is(":checked")) {
				$("#CPON_YN").val("Y");

				if (cponCnt > 0) {
					dlvyAmt = 0;
				} else {
					alert("사용가능한 배송쿠폰이 없습니다." + cponCnt);
					$("input:checkbox[name='CPON_YN']").prop("checked", false);
					return;
				}
			} else {
				$("input:checkbox[name='CPON_YN']").prop("checked", false);
				$("#CPON_YN").val("N");
			}
		}

		var totAmt = orderSum + dlvyAmt; // 총금액

		$("#tdTotAmt").text(number_format(String(totAmt)) + "원");
		$("#devy_amt").text(number_format(String(dlvyAmt)) + "원");
		$("#ORDER_AMT").val(totAmt);
		//$("#DLVY_CPON").val(cponCnt);
		$("#DLVY_AMT").val(dlvyAmt);

		fn_calculPv(totAmt, 10);
	}

	/* 도서산간 배송비 계산 */
	function fn_addrIsland(zipcode) {
		// 도서산간 지역일 경우
		if (addr_Island(zipcode)) {
			// 추가 배송비 세팅
			var dlvyAdd = $
			{
				addShipping
			}
			;
			var orderSum = parseInt($("#ORDER_SUM").val()); //주문금액
			var dlvyAmt = $
			{
				supplierInfo.DLVY_AMT
			}
			; //배송비

			var totAmt = orderSum + dlvyAmt + dlvyAdd;

			$("#tdTotAmt").text(number_format(String(totAmt)) + "원");
			$("#devy_amt").text(number_format(String(dlvyAmt + dlvyAdd)) + "원");
			$("#ORDER_AMT").val(totAmt);
			$("#DLVY_AMT").val(dlvyAmt + dlvyAdd);

			alert('도서산간지역은 추가배송비 ' + dlvyAdd + '원이 발생합니다.');

			fn_calculPv(totAmt, 10);
		}
	}

	function fn_calculPv(total, pvn) {
		var $pv = $
		{
			PV
		}
		;
		var pvtotal = Math.floor((total * $pv) / pvn) * pvn;

		$("#tdPvAmt").text(number_format(String(pvtotal)));
	}
</script>

<c:set var="strActionUrl" value="${contextPath }/order" />
<c:set var="strMethod" value="post" />

<!-- //Main Container -->
<div class="wrapper">
	<div class="container">
		<form method="post" name="fregisterform" id="fregisterform" action="${contextPath }/m/order/insert">
			<!-- 기존소스 -->
			<input type="hidden" id="ORDER_NUM" name="ORDER_NUM" value="${orderNum }" />


			<c:set var="devy_amt" value="0" />
			<c:if test="${ tot_amt < supplierInfo.DLVA_FCON }">
				<c:set var="devy_amt" value="${supplierInfo.DLVY_AMT }" />
			</c:if>
			<c:if test="${ tot_amt >= supplierInfo.DLVA_FCON }">
				<c:set var="devy_amt" value="0" />
			</c:if>
			<input type="hidden" id="DAP_YN" name="DAP_YN" value="Y" />
			<!-- 모두 선불로 통일 20180516 -->
			<fmt:parseNumber var="pv_amt" value="${ pv_round * 10 }" integerOnly="true" />
			<div class="text-right" style="display: none" id="tdPvAmt">${ pv_amt }</div>

			<!-- 기존소스 -->
			<div class="page-mycart">
				<div class="titbox">
					<div class="tit">주문결제</div>
					<div class="step">
						<ul>
							<li class="step1"><i class="ic"></i><span>장바구니</span></li>
							<li class="step2 on"><i class="ic"></i><span>주문결제</span></li>
							<li class="step3"><i class="ic"></i><span>결제완료</span></li>
						</ul>
					</div>
				</div>
				<div class="cntbox">
					<div class="order">
						<div class="order-address">
							<fieldset id="address" class="required">
								<div class="order-title">배송지정보</div>
								<div class="order-tabs">
									<ul>
										<li class="DLAR_GUBN on"><a href="#">기본배송지</a></li>
										<li class="DLAR_GUBN"><a href="#">신규 배송지</a></li>
									</ul>
								</div>
								<div class="order-info">
									<div class="order-same">
										<input type="checkbox" id="orderSame" onclick="fn_dlarGubn()"><label for="orderSame">주문자정보와 동일</label>
									</div>
									<dl class="order-desc required">
										<dt>
											수령자 <i class="required">*</i>
										</dt>
										<dd>
											<input type="text" name="RECV_PERS" id="RECV_PERS" class="form-control" placeholder="수령자명 입력" value="">
										</dd>
									</dl>
									<dl class="order-desc required">
										<dt>
											연락처 <i class="required">*</i>
										</dt>
										<dd>
											<input type="text" name="RECV_CPON1" value="" id="RECV_CPON1" required class="form-control input-sm" style="width: 60px; display: inline-block;" maxlength="3">&nbsp;-&nbsp;
											<input type="text" name="RECV_CPON2" value="" id="RECV_CPON2" required class="form-control input-sm" style="width: 70px; display: inline-block;" maxlength="4">&nbsp;-&nbsp;
											<input type="text" name="RECV_CPON3" value="" id="RECV_CPON3" required class="form-control input-sm" style="width: 70px; display: inline-block;" maxlength="4">
										</dd>
									</dl>
									<dl class="order-desc required">
										<dt>
											주소 <i class="required">*</i>
										</dt>
										<dd>
											<input type="hidden" name="COM_EXTRA_ADDR" value="" id="COM_EXTRA_ADDR" class="form-control"> 
											<input type="hidden" name="COM_ALL_ADDR" value="" id="COM_ALL_ADDR" class="form-control"> 
											<span class="required">
												<input type="text" class="form-control" name="POST_NUM" id="POST_NUM" style="background: white;" value="" placeholder="우편번호" size="5" maxlength="6" required readonly>
												<button type="button" class="order-address-btn" onclick="win_zip_island('fregisterform', 'POST_NUM', 'BASC_ADDR', 'DTL_ADDR', 'COM_EXTRA_ADDR', 'COM_ALL_ADDR');">주소검색</button>
												<input type="checkbox" id="order-basic-addr" onclick="basicAddress()"><label for="order-basic-addr">기본 배송지로 등록</label>
											</span> 
											<span class="required">
												<input type="text" name="BASC_ADDR" value="" id="BASC_ADDR" style="background: white;" required readonly="readonly" class="form-control" placeholder="기본주소" maxlength="100">
											</span>
											<span class="required">
												<input type="text" name="DTL_ADDR" value="" id="DTL_ADDR" required class="form-control" placeholder="상세주소" maxlength="100">
											</span>
										</dd>
									</dl>
									<dl class="order-desc">
										<dt>배송 메시지</dt>
										<dd>
											<select onchange="mDelivery(this.value)">
												<option value="배송 메시지를 선택해 주세요">배송 메시지를 선택해 주세요</option>
												<option value="문 앞에 두고 가주세요">문 앞에 두고 가주세요</option>
												<option value="문 앞에 두고 벨 눌러주세요">문 앞에 두고 벨 눌러주세요</option>
												<option value="">직접입력</option>
											</select> 
											<input type="text" id="directInput" style="display: none;" placeholder="직접입력" />
										</dd>
									</dl>
								</div>
								<div style='display: none;'>
									<div class="form-group">
										<div>
											<label class="radio-inline"> 
												<input type="radio" id="DLAR_GUBN1" name="DLAR_GUBN" value="DLAR_GUBN_01" onchange="javascript:fn_dlarGubn();" checked="checked" />자택
											</label> 
											<label class="radio-inline"> 
												<input type="radio" id="DLAR_GUBN4" name="DLAR_GUBN" value="DLAR_GUBN_04" onchange="javascript:fn_dlarGubn();" />신규
											</label>
											<!-- 배송비쿠폰 -->
											<c:if test="${mbinfo.DLVY_CPON > 0 and tot_amt < supplierInfo.DLVA_FCON}">
												<label class="radio-inline pull-right"> 
													<input type="checkbox" name="CPON_YN" value="N" id="CPON_YN" onclick="fn_deli_calculate()"> <b>배송비쿠폰사용</b> 
													<input type="hidden" id="DLVY_CPON" name="DLVY_CPON" value="${mbinfo.DLVY_CPON}" />
												</label>
											</c:if>
										</div>
									</div>
									<div class="form-group required">
										<label for="POST_NUM" class="control-label">우편번호</label> 
											<input type="hidden" name="COM_EXTRA_ADDR" value="" id="COM_EXTRA_ADDR"> <input type="hidden" name="COM_ALL_ADDR" value="" id="COM_ALL_ADDR">
										<div class="form-inline">
											<div class="input-group">
												<span class="input-group-btn"> 
													<input type="button" class="btn btn-primary" value="주소검색" onclick="win_zip_island('fregisterform', 'POST_NUM', 'BASC_ADDR', 'DTL_ADDR', 'COM_EXTRA_ADDR', 'COM_ALL_ADDR');">
												</span>
											</div>
										</div>
									</div>
									<div class="form-group required">
										<label for="BASC_ADDR" class="control-label">기본주소</label>
									</div>
									<div class="form-group required">
										<label for="DTL_ADDR" class="control-label">상세주소</label>
									</div>
									<div class="form-group">
										<label for="RECV_TELN1" class="control-label">전화번호</label>
										<div class="form-inline">
											<input type="hidden" name="RECV_TELN" value="" id="RECV_TELN" required class="form-control input-sm" maxlength="15">
											<input type="text" name="RECV_TELN1" value="" id="RECV_TELN1" required class="form-control input-sm" style="width: 50px; display: inline-block;" maxlength="3">&nbsp;-&nbsp;
											<input type="text" name="RECV_TELN2" value="" id="RECV_TELN2" required class="form-control input-sm" style="width: 50px; display: inline-block;" maxlength="4">&nbsp;-&nbsp;
											<input type="text" name="RECV_TELN3" value="" id="RECV_TELN3" required class="form-control input-sm" style="width: 50px; display: inline-block;" maxlength="4">
										</div>
									</div>
									<div class="form-group required">
										<label for="RECV_CPON1" class="control-label">휴대폰번호</label>
										<div class="form-inline">
											<input type="hidden" name="RECV_CPON" value="" id="RECV_CPON" required class="form-control input-sm" maxlength="15">
											<input type="text" name="RECV_CPON1" value="" id="RECV_CPON1" required class="form-control input-sm" style="width: 50px; display: inline-block;" maxlength="3">&nbsp;-&nbsp;
											<input type="text" name="RECV_CPON2" value="" id="RECV_CPON2" required class="form-control input-sm" style="width: 50px; display: inline-block;" maxlength="4">&nbsp;-&nbsp;
											<input type="text" name="RECV_CPON3" value="" id="RECV_CPON3" required class="form-control input-sm" style="width: 50px; display: inline-block;" maxlength="4">
										</div>
									</div>
									<div class="form-group">
										<label for="DLVY_MSG" class="control-label">배송 메세지</label>
										<textarea id="DLVY_MSG" name="DLVY_MSG" rows="2"class="form-control"></textarea>
									</div>
									<div class="form-group" id="dlarGugn5">
										<label for="DLAR_TIME_CHK_01" class="control-label">출고시간</label>
										<div class="form-inline">
											<label class="radio-inline"> 
												<input type="radio" id="DLAR_DATE_CHK" name="DLAR_DATE_CHK" value="DLAR_DATE_01" checked="checked" onchange="javascript:fn_dlarDate();" />명일
											</label> 
											<label class="radio-inline"> 
												<input type="radio" id="DLAR_DATE_CHK" name="DLAR_DATE_CHK" value="DLAR_DATE_02" onchange="javascript:fn_dlarDate();" />당일
											</label> &nbsp;&nbsp;&nbsp; 
											<select id="DLAR_TIME_CHK_01" class="form-control" onchange="javascript:fn_dlarTime();">
												<option value="nothing">선택</option>
												<option value="PM 1시~2시">PM 1시~2시</option>
												<option value="PM 2시~3시">PM 2시~3시</option>
												<option value="PM 3시~4시">PM 3시~4시</option>
												<option value="PM 4시~6시">PM 4시~6시</option>
											</select>
										</div>
									</div>
								</div>
							</fieldset>
						</div>
						<div class="order-payment">
							<div class="order-title">결제수단 선택</div>
							<div class="order-tabs">
								<div class="order-radio">
									<span>
										<input type="radio" id="PAY_METD1" name="PAY_METD" checked value="SC0010">
										<label for="PAY_METD1">신용카드</label>
									</span>
									<span>
										<input type="radio" id="PAY_METD2" name="PAY_METD"value="SC0030">
										<label for="PAY_METD2">계좌이체</label>
									</span> 
									<span>
										<input type="radio" id="PAY_METD3" name="PAY_METD" value="SC0060">
										<label for="PAY_METD3">휴대폰결제</label>
									</span>
									<!-- <span><input type="radio" id="PAY_METD4" name="PAY_METD" value="SC0040"><label for="PAY_METD4">가상계좌<small>(무통장입금)</small></label></span> -->
									<%-- <span><input type="radio" id="PAY_METD5" name="PAY_METD" value="SC0111"><label for="PAY_METD5"><img src="${contextPath}/resources/resources2/images/icon_payment05.png" alt=""><span class="skip">대덕이로</span></label></span> --%>
									<!-- <span><input type="radio" id="PAY_METD5" name="PAY_METD" value="SC0111"><label for="PAY_METD5">지역화폐</label></span> -->
								</div>
							</div>


							<div id="documentType" style="display: none;">
								<br>
								<hr>
								<span>증빙 서류</span> <br> <br>

								<div>
									<input type="checkbox" id="ApplicationDocumentsType1"name="APPLICATIONDOCUMENTSTYPE" value="현금영수증">
									<label for="ApplicationDocumentsType1">현금영수증 신청</label> 
									<input type="checkbox" id="ApplicationDocumentsType2" name="APPLICATIONDOCUMENTSTYPE" value="세금계산서">
									<label for="ApplicationDocumentsType2">세금계산서 신청</label> 
									<input type="checkbox" id="ApplicationDocumentsType3" name="APPLICATIONDOCUMENTSTYPE" checked value="N">
									<label for="ApplicationDocumentsType3">신청안함</label>
								</div>


								<!-- 현금영수증 신청  -->
								<div id="documentType1" style="display: none;">
									<div>
										<input type="checkbox" id="deductionorProofbusiness1" name="DEDUCTIONORPROOFBUSINESS" value="개인소득공제" checked>
										<label for="deductionorProofbusiness1">개인소득공제용</label> 
										<input type="checkbox" id="deductionorProofbusiness2" name="DEDUCTIONORPROOFBUSINESS" value="사업자증빙">
										<label for="deductionorProofbusiness2">사업자증빙용</label>
									</div>
									<!-- 개인소득공제용 -->
									<div id="documentType1_1">
										휴대폰번호 
										<input type="text" id="" name="PNUM_CASHRECEIPT_1" value="" maxlength="3" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">-
										<input type="text" id="" name="PNUM_CASHRECEIPT_2" value="" maxlength="4" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">-
										<input type="text" id="" name="PNUM_CASHRECEIPT_3" value="" maxlength="4" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
									</div>
									<!-- 사업자증빙용 -->
									<div id="documentType1_2" style="display: none;">
										사업자번호 
										<input type="text" id="" name="COMPUNYNUM_CASHRECEIPT_1" value="" maxlength="3" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">-
										<input type="text" id="" name="COMPUNYNUM_CASHRECEIPT_2" value="" maxlength="2" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">-
										<input type="text" id="" name="COMPUNYNUM_CASHRECEIPT_3" value="" maxlength="5" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
									</div>
								</div>


								<!-- 세금계산서 신청 -->
								<div id="documentType2" class="TaxBillForm"
									style="display: none;">
									<table class="TaxBillTableCss">
										<tr>
											<th style="width: 20%">사업자등록번호</th>
											<td colspan="3">
												<input type="text" name="INVOICEECORPNUM_TAXINVOICE" placeholder="-포함하여 입력" maxlength="12">
											</td>
										</tr>
										<tr>
											<th>회사명</th>
											<td>
												<input type="text"name="INVOICEECORPNAME_TAXINVOICE">
											</td>
											<th>대표자명</th>
											<td>
												<input type="text" style="width: 100%" name="INVOICEECEONAME_TAXINVOICE">
											</td>
										</tr>
										<tr>
											<th>우편번호</th>
											<td colspan="3">
												<input type="text" name="POSTALCODE_TAXINVOICE" id="POSTALCODE_TAXINVOICE" readonly="readonly">
												<button type="button" class="order-address-btn" onclick="win_zip_island('fregisterform', 'POSTALCODE_TAXINVOICE', 'ADDR1', 'ADDR2', 'ADDR3', 'ADDR4');">주소검색</button>
											</td>
										</tr>
										<tr>
											<th>사업장 주소</th>
											<td colspan="3">
												<input type="text" style="width: 100%" name="ADDR1" id="ADDR1" readonly="readonly">
											</td>
										</tr>
										<tr>
											<th>상세주소</th>
											<td colspan="3">
												<input type="text" style="width: 100%" name="ADDR2" id="ADDR2">
											</td>
										</tr>
										<tr>
											<th>업태</th>
											<td>
												<input type="text" name="INVOICEEBIZTYPE_TAXINVOICE">
											</td>
											<th>업종</th>
											<td>
												<input type="text" style="width: 100%" name="INVOICEEBIZCLASS_TAXINVOICE">
											</td>
										</tr>
										<tr>
											<th>담당자명</th>
											<td colspan="3">
												<input type="text" name="INVOICEECONTACTNAME_TAXINVOICE">
											</td>
										</tr>
										<tr>
											<th>담당자 이메일</th>
											<td colspan="3">
												<input type="text" style="width: 30%" name="INVOICEEEMAIL_TAXINVOICE1" id="INVOICEEEMAIL_TAXINVOICE1">&nbsp;&nbsp;@&nbsp;&nbsp;
												<input type="text" style="width: 30%" name="INVOICEEEMAIL_TAXINVOICE2" id="INVOICEEEMAIL_TAXINVOICE2"> 
												<select id="emailaddress" name="emailaddress" onChange="email_change()">
													<option value="" selected>선택하세요</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="gmail.com">gmail.com</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="nate.com">nate.com</option>
													<option value="1">직접입력</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>담당자 전화번호</th>
											<td colspan="3">
												<select style="width: 15%" name="top_phone_num" id="top_phone_num" onChange="phone_change()">
													<option value="" selected>선택하세요</option>
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="018">018</option>
													<option value="019">019</option>
													<option value="1">직접입력</option>
												</select>
											 	<input type="text" style="width: 20%" name="INVOICEETEL_TAXINVOICE1" id="INVOICEETEL_TAXINVOICE1" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">&nbsp;-&nbsp;
												<input type="text" style="width: 20%" name="INVOICEETEL_TAXINVOICE2" id="INVOICEETEL_TAXINVOICE2" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">&nbsp;-&nbsp;
												<input type="text" style="width: 20%" name="INVOICEETEL_TAXINVOICE3" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					<input type="hidden" id="INVOICEEADDR_TAXINVOICE" name="INVOICEEADDR_TAXINVOICE">
					<div class="total">
						<div class="box">
							<div class="tit">주문상품 정보</div>
							<div class="gds">
								<ul>
									<!-- 추가상품 -->
									<c:set var="extra_order_qty" value="0" />
									<c:set var="extra_tot_amt" value="0" />
									<c:forEach items="${extra.list}" var="ent">
										<c:if test="${!empty param.ORDER_QTY }">
											<c:set var="extra_order_qty" value="${ param.ORDER_QTY}" />
										</c:if>
										<c:set var="pd_cut_seq" value="${ent.PD_CUT_SEQ}" />
										<c:set var="option_code" value="${ent.OPTION_CODE}" />
										<c:if test="${!empty param.PD_CUT_SEQ }">
											<c:set var="pd_cut_seq" value="${ param.PD_CUT_SEQ}" />
										</c:if>
										<c:if test="${!empty param.OPTION_CODE }">
											<c:set var="option_code" value="${ param.OPTION_CODE}" />
										</c:if>
										<li>
											<a href="${contextPath }/m/product/view/${ ent.PD_CODE }" target="_blank"> 
												<%-- <c:if test='${empty ent.IMGURL}'>
													<c:set var="imgPath" value="${contextPath }/common/commonImgFileDown?ATFL_ID=${ent.ATFL_ID}&ATFL_SEQ=${ent.RPIMG_SEQ}&IMG_GUBUN=mainType1" />
														<div class="img">
															<img src="${imgPath}" alt="">${ent.ATFL_ID}/${ent.RPIMG_SEQ}
														</div>
												</c:if> 
												<c:if test='${!empty ent.IMGURL }'>
													<img src="${ent.IMGURL }" alt="">
												</c:if> --%>
												<c:if test="${ !empty(ent.ATFL_ID)  }">
				                                    <c:if test="${ent.FILEPATH_FLAG eq mainKey }">
				                                        <c:set var="imgPath" value="${contextPath }/upload/${ent.STFL_PATH }/${ent.STFL_NAME }" />
				                                    </c:if>
				                                    
				                                    <c:if test="${!empty(ent.FILEPATH_FLAG) && ent.FILEPATH_FLAG ne mainKey }">
				                                        <c:set var="imgPath" value="${ent.STFL_PATH }" />
				                                    </c:if>
				                                    
				                                    <c:if test="${ empty(ent.FILEPATH_FLAG) }">
				                                        <c:set var="imgPath" value="https://www.cjfls.co.kr/upload/${ent.STFL_PATH }/${ent.STFL_NAME }" />
				                                    </c:if>
				                                </c:if>
				                                <c:if test="${ !empty(ent.IMGURL) }">
													<c:set var="imgPath" value="${ent.IMGURL }" />
												</c:if>
				                                <c:if test="${ empty(ent.ATFL_ID) && empty(ent.IMGURL) }">
				                                    <c:set var="imgPath" value="${contextPath }/resources/images/mall/goods/noimage_270.png" />
				                                </c:if>
												<div class="con">
													<div class="tit">${ent.PD_NAME }</div>
													<div class="opt">
														<span> 
															<fmt:formatNumber value="${ent.PD_PRICE}" />원 <!-- 상품가격 -->
														</span> 
														<span> 
															<c:set var="extra_order_qty" value="${ent.ORDER_QTY}" /> <!-- 추가상품갯수 -->
															${ent.ORDER_QTY }개
														</span> 
														<span> 
															<fmt:formatNumber value="${ent.PD_PRICE * extra_order_qty }" />원 <!-- 상품가격* 갯수  -->
														</span>
														<br>
													</div>
												</div>
											</a>
										</li>
										<!-- 결제금액계산  -->
										<c:set var="extra_tot_amt" value="${extra_order_qty * ent.PD_PRICE }" />
										<!-- 총 추가상품의 금액 -->

										<input type="hidden" name="ORDER_SUM" value="${extra_tot_amt}" />
										<!-- 주문금액 함 -->
										<input type="hidden" name="ORDER_AMT" value="${extra_tot_amt+devy_amt}" />
										<!-- 총 추가상품의 금액 -->
										<!-- 상품 옵션 -->
										<input type="hidden" name="OPTION1_NAMES" value="${ent.OPTION1_NAME }">
										<input type="hidden" name="OPTION1_VALUES" value="${ent.OPTION1_VALUE}" />
										<input type="hidden" name="OPTION2_NAMES" value="${ent.OPTION2_NAME }">
										<input type="hidden" name="OPTION2_VALUES" value="${ent.OPTION2_VALUE}" />
										<input type="hidden" name="OPTION3_NAMES" value="${ent.OPTION3_NAME }">
										<input type="hidden" name="OPTION3_VALUES" value="${ent.OPTION3_VALUE}" />
										<!-- 상품 정보 -->
										<input type="hidden" name="BSKT_REGNO" value="${ent.BSKT_REGNO }">
										<!-- 장바구니 번호 -->
										<input type="hidden" name="PD_CODES" value="${ent.PD_CODE}">
										<!-- 상품코드 -->
										<input type="hidden" name="PD_NAMES" value="${ent.PD_NAME}" />
										<!-- 상품이름 -->
										<input type="hidden" name="PD_PRICES" value="${ent.PD_PRICE}" />
										<!-- 상품가격 -->
										<input type="hidden" name="ORDER_QTYS" value="${extra_order_qty}" />
										<!-- 상품수량 -->
										<input type="hidden" name="ORDER_AMTS" value="${extra_order_qty * ent.PD_PRICE}" />
										<!-- 상품금액(수량*금액) -->
										<!-- 그외  -->
										<input type="hidden" name="PD_CUT_SEQS" value="${ent.PD_CUT_SEQ}" />
										<!-- 셀제방식 -->
										<input type="hidden" name="PD_CUT_SEQS" value="${pd_cut_seq}" />
										<!-- 셀제방식 -->
										<input type="hidden" name="OPTION_CODES" value="${option_code}" />
										<input type="hidden" name="BOX_PDDC_GUBNS" value="${ent.BOX_PDDC_GUBN}" />
										<!-- 박스할인방식 -->
										<input type="hidden" name="BOX_PDDC_VALS" value="${ent.BOX_PDDC_VAL}" />
										<!-- 박스할인값 -->
										<input type="hidden" name="INPUT_CNTS" value="${ent.INPUT_CNT}" />
										<!-- 상품입수량 -->
										<c:choose>
											<c:when test="${ !empty(ent.SETPD_CODE) }">
												<input type="hidden" name="SETPD_CODES" value="${ent.SETPD_CODE}" />
												<!-- 묶음상품코드 -->
											</c:when>
											<c:otherwise>
												<input type="hidden" name="SETPD_CODES" value="${SETPD_CODE}" />
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${ !empty(ent.DLVY_AMT) }">
												<input type="hidden" id="DLVY_AMTS" name="DLVY_AMTS" value="${ent.DLVY_AMT}" />
											</c:when>
											<c:otherwise>
												<input type="hidden" id="DLVY_AMTS" name="DLVY_AMTS" value="0" />
											</c:otherwise>
										</c:choose>
										<c:set var="extra_order_qty_sum" value="${extra_order_qty_sum + extra_order_qty}" />
										<c:set var="extra_tot_amt_sum" value="${extra_tot_amt_sum + extra_tot_amt}" />
									</c:forEach>
									<c:set var="extra_tot_amt_sum" value="${extra_tot_amt_sum}" />

									<!-- #############################메인상품 (옵션포함)################################################################### -->
									<c:set var="tot_amt" value="0" />
									<c:set var="order_qty_detail" value="0" />
									<c:forEach items="${obj.list }" var="list" varStatus="loop">
										<c:set var="order_qty_detail" value="${list.ORDER_QTY}" />
										<c:if test="${!empty param.ORDER_QTY }">
											<c:set var="order_qty_detail" value="${ param.ORDER_QTY}" />
										</c:if>
										<c:set var="pd_cut_seq" value="${list.PD_CUT_SEQ}" />
										<c:set var="option_code" value="${list.OPTION_CODE}" />
										<c:if test="${!empty param.PD_CUT_SEQ }">
											<c:set var="pd_cut_seq" value="${ param.PD_CUT_SEQ}" />
										</c:if>
										<c:if test="${!empty param.OPTION_CODE }">
											<c:set var="option_code" value="${ param.OPTION_CODE}" />
										</c:if>
										<li>
											<a href="${contextPath }/m/product/view/${ list.PD_CODE }" target="_blank">
												<c:if test="${ !empty(list.ATFL_ID)  }">
				                                    <c:if test="${list.FILEPATH_FLAG eq mainKey }">
				                                        <c:set var="imgPath" value="${contextPath }/upload/${list.STFL_PATH }/${list.STFL_NAME }" />
				                                    </c:if>
				                                    
				                                    <c:if test="${!empty(list.FILEPATH_FLAG) && list.FILEPATH_FLAG ne mainKey }">
				                                        <c:set var="imgPath" value="${list.STFL_PATH }" />
				                                    </c:if>
				                                    
				                                    <c:if test="${ empty(list.FILEPATH_FLAG) }">
				                                        <c:set var="imgPath" value="https://www.cjfls.co.kr/upload/${list.STFL_PATH }/${list.STFL_NAME }" />
				                                    </c:if>
				                                </c:if>
				                                <c:if test="${ !empty(list.IMGURL) }">
													<c:set var="imgPath" value="${list.IMGURL }" />
												</c:if>
				                                <c:if test="${ empty(list.ATFL_ID) && empty(list.IMGURL) }">
				                                    <c:set var="imgPath" value="${contextPath }/resources/images/mall/goods/noimage_270.png" />
				                                </c:if>
												<div class="img">
													<%-- <c:set var="imgPath" value="${contextPath }/common/commonImgFileDown?ATFL_ID=${list.ATFL_ID}&ATFL_SEQ=${list.RPIMG_SEQ}&IMG_GUBUN=mainType1" /> --%>
													<img src="${imgPath}" alt="">
												</div> 
												<%--<c:set var="imgPath" value="${contextPath }/common/commonImgFileDown?ATFL_ID=${list.ATFL_ID}&ATFL_SEQ=${list.RPIMG_SEQ}&IMG_GUBUN=mainType1" />
                               						<c:set var="imgPathSm" value="${contextPath }/upload/${list.ATFL_ID }/${list.RPIMG_SEQ}" />
                                 				 	<div class="img">
                                 				 		<img src="${imgPath}" alt="">${list.ATFL_ID}/${list.RPIMG_SEQ}
                                 				 	</div> --%>
												<div class="con">
													<div class="tit">${list.PD_NAME }</div>
													<c:if test="${!empty list.OPTION1_NAME} ">
														<div class="txt">${list.OPTION1_NAME} : ${list.OPTION1_VALUE} ${list.OPTION2_NAME} : ${list.OPTION2_VALUE}</div>
													</c:if>
													<div class="opt">
														<span>
															<fmt:formatNumber value="${list.REAL_PRICE}" />원
														</span>
														<span>
															${order_qty_detail}개
														</span> 
														<span> 
															<fmt:formatNumber value="${list.REAL_PRICE*order_qty_detail }" />원
														</span>
														<br>
													</div>
													<div>
														<span style="font-size: 13px; color: gray; display: block">
															<c:if test="${!empty list.OPTION1_VALUE }"> ${list.OPTION1_NAME } : ${list.OPTION1_VALUE } </c:if> 
															<c:if test="${!empty list.OPTION2_VALUE }"> / ${list.OPTION2_NAME } : ${list.OPTION2_VALUE } </c:if> 
															<c:if test="${!empty list.OPTION3_VALUE }"> / ${list.OPTION3_NAME } : ${list.OPTION3_VALUE } </c:if>
														</span>
													</div>
												</div>
											</a>
										</li>
										<c:set var="tot_amt" value="${tot_amt + (order_qty_detail * list.REAL_PRICE)}" />
										<input type="hidden" id="ORDER_SUM" name="ORDER_SUM" value="${tot_amt}" />
										<!-- 주문금액 함 -->
										<input type="hidden" id="ORDER_AMT" name="ORDER_AMT" value="${tot_amt + devy_amt}" />
										<!-- 결제금액 -->
										<input type="hidden" id="OPTION1_NAMES" name="OPTION1_NAMES" value="${list.OPTION1_NAME }">
										<input type="hidden" id="OPTION1_VALUES" name="OPTION1_VALUES" value="${list.OPTION1_VALUE}" />
										<input type="hidden" id="OPTION2_NAMES" name="OPTION2_NAMES" value="${list.OPTION2_NAME }">
										<input type="hidden" id="OPTION2_VALUES" name="OPTION2_VALUES" value="${list.OPTION2_VALUE}" />
										<input type="hidden" id="OPTION3_NAMES" name="OPTION3_NAMES" value="${list.OPTION3_NAME }">
										<input type="hidden" id="OPTION3_VALUES" name="OPTION3_VALUES" value="${list.OPTION3_VALUE}" />
										<input type="hidden" id="BSKT_REGNO" name="BSKT_REGNO" value="${list.BSKT_REGNO }">
										<input type="hidden" id="PD_CODES" name="PD_CODES" value="${list.PD_CODE }">
										<input type="hidden" id="PD_NAMES" name="PD_NAMES" value="${list.PD_NAME}" />
										<input type="hidden" id="PD_PRICES" name="PD_PRICES" value="${list.REAL_PRICE}" />
										<input type="hidden" id="ORDER_QTYS" name="ORDER_QTYS" value="${order_qty_detail}" />
										<input type="hidden" id="ORDER_AMTS" name="ORDER_AMTS" value="${order_qty_detail * list.REAL_PRICE}" />
										<input type="hidden" id="PD_CUT_SEQS" name="PD_CUT_SEQS" value="${list.PD_CUT_SEQ}" />
										<input type="hidden" id="PD_CUT_SEQS" name="PD_CUT_SEQS" value="${pd_cut_seq}" />
										<input type="hidden" id="OPTION_CODES" name="OPTION_CODES" value="${option_code}" />
										<input type="hidden" id="BUNDLE_CNTS" name="BUNDLE_CNTS" value="${list.BUNDLE_CNT}" />
										<input type="hidden" id="BOX_PDDC_GUBNS" name="BOX_PDDC_GUBNS" value="${list.BOX_PDDC_GUBN}" />
										<input type="hidden" id="BOX_PDDC_VALS" name="BOX_PDDC_VALS" value="${list.BOX_PDDC_VAL}" />
										<input type="hidden" id="INPUT_CNTS" name="INPUT_CNTS" value="${list.INPUT_CNT}" />
										<c:choose>
											<c:when test="${ !empty(list.SETPD_CODE) }">
												<input type="hidden" name="SETPD_CODES" value="${list.SETPD_CODE}" />
												<!-- 묶음상품코드 -->
											</c:when>
											<c:otherwise>
												<input type="hidden" name="SETPD_CODES" value="${SETPD_CODE}" />
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${ !empty(list.DLVY_AMT) }">
												<input type="hidden" id="DLVY_AMTS" name="DLVY_AMTS" value="${list.DLVY_AMT}" />
											</c:when>
											<c:otherwise>
												<c:if test="${ !empty(obj.DLVY_AMT) }">
													<input type="hidden" id="DLVY_AMTS" name="DLVY_AMTS" value="${obj.DLVY_AMT}" />
												</c:if>
												<c:if test="${ empty(obj.DLVY_AMT) }">
													<input type="hidden" id="DLVY_AMTS" name="DLVY_AMTS" value="0" />
												</c:if>
											</c:otherwise>
										</c:choose>
										<c:set var="order_qty" value="${order_qty+order_qty_detail }" />
									</c:forEach>
									<input type="hidden" name="TOTAL_PRICE" value="${tot_amt +extra_tot_amt_sum+ obj.DLVY_AMT }" />
								</ul>
							</div>
							<div class="txt">
								<dl class="sum" style="height: 50px; margin-top: 10px;">
									<dt>총 건수</dt>
									<dd>${order_qty +  extra_order_qty_sum}<em>건</em>
									</dd>
								</dl>
							</div>
							<div class="box">
								<div class="tit">최종결제 정보</div>
								<div class="txt">
									<dl>
										<dt>상품금액</dt>
										<dd>
											<fmt:formatNumber value="${tot_amt+ extra_tot_amt_sum}" />
											<em>원</em>
										</dd>
									</dl>
									<c:if test="${ order_qty * list.PD_PRICE < supplierInfo.DLVA_FCON }">
										<c:set var="devy_amt" value="0" />
									</c:if>
									<c:if test="${ order_qty * list.REAL_PRICE >= supplierInfo.DLVA_FCON }">
										<c:set var="devy_amt" value="${devy_amt+3000 }" />
									</c:if>
									<dl>
										<dt id="devy_amt">배송비</dt>
										<dd id="devy_amt_text" name="devy_amt_text">
											<fmt:formatNumber value="${obj.DLVY_AMT}" /><em>원</em>
										</dd>
									</dl>
									<input type="hidden" id="devy_tot" value="${obj.DLVY_AMT }">
									<dl class="sum">
										<dt>전체 주문금액</dt>
										<dd id="tdTotAmt">
											<fmt:formatNumber value="${tot_amt+extra_tot_amt_sum + obj.DLVY_AMT }" />
											<em>원</em>
										</dd>
									</dl>
									<input type="hidden" id="totAmt" value="${tot_amt + extra_tot_amt_sum+ obj.DLVY_AMT }" /> 
									<input type="hidden" id="DLVY_AMT" name="DLVY_AMT" value="${obj.DLVY_AMT }" />
									<!-- 배송비 -->
								</div>
								<div class="act">
									<a href="#" id="btnSave">결제하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
		</form>
	</div>
</div>



<script>
	$(".DLAR_GUBN").on('click', function() {
		$(".DLAR_GUBN").removeClass('on');
		$(this).addClass('on');
		if ($(this).text() == '기본배송지') {
			$("#DLAR_GUBN1").click();
		} else {
			$("#DLAR_GUBN4").click();
		}
	})

	function pay() {
		// var clientKey = 'test_ck_jZ61JOxRQVEKkBDzyZR8W0X9bAqw'
		var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
		var tossPayments = TossPayments(clientKey)
		var orderName = ''
		var userName = '${USER.MEMB_NAME}'.trim()
		var orderId = $("#ORDER_NUM").val();
		var paymentType = $("input[name='PAY_METD']:checked").val();

		console.log(clientKey);
		console.log(tossPayments);
		console.log(userName);
		console.log(orderId);
		console.log(paymentType);

		if (paymentType == "SC0111") {
			alert("지역화폐 결제 서비스 준비중입니다.");
			return;
		}

		switch (paymentType) {
		case 'SC0010':
			paymentType = '카드';
			break;
		case 'SC0030':
			paymentType = '계좌이체';
			break;
		case 'SC0060':
			paymentType = '휴대폰';
			break;
		case 'SC0040':
			paymentType = '가상계좌';
			break;
		default:
			break;
		};

		if ($('input[name="PD_NAMES"]').length > 1) {
			orderName = $('input[name="PD_NAMES"]').val() + '외 '+ $('input[name="PD_NAMES"]').length + '건'
		} else {
			orderName = $('input[name="PD_NAMES"]').val();
		}

		const LOCAL_SUCCESS_URL = 'http://localhost:9998/payment/success';
		const LOCAL_FAIL_URL = 'http://localhost:9998/payment/fail';
		const SERVER_SUCCESS_URL = 'http://43.200.60.62:18080/payment/success';
		const SERVER_FAIL_URL = 'http://43.200.60.62:18080/payment/fail';

		tossPayments.requestPayment(paymentType, {
			amount : $("#totAmt").val(),
			orderId : orderId,
			orderName : orderName,
			customerName : userName,
			successUrl : LOCAL_SUCCESS_URL,
			failUrl : LOCAL_FAIL_URL,
		});
		// console.log(amount);
		// console.log(orderId);
		// console.log(userName);
		// console.log(orderName);
		// console.log(customerName);
		// console.log(successUrl);
		// console.log(failUrl);

	}

	function mDelivery(id) {
		const directInput = document.querySelector("#directInput");
		if (id == "") {
			directInput.style.display = "block";
		} else {
			directInput.style.display = "none";
		}
		directInput.value = id;
	}

	//220928 증빙서류
	$("input[name='PAY_METD']:radio").change(function() {
		var noticeCat1 = this.value;

		if (noticeCat1 === "SC0030") {
			$("#documentType").removeAttr("style");
		} else {
			$("#documentType").attr("style", "display : none;");
		}
	});

	//220928 신청 체크박스
	$("input[name='APPLICATIONDOCUMENTSTYPE']:checkbox").change(function() {
		let checkcnt = $("input[name='APPLICATIONDOCUMENTSTYPE']:checked").length;
		//체크갯수가 0개일경우
		if(checkcnt === 0) {
			$("input:checkbox[id='ApplicationDocumentsType1']").prop("checked", false);
			$("input:checkbox[id='ApplicationDocumentsType2']").prop("checked", false);
			$("input:checkbox[id='ApplicationDocumentsType3']").prop("checked", true);
			$("#documentType1").attr("style", "display : none;");
			$("#documentType2").attr("style", "display : none;");
			alert("신청하실경우 현금영수증, 세금계산서 중 하나는 선택해주세요.");
			return false;
		}
		
		var noticeCat2 = this.value;
		
		if(noticeCat2 === "현금영수증") {
			$("input:checkbox[id='ApplicationDocumentsType2']").prop("checked", false);
			$("input:checkbox[id='ApplicationDocumentsType3']").prop("checked", false);
			$("#documentType1").removeAttr("style");
			$("#documentType2").attr("style", "display : none;");
		} else if(noticeCat2 === "세금계산서") {
			$("input:checkbox[id='ApplicationDocumentsType1']").prop("checked", false);
			$("input:checkbox[id='ApplicationDocumentsType3']").prop("checked", false);
			$("#documentType2").removeAttr("style");
			$("#documentType1").attr("style", "display : none;");
		} else if(noticeCat2 === "N") {
			$("input:checkbox[id='ApplicationDocumentsType1']").prop("checked", false);
			$("input:checkbox[id='ApplicationDocumentsType2']").prop("checked", false);
			$("#documentType1").attr("style", "display : none;");
			$("#documentType2").attr("style", "display : none;");
		}
	});

	//220928 현금영수증 > 개인 or 사업자 방식
	$("input[name='DEDUCTIONORPROOFBUSINESS']:checkbox").change(function() {
		let checkcnt2 = $("input[name='DEDUCTIONORPROOFBUSINESS']:checked").length;

		//체크갯수가 0개일경우
		if (checkcnt2 === 0) {
			$("input:checkbox[id='ApplicationDocumentsType1']").prop("checked", false);
			$("input:checkbox[id='ApplicationDocumentsType3']").prop("checked", true);
			$("#documentType1").attr("style", "display : none;");
			$("#documentType1_2").attr("style","display : none;");
			$("#documentType1_1").attr("style","display : none;");
			alert("신청하실경우 현금영수증, 세금계산서 중 하나는 선택해주세요.");
			return false;
		}

		var noticeCat3 = this.value;

		if (noticeCat3 === "개인소득공제") {
			$("input:checkbox[id='deductionorProofbusiness2']").prop("checked", false);
			$("#documentType1_1").removeAttr("style");
			$("#documentType1_2").attr("style","display : none;");
		} else if (noticeCat3 === "사업자증빙") {
			$("input:checkbox[id='deductionorProofbusiness1']").prop("checked", false);
			$("#documentType1_2").removeAttr("style");
			$("#documentType1_1").attr("style","display : none;");
		}
	});

	/* 이메일주소 이벤트 2022.10.24 장보라*/
	function email_change() {
		/* 선택된값이 1이면 직접입력, 포커스이동 */
		if (document.getElementById('emailaddress').value == "1") {
			document.getElementById('INVOICEEEMAIL_TAXINVOICE2').value = null;
			document.getElementById('INVOICEEEMAIL_TAXINVOICE2').focus();
			/* 이메일주소 선택시 값 변경 */
		} else {
			document.getElementById('INVOICEEEMAIL_TAXINVOICE2').value = document.getElementById('emailaddress').value;
		}
	}

// 	/* 전화번호 이벤트 2022.10.24 장보라*/
	function phone_change() {
		/* 선택된값이 1이면 직접입력, 포커스이동 */
		if (document.getElementById('top_phone_num').value == "1") {
			document.getElementById('INVOICEETEL_TAXINVOICE1').value = null;
			document.getElementById('INVOICEETEL_TAXINVOICE1').focus();
		/* 전화번호 선택시 값 변경 */
		} else {
			document.getElementById('INVOICEETEL_TAXINVOICE1').value = document.getElementById('top_phone_num').value;
			document.getElementById('INVOICEETEL_TAXINVOICE2').focus();
		}
	}

	/* 기본배송지 등록 2022.10.26 장보라  */
	function basicAddress() {
		const checkbox = document.getElementById('order-basic-addr'); // 1. checkbox element 찾기
		const is_checked = checkbox.checked;						  // 2. checked 속성을 체크

		if (is_checked == true) {
			if (!confirm('기본 배송지로 등록하시겠습니까?')) return;
	
			var RECIPIENT_NAME = document.getElementById('RECV_PERS').value;	//수령자이름
			var MEMB_PN = document.getElementById('POST_NUM').value;			//우편번호
			var MEMB_BADR = document.getElementById('BASC_ADDR').value;			//대표주소
			var MEMB_DADR = document.getElementById('DTL_ADDR').value;			//상세주소
			var MEMB_CPON = document.getElementById('RECV_CPON1').value 		//전화번호
							+"-"+ document.getElementById('RECV_CPON2').value 
							+"-"+document.getElementById('RECV_CPON3').value;
			
			var data = {
				'RECIPIENT_NAME' : RECIPIENT_NAME,
				'MEMB_PN' : MEMB_PN,
				'MEMB_BADR' : MEMB_BADR,
				'MEMB_DADR' : MEMB_DADR,
				'MEMB_CPON' : MEMB_CPON
			}
			$.ajax({
				type : "POST",
				url : "${contextPath}/m/basicaddress/insertAndUpdate",
				data : data,
				success : function(data) {
					if (data == 'INSERT_SUCCESS'){
						alert("기본배송지를 등록하였습니다.");
					} else if (data == 'UPDATE_SUCCESS') {
						alert("기본배송지를 수정하였습니다.");
					} else {
						alert("기본배송지를 등록에 실패하였습니다. 관리자에게 문의해주세요.");
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("기본배송지를 등록에 실패하였습니다. 관리자에게 문의해주세요.");
				}
			});
		} 
	}
	

</script>
