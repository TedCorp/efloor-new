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
