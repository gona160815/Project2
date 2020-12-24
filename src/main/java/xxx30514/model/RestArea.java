package main.java.xxx30514.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "RESTAREA")
public class RestArea implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "RE_ID")
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private Integer   id ;
	@Column(name = "RE_CITY")
	private String  	city;
	@Column(name = "RE_TOWN")
	private String  	town;
	@Column(name = "RE_NAME")
	private String    	name;
	@Column(name = "RE_ADDRESS")
	private String   	address;
	@Column(name = "RE_TEL")
	private String    	tel;
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getTown() {
		return town;
	}

	public void setTown(String town) {
		this.town = town;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public RestArea() {
		
	}
	
	public RestArea(Integer  id, String city, String town, String name, String address, String tel) {
		this.id = id;
		this.city = city;
		this.town = town;
		this.name = name;
		this.address= address;
		this.tel=tel;		
	}

	public RestArea(String reCity, String reTown, String reName, String reAddress, String reTel) {
		this.city = reCity;
		this.town = reTown;
		this.name = reName;
		this.address= reAddress;
		this.tel=reTel;		
	}
	

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
