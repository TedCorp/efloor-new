<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%-- 홈택스연동(세금) 클래스 빈 생성 --%>
<jsp:useBean id="htTaxinvoiceService" scope="application" class="com.popbill.api.hometax.HTTaxinvoiceServiceImp" />

<%-- 링크아이디 --%>
<jsp:setProperty name="htTaxinvoiceService" property="linkID" value="TEDCORP" />

<%-- 비밀키, 사용자 인증에 사용되는 정보이므로 유출에 주의 --%>
<jsp:setProperty name="htTaxinvoiceService" property="secretKey" value="yXb1StBL2UF1AGQli8j0Ocxlc7ZgcCzHeBZjIVXiX0E=" />

<%-- 연동환경 설정값, 개발용(true), 상업용(false) --%>
<jsp:setProperty name="htTaxinvoiceService" property="test" value="true" />

<%-- 인증토큰 발급 IP 제한 On/Off, ture -제한기능 사용(기본값-권장), false-제한기능 미사용 --%>
<jsp:setProperty name="htTaxinvoiceService" property="IPRestrictOnOff" value="true" />

<%-- 팝빌 API 서비스 고정 IP 사용여부, true-사용, false-미사용, 기본값(false) --%>
<jsp:setProperty name="htTaxinvoiceService" property="useStaticIP" value="false"/>

<%-- 로컬시스템 시간 사용여부 true-사용(기본값-권장), false-미사용 --%>
<jsp:setProperty name="htTaxinvoiceService" property="useLocalTimeYN" value="true"/>


