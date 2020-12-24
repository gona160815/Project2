package main.java.gona.model;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
public class Cart {
	
	public Map<String,ShoppingCart> cart = new LinkedHashMap< >(); //腳踏車編號 // 暫存的物品
	
	public Map<String, ShoppingCart>  getContent() { // ${ShoppingCart.content}
		return cart;
	}	
	
	//增加東西到購物車中
	public void addToCart(String rbId,ShoppingCart rb) {
		if(cart.get(rbId) == null) {
			cart.put(rbId,rb); //如果沒有該項商品就+1
		}else {
			ShoppingCart oldRb = cart.get(rbId);
			//oldRb 原本就有的腳踏車
			//rb 新增加進來的腳踏車
			oldRb.setCount(rb.getCount()+oldRb.getCount());
		}
	}
	
	//刪除某項商品
	public int deleteOrder(String rbId) {
		if ( cart.get(rbId) != null ) {
		       cart.remove(rbId);  // Map介面的remove()方法
		       return 1;
			} else {
			   return 0;
		}
	}
	
	//計算價格
	public Integer countPrice() {
		Integer sum = 0;
		Set<String> set = cart.keySet();
		for (String k : set) {
			int price = cart.get(k).getMoney();
			int count = cart.get(k).getCount();
			int totalPrice = price*count;
			sum += totalPrice;
		}
		return sum;
	}
	
	//更改數量
	public boolean modifyCount(String rbId, int  newCount) {
		if ( cart.get(rbId) != null ) {
			ShoppingCart oldRb = cart.get(rbId);
			oldRb.setCount(newCount);
	       return true;
		} else {
		   return false;
		}
	}
	
	//清空購物車
	public void clearCart() {
		cart.clear();
	}
	

}
