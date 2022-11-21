package mall.web.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;
import org.apache.ibatis.type.Alias;

/**
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * @Package	: mall.web.domain
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * @Desc	: 세금계산서 공급자 DTO
 * @Company	: 
 * @Author	: 박용덕
 * @Date	: 2022-09-04 (오후 18:53:33)
 * @Version	: 1.0
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/
@Alias("tb_taxbillpublication_insert")
@XmlRootElement(name = "tb_taxbillpublication_insert")
public class TB_TAXBILLPUBlICATION_INSERT extends DefaultDomain {
	
	private static final long serialVersionUID = -6840747069903901206L;
	
	private String insert_num = "";	//시퀀스 번호
	private String invoicerCorpNum_insert = "";		//등록번호
	private String invoicerTaxRegID_insert = "";	//종사업자 번호
	private String invoicerCorpName_insert = "";	//회사명 상호명
	private String invoicerCEOName_insert = "";		//대표명
	private String invoicerAddr_insert = "";		//사업장
	private String invoicerBizType_insert = "";		//업태
	private String invoicerBizClass_insert = "";	//종목
	private String invoicerContactName_insert = "";	//담당자명
	private String invoicerTEL_insert = "";			//연락처
	private String invoicerEmail_insert = "";		//이메일
	
	private List<?> supplierList; // 상품리스트
	
	
	
	public String getInsert_num() {
		return insert_num;
	}
	public void setInsert_num(String insert_num) {
		this.insert_num = insert_num;
	}
	public List<?> getSupplierList() {
		return supplierList;
	}
	public void setSupplierList(List<?> supplierList) {
		this.supplierList = supplierList;
	}
	public String getInvoicerCorpNum_insert() {
		return invoicerCorpNum_insert;
	}
	public void setInvoicerCorpNum_insert(String invoicerCorpNum_insert) {
		this.invoicerCorpNum_insert = invoicerCorpNum_insert;
	}
	public String getInvoicerTaxRegID_insert() {
		return invoicerTaxRegID_insert;
	}
	public void setInvoicerTaxRegID_insert(String invoicerTaxRegID_insert) {
		this.invoicerTaxRegID_insert = invoicerTaxRegID_insert;
	}
	public String getInvoicerCorpName_insert() {
		return invoicerCorpName_insert;
	}
	public void setInvoicerCorpName_insert(String invoicerCorpName_insert) {
		this.invoicerCorpName_insert = invoicerCorpName_insert;
	}
	public String getInvoicerCEOName_insert() {
		return invoicerCEOName_insert;
	}
	public void setInvoicerCEOName_insert(String invoicerCEOName_insert) {
		this.invoicerCEOName_insert = invoicerCEOName_insert;
	}
	public String getInvoicerAddr_insert() {
		return invoicerAddr_insert;
	}
	public void setInvoicerAddr_insert(String invoicerAddr_insert) {
		this.invoicerAddr_insert = invoicerAddr_insert;
	}
	public String getInvoicerBizType_insert() {
		return invoicerBizType_insert;
	}
	public void setInvoicerBizType_insert(String invoicerBizType_insert) {
		this.invoicerBizType_insert = invoicerBizType_insert;
	}
	public String getInvoicerBizClass_insert() {
		return invoicerBizClass_insert;
	}
	public void setInvoicerBizClass_insert(String invoicerBizClass_insert) {
		this.invoicerBizClass_insert = invoicerBizClass_insert;
	}
	public String getInvoicerContactName_insert() {
		return invoicerContactName_insert;
	}
	public void setInvoicerContactName_insert(String invoicerContactName_insert) {
		this.invoicerContactName_insert = invoicerContactName_insert;
	}
	public String getInvoicerTEL_insert() {
		return invoicerTEL_insert;
	}
	public void setInvoicerTEL_insert(String invoicerTEL_insert) {
		this.invoicerTEL_insert = invoicerTEL_insert;
	}
	public String getInvoicerEmail_insert() {
		return invoicerEmail_insert;
	}
	public void setInvoicerEmail_insert(String invoicerEmail_insert) {
		this.invoicerEmail_insert = invoicerEmail_insert;
	}

	

}
