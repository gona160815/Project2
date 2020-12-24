package main.java.gona.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "RBBILL")
@Component
@JsonIgnoreProperties(value = {"hibernateLazyInitializer","handler"})
public class RbBill implements Serializable{
	private  static final long serialVersionUID = 1L;
	
	private String billId;
	private RbOrder rbOrder;
	private String memberId;
	private String billTel;
	private String billMail;
	private String billName;
	private String billGender;
	private String billIdNum;
	private Integer orderStatus;
	
	public RbBill() {
		
	}
		
	public RbBill(RbOrder rbOrder, String memberId, String billTel, String billMail, String billName,
			String billGender, String billIdNum,Integer orderStatus) {
		
		this.rbOrder = rbOrder;
		this.memberId = memberId;
		this.billTel = billTel;
		this.billMail = billMail;
		this.billName = billName;
		this.billGender = billGender;
		this.billIdNum = billIdNum;
		this.orderStatus = orderStatus;
	}

	@Id
	@Column(name="BILLID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public String getBillId() {
		return billId;
	}

	public void setBillId(String billId) {
		this.billId = billId;
	}
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="ORDERID", referencedColumnName="RBORDERID")
	@JsonIgnoreProperties("rbBill")
	public RbOrder getRbOrder() {
		return rbOrder;
	}

	public void setRbOrder(RbOrder rbOrder) {
		this.rbOrder = rbOrder;
	}

	@Column(name="MEMBERID")
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Column(name="BILLTEL")
	public String getBillTel() {
		return billTel;
	}

	public void setBillTel(String billTel) {
		this.billTel = billTel;
	}
	
	@Column(name="BILLMAIL")
	public String getBillMail() {
		return billMail;
	}

	public void setBillMail(String billMail) {
		this.billMail = billMail;
	}
	
	@Column(name="BILLNAME")
	public String getBillName() {
		return billName;
	}

	public void setBillName(String billName) {
		this.billName = billName;
	}
	
	@Column(name="BILLGENDER")
	public String getBillGender() {
		return billGender;
	}

	public void setBillGender(String billGender) {
		this.billGender = billGender;
	}

	@Column(name="BILLIDNUM")
	public String getBillIdNum() {
		return billIdNum;
	}

	public void setBillIdNum(String billIdNum) {
		this.billIdNum = billIdNum;
	}

	@Column(name="ORDERSTATUS")
	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	
	
	
	
	
}
