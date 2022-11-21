package mall.web.controller.admin;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mall.web.domain.TB_ODTAXINFO_CASHRECEIPT;
import mall.web.domain.TB_PublicationSingle;
import mall.web.service.admin.impl.PolarBearBackOfficeService;


@Controller
@RequestMapping(value="/adm")
public class CashReceiptPublicationController {
	
	@Resource(name="polarBearBackOfficeService")
	PolarBearBackOfficeService polarBearBackOfficeService;
	
	@RequestMapping(value="/CashReceiptPublication", method = RequestMethod.GET)
	public ModelAndView AccountCheck() {
		
		//응답할 view 이름, view로 넘길 객체의 key, value
		return new ModelAndView("admin.layout", "jsp", "admin/polarBearBackOffice/CashReceiptPublication");
	}
	//현금영수증 단건발행
	@RequestMapping(value="/CashReceiptPublication/Single", method = RequestMethod.POST)
	public ModelAndView CashReceiptPublicationSingle(@ModelAttribute TB_PublicationSingle tb_publicationsingle, Model model) throws Exception {
		
		System.out.println(tb_publicationsingle.getTradeUsage());
		System.out.println(tb_publicationsingle.getTradeOpt());
		System.out.println(tb_publicationsingle.getTaxationType());
		System.out.println(tb_publicationsingle.getTotalAmount());
		
		String OrderUserName = polarBearBackOfficeService.getOrderUserName_CashReceiptPublication(tb_publicationsingle.getCustomerName());
		OrderUserName = OrderUserName.trim();
		System.out.println(OrderUserName);
		
		tb_publicationsingle.setCustomerName(OrderUserName+"("+tb_publicationsingle.getCustomerName()+")");
		
		System.out.println("tb_publicationsingle.getCustomerName():"+tb_publicationsingle.getCustomerName());
		
		model.addAttribute("obj", tb_publicationsingle);
		
		return new ModelAndView("admin.layout", "jsp", "admin/polarBearBackOffice/CashReceiptPublicationSingleCommon");
	}
	
	@RequestMapping(value="/CashReceiptPublicationSingle", method = RequestMethod.GET)
	public ModelAndView CashReceiptPublicationSingle(@ModelAttribute TB_ODTAXINFO_CASHRECEIPT tb_odtaxinfo_cashreceipt, Model model,
			@RequestParam("ORDER_NUM")String ORDER_NUM, @RequestParam("MEMB_ID")String MEMB_ID) throws Exception {
		
		System.out.println(ORDER_NUM);
		System.out.println(MEMB_ID);
		
		tb_odtaxinfo_cashreceipt.setREGP_ID(MEMB_ID);
		tb_odtaxinfo_cashreceipt.setORDER_NUM(ORDER_NUM);
		
		tb_odtaxinfo_cashreceipt = polarBearBackOfficeService.CashReceiptPublicationSingle(tb_odtaxinfo_cashreceipt);
		
		model.addAttribute("obj", tb_odtaxinfo_cashreceipt);
		
		//응답할 view 이름, view로 넘길 객체의 key, value
		return new ModelAndView("admin.layout", "jsp", "admin/polarBearBackOffice/CashReceiptPublication");
	}
	
	@RequestMapping(value="/SuccessCashReceiptPublicationUpdate", method = RequestMethod.GET)
	public String SuccessCashReceiptPublicationUpdate(@RequestParam("ORDER_NUM")String ORDER_NUM) throws Exception {
		
		polarBearBackOfficeService.SuccessCashReceiptPublicationUpdate(ORDER_NUM);
		
		return "redirect:/adm/orderMgr";
	}
	
	
	
}


