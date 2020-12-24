package main.java.hugo.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@Component
@Entity
@Table(name = "memberarea")
@JsonIgnoreProperties(value = {"hibernateLazyIntializer","handler"})
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class MemberArea implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer areaId;
	private String area;
	
	@Id @Column(name = "areaId")
	@GeneratedValue(generator = "Generator")    
	@GenericGenerator(name = "Generator", strategy = "assigned")
	public Integer getAreaId() {
		return areaId;
	}
	
	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}
	@Column(name = "area")
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	
//	@JsonIgnore
//	@OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "memberArea")
//	public Set<MemberBasic> getMemberBasics() {
//		return memberBasics;
//	}
//
//	public void setMemberBasics(Set<MemberBasic> memberBasics) {
//		this.memberBasics = memberBasics;
//	}

}
