package main.java.jackey.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "ACTNAME")
@Component
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
public class ActName {
	private Integer actNameId;
	private String name;
	private Integer memberId;
	private String orderTime;
	private Integer price;
	private Integer status;

	@Id
	@Column(name = "ACTNAMEID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getActNameId() {
		return actNameId;
	}

	public void setActNameId(Integer actNameId) {
		this.actNameId = actNameId;
	}

	@Column(name = "NAME")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "MEMBERID")
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	@Column(name = "ORDERTIME")
	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	@Column(name = "PRICE")
	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	@Column(name = "STATUS")
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
