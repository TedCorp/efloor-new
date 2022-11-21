<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/layout/inc/taglib.jsp" %>

<%@ include file="TaxBillCheckCommon.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.cashbill.CBSearchResult"%>
<%@page import="com.popbill.api.cashbill.Cashbill"%>

<%
	String CorpNum = "1234567890";
	String MgtKey = (String)request.getAttribute("MgtKey");
	
	Cashbill cashbill = null; 
	
	try {
		cashbill = cashbillService.getDetailInfo(CorpNum, MgtKey);
	} catch (PopbillException pe) {
	    System.out.println("오류코드 " + pe.getCode());
	    System.out.println("오류메시지 " + pe.getMessage());
	    throw pe;
	}

%>

<style>
body{
	background: #f6f6f6;
}
.cash_subtitle {
	display: inline-block;
    padding: 0 0 0 13px;
    /* margin: 16px 0 0 0; */
    font-size: 13px;
    color: #222222;
    font-weight: bold;
    background: url(../../../resources/resources2/images/taxCheckdot.gif) left 4px no-repeat;
}
.cash_subtitle02 {
	display: inline-block;
    padding: 0 0 0 13px;
    /* margin: 16px 0 0 0; */
    font-size: 13px;
    color: #222222;
    font-weight: bold;
    background: url(../../../resources/resources2/images/taxCheckdot.gif) left 4px no-repeat;
}
    
.mgt_6 {
	margin-top: 6px !important
}

.cashinfo_table {
	width: 100%;
	border-collapse: collapse;
    /* border-top: 2px solid #7896bd; */
}
.td_bg {
	background: #f1f3f6;
}
.td_bg2 {
	background: #fff4f4;
}
.cashinfo_table > tbody > tr > td {
	border-bottom: 1px solid #DFDFDF;
	padding: 6px 6px 6px 6px;
	border-width: 2px;
}
</style>
<%-- <%=cashbill.getConfirmNum() %>
<%=cashbill.getTotalAmount() %>
<%=cashbill.getTradeType() %>
<%=cashbill.getIdentityNum() %> --%>

<table class="table table-bordered Single" style=" width: 100%; ">
	<thead style="height: 50px;"><!-- background: #FFF6F6;  -->
		<tr>
			<th colspan="2">
				<div style = "text-align-last: start; margin: 0 0 0 20px;font-size: 24px;">현금영수증</div>
			</th>
		</tr>
	</thead>
	<tr>
		<td>
			<div style="background: white; padding: 12px;">
				<table class="mgt_6 cashinfo_table" summary="현금영수증 발행정보">
					<colgroup>
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td class="td_bg" style="border-top: 2px solid #7896bd;">식별번호</td>
							<td style="border-top: 2px solid #7896bd;"><%=cashbill.getIdentityNum() %></td>
							<td class="td_bg" style="border-top: 2px solid #7896bd;">문서형태</td>
							<td style="border-top: 2px solid #7896bd;"><%=cashbill.getTradeType() %></td>
						</tr>
						<tr>
							<td class="td_bg">거래구분</td>
							<td><%=cashbill.getTradeUsage() %></td>
							<td class="td_bg">거래유형</td>
							<td><%=cashbill.getTradeOpt() %></td>
						</tr>
						<tr>
							<td class="td_bg">거래일자</td>
							<td><%=cashbill.getTradeDate() %></td>
							<td class="td_bg" rowspan="2">국세청<br>승인번호</td>
							<td rowspan="2"><b><%=cashbill.getConfirmNum() %></b></td>
						</tr>
						<tr>
							<td class="td_bg">전송일자</td>
							<td></td>
						</tr>
					</tbody>
				</table>
				
				<table class="mgt_6 cashinfo_table" summary="현금영수증 발행정보">
					<colgroup>
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td colspan="2" style="border-bottom: 0px solid #DFDFDF; padding: 0px 4px 0px 4px;">
								<p class="cash_subtitle">구매정보</p>
							</td>
							<td colspan="2" style="border-bottom: 0px solid #DFDFDF; padding: 0px 4px 0px 4px;">
								<p class="cash_subtitle02">결제정보</p>
							</td>
						</tr>
						<tr>
							<td class="td_bg" style="border-top: 2px solid #7896bd;">주문자명</td>
							<td style="border-top: 2px solid #7896bd;">
								<%=cashbill.getCustomerName() %>
							</td>
							<td class="td_bg2" style="border-top: 2px solid #7896bd;">거래금액</td>
							<td style="border-top: 2px solid #7896bd;">
								<b style="color: red;"><%=cashbill.getTotalAmount() %></b>
							</td>
						</tr>
						<tr>
							<td class="td_bg">주문번호</td>
							<td><%=cashbill.getOrderNumber() %></td>
							<td class="td_bg2">공급가액</td>
							<td><b><%=cashbill.getSupplyCost() %></b></td>
						</tr>
						<tr>
							<td class="td_bg" rowspan="2">주문상품명</td>
							<td rowspan="2">
								<%=cashbill.getItemName() %>
							</td>
							<td class="td_bg2">부가세</td>
							<td><b><%=cashbill.getTax() %></b></td>
						</tr>
						<tr>
							
							<td class="td_bg2">봉사료</td>
							<td><b><%=cashbill.getServiceFee() %></b></td>
						</tr>
					</tbody>
				</table>
				<table class="mgt_6 cashinfo_table" summary="현금영수증 발행정보">
					<colgroup>
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td colspan="4" style="border-bottom: 0px solid #DFDFDF; padding: 0px 4px 0px 4px;">
								<p class="cash_subtitle">현금영수증 가맹점</p>
							</td>
						</tr>
						<tr>
							<td class="td_bg" style="border-top: 2px solid #7896bd;">상호</td>
							<td style="border-top: 2px solid #7896bd;" colspan="3"><%=cashbill.getFranchiseCorpName() %></td>
						</tr>
						<tr>
							<td class="td_bg">사업자번호</td>
							<td><%=cashbill.getFranchiseCorpNum() %></td>
							<td class="td_bg">종사업장</td>
							<td><%=cashbill.getFranchiseAddr() %></td>
						</tr>
						<tr>
							<td class="td_bg">대표자</td>
							<td><%=cashbill.getFranchiseCEOName() %></td>
							<td class="td_bg">대표번호</td>
							<td><%=cashbill.getFranchiseTEL() %></td>
						</tr>
						<tr>
							<td class="td_bg" style="height: 60px;">주소</td>
							<td colspan="3"><%=cashbill.getFranchiseAddr() %></td>
						</tr>
					</tbody>
				</table>
			</div>
		</td>
	</tr>
</table>
