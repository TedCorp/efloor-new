package mall.web.service.admin.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mall.web.domain.TB_ODTAXINFO_CASHRECEIPT;
import mall.web.domain.TB_ODTAXINFO_TAXINVOICE;
import mall.web.domain.TB_TAXBILLPUBlICATION_INSERT;
import mall.web.mapper.admin.PolarBearBackOfficeServiceMapper;
import mall.web.service.DefaultService;

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

@Service("polarBearBackOfficeService")
public class PolarBearBackOfficeService implements DefaultService{
	
	@Resource(name="polarBearBackOfficeServiceMapper")
	PolarBearBackOfficeServiceMapper polarBearBackOfficeServiceMapper;

	@Override
	public int getObjectCount(Object obj) throws Exception {
		return 0;
	}

	@Override
	public List<?> getObjectList(Object obj) throws Exception {
		return null;
	}

	@Override
	public List<?> getPaginatedObjectList(Object obj) throws Exception {
		return null;
	}

	@Override
	public Object getObject(Object obj) throws Exception {
		return null;
	}

	@Override
	public int insertObject(Object obj) throws Exception {
		return 0;
	}

	@Override
	public int updateObject(Object obj) throws Exception {
		return 0;
	}

	@Override
	public int deleteObject(Object obj) throws Exception {
		return 0;
	}
	//공급자 insert
	public void supplierInsert(TB_TAXBILLPUBlICATION_INSERT obj) throws Exception{
		
		polarBearBackOfficeServiceMapper.supplierInsert(obj);
		
	}
	
	//select 공급자 list 가져오기
	public List<TB_TAXBILLPUBlICATION_INSERT> supplierList() throws Exception {
		
		List<TB_TAXBILLPUBlICATION_INSERT> list = polarBearBackOfficeServiceMapper.supplierList();
		
		return list;
	}
	
	//ajax 공급자 넣기용 select
	public TB_TAXBILLPUBlICATION_INSERT supplierDetail(int supplierSelect) throws Exception {
		TB_TAXBILLPUBlICATION_INSERT tb_taxbillpublication_insert; 
		tb_taxbillpublication_insert = polarBearBackOfficeServiceMapper.supplierDetail(supplierSelect);
		
		return tb_taxbillpublication_insert;
	}
	
	//220929
	//유저 아이디 가져오기용
	//오더 넘 기준으로 POLARBEAR.TB_ODTAXINFO_TAXINVOICE 테이블에서 가져옴 만약 안되면 중복되는 오더넘 있을경우인데 이럴경우 db문제일 가능성이 높음
	public String taxInvoiceUserCheck(String orderNum) throws Exception {
		
		String id= polarBearBackOfficeServiceMapper.taxInvoiceUserCheck(orderNum);
		
		return id;
	}
	
	/*주문정보 가져오기*/
	public List<TB_ODTAXINFO_TAXINVOICE> taxInvoiceSingleAction(Object obj) throws Exception {
		return  polarBearBackOfficeServiceMapper.taxInvoiceSingleAction(obj);
	}
	
	//같은아이디 대량 넘기기
	public ArrayList<TB_ODTAXINFO_TAXINVOICE> taxInvoiceSingleMuchAction(TB_ODTAXINFO_TAXINVOICE obj) throws Exception {
		
		ArrayList<TB_ODTAXINFO_TAXINVOICE> list = polarBearBackOfficeServiceMapper.taxInvoiceSingleMuchAction(obj);
		
		return list;
	}
	
	
	public TB_ODTAXINFO_CASHRECEIPT CashReceiptPublicationSingle(TB_ODTAXINFO_CASHRECEIPT obj) throws Exception {
		
		TB_ODTAXINFO_CASHRECEIPT tb_odtaxinfo_cashreceipt = polarBearBackOfficeServiceMapper.CashReceiptPublicationSingle(obj);
		
		return tb_odtaxinfo_cashreceipt;
	}
	
	//현금영수증 주문자 이름
	public String getOrderUserName_CashReceiptPublication(String orderUserId) throws Exception {
		
		String OrderUserName = polarBearBackOfficeServiceMapper.getOrderUserName_CashReceiptPublication(orderUserId);
		
		return OrderUserName;
	}
	
	//세금계산서 단건발행 완료시 수정
	public void SuccessTaxBillPublicationUpdate(String ORDER_NUM_List) throws Exception {
		polarBearBackOfficeServiceMapper.SuccessTaxBillPublicationUpdate(ORDER_NUM_List);
	}
	
	//현금영수증 단건발행 완료시 수정
	public void SuccessCashReceiptPublicationUpdate(String ORDER_NUM) throws Exception {
		polarBearBackOfficeServiceMapper.SuccessCashReceiptPublicationUpdate(ORDER_NUM);
	}

	
	
	
	
}
