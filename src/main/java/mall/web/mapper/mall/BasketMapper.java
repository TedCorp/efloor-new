package mall.web.mapper.mall;

import java.util.List;

import mall.web.domain.TB_ODINFOXM;

/**
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * @Package	: mall.web.mapper.mall
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * @Desc	: 장바구니
 * @Company	: YT Corp.
 * @Author	: Young-dae Kim (sjie1638@youngthink.co.kr)
 * @Date	: 2016-07-25 (오후 3:15:16)
 * @Version	: 1.0
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/
public interface BasketMapper {

	public int count(Object obj) throws Exception;
	public List<?> list(Object obj) throws Exception;
	public List<?> paginatedList(Object obj) throws Exception;
	public Object find(Object obj) throws Exception;
	public int insert(Object obj) throws Exception;
	public int update(Object obj) throws Exception;
	public int delete(Object obj) throws Exception;
	public List<?> excelList(Object obj) throws Exception;
	//장바구니 배송비 계산 - 이유리
	public List<?> SuprDlvyAmt(Object obj) throws Exception;
	//해당 상품 개수&총합 - 이유리
	public Object selectBkinInfo(Object obj) throws Exception;
	//배송비 업데이트 - 이유리
	public void updateDlvyAmt(Object obj) throws Exception;
	
	//장바구니 삭제 이벤트 - 장보라
	public void deleteBasket(Object obj) throws Exception;
	
}
