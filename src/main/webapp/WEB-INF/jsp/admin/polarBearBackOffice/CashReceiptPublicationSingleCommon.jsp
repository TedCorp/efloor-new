<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/layout/inc/taglib.jsp" %>
<%-- 현금영수증 클래스 빈 생성 --%>
<jsp:useBean id="cashbillService" scope="application" class="com.popbill.api.cashbill.CashbillServiceImp" />

<%-- 링크아이디 --%>
<jsp:setProperty name="cashbillService" property="linkID" value="TEDCORP" />

<%-- 비밀키, 사용자 인증에 사용되는 정보이므로 유출에 주의 --%>
<jsp:setProperty name="cashbillService" property="secretKey" value="yXb1StBL2UF1AGQli8j0Ocxlc7ZgcCzHeBZjIVXiX0E=" />

<%-- 연동환경 설정값, 개발용(true), 상업용(false) --%>
<jsp:setProperty name="cashbillService" property="test" value="true" />

<%-- 인증토큰 발급 IP 제한 On/Off, ture -제한기능 사용(기본값-권장), false-제한기능 미사용 --%>
<jsp:setProperty name="cashbillService" property="IPRestrictOnOff" value="true" />

<%-- 팝빌 API 서비스 고정 IP 사용여부, true-사용, false-미사용, 기본값(false) --%>
<jsp:setProperty name="cashbillService" property="useStaticIP" value="false"/>

<%-- 로컬시스템 시간 사용여부 true-사용(기본값-권장), false-미사용 --%>
<jsp:setProperty name="cashbillService" property="useLocalTimeYN" value="true"/>

<%@page import="com.popbill.api.Response"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Random"%>
<%@page import="com.popbill.api.CBIssueResponse"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.cashbill.Cashbill"%>
<%@page import="mall.web.domain.TB_PublicationSingle"%>



<%
	TB_PublicationSingle obj = (TB_PublicationSingle)request.getAttribute("obj");
	
	String CorpNum = "1234567890";
	String memo = "";
	String UserId = "";
	String emailSubject = "";
	
	Cashbill cashbill = new Cashbill();
	
	//날짜데이터
	Date dt=new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
	String nowTime  = sdf.format(dt);
	
  	//난수 발생
    int leftLimit = 48; // numeral '0'
	int rightLimit = 122; // letter 'z'
	int targetStringLength = 10;
	Random random = new Random();

	String generatedString = random.ints(leftLimit,rightLimit + 1)
	  .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
	  .limit(targetStringLength)
	  .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	  .toString();
		
	String MgtKey = "plKey"+nowTime+generatedString;
		
	System.out.println(MgtKey);
	
	cashbill.setMgtKey(MgtKey);
	cashbill.setTradeType("승인거래");
	
	cashbill.setTradeUsage(obj.getTradeUsage());
	System.out.println("obj.getTradeUsage()"+obj.getTradeUsage());
	
	cashbill.setTaxationType(obj.getTaxationType());
	System.out.println("obj.getTaxationType()"+obj.getTaxationType());
	
	cashbill.setTotalAmount(obj.getTotalAmount());
	System.out.println("obj.getTotalAmount()"+obj.getTotalAmount());
	
	cashbill.setSupplyCost(obj.getSupplyCost());
	System.out.println("obj.getSupplyCost()"+obj.getSupplyCost());
	
	cashbill.setTax(obj.getTax());
	System.out.println("obj.getTax()"+obj.getTax());
	
	cashbill.setServiceFee(obj.getServiceFee());
	System.out.println("obj.getServiceFee()"+obj.getServiceFee());
	
	cashbill.setFranchiseCorpNum(obj.getFranchiseCorpNum());
	System.out.println("obj.getFranchiseCorpNum()"+obj.getFranchiseCorpNum());
	
	cashbill.setIdentityNum(obj.getIdentityNum());
	System.out.println("obj.getIdentityNum()"+obj.getIdentityNum());
	
	//주문자 성명(id) 형태로 만들어서 넘기기
	cashbill.setCustomerName(obj.getCustomerName());	//주문자 name(id)
	System.out.println("obj.getCustomerName()"+obj.getCustomerName());
	
	cashbill.setItemName(obj.getItemName());	//상품명
	System.out.println("obj.getItemName()"+obj.getItemName());
	
	cashbill.setOrderNumber(obj.getOrderNumber());	//주문번호
	System.out.println("obj.getOrderNumber()"+obj.getOrderNumber());
	
	/* 대표자 정보 */
	cashbill.setFranchiseCorpName("주식회사 폴라베어");
	cashbill.setFranchiseCEOName("안남희");
	cashbill.setFranchiseTEL("042-826-8233");
	cashbill.setFranchiseAddr("34065 대전광역시 유성구 반석로 148 (반석동) 지하1층");
	
	
	CBIssueResponse cbissueResponse = null;
	
	try {
		
		cbissueResponse = cashbillService.registIssue(CorpNum, cashbill, memo, UserId, emailSubject);
    } catch (PopbillException pe) {
        //적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        System.out.println("오류코드 " + pe.getCode());
        System.out.println("오류메시지 " + pe.getMessage());
%>
	<script type="text/javascript">
		alert("문제가 발생하였습니다.\n<%=pe.getMessage()%>");
		history.go(-1);
	</script>
<%   
         throw pe;
    }
		
%>

<form action="${contextPath }/adm/SuccessCashReceiptPublicationUpdate" method = "get" id = "SuccessCashReceiptPublicationUpdate">
	<input type="hidden" name = "ORDER_NUM" value ="<%=obj.getOrderNumber()%>">
</form>

<script type="text/javascript">
	alert("발급 완료되었습니다.");
	document.getElementById("SuccessCashReceiptPublicationUpdate").submit();
</script>