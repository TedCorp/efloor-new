<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


test test test 2222

<%@ include file="PurchaseCheckCommon.jsp" %>
<%@page import="com.popbill.api.hometax.QueryType"%>
<%@page import="com.popbill.api.PopbillException"%>
<%
    /*
     * 전자세금계산서 매출/매입 내역 수집을 요청합니다
     * - 수집 요청후 반환받은 작업아이디(JobID)의 유효시간은 1시간 입니다.
     */

    // 팝빌회원 사업자번호
    String testCorpNum = "1234567890";

    // SELL-매출 세금계산서, BUY-매입 세금계산서, TRUSTEE-위수탁 세금계산서
    QueryType TaxinvoiceType = QueryType.SELL;

    // 수집일자유형 유형, W-작성일자, I-발행일자, S-전송일자
    String DType = "S";

    // 시작일자, 날짜형식(yyyyMMdd)
    String SDate = "20220101";

    // 종료일자, 날짜형식(yyyyMMdd)
    String EDate = "20220130";

    String jobID = null;

    try {
        jobID = htTaxinvoiceService.requestJob(testCorpNum, TaxinvoiceType, DType, SDate, EDate);
    } catch (PopbillException pe) {
        //적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        System.out.println("오류코드 " + pe.getCode());
        System.out.println("오류메시지 " + pe.getMessage());
        %>
			<script type="text/javascript">
				location.href="test2222222?jobID=<%=jobID%>";
			</script>
        <%
    }
%>

	



