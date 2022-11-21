package mall.web.domain;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import org.apache.ibatis.type.Alias;

@Alias("tb_polarbear_taxbillpublication")
@XmlRootElement(name = "tb_polarbear_taxbillpublication")
public class TB_POLARBEAR_TAXBILLPUBLICATION extends DefaultDomain {
	
	private static final long serialVersionUID = -6840747069903901206L;
	
	private String taxtype = ""; //
	private String invoiceetype = ""; //
	private String invoicerCorpNum = ""; //
	private String invoicerTaxRegID = ""; //
	private String invoicerCorpName = ""; //
	private String invoicerCEOName = ""; //
	private String invoicerAddr = ""; //
	private String invoicerBizType = ""; //
	private String invoicerBizClass = ""; //
	private String invoicerContactName = ""; //
	private String invoicerTEL = ""; //
	private String invoicerEmail = ""; //
	private String purposeType = ""; //
	private String invoiceeCorpNum = ""; //
	private String invoiceeTaxRegID = ""; //
	private String invoiceeCorpName = ""; //
	private String invoiceeCEOName = ""; //
	private String InvoiceeAddr = ""; //
	private String InvoiceeBizType = ""; //
	private String invoiceebizclass = ""; //
	private String invoiceeContactName1 = ""; //
	private String invoiceeTEL1 = ""; //
	private String invoiceeEmail1 = ""; //
	private String writeDate = ""; //
	private String supplycosttotal = ""; //
	private String taxtotal = ""; //
	private String totalamount = ""; //
	private String memo = ""; //
	private String[] writedatemon; //
	private String[] writedateday; //
	
	private String[] purchaseDT; //
	
	
	private String[] itemname; //
	private String[] spec; //
	private String[] qty; //
	private String[] unitcost; //
	private String[] supplycost; //
	private String[] tax; //
	private String[] remark; //
	public String getTaxtype() {
		return taxtype;
	}
	public void setTaxtype(String taxtype) {
		this.taxtype = taxtype;
	}
	public String getInvoiceetype() {
		return invoiceetype;
	}
	public void setInvoiceetype(String invoiceetype) {
		this.invoiceetype = invoiceetype;
	}
	public String getInvoicerCorpNum() {
		return invoicerCorpNum;
	}
	public void setInvoicerCorpNum(String invoicerCorpNum) {
		this.invoicerCorpNum = invoicerCorpNum;
	}
	public String getInvoicerTaxRegID() {
		return invoicerTaxRegID;
	}
	public void setInvoicerTaxRegID(String invoicerTaxRegID) {
		this.invoicerTaxRegID = invoicerTaxRegID;
	}
	public String getInvoicerCorpName() {
		return invoicerCorpName;
	}
	public void setInvoicerCorpName(String invoicerCorpName) {
		this.invoicerCorpName = invoicerCorpName;
	}
	public String getInvoicerCEOName() {
		return invoicerCEOName;
	}
	public void setInvoicerCEOName(String invoicerCEOName) {
		this.invoicerCEOName = invoicerCEOName;
	}
	public String getInvoicerAddr() {
		return invoicerAddr;
	}
	public void setInvoicerAddr(String invoicerAddr) {
		this.invoicerAddr = invoicerAddr;
	}
	public String getInvoicerBizType() {
		return invoicerBizType;
	}
	public void setInvoicerBizType(String invoicerBizType) {
		this.invoicerBizType = invoicerBizType;
	}
	public String getInvoicerBizClass() {
		return invoicerBizClass;
	}
	public void setInvoicerBizClass(String invoicerBizClass) {
		this.invoicerBizClass = invoicerBizClass;
	}
	public String getInvoicerContactName() {
		return invoicerContactName;
	}
	public void setInvoicerContactName(String invoicerContactName) {
		this.invoicerContactName = invoicerContactName;
	}
	public String getInvoicerTEL() {
		return invoicerTEL;
	}
	public void setInvoicerTEL(String invoicerTEL) {
		this.invoicerTEL = invoicerTEL;
	}
	public String getInvoicerEmail() {
		return invoicerEmail;
	}
	public void setInvoicerEmail(String invoicerEmail) {
		this.invoicerEmail = invoicerEmail;
	}
	public String getPurposeType() {
		return purposeType;
	}
	public void setPurposeType(String purposeType) {
		this.purposeType = purposeType;
	}
	public String getInvoiceeCorpNum() {
		return invoiceeCorpNum;
	}
	public void setInvoiceeCorpNum(String invoiceeCorpNum) {
		this.invoiceeCorpNum = invoiceeCorpNum;
	}
	public String getInvoiceeTaxRegID() {
		return invoiceeTaxRegID;
	}
	public void setInvoiceeTaxRegID(String invoiceeTaxRegID) {
		this.invoiceeTaxRegID = invoiceeTaxRegID;
	}
	public String getInvoiceeCorpName() {
		return invoiceeCorpName;
	}
	public void setInvoiceeCorpName(String invoiceeCorpName) {
		this.invoiceeCorpName = invoiceeCorpName;
	}
	public String getInvoiceeCEOName() {
		return invoiceeCEOName;
	}
	public void setInvoiceeCEOName(String invoiceeCEOName) {
		this.invoiceeCEOName = invoiceeCEOName;
	}
	public String getInvoiceeAddr() {
		return InvoiceeAddr;
	}
	public void setInvoiceeAddr(String invoiceeAddr) {
		InvoiceeAddr = invoiceeAddr;
	}
	public String getInvoiceeBizType() {
		return InvoiceeBizType;
	}
	public void setInvoiceeBizType(String invoiceeBizType) {
		InvoiceeBizType = invoiceeBizType;
	}
	public String getInvoiceebizclass() {
		return invoiceebizclass;
	}
	public void setInvoiceebizclass(String invoiceebizclass) {
		this.invoiceebizclass = invoiceebizclass;
	}
	public String getInvoiceeContactName1() {
		return invoiceeContactName1;
	}
	public void setInvoiceeContactName1(String invoiceeContactName1) {
		this.invoiceeContactName1 = invoiceeContactName1;
	}
	public String getInvoiceeTEL1() {
		return invoiceeTEL1;
	}
	public void setInvoiceeTEL1(String invoiceeTEL1) {
		this.invoiceeTEL1 = invoiceeTEL1;
	}
	public String getInvoiceeEmail1() {
		return invoiceeEmail1;
	}
	public void setInvoiceeEmail1(String invoiceeEmail1) {
		this.invoiceeEmail1 = invoiceeEmail1;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getSupplycosttotal() {
		return supplycosttotal;
	}
	public void setSupplycosttotal(String supplycosttotal) {
		this.supplycosttotal = supplycosttotal;
	}
	public String getTaxtotal() {
		return taxtotal;
	}
	public void setTaxtotal(String taxtotal) {
		this.taxtotal = taxtotal;
	}
	public String getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(String totalamount) {
		this.totalamount = totalamount;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String[] getWritedatemon() {
		return writedatemon;
	}
	public void setWritedatemon(String[] writedatemon) {
		this.writedatemon = writedatemon;
	}
	public String[] getWritedateday() {
		return writedateday;
	}
	public void setWritedateday(String[] writedateday) {
		this.writedateday = writedateday;
	}
	public String[] getPurchaseDT() {
		return purchaseDT;
	}
	public void setPurchaseDT(String[] purchaseDT) {
		this.purchaseDT = purchaseDT;
	}
	public String[] getItemname() {
		return itemname;
	}
	public void setItemname(String[] itemname) {
		this.itemname = itemname;
	}
	public String[] getSpec() {
		return spec;
	}
	public void setSpec(String[] spec) {
		this.spec = spec;
	}
	public String[] getQty() {
		return qty;
	}
	public void setQty(String[] qty) {
		this.qty = qty;
	}
	public String[] getUnitcost() {
		return unitcost;
	}
	public void setUnitcost(String[] unitcost) {
		this.unitcost = unitcost;
	}
	public String[] getSupplycost() {
		return supplycost;
	}
	public void setSupplycost(String[] supplycost) {
		this.supplycost = supplycost;
	}
	public String[] getTax() {
		return tax;
	}
	public void setTax(String[] tax) {
		this.tax = tax;
	}
	public String[] getRemark() {
		return remark;
	}
	public void setRemark(String[] remark) {
		this.remark = remark;
	}
	
}
