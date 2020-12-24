package main.java.gona.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
@Table(name = "RBCART")
@Component
@JsonIgnoreProperties(value = {"hibernateLazyInitializer","handler"})
public class RbCart implements Serializable{
	private  static final long serialVersionUID = 1L;
	
	private String rbCartId;
	private RentalBike rentalBike;
	private Integer count;
	private Integer money;
	private RbOrder rbOrder;
	
	public RbCart() {
		
	}	
	
	public RbCart(RentalBike rentalBike, Integer count, Integer money, RbOrder rbOrder) {
		this.rentalBike = rentalBike;
		this.count = count;
		this.money = money;
		this.rbOrder = rbOrder;
	}

	@Id
	@Column(name="RBCARTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public String getRbCartId() {
		return rbCartId;
	}

	public void setRbCartId(String rbCartId) {
		this.rbCartId = rbCartId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="RBORDERID")
	@JsonBackReference
	public RbOrder getRbOrder() {
		return rbOrder;
	}

	public void setRbOrder(RbOrder rbOrder) {
		this.rbOrder = rbOrder;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="RBID")
	@JsonBackReference
	public RentalBike getRentalBike() {
		return rentalBike;
	}

	public void setRentalBike(RentalBike rentalBike) {
		this.rentalBike = rentalBike;
	}
	
	@Column(name="COUNT")
	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
	@Column(name="MONEY")
	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	};
	
	

}
