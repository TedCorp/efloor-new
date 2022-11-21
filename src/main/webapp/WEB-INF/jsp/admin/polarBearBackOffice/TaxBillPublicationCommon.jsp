<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- 현금영수증 -->

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




여기서부터 붙여넣어라
여기서부터 붙여넣어라
여기서부터 붙여넣어라
여기서부터 붙여넣어라
여기서부터 붙여넣어라




<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Popbill Cashbill Example</title>
    </head>
<%@ include file="TaxBillPublicationCommon.jsp" %>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.cashbill.Cashbill"%>
<%
    /*
    * 1건의 현금영수증을 [즉시발행]합니다.
    * - 발행일 기준 오후 5시 이전에 발행된 현금영수증은 다음날 오후 2시에 국세청 전송결과를 확인할 수 있습니다.
    */

    // 팝빌회원 사업자번호, '-'제외 10자리
    String testCorpNum = "1234567890";
	
    // 팝빌회원 아이디
    String testUserID = "testkorea";

    // 메모
    String memo = "발행 메모";

    // 발행안내 메일 제목, 미기재시 기본 양식으로 전송
    String emailSubject = "";

    // 현금영수증 정보 객체
    Cashbill cashbill = new Cashbill();

    // 현금영수증 문서번호, 최대 24자리, 영문, 숫자 '-'를 조합하여 사업자별로 중복되지 않도록 구성
    cashbill.setMgtKey("ABC0226-TEST001");

    // 문서형태, {승인거래, 취소거래} 중 기재
    cashbill.setTradeType("승인거래");

    // [취소거래 시 필수] 원본 현금영수증 승인번호
    cashbill.setOrgConfirmNum("");

    // [취소거래 시 필수] 원본 현금영수증 거래일자
    cashbill.setOrgTradeDate("");

    // 거래구분, {소득공제용, 지출증빙용} 중 기재
    cashbill.setTradeUsage("소득공제용");

    // 거래유형, {일반, 도서, 대중교통} 중 기재
    cashbill.setTradeOpt("일반");

    //거래처 식별번호, 거래구분에 따라 작성
    //소득공제용 - 주민등록/휴대폰/카드번호(현금영수증 카드)/자진발급용 번호(010-000-1234) 입력
    //지출증빙용 - 사업자번호/주민등록/휴대폰/카드번호(현금영수증 카드) 입력
    //주민등록번호 13자리, 휴대폰번호 10~11자리, 카드번호 13~19자리, 사업자번호 10자리 입력 가능
    cashbill.setIdentityNum("0101112222");

    // 과세형태, {과세, 비과세} 중 기재
    cashbill.setTaxationType("과세");

    // 공급가액, 숫자만 가능
    cashbill.setSupplyCost("10000");

    // 부가세, 숫자만 가능
    cashbill.setTax("1000");

    // 봉사료, 숫자만 가능
    cashbill.setServiceFee("0");

    // 거래금액, 숫자만 가능, 봉사료 + 공급가액 + 부가세
    cashbill.setTotalAmount("11000");

    // 가맹점 사업자번호, '-'제외 10자리
    cashbill.setFranchiseCorpNum(testCorpNum);

    // 가맹점 종사업장 번호
    cashbill.setFranchiseTaxRegID("");

    // 가맹점 상호
    cashbill.setFranchiseCorpName("가맹점 상호");

    // 가맹점 대표자성명
    cashbill.setFranchiseCEOName("가맹점 대표자");

    // 가맹점 주소
    cashbill.setFranchiseAddr("가맹점 주소");

    // 가맹점 연락처
    cashbill.setFranchiseTEL("07043042991");

    // 발행시 안내문자 전송여부
    cashbill.setSmssendYN(false);

    // 거래처 주문자명
    cashbill.setCustomerName("주문자명");

    // 거래처 주문상품명
    cashbill.setItemName("주문상품명");

    // 거래처 주문번호
    cashbill.setOrderNumber("주문번호");

    // 거래처 이메일
    // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
    // 실제 거래처의 메일주소가 기재되지 않도록 주의
    cashbill.setEmail("test@test.com");

    // 거래처 휴대폰
    cashbill.setHp("010111222");

    // 거래처 팩스
    cashbill.setFax("070111222");

    Response CheckResponse = null;
    try {
        CheckResponse = cashbillService.registIssue(testCorpNum, cashbill, memo, testUserID, emailSubject);
    } catch (PopbillException pe) {
        //적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        System.out.println("오류코드 " + pe.getCode());
        System.out.println("오류메시지 " + pe.getMessage());
        throw pe;
    }
%>
    <body>
        <p>Response</p>
        <br/>
        <fieldset>
            <legend>현금영수증 즉시발행</legend>
            <ul>
                <li>응답코드 (Response.code) : <%=CheckResponse.getCode()%></li>
                <li>응답메시지 (Response.message) : <%=CheckResponse.getMessage()%></li>
            </ul>
        </fieldset>
    </body>
</html>












