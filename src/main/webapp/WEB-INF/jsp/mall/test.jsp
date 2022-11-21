<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>window.jQuery || document.write('<script src="${contextPath}/resources/js/jquery-2.2.1.min.js"><\/script>')</script>
<%-- <script src="${contextPath}/resources/js/read_allItems_search_by_category_example1.js"></script> --%>


<script>
/**
 * ���� ������ �명�곕�� 釉��쇱�곗���� 肄��� 李쎌���� �ㅽ���대낵 �� ���듬����.
 * �щ＼ 釉��쇱�곗������ ���ㅽ�몃�����듬����.
 *
 * ���곗�� manual.md ���쇱�� JWT �몄� �뱀���� ���� 諛⑹���쇰� 諛�湲�諛��� �� ���쇰ŉ,
 * �� ���� 肄��� ���⑤��� ���� client.setRequestHeader("Authorizaiton", "Bearer YOUR_TOKEN"); 肄�����
 * YOUR_TOKEN 遺�遺��� 諛�湲�諛��� ���곗�� �ｌ�댁＜��硫� �⑸����.
 */

/**
 * �� ������ allItems 荑쇰━濡� 寃����� 吏����� �� ����濡� �⑸����.
 *
 * ----------
 *
 * ���ν�� 移댄��怨�由� 肄����� ���댁�� �대�� 移댄��怨�由ъ�� �대�뱁���� ��留ㅼ��� ������ 紐⑤�� 遺��ъ�듬����.
 * 
 * 遺��ъ�ㅻ�� ���� ��蹂�:
 *  - �ㅻ���대�� ����肄���(key)
 *  - ����紐�(name)
 *  - �ㅻ���대�� ��留ㅺ�(price)
 *  - �ㅻ���대�� 媛�寃� ��梨�(pricePolicy)
 *  - ��鍮��� 以���媛� ������ 寃쎌�� ��鍮��� 以���媛�寃�(fixedPrice)
 *  - ���� ����(status)
 */

/**
 * 荑쇰━ 1踰��� 媛��몄�� ���� ��蹂댁�� 媛���. 理��� 1000.
 */
var countPerQuery = 1000;

/**
 * ������ 議고���� 移댄��怨�由ъ�� key������.
 */
var category = "50000108";

/**
 * 議고�� 寃곌낵������.
 */
var itemData = [];

function get(first, after) {
    var client = new XMLHttpRequest();
    
    //荑쇰━
    var endpoint = `${endpoint}`;
    var query = `${query}`;
	var token = `${token}`;
    
    client.open("GET", endpoint + encodeURIComponent(query), true);
    client.setRequestHeader("Authorization", "Bearer " + token);
    client.onreadystatechange = function (aEvt) {
        if (client.readyState === 4) {
            if (client.status === 200) {
                var response = JSON.parse(client.responseText);
                if (response.errors) {
                    // API ��踰� ���듭�� �����댁�留� API ���ш� ���ㅻ㈃ ���щ�� 諛������듬����.
                    throw new Error(JSON.stringify(response.errors));
                } else {
                    // 遺��ъ�� �곗�댄�곕�� 肄����� 湲곕����ㅻ㈃ �ㅼ�� 3以��� 二쇱�� �댁���⑸����.
                    //for (var i = 0; i < response.data.allItems.edges.length; i++) {
                    //    console.log(JSON.stringify(response.data.allItems.edges[i].node));
                    //}
                	
                	console.log(response);

                    // API ��踰� ���듬�� �����닿�, API ���щ�� ���ㅻ㈃ 諛����� �곗�댄�곕�� ���ν�⑸����.
                    for (var i = 0; i < response.data.allItems.edges.length; i++) {
                        itemData.push(response.data.allItems.edges[i].node);
                    }

                    if (response.data.allItems.pageInfo.hasNextPage) {
                        // 留��� �ㅼ�� �곗�댄�곌� �� ���ㅻ㈃ 異�媛�濡� �� 遺��ъ�듬����.
                        
                        console.log("has next : " + response.data.allItems.pageInfo.hasNextPage);
                        console.log("end cursor : " + response.data.allItems.pageInfo.endCursor);
                        console.log("response : " + response);
                        console.log("response data : " + response.data);
                        
                        
                        console.log("data>>>>>>>>>>>>>>>>>>>>>>>>>>>>> : ");
                        console.info(response.data);
                        
                        console.log("response>>>>>>>>>>>>>>>>>>>>>>>>>>>>> : ");
                        console.info(response);
                        console.log("end>>>>>>>>>>>>>>>>>>>>>>>>>>>>> : ");
                        
                        
                        get(countPerQuery, response.data.allItems.pageInfo.endCursor);
                    } else {
                        // �ㅼ�� �곗�댄�곌� ���ㅻ㈃ 遺��ъ�� ���� �곗�댄�곗�� 媛���瑜� 肄����� ������.
                        console.log(itemData.length);
                    }
                }
            } else {
                // API ��踰� ���듭�� ������ ���� 寃쎌�� ���ъ�� HTTP status code瑜� �댁�� ���щ�� 諛������듬����.
                throw new Error(client.status.toString() + ", " + client.responseText);
            }
        }
    };

    client.send(null);
}

get(countPerQuery, "0");

</script>