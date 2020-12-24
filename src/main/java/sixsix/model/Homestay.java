package main.java.sixsix.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "homestay")
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
@Component
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class Homestay implements Serializable{
	private static final long serialVersionUID = 1L;
	
	public Homestay() {
	}
	
	@Id
	@Column(name = "ID1", unique = true, nullable = false, length = 20)
	@GeneratedValue(generator = "system_uuid")
	@GenericGenerator(name = "system_uuid", strategy = "uuid")
	private String Id;
	@Column(name = "NAME1")
	private String Name;
	@Column(name = "DESCRIPTION1")
	private String Description;
	@Column(name = "ADD1")
	private String Add;
	@Column(name = "TELLPHONE")
	private String Tellphone;
	@Column(name = "REGION")
	private String Region;
	@Column(name = "TOWN")
	private String Town;
	@Column(name = "PICTUREL")
	private String Picturel;
	@Column(name = "SERVICEINFO")
	private String Serviceinfo;
	@Column(name = "PARKINGINFO")
	private String Parkinginfo;
	@Column(name = "PX")
	private BigDecimal Px;
	@Column(name = "PY")
	private BigDecimal Py;
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
	@JoinTable(name = "HOMESTAY_TYPE", joinColumns = {
			@JoinColumn(name = "HOMESTAY_ID1", referencedColumnName = "ID1", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "HOTEL_TYPE_HOTEL_ID", referencedColumnName = "HOTEL_ID", nullable = false, updatable = false) })
	@JsonIgnore
	private Set<Hotel_type> hotel_type = new HashSet<>();

	@OneToMany(mappedBy = "homestay", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JsonIgnore
	private Set<Hotel_Order> hotel_order;
	
	
	@JsonIgnore
	public Set<Hotel_Order> getOrder() {
		return hotel_order;
	}
	
	@OneToMany(mappedBy="homestay", fetch = FetchType.LAZY)
	@JsonIgnore
    private Set<Homestay_Type> homestay_type;
	

	public void setOrder(Set<Hotel_Order> hotel_order) {
		this.hotel_order = hotel_order;
	}

	public Set<Hotel_type> getHotel_type() {
		return hotel_type;
	}

	public void setHotel_type(Set<Hotel_type> hotel_type) {
		this.hotel_type = hotel_type;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		this.Id = id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		this.Name = name;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		this.Description = description;
	}

	public String getAdd() {
		return Add;
	}

	public void setAdd(String add) {
		this.Add = add;
	}

	public String getTellphone() {
		return Tellphone;
	}

	public void setTellphone(String tellphone) {
		this.Tellphone = tellphone;
	}

	public String getRegion() {
		return Region;
	}

	public void setRegion(String region) {
		this.Region = region;
	}

	public String getTown() {
		return Town;
	}

	public void setTown(String town) {
		this.Town = town;
	}

	public String getPicturel() {
		return Picturel;
	}

	public void setPicturel(String picturel) {
		this.Picturel = picturel;
	}

	public String getServiceinfo() {
		return Serviceinfo;
	}

	public void setServiceinfo(String serviceinfo) {
		this.Serviceinfo = serviceinfo;
	}

	public String getParkinginfo() {
		return Parkinginfo;
	}

	public void setParkinginfo(String parkinginfo) {
		this.Parkinginfo = parkinginfo;
	}

	public BigDecimal getPx() {
		return Px;
	}

	public void setPx(BigDecimal px) {
		this.Px = px;
	}

	public BigDecimal getPy() {
		return Py;
	}

	public void setPy(BigDecimal py) {
		this.Py = py;
	}
	
	public Set<Hotel_Order> getHotel_order() {
		return hotel_order;
	}

	public void setHotel_order(Set<Hotel_Order> hotel_order) {
		this.hotel_order = hotel_order;
	}

	public Set<Homestay_Type> getHomestay_type() {
		return homestay_type;
	}

	public void setHomestay_type(Set<Homestay_Type> homestay_type) {
		this.homestay_type = homestay_type;
	}

	

	@Override
	public String toString() {
		return "Homestay [Id=" + Id + ", Name=" + Name + ", Description=" + Description + ", Add=" + Add
				+ ", Tellphone=" + Tellphone + ", Region=" + Region + ", Town=" + Town + ", Picturel=" + Picturel
				+ ", Serviceinfo=" + Serviceinfo + ", Parkinginfo=" + Parkinginfo + ", Px=" + Px + ", Py=" + Py + "]";
	}

}
