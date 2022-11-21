<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
				
				<form action="${contextPath }/adm/TaxBillPublicationSingle" id = "form">
				<%-- <c:forEach items="${ORDER_NUM_ArrayList }" var="ORDER_NUM_ArrayList">
					<input type="hidden" name = "ORDER_NUM_ArrayList" value ="${ORDER_NUM_ArrayList }">
				</c:forEach> --%>
					<!-- 상단 -->
					<div>
						<span>
							<strong>*종류</strong>&ensp;|&ensp;
							<input type = "radio" name = "taxtype" id = "taxtype_1" value="과세" checked="checked"><strong><label for="taxtype_1">과세 (10%)</label></strong>&ensp;
							<input type = "radio" name = "taxtype" id = "taxtype_2" value="면세"> <strong><label for="taxtype_2">비과세</label></strong> <!-- 면세 -->&ensp;
							<input type = "radio" name = "taxtype" id = "taxtype_3" value="영세"> <strong><label for="taxtype_3">영세</label></strong> &ensp;
						</span>
						<span style="float: right;">
							<strong>*공급받는자 종류</strong>&ensp;|&ensp; 
							<input type = "radio" name = "invoiceetype" id = "invoiceetype1" value="사업자" checked="checked"> <strong><label for="invoiceetype1">사업자</label></strong>&ensp;
							<input type = "radio" name = "invoiceetype" id = "invoiceetype2" value="개인"> <strong><label for="invoiceetype2">개인</label></strong>
						</span>
					</div>
					<br>
					<div style=" text-align: center;">
						<span style="float: left;">
							<strong>*담당자 선택</strong>
							&ensp;
							<select onchange="supplierAjax()" name="supplierSelect" id="supplierSelect">
								<option value="">담당자[상호]</option>
								<c:forEach items="${obj.supplierList }" var="supplier">
									<option value="${supplier.insert_num }" >${supplier.invoicerContactName_insert }[${supplier.invoicerCorpName_insert }]</option>
								</c:forEach>
							</select>
						</span>
						<span style="float: center;" class="textareacenter">
							<strong>세금계산서</strong>
						</span>
						<span style="float: right;">
							<input type = "button" name = "" id="popup_open_btn" value = "공급자 등록">
						</span>
					</div>
					<!-- 상단끝 -->
					<!-- 전체 테이블 -->
					<table class="table table-bordered Single">
							<tr>
								<td>
									<!-- 세금계산서 공급자 -->
									<table class="tablestyle1" border="1">
										<tr>
											<td rowspan="6" style="width: 7%;"><strong>공<br><br>급<br><br>자</strong></td>
											<td><strong>등록번호</strong></td>
											<td><input type="text" name="invoicerCorpNum"></td>
											<td><strong>종사업자 번호</strong></td>
											<td><input type="text" name="invoicerTaxRegID"></td>
										</tr>
										<tr>
											<td><strong>상호</strong></td>
											<td><input type="text" name="invoicerCorpName"></td>
											<td><strong>성명</strong></td>
											<td><input type="text" name="invoicerCEOName"></td>
										</tr>
										<tr>
											<td><strong>사업장</strong></td>
											<td colspan="3"><input type="text" name="invoicerAddr" style="width: 99%;"></td>
										</tr>
										<tr>
											<td><strong>업태</strong></td>
											<td><input type="text" name="invoicerBizType"></td>
											<td><strong>종목</strong></td>
											<td><input type="text" name="invoicerBizClass"></td>
										</tr>
										<tr>
											<td><strong>담당자</strong></td>
											<td><input type="text" name="invoicerContactName"></td>
											<td><strong>연락처</strong></td>
											<td><input type="text" name="invoicerTEL"></td>
										</tr>
										<tr>
											<td><strong>이메일</strong></td>
											<td colspan="3"><input type="text" name="invoicerEmail" style="width: 99%;"></td>
										</tr>
									</table>
								</td>
								<td>
									<!-- 세금계산서 공급받는자 -->
									<table class="tablestyle2" border="1">
											<tr>
											<td rowspan="6" style="width: 7%;"><strong>공<br>급<br>받<br>는<br>자</strong></td>
											<td class="residentnumcheck"><strong>등록번호</strong></td>
											<td><input type="text" id="invoiceeCorpNum" name="invoiceeCorpNum" value = "${infolist.get(0).INVOICEECORPNUM }"></td>
											<td><strong>종사업자 번호</strong></td>
											<td><input type="text" id="invoiceeTaxRegID" name="invoiceeTaxRegID" value = ""></td>
										</tr>
										<tr>
											<td><strong>상호</strong></td>
											<td><input type="text" id="invoiceeCorpName" name = "invoiceeCorpName" value = "${infolist.get(0).INVOICEECORPNAME }"></td>
											<td><strong>성명</strong></td>
											<td><input type="text" id="invoiceeCEOName" name="invoiceeCEOName" value = "${infolist.get(0).INVOICEECEONAME }"></td>
										</tr>
										<tr>
											<td><strong>사업장</strong></td>
											<td colspan="3"><input type="text" id="InvoiceeAddr" name="InvoiceeAddr" style="width: 99%;" value = "${infolist.get(0).INVOICEEADDR }"></td>
										</tr>
										<tr>
											<td><strong>업태</strong></td>
											<td><input type="text" id="InvoiceeBizType" name="InvoiceeBizType" value = "${infolist.get(0).INVOICEEBIZTYPE }"></td>
											<td><strong>종목</strong></td>
											<td><input type="text" id="invoiceebizclass" name="invoiceebizclass" value = "${infolist.get(0).INVOICEEBIZCLASS }"></td>
										</tr>
										<tr>
											<td><strong>담당자</strong></td>
											<td><input type="text" id="invoiceeContactName1" name="invoiceeContactName1" value = "${infolist.get(0).INVOICEECONTACTNAME }"></td>
											<td><strong>연락처</strong></td>
											<td><input type="text" id="invoiceeTEL1" name="invoiceeTEL1" value= "${infolist.get(0).INVOICEETEL }"></td>
										</tr>
										<tr>
											<td><strong>이메일</strong></td>
											<td colspan="3"><input type="text" id="invoiceeEmail1" name="invoiceeEmail1" value = "${infolist.get(0).INVOICEEEMAIL }" style="width: 99%;"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<span style = "color: gray;">* 공급가액 , 세액 , 합계는 하단 수량과 단가를 입력시 자동으로 채워집니다.</span>
									<!-- 중앙 테이블 -->
									<table class="tablestyle3" border="1">
										<tr>
											<td style="width: 10%">
												<span><strong>작성일자</strong><i class="glyphicon glyphicon-calendar"></i></span>
											</td>
											<td><strong>공급가액</strong></td>
											<td><strong>세액</strong></td>
											<td><strong>합계</strong></td>
										</tr>
										<tr>
											<td style="width: 10%">
												<input type="text" class="" style="width: 95%" name="writeDate" id="datepickerStr" value="${obj.datepickerStr }" readonly="readonly">
											</td>
											<td>
												<input type="text" readonly="readonly" id="supplycosttotal" name="supplycosttotal">
											</td>
											<td>
												<input type="text" readonly="readonly" id="taxtotal" name="taxtotal">
											</td>
											<td>
												<input type="text" readonly="readonly" id="totalamount" name="totalamount">
											</td>
										</tr>
										<tr>
											<td style="width: 10%"><strong>비고</strong></td>
											<td colspan="3"><input type="text" style="width: 99%;" name="memo" placeholder="메모가 필요하실경우 입력해주세요."></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<span style = "color: gray;">* 공급가액 , 세액은 수량과 단가를 입력시 자동으로 채워집니다.</span>
									<table class="tablestyle4" border="1" id = "box">
										<colgroup>
											<col width="5%"/>
											<col width="5%"/>
											<col width="20%"/>
											<col width="5%"/>
											<col width="5%"/>
											<col width="10%"/>
											<col width="10%"/>
											<col width="10%"/>
											<col width="10%"/>
											<col width="2%"/>
										</colgroup>
										<tr>
											<td><strong>월</strong></td>
											<td><strong>일</strong></td>
											<td><strong>품목</strong></td>
											<td><strong>규격</strong></td>
											<td><strong>수량</strong></td>
											<td><strong>단가</strong></td>
											<td><strong>공급가액</strong></td>
											<td><strong>세액</strong></td>
											<td><strong>비고</strong></td>
											<td><i class="material-icons" style="vertical-align: top;" name = "addtable">add</i></td>
										</tr>
										<c:forEach items="${infolist }" var="infolist" varStatus="loop">
											<tr class = "DLVY_AMT">
												<td><input type="text" name="writedatemon" id="writedatemon" value= "${infolist.writedatemon }" placeholder="ex) 09" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="2"></td>
												<td>
													<input type="text" name="writedateday" id="writedateday" value= "${infolist.writedateday }" placeholder="ex) 04" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="2">
													<input type="hidden" name = "purchaseDT" id = "purchaseDT" />
												</td>
												<td><input type="text" name="itemname" id="itemname" value = "배송비"></td>
												<td><input type="text" name="spec" id="spec" value = "개"></td>
												<td>
													<input type="text" name="qty" id="qty" value="1" oninput="this.value = this.value.replace(/[^0-9]/g,'').replace(/\B(?=(\d{3})+(?!\d))/g, ',');"  onkeyup='printName()'>
												</td>
												<td>
													<input type="text" name="unitcost" id="unitcost" value="${infolist.DLVY_AMT }" oninput="this.value = this.value.replace(/[^0-9]/g,'').replace(/\B(?=(\d{3})+(?!\d))/g, ',');" onkeyup='printName()'>
												</td>
												<td>
													<input type="text" name="supplycost" id="supplycost">
												</td>
												<td>
													<input type="text" name="tax" id="tax">
												</td>
												<td><input type="text" name="remark"></td>
												<td><i class="material-icons" style="vertical-align: top;" name = "deletetable">clear</i></td>
											</tr>
											<tr id = "productlistdetail" class = "1rows">
												<td><input type="text" name="writedatemon" id="writedatemon" value= "${infolist.writedatemon }" placeholder="ex) 09" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="2"></td>
												<td>
													<input type="text" name="writedateday" id="writedateday" value= "${infolist.writedateday }" placeholder="ex) 04" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="2">
													<input type="hidden" name = "purchaseDT" id = "purchaseDT" />
												</td>
												<td>
													<input type="text" name="itemname" id="itemname" value = "${infolist.PD_NAME }">
													<c:forEach var ="ORDER_NUM_ArrayList" items="${ORDER_NUM_ArrayList[loop.index]}" varStatus="status">
														<input type="hidden" name = "ORDER_NUM_ArrayList" value ="${ORDER_NUM_ArrayList}">
													</c:forEach>
												</td>
												<td><input type="text" name="spec" id="spec" value = "개"></td>
												<td>
													<input type="text" name="qty" id="qty" value="${infolist.ORDER_QTY }" oninput="this.value = this.value.replace(/[^0-9]/g,'').replace(/\B(?=(\d{3})+(?!\d))/g, ',');"  onkeyup='printName()'>
												</td>
												<td>
													<input type="text" name="unitcost" id="unitcost" value="${infolist.ORDER_AMT }" oninput="this.value = this.value.replace(/[^0-9]/g,'').replace(/\B(?=(\d{3})+(?!\d))/g, ',');" onkeyup='printName()'>
												</td>
												<td>
													<input type="text" name="supplycost" id="supplycost">
												</td>
												<td>
													<input type="text" name="tax" id="tax">
												</td>
												<td><input type="text" name="remark"></td>
												<td><i class="material-icons" style="vertical-align: top;" name = "deletetable">clear</i></td>
											</tr>
										</c:forEach>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div style = "text-align: center;">
										<strong>
											이 금액을 (
											<input type = "radio" name = "purposeType" id = "purposeType1" value="영수" checked="checked"><label for = "purposeType1">영수</label>
											<input type = "radio" name = "purposeType" id = "purposeType2" value="청구"><label for = "purposeType2">청구</label>
											)함
										</strong>
									</div>
								
									<!-- <table class="tablestyle5">
										<tr>
											<td><strong>현금</strong></td>
											<td><strong>수표</strong></td>
											<td><strong>어음</strong></td>
											<td><strong>외상미수금</strong></td>
											<td rowspan="2" class="tabletdwidthfive">
												<strong>
													이 금액을 (
													<input type = "radio" name = "purposetype" value="영수" checked="checked">영수
													<input type = "radio" name = "purposetype" value="청구">청구
													)함
												</strong>
											</td>
										</tr>
										<tr>
											<td><input type="text" name="cash"></td>
											<td><input type="text" name="chkbill"></td>
											<td><input type="text" name="note"></td>
											<td><input type="text" name="credit"></td>
										</tr>
									</table> -->
								</td>
							</tr>
					<!-- 전체테이블 끝 -->
					</table>
					<!-- 하단 발급란 -->
					<div style="text-align: center;">
						
						<button type="button" class="btn btn-primary pull-right right-5" onclick="submit();">
               				<i class="fa fa-save"></i> <span>발급</span>
            			</button>
						<a href="#" class="btn btn-default pull-right right-5" onclick = "resetform()">
							초기화 
						</a>
						<a href="#" class="btn btn-default pull-right right-5" onclick = "alert('서비스 준비중입니다.')">
							저장
						</a>
						
						<!-- <a href="#" class="btn-two gray rounded" style="color: black; padding: 10px 20px;" onclick = "alert('서비스 준비중입니다.')">저장</a>
            			
						<a href="#" class="btn-two gray rounded" style="color: black; padding: 10px 20px;" onclick = "resetform()">초기화</a>
						<div style="display: none;">
							<input type="reset" id = "reset">
						</div>
						<a href="#" class="btn-two blue rounded" style="padding: 10px 25px;" onclick="submit();">발급</a> -->
					</div>
				</form>
<!-- 모달창 공급하기 -->
<div id="my_modal">
	<form method="post" action="supplierInsert" id="modalsss">
		<span style="float: center;" class="textareacenter"><strong>공급자 등록</strong></span>
		<!-- 세금계산서 공급자 -->
		<table class="tablestyle1" border="1">
			<tr>
				<td rowspan="6" style="width: 7%;"><strong>공<br><br>급<br><br>자</strong></td>
				<td><strong>등록번호</strong></td>
				<td><input type="text" name="invoicerCorpNum_insert" placeholder="ex) 123-45-67890"></td>
				<td><strong>종사업자 번호</strong></td>
				<td><input type="text" name="invoicerTaxRegID_insert" placeholder="ex) 1234"></td>
			</tr>
			<tr>
				<td><strong>상호</strong></td>
				<td><input type="text" name="invoicerCorpName_insert" placeholder="ex) 회사명"></td>
				<td><strong>성명</strong></td>
				<td><input type="text" name="invoicerCEOName_insert" placeholder="ex) 대표자명"></td>
			</tr>
			<tr>
				<td><strong>사업장</strong></td>
				<td colspan="3"><input type="text" name="invoicerAddr_insert" placeholder="ex) (주)폴라베어" style="width: 99%;"></td>
			</tr>
			<tr>
				<td><strong>업태</strong></td>
				<td><input type="text" name="invoicerBizType_insert" placeholder="ex) 서비스"></td>
				<td><strong>종목</strong></td>
				<td><input type="text" name="invoicerBizClass_insert" placeholder="ex) 가구"></td>
			</tr>
			<tr>
				<td><strong>담당자</strong></td>
				<td><input type="text" name="invoicerContactName_insert" placeholder="ex) 담당자명"></td>
				<td><strong>연락처</strong></td>
				<td><input type="text" name="invoicerTEL_insert" placeholder="ex) 01012345678"></td>
			</tr>
			<tr>
				<td><strong>이메일</strong></td>
				<td colspan="3"><input type="text" name="invoicerEmail_insert" placeholder="ex) polar@polarbear.com" style="width: 99%;"></td>
			</tr>
		</table>
		<div style="text-align-last: center; margin: 20px 0px 0px 0px;">
			<a href="#" class="btn-two gray rounded" id ="modal_close_btn" style="color: black;">취소</a>
			<a href="#" class="btn-two blue rounded" onclick = "modal_save_btn()">저장</a>
		</div>
	</form>
</div>

<!-- 테이블 카피용 -->
<div style = "display : none;">
	<table class="tablestyle4" border="1" id = "box2">
	<tr></tr>
	<tr id = "productlistdetail2" class = "2rows">
		<td><input type="text" name="writedatemon" id="writedatemon" placeholder="ex) 09" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="2"></td>
		<td>
			<input type="text" name="writedateday" id="writedateday" placeholder="ex) 04" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="2">
			<input type="hidden" name = "purchaseDT" id = "purchaseDT" />
		</td>
		<td><input type="text" name="itemname" id="itemname"></td>
		<td><input type="text" name="spec" id="spec" value="개"></td>
		<td>
			<input type="text" name="qty" id="qty" oninput="this.value = this.value.replace(/[^0-9]/g,'').replace(/\B(?=(\d{3})+(?!\d))/g, ',');"  onkeyup='printName()'>
		</td>
		<td>
			<input type="text" name="unitcost" id="unitcost" oninput="this.value = this.value.replace(/[^0-9]/g,'').replace(/\B(?=(\d{3})+(?!\d))/g, ',');" onkeyup='printName()'>
		</td>
		<td>
			<input type="text" name="supplycost" id="supplycost">
		</td>
		<td>
			<input type="text" name="tax" id="tax">
		</td>
		<td><input type="text" name="remark"></td>
		<td><i class="material-icons" style="vertical-align: top;" name = "deletetable">clear</i></td>
	</tr>
	</table>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		var newRow = $("#productlistdetail2").eq(0); // 첫 번째 행을 newRow라는 변수로 지정
	        //행 추가
		var table = document.getElementById('box2');
		
		const date = new Date();
	
		const datepickerStrYear = date.getFullYear();
		const datepickerStrMonth = ('0' + (date.getMonth() + 1)).slice(-2);
		const datepickerStrDay = ('0' + date.getDate()).slice(-2);
		const datepickerdateStr = datepickerStrYear + datepickerStrMonth + datepickerStrDay;
		
		document.getElementById("datepickerStr").value = datepickerdateStr;
		
       	for(i = 0 ; i < 4 ; i++){
	        if(table.rows.length > 10){
	        	alert("최대 99개 까지 가능합니다.");
	        	return false;
	        }
            $("#box tbody").append(newRow.clone(true)); //newRow의 요소뿐만 아니라 데이터, 기능까지 모두 복사 (버튼과 같은 기능 사용 위해)
            $("#box tr:last").attr('class',(($(".1rows").length+1)+'rows')); //tr 마다 다른 class 이름 부여
            $("#box tr:last").attr('id',"productlistdetail"); //tr 마다 다른 class 이름 부여
       	}
       	printName();
	});
	
	$("input[name='taxtype']").change(function(){
		//taxtype 체크된 값에 따라 제목 다르게 설정
		//종류 변경시
		var qty = document.getElementsByName('qty');
		var taxtype = $("input[name='taxtype']:checked").val();
		if(taxtype === "과세"){
			$(".textareacenter").html("<strong>세금계산서</strong>");
			$("#taxtotal").removeAttr("placeholder");
			$("#taxtotal").removeAttr("style");
			$("#totalamount").removeAttr("placeholder");
			$("#totalamount").removeAttr("style");
			$("#productlistdetail>td>#tax").removeAttr("readonly");
			$("#productlistdetail>td>#tax").removeAttr("placeholder");
			$("#productlistdetail>td>#tax").removeAttr("style");
			printName();
		} else if(taxtype === "면세") { //세액 제거
			$(".textareacenter").html("<strong>계산서</strong>");
			$("#taxtotal").val('');
			$("#taxtotal").attr('placeholder', '비활성화');
			$("#taxtotal").attr('style', 'background-color: #d1d1d1;');
			$("#totalamount").val('');
			$("#totalamount").attr('placeholder', '비활성화');
			$("#totalamount").attr('style', 'background-color: #d1d1d1;');
			$("#productlistdetail>td>#tax").val('');
			$("#productlistdetail>td>#tax").attr('readonly', 'readonly');
			$("#productlistdetail>td>#tax").attr('placeholder', '비활성화');
			$("#productlistdetail>td>#tax").attr('style', 'background-color: #d1d1d1;');
			printName();
		} else if(taxtype === "영세") {
			$(".textareacenter").html("<strong>영세율 세금계산서</strong>");
			$("#taxtotal").val('');
			$("#taxtotal").attr('placeholder', '비활성화');
			$("#taxtotal").attr('style', 'background-color: #d1d1d1;');
			$("#totalamount").removeAttr("placeholder");
			$("#totalamount").removeAttr("style");
			$("#productlistdetail>td>#tax").val('');
			$("#productlistdetail>td>#tax").attr('readonly', 'readonly');
			$("#productlistdetail>td>#tax").attr('placeholder', '비활성화');
			$("#productlistdetail>td>#tax").attr('style', 'background-color: #d1d1d1;');
			printName();
		}
	});
	
	//공급 받는자 종류 변경시
	$("input[name='invoiceetype']").change(function(){
		var qty = document.getElementsByName('qty');
		var invoiceetype = $("input[name='invoiceetype']:checked").val();
		if(invoiceetype === "개인"){
			$("#taxtype_1").prop("checked", true);
			$(".textareacenter").html("<strong>세금계산서</strong>");
			$(".residentnumcheck").html("<strong>주민번호</strong>");
			$("#productlistdetail>td>#tax").removeAttr("readonly");
			$("#productlistdetail>td>#tax").removeAttr("placeholder");
			$("#productlistdetail>td>#tax").removeAttr("style");
			$("#taxtotal").removeAttr("placeholder");
			$("#taxtotal").removeAttr("style");
			$("#totalamount").removeAttr("placeholder");
			$("#totalamount").removeAttr("style");
			$("#InvoiceeBizType").val('');
			$("#InvoiceeBizType").attr('placeholder', '비활성화');
			$("#InvoiceeBizType").attr('readonly', 'readonly');
			$("#InvoiceeBizType").attr('style', 'background-color: #d1d1d1;');
			$("#invoiceebizclass").val('');
			$("#invoiceebizclass").attr('placeholder', '비활성화');
			$("#invoiceebizclass").attr('readonly', 'readonly');
			$("#invoiceebizclass").attr('style', 'background-color: #d1d1d1;');
			$("#invoiceeCorpNum").val('');
			$("#invoiceeCorpNum").attr('placeholder', '비활성화');
			$("#invoiceeCorpNum").attr('readonly', 'readonly');
			$("#invoiceeCorpNum").attr('style', 'background-color: #d1d1d1;');
			printName();
		} else if (invoiceetype === "사업자"){
			$(".residentnumcheck").html("<strong>등록번호</strong>");
			$("#InvoiceeBizType").removeAttr("placeholder");
			$("#InvoiceeBizType").removeAttr("readonly");
			$("#InvoiceeBizType").removeAttr("style");
			$("#invoiceebizclass").removeAttr("placeholder");
			$("#invoiceebizclass").removeAttr("readonly");
			$("#invoiceebizclass").removeAttr("style");
			$("#invoiceeCorpNum").removeAttr("placeholder");
			$("#invoiceeCorpNum").removeAttr("readonly");
			$("#invoiceeCorpNum").removeAttr("style");
			printName();
		}
	});
	
	function resetform(){
		//let reset = document.querySelector('#reset');
		//reset.addEventListener("click", click);
		//alert();
		//document.getElementById("reset").click();
		
		var writedatemon = document.getElementsByName('writedatemon');
		var writedateday = document.getElementsByName('writedateday');
		var itemname = document.getElementsByName('itemname');
		var spec = document.getElementsByName('spec');
		var qty = document.getElementsByName('qty');
		var unitcost = document.getElementsByName('unitcost');
		var supplycost = document.getElementsByName('supplycost');
		var tax = document.getElementsByName('tax');
		var remark = document.getElementsByName('remark');
		
		for(i = 0 ; i < writedatemon.length ; i++){
			//alert(setDate);
			
			document.getElementsByName('writedatemon')[i].value = "";
			document.getElementsByName('writedateday')[i].value = "";
			document.getElementsByName('itemname')[i].value = "";
			document.getElementsByName('spec')[i].value = "";
			document.getElementsByName('qty')[i].value = "";
			document.getElementsByName('unitcost')[i].value = "";
			document.getElementsByName('supplycost')[i].value = "";
			document.getElementsByName('tax')[i].value = "";
			document.getElementsByName('remark')[i].value = "";
			
		}
		document.getElementById('supplycosttotal').value = "";
		document.getElementById('taxtotal').value = "";
		document.getElementById('totalamount').value = "";
	}
	
	function setHiddenDate(){
		var writedatemon = document.getElementsByName('writedatemon');
		var writedateday = document.getElementsByName('writedateday');
		
		let date = new Date();
		
		for(i = 0 ; i < writedatemon.length ; i++){
			setDate = date.getFullYear()+document.getElementsByName('writedatemon')[i].value+document.getElementsByName('writedateday')[i].value;
			//alert(setDate);
			document.getElementsByName("purchaseDT")[i].value = setDate;
		}
	}
	
	//세액 및 공급가액 및 합계금액 자동정산
	function printName() {
		//사용
		var taxtype = $("input[name='taxtype']:checked").val();
		var invoiceetype = $("input[name='invoiceetype']:checked").val();
		var qty = document.getElementsByName('qty');
		var unitcost = document.getElementsByName('unitcost');
		
		
		var supplycosttotal = 0
		var taxtotal = 0
		var totalamount = 0
		let qtyValue = 0;
		let unitcostValue = 0;
		
		
		//현재 활성화 된 길이만큼 돌려주기
		for(i = 0 ; i < qty.length ; i++){
			//alert(parseInt((qty[i].value*unitcost[i].value)*0.1));
			
			//콤마 전부 제거 계산용
			qty[i].value = qty[i].value.replace(/,/g , '');
			if(qty[i].value !== "") {
				qtyValue = parseInt(qty[i].value);
			}
			unitcost[i].value = unitcost[i].value.replace(/,/g , '');
			if(unitcost[i].value !== "") {
				unitcostValue = parseInt(unitcost[i].value);
			}
			
			//총액 구하기
			var supplycost = qty[i].value*unitcost[i].value;
			var tax = parseInt((qty[i].value*unitcost[i].value)*0.1);
			
			//총 금액 셋팅
			supplycosttotal = supplycosttotal + qty[i].value*unitcost[i].value;
			taxtotal = taxtotal + parseInt((qty[i].value*unitcost[i].value)*0.1);
			//alert(parseInt((qty[i].value*unitcost[i].value)*0.1));
			if(taxtype==="영세"){
				totalamount = supplycosttotal;
			} else {
				totalamount = supplycosttotal + taxtotal;
			}
			
			//위에 개별 상품 공급가액 아래 상품 세액 보여주기용
			document.getElementsByName("supplycost")[i].value = amountComma(supplycost);
			if(taxtype==="과세"){
				document.getElementsByName("tax")[i].value = amountComma(tax);
			}
			if(qty[i].value !== "") {
				document.getElementsByName("qty")[i].value = amountComma(qtyValue);
			}
			if(unitcost[i].value !== "") {
				document.getElementsByName("unitcost")[i].value = amountComma(unitcostValue);
			}
			
			/* document.getElementsByName("qty")[i].value = amountComma(qty[i].value);
			document.getElementsByName("unitcost")[i].value = amountComma(unitcost[i].value); */
		}
		// 중단 총액
		document.getElementById("supplycosttotal").value = amountComma(supplycosttotal);
		if(taxtype==="과세"){
			document.getElementById("taxtotal").value = amountComma(taxtotal);
		}
		if(taxtype==="과세"||taxtype==="영세"){
			document.getElementById("totalamount").value = amountComma(totalamount);
		}
	}
	
	function amountComma(id) {
		let priceComma = id.toLocaleString('ko-KR');
		return priceComma;
	}
	
	//테이블 행추가 삭제
	$(function(){
        var newRow = $("#productlistdetail2").eq(0); // 첫 번째 행을 newRow라는 변수로 지정
        //행 추가
        $("i[name='addtable']").click(function() {
			var table = document.getElementById('box');
        	for(i = 0 ; i < 4 ; i++){
		        if(table.rows.length > 10){
		        	alert("최대 99개 까지 가능합니다.");
		        	printName();
		        	return false;
		        }
	            $("#box tbody").append(newRow.clone(true)); //newRow의 요소뿐만 아니라 데이터, 기능까지 모두 복사 (버튼과 같은 기능 사용 위해)
	            $("#box tr:last").attr('class',(($(".1rows").length+1)+'rows')); //tr 마다 다른 class 이름 부여
	            $("#box tr:last").attr('id',"productlistdetail");
        	}
        	printName();
        })
		
        //행 삭제
        $("i[name='deletetable']").click(function() {
			var table = document.getElementById('box');
            var clickDel = $(this).parent().parent();
            clsName= clickDel.attr("class");
            
            if(table.rows.length < 3){
            	alert("최소 길이는 1입니다.");
            	return false;
            }
            if(clsName === "1rows"){
				alert("첫번째 행(기본값)은 삭제할수 없습니다.");
				return false;
            } else if (clsName === "DLVY_AMT"){
            	alert("배송비 행은 기본값입니다."); 
            	return false;
            }
            
            //삭제하는 지점 삭제 할 열이 항목추가 버튼을 가지고 있는 경우 항목추가 버튼을 다음 같은 class tr으로 넘기기
            if (clickDel.find("td:first").attr("class")=="optionName" && clickDel.attr("class")==clickDel.next().attr("class")) {
                clickDel.remove();                    
            } else {
                clickDel.remove();
            }
            printName();
        })
    })
	
	
	$(function() {
		//Date picker
		$('#datepickerStr').datepicker({
			autoclose: true,
			format: 'yyyymmdd'
		});
		$('#datepickerEnd').datepicker({
			autoclose: true,
			format: 'yyyymmdd'
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
	
	//발급
	function submit(){
		deleteTrNull();
		
		//return false;
		let confirmAnswer = confirm("발급 하시겠습니까?");
		
		if(confirmAnswer){
			//정렬처리
			setHiddenDate();
			printName();
			
			var form = document.getElementById("form");
			
			var writedatemon = document.getElementsByName("writedatemon");
			var writedateday = document.getElementsByName("writedateday");
			
			/* for(i = 0 ; i = writedatemon.length ; i++){
				if(writedatemon[i]<1 || writedatemon[i]>12){
					alert("날짜 (월)을 잘 확인해주세요");
					return false;
				} else if (writedateday[i]<1 || writedateday[i]>31){
					alert("날짜 (일)을 잘 확인해주세요");
					return false;
				}
			} */
			
			form.submit();
		} else {
			
		}
	}
	
	
	function deleteTrNull(){
		//alert($('#box > tbody tr').length);
		
		let tableLength = $('#box > tbody tr').length;
		let writedatemon = document.getElementsByName("writedatemon");
		let writedateday = document.getElementsByName("writedateday");
		let itemname = document.getElementsByName("itemname");
		let spec = document.getElementsByName("spec");
		let qty = document.getElementsByName("qty");
		let unitcost = document.getElementsByName("unitcost");
		let supplycost = document.getElementsByName("supplycost");
		/*
			name 길이만큼 땡겨오고 그거 빈값이면 테이블행 삭제
		*/
		
		//alert(writedatemon[1].value);
		//alert(writedatemon[1].value);
		let deleteTrnumber = 1;
		let deleteDateNumber = 0;
		let trueLength = writedatemon.length;
		
		for( i = 1 ; i < trueLength ; i++){
			//console.log(i);
			//console.log(tableLength);
			//console.log(writedatemon.length);
			//console.log(test2222);
			//console.log($('#box > tbody tr > td > writedatemon')[i].val);
			/* if($('#box > tbody tr > td > #writedatemon')){ */
			
			if(writedatemon[deleteDateNumber].value === null || writedatemon[deleteDateNumber].value === "" || writedateday[deleteDateNumber].value === null || writedateday[deleteDateNumber].value === "" || itemname[deleteDateNumber].value === null || itemname[deleteDateNumber].value === "" || spec[deleteDateNumber].value === null || spec[deleteDateNumber].value === "" || qty[deleteDateNumber].value === null || qty[deleteDateNumber].value === "" || unitcost[deleteDateNumber].value === null || unitcost[deleteDateNumber].value === "" || supplycost[deleteDateNumber].value === null || supplycost[deleteDateNumber].value === ""){
				$('#box > tbody tr').eq(deleteTrnumber).remove();
			} else {
				deleteTrnumber++;
				deleteDateNumber++;
			}
		}
    }
	
	
	function modal(id) {
        var zIndex = 9999;
        var modal = document.getElementById(id);

        // 모달 div 뒤에 희끄무레한 레이어
        var bg = document.createElement('div');
        bg.setStyle({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.4)'
        });
        document.body.append(bg);

        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        modal.querySelector('#modal_close_btn').addEventListener('click', function() {
            bg.remove();
            modal.style.display = 'none';
        });

        modal.setStyle({
            position: 'fixed',
            display: 'block',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        });
    }

    // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
    Element.prototype.setStyle = function(styles) {
        for (var k in styles) this.style[k] = styles[k];
        return this;
    };

    document.getElementById('popup_open_btn').addEventListener('click', function() {
        // 모달창 띄우기
        modal('my_modal');
    });

    function modal_save_btn(){
    	// 모달창 입력정보
    	let invoicerCorpNum_insert = document.getElementsByName("invoicerCorpNum_insert")[0].value;
    	let invoicerTaxRegID_insert = document.getElementsByName("invoicerTaxRegID_insert")[0].value;
    	let invoicerCorpName_insert = document.getElementsByName("invoicerCorpName_insert")[0].value;
    	let invoicerCEOName_insert = document.getElementsByName("invoicerCEOName_insert")[0].value;
    	let invoicerAddr_insert = document.getElementsByName("invoicerAddr_insert")[0].value;
    	let invoicerBizType_insert = document.getElementsByName("invoicerBizType_insert")[0].value;
    	let invoicerBizClass_insert = document.getElementsByName("invoicerBizClass_insert")[0].value;
    	let invoicerContactName_insert = document.getElementsByName("invoicerContactName_insert")[0].value;
    	let invoicerTEL_insert = document.getElementsByName("invoicerTEL_insert")[0].value;
    	let invoicerEmail_insert = document.getElementsByName("invoicerEmail_insert")[0].value;
    	
    	if(invoicerCorpNum_insert === null || invoicerCorpNum_insert === ""){
    		alert("공급자를 입력해주세요");
    		document.getElementsByName("invoicerCorpNum_insert")[0].focus();
    		return false;
    	}
    	if(invoicerTaxRegID_insert === null || invoicerTaxRegID_insert === ""){
    		alert("종사업자 번호를 입력해주세요");
    		document.getElementsByName("invoicerTaxRegID_insert")[0].focus();
    		return false;
    	}
    	if(invoicerCorpName_insert === null || invoicerCorpName_insert === ""){
    		alert("상호를 입력해주세요");
    		document.getElementsByName("invoicerCorpName_insert")[0].focus();
    		return false;
    	}
    	if(invoicerCEOName_insert === null || invoicerCEOName_insert === ""){
    		alert("성명을 입력해주세요");
    		document.getElementsByName("invoicerCEOName_insert")[0].focus();
    		return false;
    	}
    	if(invoicerAddr_insert === null || invoicerAddr_insert === ""){
    		alert("사업장을 입력해주세요");
    		document.getElementsByName("invoicerAddr_insert")[0].focus();
    		return false;
    	}
    	if(invoicerBizType_insert === null || invoicerBizType_insert === ""){
    		alert("업태를 입력해주세요");
    		document.getElementsByName("invoicerBizType_insert")[0].focus();
    		return false;
    	}
    	if(invoicerBizClass_insert === null || invoicerBizClass_insert === ""){
    		alert("종목을 입력해주세요");
    		document.getElementsByName("invoicerBizClass_insert")[0].focus();
    		return false;
    	}
    	if(invoicerContactName_insert === null || invoicerContactName_insert === ""){
    		alert("담당자를 입력해주세요");
    		document.getElementsByName("invoicerContactName_insert")[0].focus();
    		return false;
    	}
    	if(invoicerTEL_insert === null || invoicerTEL_insert === ""){
    		alert("연락처를 입력해주세요");
    		document.getElementsByName("invoicerTEL_insert")[0].focus();
    		return false;
    	}
    	if(invoicerEmail_insert === null || invoicerEmail_insert === ""){
    		alert("이메일을 입력해주세요");
    		document.getElementsByName("invoicerEmail_insert")[0].focus();
    		return false;
    	}
    	
    	
        document.getElementById('modalsss').submit();
    }
	
    //담당자 교체시 변경해주는 function
    function supplierAjax(){
    	let supplierSelect = document.getElementById("supplierSelect");
    	//select 선택된 value 값 가져오기
    	//alert(supplierSelect.options[supplierSelect.selectedIndex].value);
    	
    	if(supplierSelect.options[supplierSelect.selectedIndex].value === null || supplierSelect.options[supplierSelect.selectedIndex].value === ""){
    		return false;
    	}
    	
    	$.ajax({
	         type:"GET",
	         dataType: 'json',
	         url:"${contextPath}/adm/supplierAjax.json",
	         data: {supplierSelect : supplierSelect.options[supplierSelect.selectedIndex].value},
	         success : function(data) {
	        	//데이터 가져오기
	        	document.getElementsByName("invoicerCorpNum")[0].value = data.invoicerCorpNum_insert;
	        	document.getElementsByName("invoicerTaxRegID")[0].value = data.invoicerTaxRegID_insert;
	        	document.getElementsByName("invoicerCorpName")[0].value = data.invoicerCorpName_insert;
	        	document.getElementsByName("invoicerCEOName")[0].value = data.invoicerCEOName_insert;
	        	document.getElementsByName("invoicerAddr")[0].value = data.invoicerAddr_insert;
	        	document.getElementsByName("invoicerBizType")[0].value = data.invoicerBizType_insert;
	        	document.getElementsByName("invoicerBizClass")[0].value = data.invoicerBizClass_insert;
	        	document.getElementsByName("invoicerContactName")[0].value = data.invoicerContactName_insert;
	        	document.getElementsByName("invoicerTEL")[0].value = data.invoicerTEL_insert;
	        	document.getElementsByName("invoicerEmail")[0].value = data.invoicerEmail_insert;
	         },
	         error : function(jqXHR, textStatus, errorThrown) {
	        	 alert("처리중 에러가 발생했습니다. 관리자에게 문의 하세요.(error:"+textStatus+")");
	         }
	   });
    }
    
</script>