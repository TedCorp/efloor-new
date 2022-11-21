<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/layout/inc/taglib.jsp" %>

<!-- 실시간 계좌조회 -->


<%@ include file="AccountCheckCommon.jsp" %>
<%@ page import="com.popbill.api.easyfin.EasyFinBankSearchResult"%>
<%@ page import="com.popbill.api.PopbillException"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
/*     /*
     * 계좌 거래내역 수집을 요청합니다.
     * - 검색기간은 현재일 기준 90일 이내로만 요청할 수 있습니다.
     * - 수집 요청후 반환받은 작업아이디(JobID)의 유효시간은 1시간 입니다.
     */
	
    // 팝빌회원 사업자번호
    String testCorpNum = "2208835324";
    // 기관코드
    String BankCode = "0004";
    // 계좌번호
    String AccountNumber = "21650204427811";
    // 시작일자, 날짜형식(yyyyMMdd)
    
    String SDate = String.valueOf(request.getAttribute("SDate"));
    String EDate = String.valueOf(request.getAttribute("EDate"));
    
    String jobID = null;
    try {
        jobID = easyFinBankService.requestJob(testCorpNum, BankCode, AccountNumber, SDate, EDate);
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
    
    //계좌조회
    String CorpNum = "2208835324";
    
    String JobID = jobID;
    
    String[] TradeType = null;
    String SearchString = String.valueOf(request.getAttribute("SearchString"));
    int Page = Integer.parseInt(String.valueOf(request.getAttribute("pageNumber")));
    int PerPage = 10;
    String Order = "D";
    String UserID = null;

    EasyFinBankSearchResult easyfinbanksearchresult = null;
    
    try {
    	easyfinbanksearchresult = easyFinBankService.search(CorpNum,JobID,TradeType,SearchString,Page,PerPage,Order,UserID);
    } catch (PopbillException pe) {
        // 예외 발생 시, pe.getCode() 로 오류 코드를 확인하고, pe.getMessage()로 오류 메시지를 확인합니다.
        System.out.println("오류 코드 " + pe.getCode());
        System.out.println("오류 메시지 " + pe.getMessage());
    }
    //데이터 데이트 타입으로 교체
    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
    SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat formattime = new SimpleDateFormat("HH:mm:ss");
    
    
    int pageCount = (int)easyfinbanksearchresult.getPageCount();
    int pageNumNum = (int)easyfinbanksearchresult.getPageNum();
    
    int pageNumNumone = (pageNumNum/10);
    int pageNumNumone2 = (pageNumNum/10)+1;
    if(pageNumNumone == 0){
    	pageNumNumone = 1;
    }else {
    	pageNumNumone = (pageNumNumone*10)+1;
    }
    
%>

<style>
.content .box .paging_new{margin-top:30px}
.content .box .paging_new ul{display:flex;flex-direction:row;justify-content:center;align-items:center}
.content .box .paging_new li{width:30px;height:30px;}
.content .box .paging_new li a{display:block;width:30px;line-height:30px;font-size:14px;font-weight:500;color:#333;text-align:center;}
.content .box .paging_new li i{display:block;width:30px;height:30px}
.content .box .paging_new li.on a{background:#111;color:#fff;}
.content .box .paging_new li.start .ic{background:url("${contextPath}/resources/resources2/images/icon_page_start.png") no-repeat 50% 50%}
.content .box .paging_new li.end .ic{background:url("${contextPath}/resources/resources2/images/icon_page_end.png") no-repeat 50% 50%}
.content .box .paging_new li.prev .ic{background:url("${contextPath}/resources/resources2/images/icon_page_prev.png") no-repeat 50% 50%}
.content .box .paging_new li.next .ic{background:url("${contextPath}/resources/resources2/images/icon_page_next.png") no-repeat 50% 50%}

table.table>thead>tr>th {
    text-align: center;
    vertical-align: middle;
}
.tablesettingkey{
	width:5%; 
	text-align: center;
}
.tablesettingvalue{
	width:20%; 
	text-align: center;
}

/* 버튼 이미지 */
.rounded {
 	border-radius: 10px;
}
.gray {
	background: #eee;}
.btn-two {
	color: white; 
	margin: 0px 0px 0px 3px;
	padding: 2px 10px;
	display: inline-block;
	border: 1px solid rgba(0,0,0,0.21);
	border-bottom-color: rgba(0,0,0,0.34);
	text-shadow:0 1px 0 rgba(0,0,0,0.15);
}
</style>


<!-- 최상단 -->
<section class="content-header">
	<h1>
		실시간계좌조회
	</h1>
</section>

<section class="content">
	<!-- 검색 박스 -->
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">검색 조건</h3>

			<div class="box-tools pull-right">
				<button type="button" class="btn btn-box-tool" data-widget="collapse">
					<i class="fa fa-minus"></i>
				</button>
				<button type="button" class="btn btn-box-tool" data-widget="remove">
					<i class="fa fa-remove"></i>
				</button>
			</div>
		</div>
		<!-- /.box-header -->
		
		<div class="box-body">
			<spform:form class="form-horizontal" name="memberSalCntMgrForm" id="AccountCheckForm" method="GET" action="AccountCheck">
				<div class="box-body">
					<div class="form-group">						
						<label for="datepickerStr" class="col-sm-1 control-label">기간</label>
						
						<div class="col-sm-2">
							<div class="input-group bootstrap-datepicker datepicker">
								<input type="text" class="form-control pull-left" name="SDate" id="datepickerStr" value="${SDate }" readonly="readonly">
								<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="input-group bootstrap-datepicker datepicker">
								<input type="text" class="form-control pull-left" name="EDate" id="datepickerEnd" value="${EDate }" readonly="readonly">
								<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
							</div>
						</div>
						<div class="col-sm-7">
							<div class="input-group bootstrap-datepicker datepicker" style = "width: 100%">
								<span>
									<a href="#" class="btn-two rounded" style="color: black; width: 10%; text-align: center; padding: 6px 0px;" onclick="bungi(1)">당일</a>
									<a href="#" class="btn-two rounded" style="color: black; width: 10%; text-align: center; padding: 6px 0px;" onclick="bungi(2)">1주일</a>
									<a href="#" class="btn-two rounded" style="color: black; width: 10%; text-align: center; padding: 6px 0px;" onclick="bungi(3)">15일</a>
									<a href="#" class="btn-two rounded" style="color: black; width: 10%; text-align: center; padding: 6px 0px;" onclick="bungi(4)">1개월</a>
									<!-- <a href="#" class="btn-two gray rounded" style="color: black; padding: 6px 10px;" onclick="firsthalfyear()">상반기</a>
									<a href="#" class="btn-two gray rounded" style="color: black; padding: 6px 10px;" onclick="secondhalfyear()">하반기</a> -->
								</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="MEMB_GUBN" class="col-sm-1 control-label">검색</label>
						
						<div class="col-sm-5">
							<div class="input-group">
								<input type="search" class="form-control" name="SearchString" placeholder="입·출금액  또는 메모" value="${param.schTxt }">
								<span class="input-group-btn">
									<button type="submit" class="btn btn-success pull-right">검색</button>
								</span>
							</div>
						</div>
					</div>
					<div class="box-header with-border">
						<h3 class="box-title"></h3>
						<div class="box-tools">
							<span><strong>검색결과[ <span style="color:red;"><fmt:formatNumber value="<%=easyfinbanksearchresult.getTotal()%>"/></span> 건 ]</strong></span>
							&ensp;<button type="button" class="btn btn-sm btn-success pull-right" id="btnExcel">엑셀</button>
						</div>
					</div>
				</div>
				<input type="hidden" id = "pageNumber" name = "pageNumber">
			</spform:form>
		</div>
		<!-- /.box-body -->
	</div>
	<!-- 검색 박스 -->
	
	<div class="box">
		
		<!-- /.box-header -->
		<div class="box-body">
			<div class="box-body" style="white-space:nowrap;overflow-x:scroll;">
				<table class="table table-bordered" style="background-color: #ededed;">
					<thead>
						<tr>
							<th>No</th>
							<th>거래일시</th>
							<th>거래내역</th>
							<th>입금액</th>
							<th>출금액</th>
							<th>잔액</th>
							<th>메모</th>
						</tr>
					</thead>
					<tbody style="background-color: white; text-align: center;">
						<% for(int i=0 ; i < easyfinbanksearchresult.getList().size(); i++) { %>
							<tr>
								<td><%=(easyfinbanksearchresult.getPageNum()*10)-9+i %></td>
								<td>
									<%=formatdate.format(formatter.parse(easyfinbanksearchresult.getList().get(i).getTrdt()))%>
									<br>
									<%=formattime.format(formatter.parse(easyfinbanksearchresult.getList().get(i).getTrdt()))%>
								</td>
								<td style = "text-align: start;"><%=easyfinbanksearchresult.getList().get(i).getRemark3()%></td>
								<td style = "text-align: end;">
									<% if(Integer.parseInt(easyfinbanksearchresult.getList().get(i).getAccIn())>0){ %>
											<fmt:formatNumber value="<%=easyfinbanksearchresult.getList().get(i).getAccIn()%>"/>원
									<% } else { %>
											-
									<% } %>
								</td>
								<td style = "text-align: end;">
									<% if(Integer.parseInt(easyfinbanksearchresult.getList().get(i).getAccOut())>0){ %>
											<fmt:formatNumber value="<%=easyfinbanksearchresult.getList().get(i).getAccOut()%>"/>원
									<% } else { %>
											-
									<% } %>
								</td>
								<td style = "text-align: end;">
									<fmt:formatNumber value="<%=easyfinbanksearchresult.getList().get(i).getBalance()%>"/>원
								</td>
								<td>
									<input type="text" style="width: 60%;" id="memo" value=<%=easyfinbanksearchresult.getList().get(i).getMemo() %>>
									<input type="hidden" id="tid" value=<%=easyfinbanksearchresult.getList().get(i).getTid()%>>
									<a href="#" class="btn-two gray rounded setMemo" style="color: black;">저장</a>
								</td>
							</tr>
						<% } %>
					</tbody>
				</table>
				<%-- <%for(int i = 1 ; i <= easyfinbanksearchresult.getPageCount() ; i++){%>
					<span onclick="pageNumber(<%=i %>)"><%=i %></span>
				<%} %> --%>
				<div style=" text-align: center; ">
				<%if(1 < (int)easyfinbanksearchresult.getPageCount()){%>
					<span onclick="pageAjax(1)"><<</span>&emsp;
				<% }
				if(1 < (int)easyfinbanksearchresult.getPageNum()){%>
					<span onclick="pageAjax(<%=(easyfinbanksearchresult.getPageNum()-1)%>)"><</span>&emsp;
				<% } %>
				<%for(int i = pageNumNumone ; i <= pageNumNumone+9 ; i++ ){ 
					if((int)i == ((int)easyfinbanksearchresult.getPageCount()+1)){
						break;
					}
				%>
					<%if(i == (int)easyfinbanksearchresult.getPageNum()){%>
						<span style="color: #3498ff;"><b><%=i %></b></span>&emsp;
					<%} else {%>
						<span onclick="pageAjax(<%=i %>)"><b><%=i %></b></span>&emsp;
					<%} %>
				<% } %>
				
				<%if(easyfinbanksearchresult.getPageCount() != easyfinbanksearchresult.getPageNum() || 1 < (int)easyfinbanksearchresult.getPageNum()){%>
					<span onclick="pageAjax(<%=(easyfinbanksearchresult.getPageNum()+1)%>)">></span>&emsp;
				<% } %>
				<%if(1 < (int)easyfinbanksearchresult.getPageCount()){%>
					<span onclick="pageAjax(<%=easyfinbanksearchresult.getPageCount()%>)">>></span>
				<%} %>
				</div>
			</div>
		</div>		
	</div>
</section>

<form id="excelFrm" method="get" action="${contextPath }/adm/memberSalCntMgr/excelDown"></form>

<script type="text/javascript">
	
	$('.setMemo').on('click', function() { 
		  //alert();
		  
		  var trNum = $(this).closest('tr').prevAll().length;
          console.log('trNum : ' + trNum);
		  
		  //현재 row의 정보 가져오기 
		  var thisRow = $(this).closest('tr'); 
		  
		  //주소 input 값 가져오기
		  var memo = thisRow.find('td:eq(6)').find('#memo').val();
		  var tid = thisRow.find('td:eq(6)').find('#tid').val();
		  //섦졍 input 값 가져오기
		  //var txt = thisRow.find('td:eq(7)').find('input').val();
		  //alert(memo);
		  //alert(tid + ", " + "을(를) 클릭하였습니다.");
		  location.href="${contextPath }/adm/AccountCheck/setMemo?tid="+tid+"&memo="+memo;
	})
	
	
	
	function pageAjax(pageNumber){
		document.getElementById("pageNumber").value = pageNumber;
		document.getElementById("AccountCheckForm").submit();
	}
	function bungi(bungi){
		var now = new Date();
		var End = new Date();
		
		let year = now.getFullYear();
		let month = ''+(now.getMonth()+1);   // 월    
		let day = now.getDate();        // 일
		
		let year2;
		let month2;   
		let day2;
		
		let startday;
		let endday;
		
		//month = ("0" + (1 + End.getMonth())).slice(-2);
	    //day = ("0" + End.getDate()).slice(-2);
		
		if(bungi === 1) {	//당일
			if (month.length < 2){ 
		        month = '0' + month;
		    }
		    if (day.length < 2){ 
		        day = '0' + day;
		    }
			startday = year+'-'+month+'-'+day;
			endday = year+'-'+month+'-'+day;
			//alert(startday);
			//alert(endday);
		} else if(bungi === 2) {	//1주일
			End.setDate(End.getDate() - 6);
		
			year2 = End.getFullYear();
			month2 = ''+(End.getMonth()+1);   
			day2 = ''+End.getDate();
			
			if (month.length < 2){ 
		        month = '0' + month;
		    }
		    if (day.length < 2){ 
		        day = '0' + day;
		    }
		    if (month2.length < 2){ 
		        month2 = '0' + month2;
		    }
		    if (day2.length < 2){ 
		        day2 = '0' + day2;
		    }
			
		    startday = year2+"-"+month2+"-"+day2;
			endday = year+"-"+month+"-"+day;
		} else if(bungi === 3) {	//15일
			End.setDate(End.getDate() - 14);
			
			year2 = End.getFullYear();
			month2 = ''+(End.getMonth()+1);   
			day2 = ''+End.getDate();
			
			if (month.length < 2){ 
		        month = '0' + month;
		    }
		    if (day.length < 2){ 
		        day = '0' + day;
		    }
		    if (month2.length < 2){ 
		        month2 = '0' + month2;
		    }
		    if (day2.length < 2){ 
		        day2 = '0' + day2;
		    }
			
		    startday = year2+"-"+month2+"-"+day2;
			endday = year+"-"+month+"-"+day;
		} else if(bungi === 4) {	//1개월
			End.setDate(End.getDate() - 29);
			
			year2 = End.getFullYear();
			month2 = ''+(End.getMonth()+1);   
			day2 = ''+End.getDate();
			
			if (month.length < 2){ 
		        month = '0' + month;
		    }
		    if (day.length < 2){ 
		        day = '0' + day;
		    }
		    if (month2.length < 2){ 
		        month2 = '0' + month2;
		    }
		    if (day2.length < 2){ 
		        day2 = '0' + day2;
		    }
			
		    startday = year2+"-"+month2+"-"+day2;
			endday = year+"-"+month+"-"+day;
		}
		document.getElementById("datepickerStr").value =  startday;
		document.getElementById("datepickerEnd").value =  endday;
	}
	//상반기
	function firsthalfyear(){
		var now = new Date();
		var year = now.getFullYear();
		var startday = "-01-01";
		var endday = "-06-30";
		document.getElementById("datepickerStr").value =  year+startday;
		document.getElementById("datepickerEnd").value =  year+endday;
	}
	//하반기
	function secondhalfyear(){
		var now = new Date();
		var year = now.getFullYear();
		var startday = "-07-01";
		var endday = "-12-31";
		document.getElementById("datepickerStr").value =  year+startday;
		document.getElementById("datepickerEnd").value =  year+endday;
	}


$(function() {
	//Date picker
	$('#datepickerStr').datepicker({
		autoclose: true,
		format: 'yyyy-mm-dd'
	});
	$('#datepickerEnd').datepicker({
		autoclose: true,
		format: 'yyyy-mm-dd'
	});
	
	// 엑셀
    $("#btnExcel").click(function() {    
    	
    	alert("서비스 준비중입니다.");
    	return false;
    	
    	/* var strAction = "${contextPath }/adm/memberSalCntMgr/excelDown";
    	var realAction =  "${strActionUrl }";
    	
        $("#AccountCheckForm").attr("action", strAction);
        $("#AccountCheckForm").submit();
        
        //원래대로
        $("#AccountCheckForm").attr("action",realAction);     */    
    });
});

//정렬 주문일 & 주문자명 클릭시 , 목록수 변경시
function fn_order_by(str){	
	var frm=document.getElementById("sortingForm");
	
	if(str != ""){
		frm.MEMB_ORD_GUBUN.value=str;
	}
	frm.submit();
}
</script>
