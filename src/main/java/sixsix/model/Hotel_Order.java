package main.java.sixsix.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "hotel_order")
@JsonIgnoreProperties(value = {"hibernateLazyInitializer","handler"})
@Component
public class Hotel_Order {
	@Id @Column(name = "ORDERID", unique = true, nullable = false, length = 20)
	@GeneratedValue(generator="system_uuid")
	@GenericGenerator(name="system_uuid",strategy="uuid")
	private String Id;
	@Column(name = "MEMBERID")
	private Integer Memberid;
	@Column(name = "TOTAL_DATE")
	private String Date;
	@Column(name = "HOWMANYDAY")
	private Integer Howmanyday;
	@Column(name = "MONEY")
	private int Money;
	@Column(name = "ORDERDATE")
	private String Orderdate;
	@Column(name = "STARNUM")
	private Integer Starnum;
	@Column(name = "COMMENTT")
	private String Commentt;
	

	

	@ManyToOne(fetch = FetchType.LAZY,optional = false)
	@JoinColumn(name = "HOMESTAY_ID1")
	@JsonBackReference
	private Homestay homestay;

	public Hotel_Order() {
		
	}
	
	public Hotel_Order(Integer Memberid,String Date,Integer Howmanyday,Integer Money,Homestay homestay,String Orderdate/*,Integer Starnum,String Commentt*/) {
		setMemberid(Memberid);
		setDate(Date);
		setHowmanyday(Howmanyday);
		setMoney(Money);
		setHomestay(homestay);
		setOrderdate(Orderdate);
//		setStarnum(Starnum);
//		setCommentt(Commentt);
	}
	
	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public Integer getMemberid() {
		return Memberid;
	}

	public void setMemberid(Integer memberid) {
		Memberid = memberid;
	}

	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	public Integer getHowmanyday() {
		return Howmanyday;
	}

	public void setHowmanyday(Integer howmanyday) {
		Howmanyday = howmanyday;
	}

	public Integer getMoney() {
		return Money;
	}

	public void setMoney(Integer money) {
		Money = money;
	}
	
	public String getOrderdate() {
		return Orderdate;
	}

	public void setOrderdate(String orderdate) {
		Orderdate = orderdate;
	}

	public Homestay getHomestay() {
		return homestay;
	}

	public void setHomestay(Homestay homestay) {
		this.homestay = homestay;
	}
	
	public Integer getStarnum() {
		return Starnum;
	}

	public void setStarnum(Integer starnum) {
		Starnum = starnum;
	}

	public String getCommentt() {
		return Commentt;
	}

	public void setCommentt(String commentt) {
		Commentt = commentt;
	}

	public void setMoney(int money) {
		Money = money;
	}

}
