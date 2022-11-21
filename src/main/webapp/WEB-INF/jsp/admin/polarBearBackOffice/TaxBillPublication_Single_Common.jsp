<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/layout/inc/taglib.jsp" %>
<%-- 전자세금계산서 클래스 빈 생성 --%>
<jsp:useBean id="taxinvoiceService" scope="application" class="com.popbill.api.taxinvoice.TaxinvoiceServiceImp"/>

<%-- 링크아이디(LinkID), 연동신청시 발급받은 정보로 수정 --%>
<jsp:setProperty name="taxinvoiceService" property="linkID" value="TEDCORP"/>

<%-- 비밀키(SecretKey), 연동신청시 발급받은 정보로 수정 --%>
<jsp:setProperty name="taxinvoiceService" property="secretKey" value="yXb1StBL2UF1AGQli8j0Ocxlc7ZgcCzHeBZjIVXiX0E="/>

<%-- 연동환경 설정값, true-개발용(테스트베드), false-상업용(실서비스) --%>
<jsp:setProperty name="taxinvoiceService" property="test" value="true"/>

<%-- 인증토큰 발급 IP 제한 On/Off, ture-제한기능 사용(기본값-권장),  false-제한기능 미사용 --%>
<jsp:setProperty name="taxinvoiceService" property="IPRestrictOnOff" value="true"/>

<%-- 팝빌 API 서비스 고정 IP 사용여부, true-사용, false-미사용, 기본값(false) --%>
<jsp:setProperty name="taxinvoiceService" property="useStaticIP" value="false"/>

<%-- 로컬시스템 시간 사용여부 true-사용(기본값-권장), false-미사용 --%>
<jsp:setProperty name="taxinvoiceService" property="useLocalTimeYN" value="true"/>


<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Random"%>
<%@page import="mall.web.domain.TB_POLARBEAR_TAXBILLPUBLICATION"%>
<%@page import="com.popbill.api.IssueResponse"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.taxinvoice.Taxinvoice"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceDetail"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceAddContact"%>

<%
	TB_POLARBEAR_TAXBILLPUBLICATION info = (TB_POLARBEAR_TAXBILLPUBLICATION)request.getAttribute("info");
	
	System.out.println(info.getTotalamount());
	//for문 돌리면서 replace 의심가는건 다하자
	
	String CorpNum = "1234567890";
	Boolean WriteSpecification = false;
	String Memo = info.getMemo();
	Boolean ForceIssue = false;
	String DealInvoiceKey = "";
	String EmailSubject = "";
	String UserID = "";
	
	//세부내용 1
	Taxinvoice taxinvoice = new Taxinvoice();
	
	taxinvoice.setIssueType("정발행");
	taxinvoice.setTaxType(info.getTaxtype());
	taxinvoice.setChargeDirection("정과금");
	taxinvoice.setSerialNum("");
	//taxinvoice.setKwon();
	//taxinvoice.setHo();
	taxinvoice.setWriteDate(info.getWriteDate());
	taxinvoice.setPurposeType(info.getPurposeType());
	
	taxinvoice.setPurposeType(info.getPurposeType());
	taxinvoice.setSupplyCostTotal(info.getSupplycosttotal());
	taxinvoice.setTaxTotal(info.getTaxtotal());
	taxinvoice.setTotalAmount(info.getTotalamount());
	//taxinvoice.setCash("");
	//taxinvoice.setChkBill("");
	//taxinvoice.setCredit("");
	//taxinvoice.setNote("");
	//taxinvoice.setRemark1("");
	//taxinvoice.setRemark2("");
	//taxinvoice.setRemark3("");
	
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
	
	
	String InvoicerMgtKey = "plKey"+nowTime+generatedString;
	
	System.out.println(InvoicerMgtKey);
	
	taxinvoice.setInvoicerMgtKey(InvoicerMgtKey);	//추후 난수로 발행
	
	taxinvoice.setInvoicerCorpNum(info.getInvoicerCorpNum().replaceAll("-", ""));
	System.out.println(info.getInvoicerCorpNum().replaceAll("-", ""));
	
	taxinvoice.setInvoicerTaxRegID(info.getInvoicerTaxRegID());
	taxinvoice.setInvoicerCorpName(info.getInvoicerCorpName());
	taxinvoice.setInvoicerCEOName(info.getInvoicerCEOName());
	taxinvoice.setInvoicerAddr(info.getInvoicerAddr());
	taxinvoice.setInvoicerBizType(info.getInvoicerBizType());
	taxinvoice.setInvoicerBizClass(info.getInvoicerBizClass());
	taxinvoice.setInvoicerContactName(info.getInvoicerContactName());
	//taxinvoice.setInvoicerDeptName("");
	taxinvoice.setInvoicerTEL(info.getInvoicerTEL());
	//taxinvoice.setInvoicerHP("");
	taxinvoice.setInvoicerEmail(info.getInvoicerEmail());
	taxinvoice.setInvoicerSMSSendYN(false);
	taxinvoice.setInvoiceeMgtKey("");
	taxinvoice.setInvoiceeType(info.getInvoiceetype());
	taxinvoice.setInvoiceeCorpNum(info.getInvoiceeCorpNum().replaceAll("-", ""));
	System.out.println(info.getInvoiceeCorpNum().replaceAll("-", ""));
	
	taxinvoice.setInvoiceeTaxRegID(info.getInvoiceeTaxRegID());
	taxinvoice.setInvoiceeCorpName(info.getInvoiceeCorpName());
	taxinvoice.setInvoiceeCEOName(info.getInvoiceeCEOName());
	taxinvoice.setInvoiceeAddr(info.getInvoiceeAddr());
	taxinvoice.setInvoiceeBizType(info.getInvoiceeBizType());
	taxinvoice.setInvoiceeBizClass(info.getInvoiceebizclass());
	taxinvoice.setInvoiceeContactName1(info.getInvoiceeContactName1());
	//taxinvoice.setInvoiceeDeptName1("");
	taxinvoice.setInvoiceeTEL1(info.getInvoiceeTEL1());
	//taxinvoice.setInvoiceeHP1("");
	taxinvoice.setInvoiceeEmail1(info.getInvoiceeEmail1());
	
	//담당자 부 2 이거 생략
	//taxinvoice.setInvoiceeContactName2("");
	
	
    /******상품 디테일*******/
	taxinvoice.setDetailList(new ArrayList<TaxinvoiceDetail>());

    TaxinvoiceDetail detail;
    
    
    //for문 돌리기
    for(int i = 0 ; i < info.getItemname().length ; i++){
    	
    	detail = new TaxinvoiceDetail();
    	
	    detail.setSerialNum((short) ((short)i+1));
		detail.setPurchaseDT(info.getPurchaseDT()[i]);
		detail.setItemName(info.getItemname()[i]);
		detail.setSpec(info.getSpec()[i]);
		detail.setQty(info.getQty()[i]);
		detail.setUnitCost(info.getUnitcost()[i]);
		detail.setSupplyCost(info.getSupplycost()[i]);
		detail.setTax(info.getTax()[i]);
		detail.setRemark(info.getRemark()[i]);
		
		taxinvoice.getDetailList().add(detail);
    }
    
	//추가담당자 null처리
	
    IssueResponse issueResponse = null;
	
	
	try {
		issueResponse = taxinvoiceService.registIssue(CorpNum, taxinvoice, WriteSpecification, Memo, ForceIssue, DealInvoiceKey, EmailSubject, UserID);
	} catch (PopbillException pe) {
	    //적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
	    System.out.println("오류코드 " + pe.getCode());
	    System.out.println("오류메세지 " + pe.getMessage());
%>
	<script type="text/javascript">
		alert("문제가 발생하였습니다.\n<%=pe.getMessage()%>");
		history.go(-1);
	</script>
<%    
	    throw pe;
	}
	
%>
	<form action="${contextPath }/adm/SuccessTaxBillPublicationUpdate" method = "get" id = "SuccessTaxBillPublicationUpdate">
		<c:forEach items="${ORDER_NUM_ArrayList }" var="ORDER_NUM_ArrayList">
			<input type="hidden" name = "ORDER_NUM_List" value ="${ORDER_NUM_ArrayList }">
		</c:forEach>
	</form>
	
<script type="text/javascript">
	alert("발급 완료되었습니다.");
	/* location.href='${contextPath }/adm/orderMgr'; */
	document.getElementById("SuccessTaxBillPublicationUpdate").submit();
	//location.href='${contextPath }/adm/orderMgr';

</script>
