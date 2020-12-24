package main.java.xxx30514.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "BIKECOUNT")
public class BikeCount implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "BCO_ID")
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private Integer   	id ;
	@Column(name = "BCO_BIKE")
	private long 	bike;
	@Column(name = "BK_RESTAREA")
	private long  	restarea;
	@Column(name = "BCO_MAP")
	private long   	map;
	@Column(name = "BCO_YEAR")
	private String   	year;
	@Column(name = "BCO_MONTH")
	private String    	month;
	@Column(name = "BCO_DAY")
	private String  	day;
	@Column(name = "BCO_TIME")
	private String  	time;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public long getBike() {
		return bike;
	}
	public void setBike(long bike) {
		this.bike = bike;
	}
	public long getRestarea() {
		return restarea;
	}
	public void setRestarea(long restarea) {
		this.restarea = restarea;
	}
	public long getMap() {
		return map;
	}
	public void setMap(long map) {
		this.map = map;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public BikeCount() {
	}
}
