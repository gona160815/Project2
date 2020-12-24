package main.java.hugo.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Component
@Entity
@Table(name = "MEMBERAUTH")
@JsonIgnoreProperties(value = { "hibernateLazyIntializer", "handler" })
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class MemberAuth implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer memberId;
	private Integer levelId;
	private Integer statusId;
	private Integer authorityId;
	
	private Authority authority;
	private MemberLevel memberLevel;
//	-----------------------
	private MemberBasic memberBasic;
	private Status status;
//----------------------------
	@Id
	@Column(name = "MEMBERID")
	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "memberBasic"))
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	@JsonIgnore
	@Transient
	public Integer getLevelId() {
		return levelId;
	}

	public void setLevelId(Integer levelId) {
		this.levelId = levelId;
	}

	@JsonIgnore
	@Transient
	public Integer getStatusId() {
		return statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}

	@JsonIgnore
	@Transient
	public Integer getAuthorityId() {
		return authorityId;
	}

	public void setAuthorityId(Integer authorityId) {
		this.authorityId = authorityId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "AUTHORITYID")
	@JsonBackReference
	public Authority getAuthority() {
		return authority;
	}

	public void setAuthority(Authority authority) {
		this.authority = authority;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "LEVELID")
	@JsonBackReference
	public MemberLevel getMemberLevel() {
		return memberLevel;
	}

	public void setMemberLevel(MemberLevel memberLevel) {
		this.memberLevel = memberLevel;
	}
	
	
	
	@OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn
	@JsonBackReference
	public MemberBasic getMemberBasic() {
		return memberBasic;
	}

	public void setMemberBasic(MemberBasic memberBasic) {
		this.memberBasic = memberBasic;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "STATUSID")
	@JsonBackReference
	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

}
