package mall.web.mapper.mall;

import java.util.List;

import mall.web.domain.TB_MEMBER_BASIC_ADDRESS;

/**
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * @Package	: mall.web.mapper.mall
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * @Desc	: 고객 기본배송지 
 * @Company	: TED
 * @Author	: 장보라
 * @Date	: 2022-10-27
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/
public interface MemberBasicAddressMapper {
	
	/*기본배송지 조회*/
	public List<TB_MEMBER_BASIC_ADDRESS> getList(TB_MEMBER_BASIC_ADDRESS tb_member_basic_address) throws Exception;
	
	/* 기본 배송지 등록 */
	public int insert(TB_MEMBER_BASIC_ADDRESS tb_member_basic_address) throws Exception;
	
	/* 기본 배송지 수정 [사용여부 N] */
	public int update(TB_MEMBER_BASIC_ADDRESS tb_member_basic_address) throws Exception;
}
