package mall.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//main-sidebar>매출 조회
@Controller
@RequestMapping(value="/adm")
public class SalesCheckController {
	@RequestMapping(value="/SalesCheck", method = RequestMethod.GET)
	static ModelAndView SalesCheck() {

									//응답할 view 이름, view로 넘길 객체의 key, value
		return new ModelAndView("admin.layout", "jsp", "admin/polarBearBackOffice/SalesCheck");
	}
}
