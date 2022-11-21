<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/layout/inc/taglib.jsp" %>
<link href="../../resources/css/common.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/font-awesome/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


<%@ include file="TaxInvoiceCheck_Common.jsp" %>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.popbill.api.IssueResponse"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.taxinvoice.MgtKeyType"%>
<%@page import="com.popbill.api.taxinvoice.TISearchResult"%>
<%@page import="com.popbill.api.taxinvoice.Taxinvoice"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceDetail"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceAddContact"%>

<% 
	String MgtKeyTypeCheck = (String)request.getAttribute("MgtKeyTypeCheck");
	
	String CorpNum = "1234567890";
	MgtKeyType KeyType;
	if(MgtKeyTypeCheck.equals("SELL")){
		KeyType = MgtKeyType.SELL;
	} else {
		KeyType = MgtKeyType.BUY;
	}
	String MgtKey = (String)request.getAttribute("MgtKey");
	
	Taxinvoice taxinvoice = null; 
	
	try {
		taxinvoice = taxinvoiceService.getDetailInfo(CorpNum, KeyType, MgtKey);
    } catch (PopbillException pe) {
        // 예외 발생 시, pe.getCode() 로 오류 코드를 확인하고, pe.getMessage()로 오류 메시지를 확인합니다.
        System.out.println("오류 코드 " + pe.getCode());
        System.out.println("오류 메시지 " + pe.getMessage());
    }
	
	SimpleDateFormat fDate1 = new SimpleDateFormat("yyyyMMdd"); //같은 형식으로 맞춰줌
    SimpleDateFormat fDate2 = new SimpleDateFormat("yyyyMMddHHmmss"); //같은 형식으로 맞춰줌
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
.tablestyle1 {
	width:100%;
	border-color: red;
	/* color: red; */
	text-align: center;
	border-collapse: collapse;
	border-width: 2px;
}

.tablestyle2 {
	width:100%;
	border-color: blue;
	/* color: red; */
	text-align: center;
	border-collapse: collapse;
	border-width: 2px;
}
.tablestyle3 {
	width: 100%;
	/* border-color: red; */
	text-align: center;
	border-collapse: collapse;
	border-width: 2px;
}
.tablestyle4 {
	width:100%;
	/* border-color: red; */
	text-align: center;
	border-collapse: collapse;
	border-width: 2px;
}
.tablestyle5 {
	width: 90%;
	text-align: center;
}
.tablestyle1 > tbody > tr > td, .tablestyle2 > tbody > tr > td, .tablestyle3 > tbody > tr > td {
	padding: 4px 4px 4px 4px;
	border-width: 2px;
}
.tablestyle4 > tbody > tr > td{
	padding: 1px 4px 1px 4px;
	border-width: 2px;
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

#selectTableType2_th > .MuchTable > tr > input[type=text] {
	width : auto;
	color: black;
	margin: 3px 3px 3px 3px;
}

/* 버튼이미지 */
.rounded {
 	border-radius: 3px;
}
.gray {
	background: #eee;
	color: black;
}
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
	/* box-shadow: 0 1px 0 rgba(255,255,255,0.34) inset, 
              0 2px 0 -1px rgba(0,0,0,0.13), 
              0 3px 0 -1px rgba(0,0,0,0.08), 
              0 3px 13px -1px rgba(0,0,0,0.21); */
}
a {
  text-decoration: none;
}

</style>
<br>
<table class="table table-bordered Single" style=" width: 100%; ">
	<thead style="background: #FFF6F6; height: 50px;"><!-- background: #FFF6F6;  -->
		<tr>
			<th colspan="2">
				<div style = "position: absolute; left: 32px; top: 42px; font-size: 24px; color: red;">전자세금계산서</div>
				<div style = "position: absolute; left: 20px; top: 10px; font-size: 12px; color: red;">국세청 승인번호 : <span style="color: black;"><%=taxinvoice.getNTSConfirmNum() %></span></div>
				<div style = "position: absolute; right: 180px; top: 45px; font-size: 12px; color: black; text-align: left;">
					발행형태 - <span style="color: black;"><%=taxinvoice.getIssueType() %></span><br>
					과세형태 - <span style="color: black;"><%=taxinvoice.getTaxType() %></span><br>
				</div>
				<div style = "position: absolute; right: 50px; top: 45px; font-size: 12px; color: black; text-align: left;">
					과금방향 - <span style="color: black;"><%=taxinvoice.getChargeDirection() %></span><br>
					영수/청구 - <span style="color: black;"><%=taxinvoice.getPurposeType() %></span>
				</div>
			</th>
		</tr>
	</thead>
	<tr>
		<td>
			<!-- 세금계산서 공급자 -->
			<table class="tablestyle1" border="1">
				<tr>
					<td rowspan="6" style="width: 7%; background: #FFF6F6; color : red;"><strong>공<br><br>급<br><br>자</strong></td>
					<td style= "color : red;"><strong>등록번호</strong></td>
					<td style = "text-align-last: start;">
						<!-- <input type="text" name="invoicerCorpNum"> -->
						<%=taxinvoice.getInvoicerCorpNum() %>
					</td>
					<td style= "color : red;"><strong>종사업자 번호</strong></td>
					<!-- <input type="text" name="invoicerTaxRegID"> -->
					<td style = "text-align-last: start;">
						<%=taxinvoice.getInvoicerTaxRegID() %>
					</td>
				</tr>
				<tr>
					<td style= "color : red;"><strong>상호</strong></td>
					<td style = "text-align-last: start;">
						<!-- <input type="text" name="invoicerCorpName"> -->
						<%=taxinvoice.getInvoicerCorpName() %>	
					</td>
					<td style= "color : red;"><strong>성명</strong></td>
					<td style = "text-align-last: start;">
						<!-- <input type="text" name="invoicerCEOName"> -->
						<%=taxinvoice.getInvoicerCEOName() %>
					</td>
				</tr>
				<tr>
					<td style= "color : red;"><strong>사업장</strong></td>
					<td colspan="3" style = "text-align-last: start;">
						<!-- <input type="text" name="invoicerAddr" style="width: 99%;"> -->
						<%=taxinvoice.getInvoicerAddr() %>
					</td>
				</tr>
				<tr>
					<td style= "color : red;"><strong>업태</strong></td>
					<td style = "text-align-last: start;">
						<!-- <input type="text" name="invoicerBizType"> -->
						<%=taxinvoice.getInvoicerBizType() %>
					</td>
					<td style= "color : red;"><strong>종목</strong></td>
					<td style = "text-align-last: start;">
						<!-- <input type="text" name="invoicerBizClass"> -->
						<%=taxinvoice.getInvoicerBizClass() %>
					</td>
				</tr>
				<tr>
					<td style= "color : red;"><strong>담당자</strong></td>
					<td style = "text-align-last: start;">
						<!-- <input type="text" name="invoicerContactName"> -->
						<%=taxinvoice.getInvoicerContactName() %>
					</td>
					<td style= "color : red;"><strong>연락처</strong></td>
					<td style = "text-align-last: start;">
						<!-- <input type="text" name="invoicerTEL"> -->
						<%=taxinvoice.getInvoicerTEL() %>
					</td>
				</tr>
				<tr>
					<td style= "color : red;"><strong>이메일</strong></td>
					<td colspan="3" style = "text-align-last: start;">
						<!-- <input type="text" name="invoicerEmail" style="width: 99%;"> -->
						<%=taxinvoice.getInvoicerEmail() %>
					</td>
				</tr>
			</table>
		</td>
		<td>
			<!-- 세금계산서 공급받는자 -->
			<table class="tablestyle2" border="1">
				<tr>
					<td rowspan="6" style="width: 7%; background: #f3f6ff; color : blue;"><strong>공<br>급<br>받<br>는<br>자</strong></td>
					<td class="residentnumcheck" style= "color : blue;"><strong>등록번호</strong></td>
					<td style = "text-align-last: start;">
						<%-- <input type="text" id="invoiceeCorpNum" name="invoiceeCorpNum" value = "${infolist.get(0).INVOICEECORPNUM }"> --%>
						<%=taxinvoice.getInvoiceeCorpNum() %>
					</td>
					<td style= "color : blue;"><strong>종사업자 번호</strong></td>
					<td style = "text-align-last: start;">
						<!-- <input type="text" id="invoiceeTaxRegID" name="invoiceeTaxRegID" value = ""> -->
						<%=taxinvoice.getInvoiceeTaxRegID() %>
					</td>
				</tr>
				<tr>
					<td style= "color : blue;"><strong>상호</strong></td>
					<td style = "text-align-last: start;">
						<%-- <input type="text" id="invoiceeCorpName" name = "invoiceeCorpName" value = "${infolist.get(0).INVOICEECORPNAME }"> --%>
						<%=taxinvoice.getInvoiceeCorpName() %>
					</td>
					<td style= "color : blue;"><strong>성명</strong></td>
					<td style = "text-align-last: start;">
						<%-- <input type="text" id="invoiceeCEOName" name="invoiceeCEOName" value = "${infolist.get(0).INVOICEECEONAME }"> --%>
						<%=taxinvoice.getInvoiceeCEOName() %>
					</td>
				</tr>
				<tr>
					<td style= "color : blue;"><strong>사업장</strong></td>
					<td colspan="3" style = "text-align-last: start;">
						<%-- <input type="text" id="InvoiceeAddr" name="InvoiceeAddr" style="width: 99%;" value = "${infolist.get(0).INVOICEEADDR }"> --%>
						<%=taxinvoice.getInvoiceeAddr() %>
					</td>
				</tr>
				<tr>
					<td style= "color : blue;"><strong>업태</strong></td>
					<td style = "text-align-last: start;">
						<%-- <input type="text" id="InvoiceeBizType" name="InvoiceeBizType" value = "${infolist.get(0).INVOICEEBIZTYPE }"> --%>
						<%=taxinvoice.getInvoiceeBizType() %>
					</td>
					<td style= "color : blue;"><strong>종목</strong></td>
					<td style = "text-align-last: start;">
						<%-- <input type="text" id="invoiceebizclass" name="invoiceebizclass" value = "${infolist.get(0).INVOICEEBIZCLASS }"> --%>
						<%=taxinvoice.getInvoiceeBizClass() %>	
					</td>
				</tr>
				<tr>
					<td style= "color : blue;"><strong>담당자</strong></td>
					<td style = "text-align-last: start;">
						<%-- <input type="text" id="invoiceeContactName1" name="invoiceeContactName1" value = "${infolist.get(0).INVOICEECONTACTNAME }"> --%>
						<%=taxinvoice.getInvoiceeContactName1() %>
					</td>
					<td style= "color : blue;"><strong>연락처</strong></td>
					<td style = "text-align-last: start;">
						<%-- <input type="text" id="invoiceeTEL1" name="invoiceeTEL1" value= "${infolist.get(0).INVOICEETEL }"> --%>
						<%=taxinvoice.getInvoiceeTEL1() %>
					</td>
				</tr>
				<tr>
					<td style= "color : blue;"><strong>이메일</strong></td>
					<td colspan="3" style = "text-align-last: start;">
						<%-- <input type="text" id="invoiceeEmail1" name="invoiceeEmail1" value = "${infolist.get(0).INVOICEEEMAIL }" style="width: 99%;"> --%>
						<%=taxinvoice.getInvoiceeEmail1() %>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<table class="tablestyle3" border="1">
				<tr>
					<td>
						<span><strong>작성일자</strong></span>
					</td>
					<td><strong>공급가액</strong></td>
					<td><strong>세액</strong></td>
					<td><strong>합계</strong></td>
				</tr>
				<tr>
					<td style="width: 10%;">
						<%-- <input type="text" class="" style="width: 95%" name="writeDate" id="datepickerStr" value="${obj.datepickerStr }" readonly="readonly"> --%>
						<%=fDate3.format(fDate1.parse(taxinvoice.getWriteDate())) %>
					</td>
					<td style = "text-align-last: end;">
						<!-- <input type="text" readonly="readonly" id="supplycosttotal" name="supplycosttotal"> -->
						<fmt:formatNumber value="<%=taxinvoice.getSupplyCostTotal()%>"/>
					</td>
					<td style = "text-align-last: end;">
						<!-- <input type="text" readonly="readonly" id="taxtotal" name="taxtotal"> -->
						<fmt:formatNumber value="<%=taxinvoice.getTaxTotal()%>"/>
					</td>
					<td style = "text-align-last: end;">
						<!-- <input type="text" readonly="readonly" id="totalamount" name="totalamount"> -->
						<fmt:formatNumber value="<%=taxinvoice.getTotalAmount() %>"/>
					</td>
				</tr>
				<tr>
					<td><strong>비고</strong></td>
					<td colspan="3" style = "text-align-last: start;">
						<!-- <input type="text" style="width: 99%;" name="memo" placeholder="메모가 필요하실경우 입력해주세요."> -->
						<%if(taxinvoice.getMemo() != null ){ %>
							<%=taxinvoice.getMemo() %>
						<%} %>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<table class="tablestyle4" border="1" id = "box">
				<colgroup>
					<col width="10%"/>
					<col width="20%"/>
					<col width="5%"/>
					<col width="5%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
				</colgroup>
				<tr>
					<td><strong>거래일자</strong></td>
					<td><strong>품목</strong></td>
					<td><strong>규격</strong></td>
					<td><strong>수량</strong></td>
					<td><strong>단가</strong></td>
					<td><strong>공급가액</strong></td>
					<td><strong>세액</strong></td>
					<td><strong>비고</strong></td>
				</tr>
				<%for(int i = 0 ; i < taxinvoice.getDetailList().size() ; i++){ %>
					<tr class = "DLVY_AMT">
						<td>
							<%-- <input type="text" name="writedateday" id="writedateday" value= "<%=taxinvoice.getDetailList().get(i).getPurchaseDT() %>" placeholder="ex) 04" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="2"> --%>
							<!-- <input type="hidden" name = "purchaseDT" id = "purchaseDT" /> -->
							<%=fDate3.format(fDate1.parse(taxinvoice.getDetailList().get(i).getPurchaseDT())) %>
						</td>
						<td style = "text-align-last: start;">
							<%-- <input type="text" name="itemname" id="itemname" value = "<%=taxinvoice.getDetailList().get(i).getItemName() %>"> --%>
							<%=taxinvoice.getDetailList().get(i).getItemName() %>
						</td>
						<td>
							<!-- <input type="text" name="spec" id="spec" value = "개"> -->
							개
						</td>
						<td>
							<%-- <input type="text" name="qty" id="qty" value="<%=taxinvoice.getDetailList().get(i).getQty() %>" oninput="this.value = this.value.replace(/[^0-9]/g,'').replace(/\B(?=(\d{3})+(?!\d))/g, ',');"  onkeyup='printName()'> --%>
							<fmt:formatNumber value="<%=taxinvoice.getDetailList().get(i).getQty() %>"/>
						</td>
						<td style = "text-align-last: end;">
							<%-- <input type="text" name="unitcost" id="unitcost" value="<%=taxinvoice.getDetailList().get(i).getSupplyCost() %>" oninput="this.value = this.value.replace(/[^0-9]/g,'').replace(/\B(?=(\d{3})+(?!\d))/g, ',');" onkeyup='printName()'> --%>
							<fmt:formatNumber value="<%=taxinvoice.getDetailList().get(i).getUnitCost() %>"/>
						</td>
						<td style = "text-align-last: end;">
							<%-- <input type="text" name="supplycost" id="supplycost" value = "<%=taxinvoice.getDetailList().get(i).getTax() %>"> --%>
							<fmt:formatNumber value="<%=taxinvoice.getDetailList().get(i).getSupplyCost() %>"/>
						</td>
						<td style = "text-align-last: end;">
							<!-- <input type="text" name="tax" id="tax"> -->
							<fmt:formatNumber value="<%=taxinvoice.getDetailList().get(i).getTax() %>"/>
						</td>
						<td style = "text-align-last: start;"><%=taxinvoice.getDetailList().get(i).getRemark() %></td>
					</tr>
				<%} %>
			</table>
			<div style="text-align: right;">
				<a href="#" class="btn-two gray rounded" style="color: black; padding: 5px 15px; margin: 10px 2px;" onclick="window.close();">닫기</a>
				<a href="#" class="btn-two blue rounded" style="padding: 5px 15px; margin: 10px 2px;" onclick="alert('서비스 준비중입니다.');">취소발행</a>
			</div>
		</td>
	</tr>
<!-- 전체테이블 끝 -->
</table>