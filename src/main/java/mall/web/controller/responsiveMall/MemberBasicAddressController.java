package mall.web.controller.responsiveMall;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mall.web.controller.DefaultController;
import mall.web.domain.TB_MBINFOXM;
import mall.web.domain.TB_MEMBER_BASIC_ADDRESS;
import mall.web.service.mall.MemberBasicAddressService;

/**
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * @Package : mall.web.responsiveMall.MemberBasicAddressController
 *          ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * @Desc : 기본배송지 Controller
 * @Company : TED
 * @Author : 장보라
 * @Date : 2022-10-27 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 */
@Controller
@RequestMapping(value = "/m/basicaddress")
public class MemberBasicAddressController extends DefaultController {

	@Resource(name = "memberBasicAddressService")
	MemberBasicAddressService memberBasicAddressService;

	/**
	 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	 * 
	 * @Class : mall.web.controller.mall.MypageRespController.java
	 * @Method : insertAndUpdate ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	 * @Desc : 기본배송지로 등록
	 * @Company : TED
	 * @Author : 장보라
	 * @Date : 2022-10-26 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	 */
	@RequestMapping(value = { "/insertAndUpdate" }, method = RequestMethod.POST)
	public @ResponseBody String insertAndUpdate(@ModelAttribute TB_MEMBER_BASIC_ADDRESS tb_member_basic_address,
			Model model, HttpServletRequest request) throws Exception {
		String result = "FALI";
		try {
			TB_MBINFOXM loginUser = (TB_MBINFOXM) request.getSession().getAttribute("USER");
			tb_member_basic_address.setMEMB_ID(loginUser.getMEMB_ID());
			tb_member_basic_address.setMEMB_NAME(loginUser.getMEMB_NAME());

			// step1. 기본배송지 조회
			List<TB_MEMBER_BASIC_ADDRESS> list = memberBasicAddressService.getList(tb_member_basic_address);

			// step2. 기본배송지가 없다면 등록
			if (list.isEmpty()) {
				return result = memberBasicAddressService.insert(tb_member_basic_address) != 0 ? "INSERT_SUCCESS" : result;
			} else {
				tb_member_basic_address.setBASIC_ADDRESS_ID(list.get(0).getBASIC_ADDRESS_ID());
				return result = memberBasicAddressService.update(tb_member_basic_address) != 0 ? "UPDATE_SUCCESS" : result;
			}
			
		} catch (Exception e) {
			
			return result;
			
		}
	}
}
