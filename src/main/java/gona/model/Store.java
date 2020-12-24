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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.ManyToAny;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "STORE")
@Component
@JsonIgnoreProperties(value = {"hibernateLazyInitializer","handler"})
public class Store implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "STORE_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String store_id;

	@Column(name = "ST_NAME")
	private String st_name;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ST_AREA")
//	@JsonIgnoreProperties("stores")
	@JsonBackReference
	private Area area;

	@Column(name = "ST_ADDRESS")
	private String st_address;

	@Column(name = "ST_TEL")
	private String st_tel;

	@Column(name = "ST_MAIL")
	private String st_mail;

	@Column(name = "ST_HOLIDAY")
	private String st_holiday;

	@Column(name = "ST_BGTIME")
	private String st_bgtime;

	@Column(name = "ST_EDTIME")
	private String st_edtime;
	
	@OneToMany(mappedBy = "bgStore",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
//	@JsonIgnoreProperties("bgStore")
	@JsonManagedReference
	private Set<RbOrder> bgRbOrder;
	
	@OneToMany(mappedBy = "edStore",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@JsonIgnoreProperties("edStore")
//	@JsonManagedReference
	private Set<RbOrder> edRbOrder;
	
	@OneToMany(mappedBy = "store",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	@JsonIgnoreProperties("store")
	private Set<RbStock> rbStock;

	@Column(name = "ST_IMGFILE1")
	private String st_imgFile1;

	public Store() {

	}

	public Store(String store_id, String st_name, Area area, String st_address, String st_tel, String st_mail,
			String st_holiday, String st_bgtime, String st_edtime, String st_imgFile1) {

		this.store_id = store_id;
		this.st_name = st_name;
		this.area = area;
		this.st_address = st_address;
		this.st_tel = st_tel;
		this.st_mail = st_mail;
		this.st_holiday = st_holiday;
		this.st_bgtime = st_bgtime;
		this.st_edtime = st_edtime;
		this.st_imgFile1 = st_imgFile1;
	}
	
	public Store(String st_name, Area area, String st_address, String st_tel, String st_mail,
			String st_holiday, String st_bgtime, String st_edtime, String st_imgFile1) {

		this.st_name = st_name;
		this.area = area;
		this.st_address = st_address;
		this.st_tel = st_tel;
		this.st_mail = st_mail;
		this.st_holiday = st_holiday;
		this.st_bgtime = st_bgtime;
		this.st_edtime = st_edtime;
		this.st_imgFile1 = st_imgFile1;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}

	public String getSt_address() {
		return st_address;
	}

	public void setSt_address(String st_address) {
		this.st_address = st_address;
	}

	public String getSt_tel() {
		return st_tel;
	}

	public void setSt_tel(String st_tel) {
		this.st_tel = st_tel;
	}

	public String getSt_mail() {
		return st_mail;
	}

	public void setSt_mail(String st_mail) {
		this.st_mail = st_mail;
	}

	public String getSt_holiday() {
		return st_holiday;
	}

	public void setSt_holiday(String st_holiday) {
		this.st_holiday = st_holiday;
	}

	public String getSt_bgtime() {
		return st_bgtime;
	}

	public void setSt_bgtime(String st_bgtime) {
		this.st_bgtime = st_bgtime;
	}

	public String getSt_edtime() {
		return st_edtime;
	}

	public void setSt_edtime(String st_edtime) {
		this.st_edtime = st_edtime;
	}

	public String getSt_imgFile1() {
		return st_imgFile1;
	}

	public void setSt_imgFile1(String st_imgFile1) {
		this.st_imgFile1 = st_imgFile1;
	}

	public Set<RbOrder> getBgRbOrder() {
		return bgRbOrder;
	}

	public void setBgRbOrder(Set<RbOrder> bgRbOrder) {
		this.bgRbOrder = bgRbOrder;
	}

	public Set<RbOrder> getEdRbOrder() {
		return edRbOrder;
	}

	public void setEdRbOrder(Set<RbOrder> edRbOrder) {
		this.edRbOrder = edRbOrder;
	}

	public Set<RbStock> getRbStock() {
		return rbStock;
	}

	public void setRbStock(Set<RbStock> rbStock) {
		this.rbStock = rbStock;
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}
	
	

}
