<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
<%@page import="com.popbill.api.IssueResponse"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.taxinvoice.MgtKeyType"%>
<%@page import="com.popbill.api.taxinvoice.Taxinvoice"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceDetail"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceAddContact"%>

<%

	String CorpNum = "1234567890";
	MgtKeyType KeyType;
	KeyType = MgtKeyType.SELL;
	//String MgtKey = "InvoicerMgtKey";	//성공
	
	//String MgtKey = "022093014224100001";	//실패
	
	//String MgtKey = "20221004-C1234567890-470"; //실패
	
	String MgtKey = "AAN300-202210-001";
	
	Taxinvoice taxinvoice = null;
	
	try {
		taxinvoice = taxinvoiceService.getDetailInfo(CorpNum, KeyType, MgtKey);
    } catch (PopbillException pe) {
        // 예외 발생 시, pe.getCode() 로 오류 코드를 확인하고, pe.getMessage()로 오류 메시지를 확인합니다.
        System.out.println("오류 코드 " + pe.getCode());
        System.out.println("오류 메시지 " + pe.getMessage());
    }
	
%>

	testtesttest
	<%=taxinvoice.getCash() %>
	<%=taxinvoice.getPurposeType() %>
