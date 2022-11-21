package mall.web.service.mall;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mall.web.domain.TB_MEMBER_BASIC_ADDRESS;
import mall.web.mapper.mall.MemberBasicAddressMapper;

/**
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * @Package	: mall.web.service.mall
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * @Desc	: 고객 기본배송지
 * @Company	: TED
 * @Author	: 장보라
 * @Date	: 2022-10-27
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/
@Service("memberBasicAddressService")
public class MemberBasicAddressService {

	@Resource(name="memberBasicAddressMapper")
	MemberBasicAddressMapper memberBasicAddressMapper;

	/* 기본배송지 조회 */
	public List<TB_MEMBER_BASIC_ADDRESS> getList(TB_MEMBER_BASIC_ADDRESS tb_member_basic_address) throws Exception{
		return memberBasicAddressMapper.getList(tb_member_basic_address);
	}
	
	/* 기본 배송지 등록 */
	@Transactional
	public int insert(TB_MEMBER_BASIC_ADDRESS tb_member_basic_address) throws Exception {
		return memberBasicAddressMapper.insert(tb_member_basic_address);
	}
	
	/* 기본 배송지 수정[사용여부 N]*/
	@Transactional
	public int update(TB_MEMBER_BASIC_ADDRESS tb_member_basic_address) throws Exception {
	
		// step1. 기존배송지의 수정여부를 N으로 수정
		memberBasicAddressMapper.update(tb_member_basic_address);
		
		// step2. 새로운 배송지 등록
		return memberBasicAddressMapper.insert(tb_member_basic_address);
	}
}
