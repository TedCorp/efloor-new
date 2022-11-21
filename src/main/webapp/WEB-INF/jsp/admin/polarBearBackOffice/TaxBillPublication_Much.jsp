<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<table>
	<tr>
		<td>
			세금계산서 발행유형
		</td>
		<td>
			<input type="radio" id = "taxtype_11" name = "taxtype_checkbox" onChange="taxIssueFormChange()" checked="checked"><label for="taxtype_11"> 정발형 </label><button type="button"> <img src="${contextPath}/resources/resources2/images/pngwing.com.png" height ="20" width="20" />엑셀양식 다운로드</button>
			<input type="radio" id = "taxtype_22" name = "taxtype_checkbox" onchange="taxIssueFormChange()"><label for="taxtype_22"> 역발행 </label><button type="button"> <img src="${contextPath}/resources/resources2/images/pngwing.com.png" height ="20" width="20" />엑셀양식 다운로드</button>
		</td>
	</tr>
	<tr>
		<td>
			엑셀파일 업로드
		</td>
		<td>
			<input type="text"><input type="button" value="찾아보기">
		</td>
	</tr>
</table>

	<!-- 정발행 -->
	<div id = "taxIssueForm">
	> 전체 [10건]
		<table class = "MuchTable">
			<tr style = "background:#C2D5F3;">
				<td>&emsp;&emsp;</td>
				<td style="color: red;"><strong>작성일자<br> (형식: 0000-00-00)</strong></td>
				<td style="color: red;"><strong>[공급받는자]<br> 사업자번호</strong></td>
				<td ><strong>종사업장</strong></td>
				<td style="color: red;"><strong>회사명</strong></td>
				<td style="color: red;"><strong>대표자</strong></td>
				<td ><strong>주소</strong></td>
				<td ><strong>업태</strong></td>
				<td ><strong>종목</strong></td>
				<td ><strong>담당자</strong></td>
				<td ><strong>연락처</strong></td>
				<td ><strong>휴대폰</strong></td>
				<td ><strong>이메일</strong></td>
				<td style="color: red;"><strong>과세형태<br> (과세,영세,면세 중 택1)</strong></td>
				<td style="color: red;"><strong>영수/청구/없음<br> (택1)</strong></td>
				<td ><strong>비고</strong></td>
				<td ><strong>[품목1] 일자<br> (형식: 0000-00-00)</strong></td>
				<td ><strong>[품목1] 품목</strong></td>
				<td ><strong>[품목1] 규격</strong></td>
				<td ><strong>[품목1] 수량</strong></td>
				<td ><strong>[품목1] 단가</strong></td>
				<td style="color: red;"><strong>[품목1] 공급가액</strong></td>
				<td style="color: red;"><strong>[품목1] 세액<br> (영세, 면세는 세액 "0"입력)</strong></td>
				<td ><strong>[품목1] 비고</strong></td>
				<td ><strong>[품목2] 일자</strong></td>
				<td ><strong>[품목2] 품목</strong></td>
				<td ><strong>[품목2] 규격</strong></td>
				<td ><strong>[품목2] 수량</strong></td>
				<td ><strong>[품목2] 단가</strong></td>
				<td ><strong>[품목2] 공급가액</strong></td>
				<td ><strong>[품목2] 세액</strong></td>
				<td ><strong>[품목2] 비고</strong></td>
				<td ><strong>[품목3] 일자</strong></td>
				<td ><strong>[품목3] 품목</strong></td>
				<td ><strong>[품목3] 규격</strong></td>
				<td ><strong>[품목3] 수량</strong></td>
				<td ><strong>[품목3] 단가</strong></td>
				<td ><strong>[품목3] 공급가액</strong></td>
				<td ><strong>[품목3] 세액</strong></td>
				<td ><strong>[품목3] 비고</strong></td>
				<td ><strong>[품목4] 일자</strong></td>
				<td ><strong>[품목4] 품목</strong></td>
				<td ><strong>[품목4] 규격</strong></td>
				<td ><strong>[품목4] 수량</strong></td>
				<td ><strong>[품목4] 단가</strong></td>
				<td ><strong>[품목4] 공급가액</strong></td>
				<td ><strong>[품목4] 세액</strong></td>
				<td ><strong>[품목4] 비고</strong></td>
				<td ><strong>현금</strong></td>
				<td ><strong>수표</strong></td>
				<td ><strong>어음</strong></td>
				<td ><strong>외상미수금</strong></td>
			</tr>
			<tr>
				<td style = "background:#D9E5F6;">1</td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
			</tr>
		</table>
	</div>	
		<!-- 역발행 -->
	<div id = "taxReverseIssueForm" style="display: none;">
		> 전체 [10건]
		<table class = "MuchTable">
			<tr style = "background:#C2D5F3;">
				<td>&emsp;&emsp;</td>
				<td style="color: red;"><strong>작성일자<br> (형식: 0000-00-00)</strong></td>
				<td style="color: red;"><strong>[공급자]<br> 사업자번호</strong></td>
				<td ><strong>종사업장</strong></td>
				<td style="color: red;"><strong>회사명</strong></td>
				<td style="color: red;"><strong>대표자</strong></td>
				<td ><strong>주소</strong></td>
				<td ><strong>업태</strong></td>
				<td ><strong>종목</strong></td>
				<td ><strong>담당자</strong></td>
				<td ><strong>연락처</strong></td>
				<td ><strong>휴대폰</strong></td>
				<td ><strong>이메일</strong></td>
				<td style="color: red;"><strong>과세형태<br> (과세,영세,면세 중 택1)</strong></td>
				<td style="color: red;"><strong>영수/청구/없음<br> (택1)</strong></td>
				<td ><strong>비고</strong></td>
				<td ><strong>[품목1] 일자<br> (형식: 0000-00-00)</strong></td>
				<td ><strong>[품목1] 품목</strong></td>
				<td ><strong>[품목1] 규격</strong></td>
				<td ><strong>[품목1] 수량</strong></td>
				<td ><strong>[품목1] 단가</strong></td>
				<td style="color: red;"><strong>[품목1] 공급가액</strong></td>
				<td style="color: red;"><strong>[품목1] 세액<br> (영세, 면세는 세액 "0"입력)</strong></td>
				<td ><strong>[품목1] 비고</strong></td>
				<td ><strong>[품목2] 일자</strong></td>
				<td ><strong>[품목2] 품목</strong></td>
				<td ><strong>[품목2] 규격</strong></td>
				<td ><strong>[품목2] 수량</strong></td>
				<td ><strong>[품목2] 단가</strong></td>
				<td ><strong>[품목2] 공급가액</strong></td>
				<td ><strong>[품목2] 세액</strong></td>
				<td ><strong>[품목2] 비고</strong></td>
				<td ><strong>[품목3] 일자</strong></td>
				<td ><strong>[품목3] 품목</strong></td>
				<td ><strong>[품목3] 규격</strong></td>
				<td ><strong>[품목3] 수량</strong></td>
				<td ><strong>[품목3] 단가</strong></td>
				<td ><strong>[품목3] 공급가액</strong></td>
				<td ><strong>[품목3] 세액</strong></td>
				<td ><strong>[품목3] 비고</strong></td>
				<td ><strong>[품목4] 일자</strong></td>
				<td ><strong>[품목4] 품목</strong></td>
				<td ><strong>[품목4] 규격</strong></td>
				<td ><strong>[품목4] 수량</strong></td>
				<td ><strong>[품목4] 단가</strong></td>
				<td ><strong>[품목4] 공급가액</strong></td>
				<td ><strong>[품목4] 세액</strong></td>
				<td ><strong>[품목4] 비고</strong></td>
				<td ><strong>현금</strong></td>
				<td ><strong>수표</strong></td>
				<td ><strong>어음</strong></td>
				<td ><strong>외상미수금</strong></td>
			</tr>
			<tr>
				<td style = "background:#D9E5F6;">1</td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
			</tr>
		</table>
	</div>
	<div style="text-align-last: center; margin: 20px 0px 0px 0px;">
		<a href="#" class="btn-two gray rounded" style="color: black;">취소</a>
		<a href="#" class="btn-two blue rounded">저장</a>
	</div>
<script type="text/javascript">
	function taxIssueFormChange() {
	    if(document.getElementById('taxIssueForm').style.display === 'none') {
	    	document.getElementById('taxReverseIssueForm').style.display = 'none';
	    	document.getElementById('taxIssueForm').style.display = 'contents';
	    } else {
	    	document.getElementById('taxIssueForm').style.display = 'none';
	    	document.getElementById('taxReverseIssueForm').style.display = 'contents';
	    }
	  }
	
</script>