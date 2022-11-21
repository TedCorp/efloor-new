package mall.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//main-sidebar>매입조회
@Controller
@RequestMapping(value="/adm")
public class PurchaseCheckController {
	@RequestMapping(value="/PurchaseCheck", method = RequestMethod.GET)
	static ModelAndView PurchaseCheck() {
		
								//응답할 view 이름, view로 넘길 객체의 key, value
		return new ModelAndView("admin.layout", "jsp", "admin/polarBearBackOffice/PurchaseCheck");
	}

}
