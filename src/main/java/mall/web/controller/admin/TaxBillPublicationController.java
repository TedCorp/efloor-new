package mall.web.controller.admin;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mall.web.domain.TB_ODTAXINFO_TAXINVOICE;
import mall.web.domain.TB_POLARBEAR_TAXBILLPUBLICATION;
import mall.web.domain.TB_TAXBILLPUBlICATION_INSERT;
import mall.web.service.admin.impl.PolarBearBackOfficeService;

//main-sidebar>세금계산서 발행
@Controller
@RequestMapping(value="/adm")
public class TaxBillPublicationController {
	
	private static final Logger logger = LoggerFactory.getLogger(CategoryMgrController.class);
	
	@Resource(name="polarBearBackOfficeService")
	PolarBearBackOfficeService polarBearBackOfficeService;
	
	@RequestMapping(value="/TaxBillPublication", method = RequestMethod.GET)
	public ModelAndView TaxBillPublication(@ModelAttribute TB_TAXBILLPUBlICATION_INSERT tb_taxbillpublication_insert, Model model) throws Exception {
		tb_taxbillpublication_insert.setSupplierList(polarBearBackOfficeService.supplierList());
		
		model.addAttribute("obj", tb_taxbillpublication_insert);
		
		//응답할 view 이름, view로 넘길 객체의 key, value
		return new ModelAndView("admin.layout", "jsp", "admin/polarBearBackOffice/TaxBillPublication");
	}
	
	@RequestMapping(value="/text1111111")
	public String testesttest() {
		
		return "admin/polarBearBackOffice/test";
	}
	@RequestMapping(value="/test2222222", method = RequestMethod.GET)
	public ModelAndView testesttest2() {
		
		return new ModelAndView("admin.layout", "jsp", "admin/polarBearBackOffice/test2");
	}
	
	ArrayList<String> ORDER_NUM_ArrayList;
	
	
	//공급자 등록시 popUp
	@RequestMapping(value="/supplierInsert", method = RequestMethod.POST)
	public String supplierInsert(@ModelAttribute TB_TAXBILLPUBlICATION_INSERT tb_taxbillpublication_insert, Model model) throws Exception {
		
		polarBearBackOfficeService.supplierInsert(tb_taxbillpublication_insert);
		
		model.addAttribute("obj", tb_taxbillpublication_insert);
		
		return "redirect:/adm/TaxBillPublication";
	}
	
	/**
	 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	 * @Class	: mall.web.controller.admin.TaxBillPublicationController.java
	 * @Method	: supplierAjax
	 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	 * @Desc	: 공급자 변경시 ajax
	 * @Company	: TED
	 * @Author	: 박용덕
	 * @Date	: 2022-09-06 (오후 01:21:40)
	 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	 * @return @ResponseBody
	 * @throws Exception
	 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	*/
	@RequestMapping(value="/supplierAjax", method = RequestMethod.GET)
	public @ResponseBody TB_TAXBILLPUBlICATION_INSERT supplierAjax(@ModelAttribute TB_TAXBILLPUBlICATION_INSERT tb_taxbillpublication_insert, Model model, @RequestParam("supplierSelect") int supplierSelect) throws Exception {
		
		tb_taxbillpublication_insert = polarBearBackOfficeService.supplierDetail(supplierSelect);
		
		return tb_taxbillpublication_insert;
	}
	
	//세금계산서 발급하기 1개 클릭시
	@RequestMapping(value="/taxPublicationSingle", method = RequestMethod.GET)
	public ModelAndView taxPublicationSingle(@RequestParam(value="ORDER_NUM", defaultValue="") String ORDER_NUM, Model model,
		@ModelAttribute TB_TAXBILLPUBlICATION_INSERT tb_taxbillpublication_insert,
		@ModelAttribute TB_ODTAXINFO_TAXINVOICE tb_odtaxinfo_taxinvoice) throws Exception {
		try {
			System.out.println("**************낱개 세금계산서 발급********************");
			
			/*공급자 정보 가져오기*/
			tb_taxbillpublication_insert.setSupplierList(polarBearBackOfficeService.supplierList());
			model.addAttribute("obj", tb_taxbillpublication_insert);
			
			ORDER_NUM_ArrayList = new ArrayList<String>();
			ORDER_NUM_ArrayList.add(ORDER_NUM);
			
			/*주문자 아이디*/
			String taxIdCheck = polarBearBackOfficeService.taxInvoiceUserCheck(ORDER_NUM);
			tb_odtaxinfo_taxinvoice.setORDER_NUM(ORDER_NUM);
			tb_odtaxinfo_taxinvoice.setREGP_ID(taxIdCheck);
			
			/*주문 정보 가져오기*/	
			List<TB_ODTAXINFO_TAXINVOICE> list = polarBearBackOfficeService.taxInvoiceSingleAction(tb_odtaxinfo_taxinvoice);
			
			model.addAttribute("infolist", list);
			model.addAttribute("ORDER_NUM_ArrayList", ORDER_NUM_ArrayList);
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return new ModelAndView("admin.layout", "jsp", "admin/polarBearBackOffice/TaxBillPublication");
	}
	
	
	
	//주문 리스트에서 세금계산서 발행시
	@RequestMapping(value="/taxPublication", method = RequestMethod.POST)
	public ModelAndView taxPublication(@RequestParam(value="taxPublicationArray", defaultValue="") List<String> arrayOrderNumber, Model model,
			@ModelAttribute TB_TAXBILLPUBlICATION_INSERT tb_taxbillpublication_insert,
			@ModelAttribute TB_ODTAXINFO_TAXINVOICE tb_odtaxinfo_taxinvoice) throws Exception {
		
		//공급자 정보 가져오기
		tb_taxbillpublication_insert.setSupplierList(polarBearBackOfficeService.supplierList());
		model.addAttribute("obj", tb_taxbillpublication_insert);
		
		//중복값 찾기용
		Set<String> set = new HashSet<>();
		
		//같은 아이디 대량
		ArrayList<TB_ODTAXINFO_TAXINVOICE> taxIds = new ArrayList<TB_ODTAXINFO_TAXINVOICE>();
		
		ORDER_NUM_ArrayList = new ArrayList<String>();
		
		//db 수정하기위해 넘기기
		for(int i = 0 ; i < arrayOrderNumber.size() ; i++) {
			ORDER_NUM_ArrayList.add(arrayOrderNumber.get(i));
			System.out.println("11111111111");
			System.out.println(ORDER_NUM_ArrayList.get(i));
			System.out.println("11111111111");
		}
		
		String taxIdCheck;
		//체크를 하나만 하고 넘겼을경우
		if (arrayOrderNumber.size() == 1) {
			/*
			여기다가 
			1. 체크값 많을경우 주문번호의 아이디 몇개인지 확인하고 동일한 아이디면 단건에 여러개 들어가게 하기
			2. 체크값 많을은데 주문번호의 아이디가 다른 아이디라면 대령으로 들어가게 조건문 생성
			*/
			
			//주문번호 기준 아이디
			taxIdCheck = polarBearBackOfficeService.taxInvoiceUserCheck(arrayOrderNumber.get(0));
			
			tb_odtaxinfo_taxinvoice.setORDER_NUM(arrayOrderNumber.get(0));
			tb_odtaxinfo_taxinvoice.setREGP_ID(taxIdCheck);
			tb_odtaxinfo_taxinvoice.setList(polarBearBackOfficeService.taxInvoiceSingleAction(tb_odtaxinfo_taxinvoice));
			//tb_odtaxinfo_taxinvoice.setWritedatemon(tb_odtaxinfo_taxinvoice.getDATE().substring(4,6));
			//tb_odtaxinfo_taxinvoice.setWritedateday(tb_odtaxinfo_taxinvoice.getDATE().substring(6,8));
			
			taxIds.add(tb_odtaxinfo_taxinvoice);
			
			model.addAttribute("infolist", taxIds);
			model.addAttribute("ORDER_NUM_ArrayList", ORDER_NUM_ArrayList);
			
		} else if (arrayOrderNumber.size() > 1) { //한개이상
			
			//넘겨받은 아이디들 정보 확인을 위한 for문
			for(int i = 0 ; i < arrayOrderNumber.size(); i++) {
				String taxIdCheckCount = polarBearBackOfficeService.taxInvoiceUserCheck(arrayOrderNumber.get(i));
				//set 특징 활용하여 주문번호를 기준으로 id들을 다 가져온다음 중복값은 제거되고 size가 2 이상이면 대량으로
				set.add(taxIdCheckCount);
			}
			
			if(set.size() == 1) {
				//똑같은 
				taxIdCheck = polarBearBackOfficeService.taxInvoiceUserCheck(arrayOrderNumber.get(0));
				for(int i=0; i<arrayOrderNumber.size(); i++) {
					tb_odtaxinfo_taxinvoice.setORDER_NUM(arrayOrderNumber.get(i));
					System.out.println("testordernum:"+arrayOrderNumber.get(i));
					tb_odtaxinfo_taxinvoice.setREGP_ID(taxIdCheck);
					tb_odtaxinfo_taxinvoice.setList(polarBearBackOfficeService.taxInvoiceSingleAction(tb_odtaxinfo_taxinvoice));
					//tb_odtaxinfo_taxinvoice.setWritedatemon(tb_odtaxinfo_taxinvoice.getDATE().substring(4,6));
					//tb_odtaxinfo_taxinvoice.setWritedateday(tb_odtaxinfo_taxinvoice.getDATE().substring(6,8));
					
					taxIds.add(tb_odtaxinfo_taxinvoice);
					
					System.out.println("tb_odtaxinfo_taxinvoice : " + tb_odtaxinfo_taxinvoice.getORDER_NUM());
				}
				model.addAttribute("infolist", taxIds);
				model.addAttribute("ORDER_NUM_ArrayList", ORDER_NUM_ArrayList);
				
			} else if(set.size() > 1) {
				//여기는 대량으로 넘어가는 영역
			}
			
			
		}
		
		
		return new ModelAndView("admin.layout", "jsp", "admin/polarBearBackOffice/TaxBillPublication");
	}
	
	
	
	
	
	
	//세금계산서 싱글 발행시
	@RequestMapping(value="/TaxBillPublicationSingle", method = RequestMethod.GET)
	public ModelAndView taxPublication(@ModelAttribute TB_POLARBEAR_TAXBILLPUBLICATION tb_polarbear_taxbillpublication, Model model, 
			@RequestParam(value="ORDER_NUM_ArrayList", defaultValue="") List<String> ORDER_NUM_List) throws Exception {
		System.out.println(tb_polarbear_taxbillpublication.getTax());
		System.out.println(tb_polarbear_taxbillpublication.getTax().length);
		
		ORDER_NUM_ArrayList = new ArrayList<String>();
		
		//db 수정하기위해 넘기기
		for(int i = 0 ; i < ORDER_NUM_List.size() ; i++) {
			ORDER_NUM_ArrayList.add(ORDER_NUM_List.get(i));
			System.out.println("222222222");
			System.out.println(ORDER_NUM_List.get(i));
			System.out.println("222222222");
		}
		model.addAttribute("info", tb_polarbear_taxbillpublication);
		model.addAttribute("ORDER_NUM_ArrayList", ORDER_NUM_ArrayList);
		
		
		
		return new ModelAndView("admin.layout", "jsp", "admin/polarBearBackOffice/TaxBillPublication_Single_Common");
	}
			
	//세금계산서 싱글 발행시
	@RequestMapping(value="/SuccessTaxBillPublicationUpdate", method = RequestMethod.GET)
	public String SuccessTaxBillPublicationInsert(@RequestParam(value="ORDER_NUM_List", defaultValue="") List<String> ORDER_NUM_List) throws Exception {
		
		//db 수정하기위해 넘기기
		for(int i = 0 ; i < ORDER_NUM_List.size() ; i++) {
			System.out.println(i);
			polarBearBackOfficeService.SuccessTaxBillPublicationUpdate(ORDER_NUM_List.get(i));
		}
		
		return "redirect:/adm/orderMgr";
	}
	
}


