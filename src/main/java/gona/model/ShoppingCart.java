package main.java.gona.model;

import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.poi.hssf.record.CalcCountRecord;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope(value = "prototype")
public class ShoppingCart {
	private  String  rbId;
	private  Integer count;
	private  Integer money;
	private  String rbName;
	private  String rbType;
	private  String rbSize;
	private  String rbImg;
	
	
	public ShoppingCart() {
		
	}

	public ShoppingCart(String rbId, Integer count, Integer money, String rbName, String rbType, String rbSize,
			String rbImg) {
		this.rbId = rbId;
		this.count = count;
		this.money = money;
		this.rbName = rbName;
		this.rbType = rbType;
		this.rbSize = rbSize;
		this.rbImg = rbImg;
	}


	public String getRbId() {
		return rbId;
	}

	public void setRbId(String rbId) {
		this.rbId = rbId;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	public String getRbName() {
		return rbName;
	}

	public void setRbName(String rbName) {
		this.rbName = rbName;
	}

	public String getRbType() {
		return rbType;
	}

	public void setRbType(String rbType) {
		this.rbType = rbType;
	}

	public String getRbSize() {
		return rbSize;
	}

	public void setRbSize(String rbSize) {
		this.rbSize = rbSize;
	}

	public String getRbImg() {
		return rbImg;
	}

	public void setRbImg(String rbImg) {
		this.rbImg = rbImg;
	}
	
	
	
}
