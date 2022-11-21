package mall.web.domain;

import javax.xml.bind.annotation.XmlRootElement;

import org.apache.ibatis.type.Alias;

/**
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * 
 * @Package : mall.web.domain ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * @Desc : 기본배송정보
 * @Company : 테드
 * @Author : 장보라
 * @Date : 2022-10-26 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 */
@Alias("tb_member_basic_address")
@XmlRootElement(name = "tb_member_basic_address")
public class TB_MEMBER_BASIC_ADDRESS extends DefaultDomain {

	private static final long serialVersionUID = 1L;

	private String BASIC_ADDRESS_ID = "";			
	private String MEMB_ID = "";					//회원 ID
	private String MEMB_NAME = "";					//회원 이름
	private String MEMB_BASIC_YN = "";				//기본배송지사용여부
	private String RECIPIENT_NAME = "";				//수령자이름
	private String MEMB_PN = "";					//우편번호
	private String MEMB_BADR = "";					//대표주소
	private String MEMB_DADR = "";					//상세주소
	private String MEMB_CPON = "";					//전화번호
	
	public String getBASIC_ADDRESS_ID() {
		return BASIC_ADDRESS_ID;
	}
	public void setBASIC_ADDRESS_ID(String bASIC_ADDRESS_ID) {
		BASIC_ADDRESS_ID = bASIC_ADDRESS_ID;
	}
	public String getMEMB_ID() {
		return MEMB_ID;
	}
	public void setMEMB_ID(String mEMB_ID) {
		MEMB_ID = mEMB_ID;
	}
	public String getMEMB_NAME() {
		return MEMB_NAME;
	}
	public void setMEMB_NAME(String mEMB_NAME) {
		MEMB_NAME = mEMB_NAME;
	}
	public String getMEMB_BASIC_YN() {
		return MEMB_BASIC_YN;
	}
	public void setMEMB_BASIC_YN(String mEMB_BASIC_YN) {
		MEMB_BASIC_YN = mEMB_BASIC_YN;
	}
	public String getRECIPIENT_NAME() {
		return RECIPIENT_NAME;
	}
	public void setRECIPIENT_NAME(String rECIPIENT_NAME) {
		RECIPIENT_NAME = rECIPIENT_NAME;
	}
	public String getMEMB_PN() {
		return MEMB_PN;
	}
	public void setMEMB_PN(String mEMB_PN) {
		MEMB_PN = mEMB_PN;
	}
	public String getMEMB_BADR() {
		return MEMB_BADR;
	}
	public void setMEMB_BADR(String mEMB_BADR) {
		MEMB_BADR = mEMB_BADR;
	}
	public String getMEMB_DADR() {
		return MEMB_DADR;
	}
	public void setMEMB_DADR(String mEMB_DADR) {
		MEMB_DADR = mEMB_DADR;
	}
	public String getMEMB_CPON() {
		return MEMB_CPON;
	}
	public void setMEMB_CPON(String mEMB_CPON) {
		MEMB_CPON = mEMB_CPON;
	}
	
	@Override
	public String toString() {
		return "TB_MEMBER_BASIC_ADDRESS [BASIC_ADDRESS_ID=" + BASIC_ADDRESS_ID + ", MEMB_ID=" + MEMB_ID + ", MEMB_NAME="
				+ MEMB_NAME + ", MEMB_BASIC_YN=" + MEMB_BASIC_YN + ", RECIPIENT_NAME=" + RECIPIENT_NAME + ", MEMB_PN="
				+ MEMB_PN + ", MEMB_BADR=" + MEMB_BADR + ", MEMB_DADR=" + MEMB_DADR + ", MEMB_CPON=" + MEMB_CPON + "]";
	}

}
