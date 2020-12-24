package main.java.xxx30514.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "BIKE")
public class Bike implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "BK_ID")
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private Integer   	id ;
	@Column(name = "BK_NAME")
	private String  	name;
	@Column(name = "BK_BEGIN")
	private String  	begin;
	@Column(name = "BK_GOAL")
	private String    	goal;
	@Column(name = "BK_CITY")
	private String   	city;
	@Column(name = "BK_TOWN")
	private String    	town;
	@Column(name = "BK_MAINTAIN")
	private String  	maintain;
	@Column(name = "BK_M")
	private String  	m;
	@Column(name = "BK_LATITUDE")
	private String  	latitude;
	@Column(name = "BK_LONGITUDE")
	private String  	longitude;
	
	public Bike() {
		
	}
	public Bike(String name, String begin, 
			String goal, String city, String town, 
			String maintain, String m, String latitude, String longitude) {
			this.name = name;
			this.begin = begin;
			this.goal = goal;
			this.city = city;
			this.town = town;
			this.maintain = maintain;
			this.m = m;
			this.latitude = latitude;
			this.longitude = longitude;
		}
	public Bike(Integer  id, String name, String begin, 
		String goal, String city, String town, 
		String maintain, String m, String latitude, String longitude) {
		this.id = id;
		this.name = name;
		this.begin = begin;
		this.goal = goal;
		this.city = city;
		this.town = town;
		this.maintain = maintain;
		this.m = m;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBegin() {
		return begin;
	}
	public void setBegin(String begin) {
		this.begin = begin;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
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
	public String getMaintain() {
		return maintain;
	}
	public void setMaintain(String maintain) {
		this.maintain = maintain;
	}
	public String getM() {
		return m;
	}
	public void setM(String m) {
		this.m = m;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
