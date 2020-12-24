package main.java.xxx30514.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "HotBikeRoad")
public class HotBike implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "HB_ID")
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private Integer   	id ;
	@Column(name = "HB_NAME")
	private String  	name;
	@Column(name = "HB_CITY")
	private String   	city;
	@Column(name = "HB_TOWN")
	private String    	town;
	@Column(name = "HB_description")
	private String  	description;
	
	
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public HotBike() {
		
	}
	public HotBike(String name, String begin, 
			String goal, String city, String town, 
			String description) {
			this.name = name;
			this.city = city;
			this.town = town;
			this.description = description;
		}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
