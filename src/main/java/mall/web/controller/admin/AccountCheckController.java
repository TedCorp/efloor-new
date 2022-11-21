package mall.web.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.poi.ss.formula.functions.EDate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

//main-sidebar>실시간 계좌조회
@Controller
@RequestMapping(value="/adm")
public class AccountCheckController {
	@RequestMapping(value="/AccountCheck", method = RequestMethod.GET)
	static ModelAndView AccountCheck(@RequestParam(value = "SDate", required = false) String SDate, 
			@RequestParam(value = "EDate", required = false) String EDate,
			@RequestParam(value = "SearchString", required = false) String SearchString,
			@RequestParam(value = "pageNumber", required = false) String pageNumber,
			Model model) {
		
		
		//SDate = SDate.replaceAll("[^0-9]","");
		//EDate = EDate.replaceAll("[^0-9]","");
		
		
		//오늘 날짜 계산
		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		
		//최근 1주일을 계산하기 위해
		Calendar cal1 = Calendar.getInstance();
		cal1.add(Calendar.DATE, -6); // 일 계산
		Date date = new Date(cal1.getTimeInMillis());
		
		if(SDate.equals("null") || SDate.equals("")){
			SDate = String.valueOf(simpleDateFormat.format(date));
			System.out.println(SDate);
		}
		if(EDate.equals("null") || EDate.equals("")){
			EDate = String.valueOf(simpleDateFormat.format(nowDate));
			System.out.println(EDate);
		}
		if(SearchString == null || SearchString.equals("")) {
			SearchString = "";
			System.out.println("SearchString"+SearchString);
		}
		SearchString = SearchString.replaceAll(",", "");
		if(pageNumber == null || pageNumber.equals("")) {
			pageNumber = "1";
		}
		
		//날짜 데이터 지우기
		SDate.replaceAll("-","");
		EDate.replaceAll("-","");
		
		model.addAttribute("SDate", SDate);
		model.addAttribute("EDate", EDate);
		model.addAttribute("SearchString", SearchString);
		model.addAttribute("pageNumber", pageNumber);
		
		//응답할 view 이름, view로 넘길 객체의 key, value
		return new ModelAndView("admin.layout", "jsp", "admin/polarBearBackOffice/AccountCheck");
	}
	
	
	@RequestMapping(value="/AccountCheck/pageNumber", method = RequestMethod.GET)
	static ModelAndView AccountCheck(@RequestParam(value = "pagenumber", required = false) String pageNumber) {
		
		System.out.println("test");
		System.out.println(pageNumber);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageNumber", pageNumber);
		
		return mav;
	}
	
	@RequestMapping(value="/AccountCheck/setMemo", method = RequestMethod.GET)
	static ModelAndView setMemo(@RequestParam(value = "tid", required = false) String tid,@RequestParam(value = "memo", required = false) String memo, Model model) {
		
		model.addAttribute("tid", tid);
		model.addAttribute("memo", memo);
		
		return new ModelAndView("admin.layout", "jsp", "admin/polarBearBackOffice/AccountCheckMemoCommon");
	}
	
}
