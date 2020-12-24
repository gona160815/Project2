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
@Table(name = "EVENTACTIVITY")
@Component
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
public class EventActivity {
	private Integer activityId;
	private Integer typeId;
	private String infoId;
	private String ActDate;
	private String name;
	private Integer price;
	private Integer memberId;

	@Id
	@Column(name = "ACTIVITYID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getActivityId() {
		return activityId;
	}

	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}

	@Column(name = "TYPEID")
	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	@Column(name = "INFOID")
	public String getInfoId() {
		return infoId;
	}

	public void setInfoId(String infoId) {
		this.infoId = infoId;
	}

	@Column(name = "ACTDATE")
	public String getActDate() {
		return ActDate;
	}

	public void setActDate(String actDate) {
		ActDate = actDate;
	}

	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "price")
	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	@Column(name = "memberId")
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "EventActivity [activityId=" + activityId + ", typeId=" + typeId + ", infoId=" + infoId + ", ActDate="
				+ ActDate + ", name=" + name + ", price=" + price + ", memberId=" + memberId + "]";
	}
	
	

}
