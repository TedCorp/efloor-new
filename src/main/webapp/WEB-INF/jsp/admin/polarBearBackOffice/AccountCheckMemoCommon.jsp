<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/layout/inc/taglib.jsp" %>

<%@ include file="AccountCheckCommon.jsp" %>
<%@ page import="com.popbill.api.easyfin.EasyFinBankSearchResult"%>
<%@ page import="com.popbill.api.PopbillException"%>
<%@ page import="com.popbill.api.Response"%>
<%@ page import="java.text.SimpleDateFormat"%>


<%
	String CorpNum = "2208835324";
	String TID = String.valueOf(request.getAttribute("tid"));
	String Memo = String.valueOf(request.getAttribute("memo"));
	
	Response responseMemo = null;;
	
	try {
		responseMemo = easyFinBankService.saveMemo(CorpNum, TID, Memo, null);
    } catch (PopbillException pe) {
        // 예외 발생 시, pe.getCode() 로 오류 코드를 확인하고, pe.getMessage()로 오류 메시지를 확인합니다.
        System.out.println("오류 코드 " + pe.getCode());
        System.out.println("오류 메시지 " + pe.getMessage());
        %>
        <script type="text/javascript">
	        alert("문제가 발생하였습니다.\n<%=pe.getMessage()%>");
			history.go(-1);
		</script>
        <%
    }
%>

<script type="text/javascript">

	location.href="/adm/AccountCheck?SDate=null&EDate=null";

</script>