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

//main-sidebar>현금영수증 조회
@Controller
@RequestMapping(value="/adm")
public class TaxBillCheckController {
	@RequestMapping(value="/TaxBillCheck", method = RequestMethod.GET)
	public ModelAndView AccountCheck(@RequestParam(value = "datepickerStr", required = false)String datepickerStr, Model model,
			@RequestParam(value = "datepickerEnd", required = false)String datepickerEnd,
			@RequestParam(value = "schTxt", required = false)String schTxt,
			@RequestParam(value = "PAY_GUBN", required = false)String PAY_GUBN,
			@RequestParam(value = "payType", required = false)String payType,
			@RequestParam(value = "pageNumber", required = false)String pageNumber) {
		
		
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
		}
		if(pageNumber == null || pageNumber.equals("")) {
			pageNumber = "1";
		}
		
		
		model.addAttribute("datepickerStr", datepickerStr);
		model.addAttribute("datepickerEnd", datepickerEnd);
		model.addAttribute("schTxt", schTxt);
		model.addAttribute("pageNumber", pageNumber);
		
		//응답할 view 이름, view로 넘길 객체의 key, value
		return new ModelAndView("admin.layout", "jsp", "admin/polarBearBackOffice/TaxBillCheck");
	}
	
	@RequestMapping(value="/TaxBillCheck/detail", method = RequestMethod.GET)
	public String detail(@RequestParam(value = "MgtKey", required = false)String MgtKey, Model model) {
		
		System.out.println(MgtKey);
		model.addAttribute("MgtKey", MgtKey);
		
		return "admin/polarBearBackOffice/TaxBillCheckCheckDetailPop";
	}
	
}
