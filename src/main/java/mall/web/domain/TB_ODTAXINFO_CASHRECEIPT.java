package mall.web.domain;

import javax.xml.bind.annotation.XmlRootElement;

import org.apache.ibatis.type.Alias;

@Alias("tb_odtaxinfo_cashreceipt")
@XmlRootElement(name = "tb_odtaxinfo_cashreceipt")
public class TB_ODTAXINFO_CASHRECEIPT extends DefaultDomain  {
	
	private static final long serialVersionUID = -6840747069903901206L;
	
	//TB_ODINFOXD table info
	
	private String OPTION3_NAME = "";
	private String OPTION3_VALUE = "";
	private String CNCL_MSG = "";
	private String RFND_AMT = "";
	private String RFND_DLVY_AMT = "";
	private String RFND_DLVY_TDN = "";
	private String SETPD_CODE = "";
	private String IMSI_DLVY_AMT = "";
	private String ORDER_DTNUM = "";
	private String ORDER_NUM = "";
	private String PD_CODE = "";
	private String PD_NAME = "";
	private String PD_PRICE = "";
	private String PDDC_GUBN = "";
	private String PDDC_VAL = "";
	private String ORDER_QTY = "";
	private String ORDER_AMT = "";
	private String DLVY_AMT = "";
	private String USE_SVMN = "";
	private String OCCUR_SVMN = "";
	private String ORDER_CON = "";
	private String PAY_METD = "";
	private String PAY_MDKY = "";
	private String DLVY_CON = "";
	private String DLVY_COM = "";
	private String DLVY_TDN = "";
	private String CNCL_CON = "";
	private String RFND_CON = "";
	private String REGP_ID = "";
	private String REG_DTM = "";
	private String MODP_ID = "";
	private String MOD_DTM = "";
	private String DEL_YN = "";
	private String PAY_DATE = "";
	private String PD_CUT_SEQ = "";
	private String OPTION_CODE = "";
	private String BOX_PDDC_GUBN = "";
	private String BOX_PDDC_VAL = "";
	private String INPUT_CNT = "";
	private String MBDC_VAL = "";
	private String SUPR_ID = "";
	private String OPTION1_NAME = "";
	private String OPTION1_VALUE = "";
	private String OPTION2_NAME = "";
	private String OPTION2_VALUE = "";
	private String LINK_MODP_DATE = "";
	private String LINK_ORDER_KEY = "";
	private String DLVY_TDN_MODP_DATE = "";
	
	//TB_ODTAXINFO_CASHRECEIPT
	private String DEDUCTIONORPROOFBUSINESS = "";
	private String ID = "";
	private String PNUM = "";
	private String COMPUNYNUM = "";
	private String PAYMENT = "";
	private String INVOICEEE_REG_DTM ="";
	
	
	public String getINVOICEEE_REG_DTM() {
		return INVOICEEE_REG_DTM;
	}
	public void setINVOICEEE_REG_DTM(String iNVOICEEE_REG_DTM) {
		INVOICEEE_REG_DTM = iNVOICEEE_REG_DTM;
	}
	public String getOPTION3_NAME() {
		return OPTION3_NAME;
	}
	public void setOPTION3_NAME(String oPTION3_NAME) {
		OPTION3_NAME = oPTION3_NAME;
	}
	public String getOPTION3_VALUE() {
		return OPTION3_VALUE;
	}
	public void setOPTION3_VALUE(String oPTION3_VALUE) {
		OPTION3_VALUE = oPTION3_VALUE;
	}
	public String getCNCL_MSG() {
		return CNCL_MSG;
	}
	public void setCNCL_MSG(String cNCL_MSG) {
		CNCL_MSG = cNCL_MSG;
	}
	public String getRFND_AMT() {
		return RFND_AMT;
	}
	public void setRFND_AMT(String rFND_AMT) {
		RFND_AMT = rFND_AMT;
	}
	public String getRFND_DLVY_AMT() {
		return RFND_DLVY_AMT;
	}
	public void setRFND_DLVY_AMT(String rFND_DLVY_AMT) {
		RFND_DLVY_AMT = rFND_DLVY_AMT;
	}
	public String getRFND_DLVY_TDN() {
		return RFND_DLVY_TDN;
	}
	public void setRFND_DLVY_TDN(String rFND_DLVY_TDN) {
		RFND_DLVY_TDN = rFND_DLVY_TDN;
	}
	public String getSETPD_CODE() {
		return SETPD_CODE;
	}
	public void setSETPD_CODE(String sETPD_CODE) {
		SETPD_CODE = sETPD_CODE;
	}
	public String getIMSI_DLVY_AMT() {
		return IMSI_DLVY_AMT;
	}
	public void setIMSI_DLVY_AMT(String iMSI_DLVY_AMT) {
		IMSI_DLVY_AMT = iMSI_DLVY_AMT;
	}
	public String getORDER_DTNUM() {
		return ORDER_DTNUM;
	}
	public void setORDER_DTNUM(String oRDER_DTNUM) {
		ORDER_DTNUM = oRDER_DTNUM;
	}
	public String getORDER_NUM() {
		return ORDER_NUM;
	}
	public void setORDER_NUM(String oRDER_NUM) {
		ORDER_NUM = oRDER_NUM;
	}
	public String getPD_CODE() {
		return PD_CODE;
	}
	public void setPD_CODE(String pD_CODE) {
		PD_CODE = pD_CODE;
	}
	public String getPD_NAME() {
		return PD_NAME;
	}
	public void setPD_NAME(String pD_NAME) {
		PD_NAME = pD_NAME;
	}
	public String getPD_PRICE() {
		return PD_PRICE;
	}
	public void setPD_PRICE(String pD_PRICE) {
		PD_PRICE = pD_PRICE;
	}
	public String getPDDC_GUBN() {
		return PDDC_GUBN;
	}
	public void setPDDC_GUBN(String pDDC_GUBN) {
		PDDC_GUBN = pDDC_GUBN;
	}
	public String getPDDC_VAL() {
		return PDDC_VAL;
	}
	public void setPDDC_VAL(String pDDC_VAL) {
		PDDC_VAL = pDDC_VAL;
	}
	public String getORDER_QTY() {
		return ORDER_QTY;
	}
	public void setORDER_QTY(String oRDER_QTY) {
		ORDER_QTY = oRDER_QTY;
	}
	public String getORDER_AMT() {
		return ORDER_AMT;
	}
	public void setORDER_AMT(String oRDER_AMT) {
		ORDER_AMT = oRDER_AMT;
	}
	public String getDLVY_AMT() {
		return DLVY_AMT;
	}
	public void setDLVY_AMT(String dLVY_AMT) {
		DLVY_AMT = dLVY_AMT;
	}
	public String getUSE_SVMN() {
		return USE_SVMN;
	}
	public void setUSE_SVMN(String uSE_SVMN) {
		USE_SVMN = uSE_SVMN;
	}
	public String getOCCUR_SVMN() {
		return OCCUR_SVMN;
	}
	public void setOCCUR_SVMN(String oCCUR_SVMN) {
		OCCUR_SVMN = oCCUR_SVMN;
	}
	public String getORDER_CON() {
		return ORDER_CON;
	}
	public void setORDER_CON(String oRDER_CON) {
		ORDER_CON = oRDER_CON;
	}
	public String getPAY_METD() {
		return PAY_METD;
	}
	public void setPAY_METD(String pAY_METD) {
		PAY_METD = pAY_METD;
	}
	public String getPAY_MDKY() {
		return PAY_MDKY;
	}
	public void setPAY_MDKY(String pAY_MDKY) {
		PAY_MDKY = pAY_MDKY;
	}
	public String getDLVY_CON() {
		return DLVY_CON;
	}
	public void setDLVY_CON(String dLVY_CON) {
		DLVY_CON = dLVY_CON;
	}
	public String getDLVY_COM() {
		return DLVY_COM;
	}
	public void setDLVY_COM(String dLVY_COM) {
		DLVY_COM = dLVY_COM;
	}
	public String getDLVY_TDN() {
		return DLVY_TDN;
	}
	public void setDLVY_TDN(String dLVY_TDN) {
		DLVY_TDN = dLVY_TDN;
	}
	public String getCNCL_CON() {
		return CNCL_CON;
	}
	public void setCNCL_CON(String cNCL_CON) {
		CNCL_CON = cNCL_CON;
	}
	public String getRFND_CON() {
		return RFND_CON;
	}
	public void setRFND_CON(String rFND_CON) {
		RFND_CON = rFND_CON;
	}
	public String getREGP_ID() {
		return REGP_ID;
	}
	public void setREGP_ID(String rEGP_ID) {
		REGP_ID = rEGP_ID;
	}
	public void setREG_DTM(String rEG_DTM) {
		REG_DTM = rEG_DTM;
	}
	public String getMODP_ID() {
		return MODP_ID;
	}
	public void setMODP_ID(String mODP_ID) {
		MODP_ID = mODP_ID;
	}
	public void setMOD_DTM(String mOD_DTM) {
		MOD_DTM = mOD_DTM;
	}
	public String getDEL_YN() {
		return DEL_YN;
	}
	public void setDEL_YN(String dEL_YN) {
		DEL_YN = dEL_YN;
	}
	public String getPAY_DATE() {
		return PAY_DATE;
	}
	public void setPAY_DATE(String pAY_DATE) {
		PAY_DATE = pAY_DATE;
	}
	public String getPD_CUT_SEQ() {
		return PD_CUT_SEQ;
	}
	public void setPD_CUT_SEQ(String pD_CUT_SEQ) {
		PD_CUT_SEQ = pD_CUT_SEQ;
	}
	public String getOPTION_CODE() {
		return OPTION_CODE;
	}
	public void setOPTION_CODE(String oPTION_CODE) {
		OPTION_CODE = oPTION_CODE;
	}
	public String getBOX_PDDC_GUBN() {
		return BOX_PDDC_GUBN;
	}
	public void setBOX_PDDC_GUBN(String bOX_PDDC_GUBN) {
		BOX_PDDC_GUBN = bOX_PDDC_GUBN;
	}
	public String getBOX_PDDC_VAL() {
		return BOX_PDDC_VAL;
	}
	public void setBOX_PDDC_VAL(String bOX_PDDC_VAL) {
		BOX_PDDC_VAL = bOX_PDDC_VAL;
	}
	public String getINPUT_CNT() {
		return INPUT_CNT;
	}
	public void setINPUT_CNT(String iNPUT_CNT) {
		INPUT_CNT = iNPUT_CNT;
	}
	public String getMBDC_VAL() {
		return MBDC_VAL;
	}
	public void setMBDC_VAL(String mBDC_VAL) {
		MBDC_VAL = mBDC_VAL;
	}
	public String getSUPR_ID() {
		return SUPR_ID;
	}
	public void setSUPR_ID(String sUPR_ID) {
		SUPR_ID = sUPR_ID;
	}
	public String getOPTION1_NAME() {
		return OPTION1_NAME;
	}
	public void setOPTION1_NAME(String oPTION1_NAME) {
		OPTION1_NAME = oPTION1_NAME;
	}
	public String getOPTION1_VALUE() {
		return OPTION1_VALUE;
	}
	public void setOPTION1_VALUE(String oPTION1_VALUE) {
		OPTION1_VALUE = oPTION1_VALUE;
	}
	public String getOPTION2_NAME() {
		return OPTION2_NAME;
	}
	public void setOPTION2_NAME(String oPTION2_NAME) {
		OPTION2_NAME = oPTION2_NAME;
	}
	public String getOPTION2_VALUE() {
		return OPTION2_VALUE;
	}
	public void setOPTION2_VALUE(String oPTION2_VALUE) {
		OPTION2_VALUE = oPTION2_VALUE;
	}
	public String getLINK_MODP_DATE() {
		return LINK_MODP_DATE;
	}
	public void setLINK_MODP_DATE(String lINK_MODP_DATE) {
		LINK_MODP_DATE = lINK_MODP_DATE;
	}
	public String getLINK_ORDER_KEY() {
		return LINK_ORDER_KEY;
	}
	public void setLINK_ORDER_KEY(String lINK_ORDER_KEY) {
		LINK_ORDER_KEY = lINK_ORDER_KEY;
	}
	public String getDLVY_TDN_MODP_DATE() {
		return DLVY_TDN_MODP_DATE;
	}
	public void setDLVY_TDN_MODP_DATE(String dLVY_TDN_MODP_DATE) {
		DLVY_TDN_MODP_DATE = dLVY_TDN_MODP_DATE;
	}
	public String getDEDUCTIONORPROOFBUSINESS() {
		return DEDUCTIONORPROOFBUSINESS;
	}
	public void setDEDUCTIONORPROOFBUSINESS(String dEDUCTIONORPROOFBUSINESS) {
		DEDUCTIONORPROOFBUSINESS = dEDUCTIONORPROOFBUSINESS;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPNUM() {
		return PNUM;
	}
	public void setPNUM(String pNUM) {
		PNUM = pNUM;
	}
	public String getCOMPUNYNUM() {
		return COMPUNYNUM;
	}
	public void setCOMPUNYNUM(String cOMPUNYNUM) {
		COMPUNYNUM = cOMPUNYNUM;
	}

	public String getPAYMENT() {
		return PAYMENT;
	}
	public void setPAYMENT(String pAYMENT) {
		PAYMENT = pAYMENT;
	}

	
	
}
