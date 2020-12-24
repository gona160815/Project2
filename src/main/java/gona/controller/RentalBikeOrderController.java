package main.java.gona.controller;

import java.security.GeneralSecurityException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.stream.Collectors;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.apache.poi.ss.formula.eval.UnaryPlusEval;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import main.java.gona.model.Cart;
import main.java.gona.model.RbBill;
import main.java.gona.model.RbCart;
import main.java.gona.model.RbOrder;
import main.java.gona.model.RbStock;
import main.java.gona.model.RentalBike;
import main.java.gona.model.ShoppingCart;
import main.java.gona.model.Store;
import main.java.gona.service.RentalBikeDataService;
import main.java.gona.service.RentalBikeOrderService;
import main.java.gona.service.RentalBikeService;
import main.java.gona.service.StoreService;
import main.java.gona.util.BikeMailUtil;
import main.java.hugo.model.MemberBasic;
import main.java.hugo.util.MailUtils;
import oracle.net.aso.m;

@Controller
@SessionAttributes({"loginOK", "ShoppingCart" })
public class RentalBikeOrderController {
	
	@Autowired
	RentalBikeService rbService;
	@Autowired
	StoreService storeService;
	@Autowired
	RentalBikeOrderService rbOrderService;
	
	//傳送搜尋頁面(從車種頁面開始)------------------------------------
	
	@PostMapping(path="/orderSearchPre")
	public String orderSearchPre(Model model,@RequestParam(name="bgStore") String bgStore,
			@RequestParam(name="bgDate") String bgDate,@RequestParam(name="selectBgTime") String selectBgTime,
			@RequestParam(name="edDate") String edDate,@RequestParam(name="selectEdTime") String selectEdTime,
			@RequestParam(name="edStore") String edStore,
			@SessionAttribute(value = "ShoppingCart", required = false) Cart cart) {
		
		
		
		if(cart == null) {
			cart = (Cart)new Cart();
			model.addAttribute("ShoppingCart",cart);
		}
		
		List<RentalBike> rbList = rbOrderService.getSearchRb(bgStore);//撈出擁有庫存腳踏車的店家
		String storeSelect = storeService.getAllStoreSelect();//店家下拉式選單
		Store bgStore1 = storeService. selectOne(bgStore);//篩選起始店家物件
		Store edStore1 = storeService. selectOne(edStore);//篩選結尾店家物件
		
		int totalDate = 0;
		int totalTime = 0;
		if(bgDate.equals(edDate)) {
			String[] bTime = selectBgTime.split(":");
			String[] eTime = selectEdTime.split(":");
			int bgTime = Integer.parseInt(bTime[0]);
			int edTime = Integer.parseInt(eTime[0]);
			totalTime =  (edTime - bgTime);
			if(totalTime < 12) {
				totalTime = totalTime;
			}else if(totalTime >= 12 ) {
				totalTime = 0;
				totalDate = 1;
			}
		}else {
			totalDate = rbOrderService.getOrderDate(bgDate, edDate);
		}
		
		
		model.addAttribute("bgStore",bgStore1);
		model.addAttribute("edStore",edStore1);
		model.addAttribute("bgDate",bgDate);
		model.addAttribute("edDate",edDate);
		model.addAttribute("selectBgTime",selectBgTime);
		model.addAttribute("selectEdTime",selectEdTime);
		model.addAttribute("rentalBike",rbList);
		model.addAttribute("storeSelect",storeSelect);
		model.addAttribute("totalDate",totalDate);
		model.addAttribute("totalTime",totalTime);
		
		return "rental/OrderBikePre";	
	}
	
	
	//新增東西到購物車裡(Ajax)------------------------------------------------------------------------
	@PostMapping(path="/addToCart")
	public @ResponseBody String addToCart(@RequestParam(name="rbId") String rbId,
		   @RequestParam(name="totalMoney") Integer money,@RequestParam(name="count") Integer count,
		   @RequestParam(name="rbName") String rbName,@RequestParam(name="rbType") String rbType,
		   @RequestParam(name="rbSize") String rbSize,@RequestParam(name="rbImg") String rbImg,
		   @SessionAttribute(value = "ShoppingCart", required = false) Cart cart) {	
		   ShoppingCart newCart = new ShoppingCart(rbId,count,money,rbName,rbType,rbSize,rbImg);
		   cart.addToCart(rbId, newCart);
		   
//		   System.out.println("測試測試測試測試");
//		   Map<String,ShoppingCart> cartMap = cart.getContent();
//		   Iterator<Map.Entry<String,ShoppingCart>> entries = cartMap.entrySet().iterator();
//		   while (entries.hasNext()) {
//		   Map.Entry<String,ShoppingCart> entry = entries.next();
//		   System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
//		}
		   String test = "我其實不知道回傳什麼";
		   return test;
	}
	
	//計算總金額(Ajax)---------------------------------------------------------------------------------------
	@PostMapping(path="/totalPrice")
	public @ResponseBody String totalPrice(@SessionAttribute(value = "ShoppingCart", required = false) Cart cart) {
		String totalPrice  = String.valueOf(cart.countPrice());
		return totalPrice;
	}
	
	//撈出購物車的東西傳給前端(Ajax)-------------------------------------------------------------------------
	@PostMapping(path="/checkCart",produces = "application/json")
	public @ResponseBody  Map<String, Object> checkCart(@SessionAttribute(value = "ShoppingCart", required = false) Cart cart){
		Map<String,Object> map = new HashMap<>();
		Map<String,ShoppingCart> cartMap = cart.getContent();
		List<ShoppingCart> cartList = cartMap.values().stream().collect(Collectors.toList());
		map.put("cart",cartList);
		return map;
	}
	//刪除一筆購物車商品(Ajax)---------------------------------------------------------------------------------
	@PostMapping(path="/deleteCart")
	public @ResponseBody Boolean addToCart(@RequestParam(name="rbId") String rbId,
		   @SessionAttribute(value = "ShoppingCart", required = false) Cart cart) {
		   int num = cart.deleteOrder(rbId);
		   if(num == 1) {
			   return true;
		   }else {
			   return false;
		   }	   
	}
	
	// 送給訂單頁(填資料)--------------------------------------------------------------------------------------
	@PostMapping(path="/sendOrder")
	public String sendOrder(Model model,@RequestParam(name="bgStoreId") String bgStoreId,
			@RequestParam(name="bgDate") String bgDate,@RequestParam(name="selectBgTime") String selectBgTime,
			@RequestParam(name="edDate") String edDate,@RequestParam(name="selectEdTime") String selectEdTime,
			@RequestParam(name="edStoreId") String edStoreId,@RequestParam(name="totalDate", required = false) String totalDate,
			@RequestParam(name="totalTime", required = false) String totalTime,
			@SessionAttribute(value = "ShoppingCart", required = false) Cart cart,
			@SessionAttribute(value = "loginOK", required = false) MemberBasic member) {
		
		Integer sum = cart.countPrice();
		System.out.println(sum);
		
		Store bgStore = storeService. selectOne(bgStoreId);//篩選起始店家物件
		Store edStore = storeService. selectOne(edStoreId);//篩選結尾店家物件
			
		model.addAttribute("bgStore",bgStore);
		model.addAttribute("edStore",edStore);
		model.addAttribute("bgDate",bgDate);
		model.addAttribute("edDate",edDate);
		model.addAttribute("selectBgTime",selectBgTime);
		model.addAttribute("selectEdTime",selectEdTime);
		model.addAttribute("totalDate",totalDate);
		model.addAttribute("totalTime",totalTime);
		model.addAttribute("member",member);
		model.addAttribute("totalPrice",sum);
	
		return "rental/orderBike";
	}
	
	//把訂單資料存到資料庫----------------------------------------------------------------------------------------
	@PostMapping(path="/comfirmOrder")
	public String comfirmOrder(Model model,@RequestParam(name="bgStoreId") String bgStoreId,
			@RequestParam(name="bgDate") String bgDate,@RequestParam(name="selectBgTime") String selectBgTime,
			@RequestParam(name="edDate") String edDate,@RequestParam(name="selectEdTime") String selectEdTime,
			@RequestParam(name="edStoreId") String edStoreId,@RequestParam(name="totalDate", required = false) String totalDate,
			@RequestParam(name="totalTime", required = false) String totalTime,@RequestParam(name="totalPrice") Integer totalPrice,
			@RequestParam(name="mbName") String mbName,@RequestParam(name="mbGender") String mbGender,
			@RequestParam(name="idnum") String idnum,@RequestParam(name="mbTel") String mbTel,@RequestParam(name="mbMail") String mbMail,
			@SessionAttribute(value = "ShoppingCart", required = false) Cart cart,
			@SessionAttribute(value = "loginOK", required = false) MemberBasic member) {
			 	
			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Date date = new Date();
			String strDate = sdFormat.format(date);
			String priceStr = String.valueOf(totalPrice);
			
			//先創建ORDERID
			String memberId = String.valueOf(member.getMemberId());
			Store bgStore = storeService. selectOne(bgStoreId);//篩選起始店家物件
			Store edStore = storeService. selectOne(edStoreId);//篩選結尾店家物件
			RbOrder order = new RbOrder(memberId,bgStore,edStore,bgDate,edDate,selectBgTime,selectEdTime,totalPrice,strDate);
			rbOrderService.insertRbOrder(order);
			
			String orderId = order.getRbOrderId();
			//把購物車的東西一個個撈出來
			Map<String,ShoppingCart> cartMap = cart.getContent();
			List<ShoppingCart> cartList = cartMap.values().stream().collect(Collectors.toList());
			//把他們一個個塞進資料庫
			for(ShoppingCart cartBean:cartList) {
		
				String rbId = cartBean.getRbId();
				Integer count = cartBean.getCount();
				Integer money = cartBean.getMoney();
				
				RentalBike rb = rbService.selectBike(rbId);
				RbCart rbCart = new RbCart(rb,count,money,order);
				rbOrderService.insertRbCart(rbCart);
			}
			
			//傳送預約者資料給交易明細
			RbBill rbBill = new RbBill(order,memberId,mbTel,mbMail,mbName,mbGender,idnum,0);
			rbOrderService.insertRbBill(rbBill);
			
			//傳給綠界
			String form = rbOrderService.payOrder(orderId,strDate, priceStr, "本次預約商品"); 
			model.addAttribute("form",form);
			model.addAttribute("orderId",orderId);
			
			//清空購物車
			cart.clearCart();
			
			
		return  "rental/orderSuccess";
	} 

	//搜尋該會員擁有的訂單(Ajax)================
	@PostMapping(path="/orderByMember",produces = "application/json")
	public @ResponseBody  Map<String, Object> orderByMember(@SessionAttribute(value = "loginOK", required = false) MemberBasic member){
		Map<String, Object> map = new HashMap<>();
		String memberId = String.valueOf(member.getMemberId());
		List<RbOrder> orderList = rbOrderService.selectOrderByMenber(memberId);
		map.put("orderList",orderList);
		return map;
	}
	
	//預約成功送信==========================
	@GetMapping(path="/orderSuccess")
	public String orderSuccess(@RequestParam(name = "orderId") String orderId,
		   @RequestParam(name = "ors") Integer status,
		   @SessionAttribute(value = "loginOK", required = false) MemberBasic member) throws AddressException, MessagingException, GeneralSecurityException {
		
		String to = member.getEmail();
		String subject = "[追風者]  單車預約訂單明細";
		StringBuilder contentBuilder = new StringBuilder();
		RbOrder thisOrder = rbOrderService.selectRbOrder(orderId); //撈出此筆訂單資訊
		ArrayList<RbCart> thisCart = rbOrderService.selectCartByOrder(orderId);
		
		contentBuilder.append("親愛的　"+member.getName()+"　您好：<br><br>");
		contentBuilder.append("感謝您使用我們的預約服務！<br>以下是您本次的預約資訊<br><br>");
		
		contentBuilder.append("訂單編號："+thisOrder.getRbOrderId()+"<br>");	
		contentBuilder.append("下訂日期："+thisOrder.getOrderTime()+"<br>");
		contentBuilder.append("預約人姓名："+thisOrder.getRbBill().getBillName()+"<br>");
		contentBuilder.append("預約人聯絡電話："+thisOrder.getRbBill().getBillTel()+"<br><br>");
		
		contentBuilder.append("租車起始日："+thisOrder.getBgDate()+"　"+thisOrder.getBgTime()+"<br>");
		contentBuilder.append("租車門市："+thisOrder.getBgStore().getSt_name()+"<br>");
		contentBuilder.append("租車結束日："+thisOrder.getEdDate()+"　"+thisOrder.getEdTime()+"<br>");
		contentBuilder.append("還車門市："+thisOrder.getEdStore().getSt_name()+"<br><br>");
		
		
		contentBuilder.append("=====預約單車總覽=====<br><br>");
		for (int i = 0 ; i < thisCart.size();i++ ) { 
			contentBuilder.append("單車型號："+ thisCart.get(i).getRentalBike().getSimBike().getRbName()+"("+thisCart.get(i).getRentalBike().getSimBike().getRbType().getTypeName()+")"+"<br>");
			contentBuilder.append("單車尺寸："+ thisCart.get(i).getRentalBike().getRbSize().getRbSize()+"<br>");			
			contentBuilder.append("預約數量："+ thisCart.get(i).getCount()+"<br>");		
			contentBuilder.append("價錢："+ (thisCart.get(i).getCount())*(thisCart.get(i).getMoney())+"<br><br>");			
		} 
		
		contentBuilder.append("=====================<br><br>");
		contentBuilder.append("金額總計："+thisOrder.getTotlalMoney()+"<br><br>");
		
		contentBuilder.append("您也可隨時登入我們的網站，至會員中心查詢訂單或修改基本資料。如果您有任何問題，也請您至客服中心詢問相關訊息或來信給我們。<br>追風者 敬上");
		
		String content = contentBuilder.toString();
	
		BikeMailUtil.sendBikeMail(to,subject,content);
		thisOrder.getRbBill().setOrderStatus(status);
		return "redirect:orderSuccessPage";
	}
	
	//顯示預約成功畫面
	@GetMapping(path="/orderSuccessPage")
	public String orderSuccessPage() {
		return "rental/orderSuccess";
	}
	
	//隨機灌庫存================================================================================
	@GetMapping(path="/randomStock")
	public String randomStock() {
		int rbmin = 271;
		int rbmax = 397;
		int stockmin = 1;
		int stockmax = 20;
		Random random = new Random();
		
		for(int j=1005;j<=1037;j++) {
			String store_id = "RS"+j;
			
			for(int i=1;i<5;i++) {
				int rb = random.nextInt(rbmax)%(rbmax-rbmin+1) + rbmin;
				int stock = random.nextInt(stockmax)%(stockmax-stockmin+1) + stockmin;
				String rbId = "RB"+rb;
				RentalBike rbBean = rbService.selectBike(rbId);
				Store storeBean = storeService.selectOne(store_id);
				RbStock rbStock = new RbStock(stock,rbBean, storeBean);
				storeService.insertRbStock(rbStock);
			} 
		}
	  
        return "rental/orderSuccess";
	}
	
	//隨機灌訂單================================================================================
	@GetMapping(path="/initRandomOrder")
	public String randomOrder() {
		
		
		int smin = 1006;  //店家
		int smax = 1037;  //店家
		int priceMin = 1000;  //價格
		int priceMax = 20000; //價格
		int rbPriceMin = 350;  //價格
		int rbPriceMax = 2000; //價格
		int rbmin = 271; //單車
		int rbmax = 397; //單車
		int mmin = 51; //會員
		int mmax = 52; //會員
		int countMax = 10; //數量最大
		int countMin = 1; //數量最小
		Random random = new Random();
		
		for(int i=1;i<50;i++) {
			
			//先創建ORDERID	
			for(int s = 1006;s<=1037;s++) {
			String store_id1 = "RS"+s; //起始店家(每家都有)
			
			int st1 = random.nextInt(smax)%(smax-smin+1) + smin; //隨機生成的店家數字
			int st2 = random.nextInt(smax)%(smax-smin+1) + smin; //隨機生成的店家數字
			int totalPrice = random.nextInt(priceMax)%(priceMax-priceMin+1) + priceMin; //隨機生成的價格
			//String priceStr = String.valueOf(price);
			int member = random.nextInt(mmax)%(mmax-mmin+1) + mmin; //隨機生成的會員
			String memberId = String.valueOf(member);
			String date = rbOrderService.randomDate("2020-01-01 00:00:00","2020-12-08 00:00:00").get(0); //隨機生成日期
			String bgDate = rbOrderService.randomDate("2020-01-01 00:00:00","2020-12-08 00:00:00").get(1);
			String edDate = rbOrderService.randomDate("2020-01-01 00:00:00","2020-12-08 00:00:00").get(1);
			String selectBgTime = rbOrderService.randomDate("2020-01-01 00:00:00","2020-12-08 00:00:00").get(2);
			String selectEdTime = rbOrderService.randomDate("2020-01-01 00:00:00","2020-12-08 00:00:00").get(2);
			
			String store_id2 = "RS"+st2; 
			Store bgStore = storeService. selectOne(store_id1);//篩選起始店家物件
			Store edStore = storeService. selectOne(store_id2);//篩選結尾店家物件
			System.out.println(store_id1);
			RbOrder order = new RbOrder(memberId,bgStore,edStore,bgDate,edDate,selectBgTime,selectEdTime,totalPrice,date);
			rbOrderService.insertRbOrder(order);
			
			for(int j=1;j <5;j++) {
				int rb = random.nextInt(rbmax)%(rbmax-rbmin+1) + rbmin; //隨機生成的腳踏車數字
				int count = random.nextInt(countMax)%(countMax-countMin+1) + countMin; //隨機生成的腳踏車數字
				int rbPrice = random.nextInt(rbPriceMax)%(rbPriceMax-rbPriceMin+1) + rbPriceMin; //隨機生成的腳踏車數字				
				String rbId = "RB"+rb; 
				RentalBike rbBean = rbService.selectBike(rbId); //隨機生成的腳踏車
				
				RbCart rbCart = new RbCart(rbBean,count,rbPrice,order);
				rbOrderService.insertRbCart(rbCart);
			}			
			
			RbBill rbBill = new RbBill(order,memberId,"09123456789","gona0815@gmail.com","第一組","Male","A12345679",1);
			rbOrderService.insertRbBill(rbBill);
			
			}
		}    					
		return "rental/orderSuccess";
	}
	
	//刪除購物車裡的一筆資料(ajax)====================================================================
	@PostMapping(path="deleteFromCart",produces = "application/json")
	public @ResponseBody String deleteFromCart(@RequestParam(name="rbId") String rbId,
		   @SessionAttribute(value = "ShoppingCart", required = false) Cart cart) {
		   cart.deleteOrder(rbId);
		   return "刪除成功"; 
		
	}

	//更新購物車商品數量(Ajax)========================================================================
	@PostMapping(path="modifyCartCart",produces = "application/json")
	public @ResponseBody String modifyCartCart(@RequestParam(name="rbId") String rbId,
		   @RequestParam(name="count") Integer newCount,
		   @SessionAttribute(value = "ShoppingCart", required = false) Cart cart) {
		   cart.modifyCount(rbId,newCount);
		   return "刪除成功"; 	
	}
	
	//傳送訂單詳細資料=================================================================================
	@GetMapping(path="/rbOrderDetail")
	public String rbOrderDetail(Model model)  {
		MemberBasic memberBasic = (MemberBasic) model.getAttribute("loginOK");
		String memberId = Integer.toString(memberBasic.getMemberId());
		List<RbOrder> orders  = rbOrderService.selectOrderByMenber(memberId);
		model.addAttribute("orderBean",orders);
		return "rental/bikeOrderDetail";			
	}
	
	
}
