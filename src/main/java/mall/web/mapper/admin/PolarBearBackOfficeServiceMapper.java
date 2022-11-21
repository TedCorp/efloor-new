package mall.web.mapper.admin;

import java.util.ArrayList;
import java.util.List;

import mall.web.domain.TB_ODTAXINFO_CASHRECEIPT;
import mall.web.domain.TB_ODTAXINFO_TAXINVOICE;
import mall.web.domain.TB_TAXBILLPUBlICATION_INSERT;

/**
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * @Package	: mall.web.mapper.admin
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * @Desc	: 폴라베어 백오피스
 * @Company	: 
 * @Author	: 박용덕
 * @Date	: 2022-09-05 (오후 12:07:32)
 * @Version	: 1.0
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

public interface PolarBearBackOfficeServiceMapper {
	
	//공급자 등록
	public void supplierInsert(TB_TAXBILLPUBlICATION_INSERT obj) throws Exception;
	
	public List<TB_TAXBILLPUBlICATION_INSERT> supplierList() throws Exception;
	
	public TB_TAXBILLPUBlICATION_INSERT supplierDetail(int supplierSelect) throws Exception;
	
	
	//유저 아이디 가져오기용
	public String taxInvoiceUserCheck(String orderNum) throws Exception;
	
	//세금계산서 단건발행
	public  List<TB_ODTAXINFO_TAXINVOICE> taxInvoiceSingleAction(Object obj) throws Exception;
	
	//세금계산서 동일인물 다량
	public ArrayList<TB_ODTAXINFO_TAXINVOICE> taxInvoiceSingleMuchAction(TB_ODTAXINFO_TAXINVOICE obj) throws Exception;
	
	//현금영수증 단건발행
	public TB_ODTAXINFO_CASHRECEIPT CashReceiptPublicationSingle(TB_ODTAXINFO_CASHRECEIPT obj) throws Exception;
	
	//세금계산서 발행 완료시
	public void SuccessTaxBillPublicationUpdate(String ORDER_NUM_List) throws Exception;
	
	//현금영수증 단건 발행 완료시
	public void SuccessCashReceiptPublicationUpdate(String ORDER_NUM) throws Exception;
	
	//현금영수증 주문자 이름
	public String getOrderUserName_CashReceiptPublication(String orderUserId) throws Exception;
}
