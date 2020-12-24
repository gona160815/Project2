package main.java.gona.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "RBORDER")
@Component
@JsonIgnoreProperties(value = {"hibernateLazyInitializer","handler"})
public class RbOrder implements Serializable {
	private  static final long serialVersionUID = 1L;
	
	private String rbOrderId;
	private String memberId;
	private String bgDate;
	private String edDate;
	private String bgTime;
	private String edTime;
	private Integer totlalMoney;
	private String  orderTime;
	
	

	private Store bgStore;
	private Store edStore;
	private Set<RbCart> rbCart; 
	private RbBill rbBill;
	
	public RbOrder() {
		
	}
	
	

	public RbOrder(String memberId,Store bgStore,Store edStore, String bgDate, String edDate, String bgTime, String edTime, Integer totlalMoney,String orderTime) {
		this.memberId = memberId;
		this.bgStore = bgStore;
		this.edStore = edStore;
		this.bgDate = bgDate;
		this.edDate = edDate;
		this.bgTime = bgTime;
		this.edTime = edTime;
		this.totlalMoney = totlalMoney;
		this.orderTime = orderTime;
	}



	@Id
	@Column(name="RBORDERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public String getRbOrderId() {
		return rbOrderId;
	}

	public void setRbOrderId(String rbOrderId) {
		this.rbOrderId = rbOrderId;
	}
	
	@Column(name="MEMBERID")
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="BGSTORE")
	@JsonBackReference
//	@JsonIgnoreProperties("bgRbOrder")
	public Store getBgStore() {
		return bgStore;
	}

	public void setBgStore(Store bgStore) {
		this.bgStore = bgStore;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="EDSTORE")
	@JsonBackReference
//	@JsonIgnoreProperties("edRbOrder")
	public Store getEdStore() {
		return edStore;
	}

	public void setEdStore(Store edStore) {
		this.edStore = edStore;
	}
	
	@Column(name="BGDATE")
	public String getBgDate() {
		return bgDate;
	}

	public void setBgDate(String bgDate) {
		this.bgDate = bgDate;
	}
	
	@Column(name="EDDATE")
	public String getEdDate() {
		return edDate;
	}

	public void setEdDate(String edDate) {
		this.edDate = edDate;
	}

	@Column(name="BGTIME")
	public String getBgTime() {
		return bgTime;
	}

	public void setBgTime(String bgTime) {
		this.bgTime = bgTime;
	}
	
	@Column(name="EDTIME")
	public String getEdTime() {
		return edTime;
	}

	public void setEdTime(String edTime) {
		this.edTime = edTime;
	}
	
	@Column(name="TOTALMONEY")
	public Integer getTotlalMoney() {
		return totlalMoney;
	}

	public void setTotlalMoney(Integer totlalMoney) {
		this.totlalMoney = totlalMoney;
	}
	
	@OneToMany(mappedBy = "rbOrder",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@JsonManagedReference
	public Set<RbCart> getRbCart() {
		return rbCart;
	}

	public void setRbCart(Set<RbCart> rbCart) {
		this.rbCart = rbCart;
	}

	@Column(name="ORDERTIME")
	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	@OneToOne(mappedBy = "rbOrder",fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	@JsonIgnoreProperties("rbOrder")
	public RbBill getRbBill() {
		return rbBill;
	}

	public void setRbBill(RbBill rbBill) {
		this.rbBill = rbBill;
	}
	
	

}
