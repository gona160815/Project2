package main.java.hugo.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Component
@Entity
@Table(name = "FAVOR")
@JsonIgnoreProperties(value = {"hibernateLazyIntializer","handler"})
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class Favor implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private Integer favorId;
	private String favor;
	private Set<MemberBasic> memberBasics = new HashSet<MemberBasic>();
	@Id @Column(name = "FAVORID")
	@GeneratedValue(generator = "Generator")    
	@GenericGenerator(name = "Generator", strategy = "assigned")
	public Integer getFavorId() {
		return favorId;
	}

	public void setFavorId(Integer favorId) {
		this.favorId = favorId;
	}
	@Column(name = "FAVOR")
	public String getFavor() {
		return favor;
	}

	public void setFavor(String favor) {
		this.favor = favor;
	}
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "favor")
	@JsonManagedReference
	public Set<MemberBasic> getMemberBasics() {
		return memberBasics;
	}

	public void setMemberBasics(Set<MemberBasic> memberBasics) {
		this.memberBasics = memberBasics;
	}

}
