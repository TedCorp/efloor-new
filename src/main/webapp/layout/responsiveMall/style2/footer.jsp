<%@ page trimDirectiveWhitespaces="true"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/layout/inc/taglib.jsp"%>

<style>
.modal {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
	}

.modal .bg {
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.6);
	}

	.modalBox {
		position: absolute;
		background-color: #fff;
		width: 80%;
		height: 90%;
		padding: 15px;
		overflow: scroll;
	}

.closeBtn {
		display: block;
		width: 80px;
}  

.hidden {
		display: none;
	}	

</style>

<!-- Footer Container -->
    <!-- Footer Bottom Container -->
        <div class="footer-wrap" >
            <div class="footer-conts">
                <div class="content">
                    <ul class="redirect-conts" style="font-size: 15px;">
                        <li><span onclick="termscheck('terms');">이용약관</span></li>
                        <li><span onclick="termscheck('personalInfo');">개인정보취급방침</span></li>
                        <li><span><a style='font-size:15px; font-weight:500; color: #a7a7a7;' href="/m/community">고객센터</a></span></li>
                    </ul>
                    <div class="info-list">
                        <p>
                            <span>주식회사 폴라베어</span>
                            <span>대표이사: 안남희</span>
                        </p>
                        <p>
                            <span>34065 대전광역시 유성구 반석로 148 (반석동) 지하1층</span>
                            <span>대표번호 : 042-826-8233</span>
                            <span>전자우편: ob1982@naver.com</span>
                        </p>
                        <p>
                            <span>사업자등록번호:883-87-01986 </span>
                            <span>통신판매업 신고: 2021 대전 유성 0598 <button onclick="license();">사업자정보확인</button></span>
                            <span>개인정보 관리 책임자: 주식회사 폴라베어 (ob1982@naver.com)</span>
                        </p>
                    </div>
                    <div class="copyright"> COPYRIGHT © 폴라베어닷컴 ALL RIGHTS RESERVED.</div>
                </div>

                <div class="right-cont">
                    <p style="font-size: 14px;font-weight: 600;margin-bottom: 5px;">구매안전(에스크로)서비스 가맹점
                        <button>서비스 가입사실 확인</button>
                    </p>
                    <p>
                      	  고객님의 안전한 거래를 위해 현금으로 결제 시 저희 쇼핑몰에서 가입한
                      	  구매안전(에스크로)서비스를 이용하실 수 있습니다.
                    </p>
                </div>
            </div>
        </div>
		
		<!-- 모달추가  -->
		<div class="modal hidden">
			<div class="bg"></div>
			<div class="modalBox" >
				<button class="closeBtn" style = "margin-left: 90%;"onclick="popClose()">✖</button>
				<div>
					<div class='footer-msg'></div>
				</div>
				<div>
			 		<button class='closeBtn' style="margin-left: 45%;" onclick="popClose()">확인</button>
				</div>
			</div>
		</div>
		
        
<script>
	function popClose() {
		$('.modal').removeClass('on');
		$('.modal').addClass('hidden');
	}

	function license(){
		window.open('http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=8838701986','wowbook','width=750,height=700');
		return false;
	}
	
	function termscheck(clicktype){
		if(clicktype === 'terms'){
			$.ajax({
				type: "POST",
				url: "${contextPath}/html/terms.html",
				data: $("#idChkFrm").serialize(),
				success: function (data) {
					$('.modal').addClass('on');
					$('.modal').removeClass('hidden');
					$('.footer-msg').html(data);
				}, error: function (jqXHR, textStatus, errorThrown) {
					alert("처리중 에러가 발생했습니다. 관리자에게 문의 하세요.(error:"+textStatus+")");
				}
			});
		} else if(clicktype === 'personalInfo'){
			$.ajax({
				type: "POST",
				url: "${contextPath}/html/personalInfo.html",
				data: $("#idChkFrm").serialize(),
				success: function (data) {
					$('.modal').addClass('on');
					$('.modal').removeClass('hidden');
					$('.footer-msg').html(data);
				}, error: function (jqXHR, textStatus, errorThrown) {
					alert("처리중 에러가 발생했습니다. 관리자에게 문의 하세요.(error:"+textStatus+")");
				}
			});
		}
	}
</script>