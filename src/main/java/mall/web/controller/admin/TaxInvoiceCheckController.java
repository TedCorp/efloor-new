package mall.web.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/adm")
public class TaxInvoiceCheckController {
	@RequestMapping(value="/TaxInvoiceCheck", method = RequestMethod.GET)
	public ModelAndView AccountCheck(@RequestParam(value = "datepickerStr", required = false)String datepickerStr, Model model,
			@RequestParam(value = "datepickerEnd", required = false)String datepickerEnd,
			@RequestParam(value = "schTxt", required = false)String schTxt,
			@RequestParam(value = "PAY_GUBN", required = false)String PAY_GUBN,
			@RequestParam(value = "payType", required = false)String payType,
			@RequestParam(value = "pageNumber", required = false)String pageNumber) throws Exception {
		
		//오늘 날짜 계산
		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
				
		//최근 1주일을 계산하기 위해
		Calendar cal1 = Calendar.getInstance();
		cal1.add(Calendar.DATE, -6); // 일 계산
		Date date = new Date(cal1.getTimeInMillis());
				
		if(datepickerStr == null || datepickerStr.equals("")) {
			datepickerStr = String.valueOf(simpleDateFormat.format(date));
			System.out.println("datepickerStr"+datepickerStr);
		} 
		if(datepickerEnd == null || datepickerEnd.equals("")) {
			datepickerEnd = String.valueOf(simpleDateFormat.format(nowDate));
			System.out.println("datepickerEnd"+datepickerEnd);
		} 
		if(schTxt == null || schTxt.equals("")) {
			schTxt = "";
			System.out.println("schTxt"+schTxt);
		}
		if(PAY_GUBN == null || PAY_GUBN.equals("")) {
			PAY_GUBN = "I";
			System.out.println("PAY_GUBN"+PAY_GUBN);
		}
		if(payType == null || payType.equals("")) {
			payType = "Sales";
			System.out.println("PAY_GUBN"+PAY_GUBN);
		}
		if(pageNumber == null || pageNumber.equals("")) {
			pageNumber = "1";
			System.out.println("pageNumber"+pageNumber);
		}
		
		model.addAttribute("datepickerStr", datepickerStr);
		model.addAttribute("datepickerEnd", datepickerEnd);
		model.addAttribute("schTxt", schTxt);
		model.addAttribute("PAY_GUBN", PAY_GUBN);
		model.addAttribute("payType", payType);
		model.addAttribute("pageNumber", pageNumber);
		
		//응답할 view 이름, view로 넘길 객체의 key, value
		return new ModelAndView("admin.layout", "jsp", "admin/polarBearBackOffice/TaxInvoiceCheck");
	}
	
	@RequestMapping(value="/TaxInvoiceCheck/detail", method = RequestMethod.GET)
	public String detail(Model model,
			@RequestParam(value = "MgtKeyTypeCheck", required = false)String MgtKeyTypeCheck,
			@RequestParam(value = "MgtKey", required = false)String MgtKey) {
		
		model.addAttribute("MgtKeyTypeCheck", MgtKeyTypeCheck);
		model.addAttribute("MgtKey", MgtKey);
		
		return "admin/polarBearBackOffice/TaxInvoiceCheckDetailPop";
	}
	
}
