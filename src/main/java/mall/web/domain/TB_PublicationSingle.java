package mall.web.domain;

import javax.xml.bind.annotation.XmlRootElement;

import org.apache.ibatis.type.Alias;

@Alias("tb_publicationsingle")
@XmlRootElement(name = "tb_publicationsingle")
public class TB_PublicationSingle {
	
	private String mgtKey = ""; //
	private String confirmNum = ""; //
	private String orgConfirmNum = ""; //
	private String orgTradeDate = ""; //
	private String tradeDate = ""; //
	private String tradeType = ""; //
	private String tradeUsage = ""; //
	private String tradeOpt = ""; //
	private String taxationType = ""; //
	private String totalAmount = ""; //
	private String supplyCost = ""; //
	private String tax = ""; //
	private String serviceFee = ""; //
	private String franchiseCorpNum = ""; //
	private String franchiseTaxRegID = ""; //
	private String franchiseCorpName = ""; //
	private String franchiseCEOName = ""; //
	private String franchiseAddr = ""; //
	private String franchiseTEL = ""; //
	private String identityNum = ""; //
	private String customerName = ""; //
	private String itemName = ""; //
	private String orderNumber = ""; //
	private String email = ""; //
	private String hp = ""; //
	private String smssendYN = ""; //
	private String faxsendYN = ""; //
	private String cancelType = ""; //
	
	public String getMgtKey() {
		return mgtKey;
	}
	public void setMgtKey(String mgtKey) {
		this.mgtKey = mgtKey;
	}
	public String getConfirmNum() {
		return confirmNum;
	}
	public void setConfirmNum(String confirmNum) {
		this.confirmNum = confirmNum;
	}
	public String getOrgConfirmNum() {
		return orgConfirmNum;
	}
	public void setOrgConfirmNum(String orgConfirmNum) {
		this.orgConfirmNum = orgConfirmNum;
	}
	public String getOrgTradeDate() {
		return orgTradeDate;
	}
	public void setOrgTradeDate(String orgTradeDate) {
		this.orgTradeDate = orgTradeDate;
	}
	public String getTradeDate() {
		return tradeDate;
	}
	public void setTradeDate(String tradeDate) {
		this.tradeDate = tradeDate;
	}
	public String getTradeType() {
		return tradeType;
	}
	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
	}
	public String getTradeUsage() {
		return tradeUsage;
	}
	public void setTradeUsage(String tradeUsage) {
		this.tradeUsage = tradeUsage;
	}
	public String getTradeOpt() {
		return tradeOpt;
	}
	public void setTradeOpt(String tradeOpt) {
		this.tradeOpt = tradeOpt;
	}
	public String getTaxationType() {
		return taxationType;
	}
	public void setTaxationType(String taxationType) {
		this.taxationType = taxationType;
	}
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getSupplyCost() {
		return supplyCost;
	}
	public void setSupplyCost(String supplyCost) {
		this.supplyCost = supplyCost;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	public String getServiceFee() {
		return serviceFee;
	}
	public void setServiceFee(String serviceFee) {
		this.serviceFee = serviceFee;
	}
	public String getFranchiseCorpNum() {
		return franchiseCorpNum;
	}
	public void setFranchiseCorpNum(String franchiseCorpNum) {
		this.franchiseCorpNum = franchiseCorpNum;
	}
	public String getFranchiseTaxRegID() {
		return franchiseTaxRegID;
	}
	public void setFranchiseTaxRegID(String franchiseTaxRegID) {
		this.franchiseTaxRegID = franchiseTaxRegID;
	}
	public String getFranchiseCorpName() {
		return franchiseCorpName;
	}
	public void setFranchiseCorpName(String franchiseCorpName) {
		this.franchiseCorpName = franchiseCorpName;
	}
	public String getFranchiseCEOName() {
		return franchiseCEOName;
	}
	public void setFranchiseCEOName(String franchiseCEOName) {
		this.franchiseCEOName = franchiseCEOName;
	}
	public String getFranchiseAddr() {
		return franchiseAddr;
	}
	public void setFranchiseAddr(String franchiseAddr) {
		this.franchiseAddr = franchiseAddr;
	}
	public String getFranchiseTEL() {
		return franchiseTEL;
	}
	public void setFranchiseTEL(String franchiseTEL) {
		this.franchiseTEL = franchiseTEL;
	}
	public String getIdentityNum() {
		return identityNum;
	}
	public void setIdentityNum(String identityNum) {
		this.identityNum = identityNum;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getSmssendYN() {
		return smssendYN;
	}
	public void setSmssendYN(String smssendYN) {
		this.smssendYN = smssendYN;
	}
	public String getFaxsendYN() {
		return faxsendYN;
	}
	public void setFaxsendYN(String faxsendYN) {
		this.faxsendYN = faxsendYN;
	}
	public String getCancelType() {
		return cancelType;
	}
	public void setCancelType(String cancelType) {
		this.cancelType = cancelType;
	}

	
}
