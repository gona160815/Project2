package main.java.hugo.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
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
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import main.java.jackey.model.EventComment;
import main.java.jackey.model.EventLike;

@Component
@Entity
@Table(name = "MEMBERBASIC")
@JsonIgnoreProperties(value = { "hibernateLazyIntializer", "handler" }, ignoreUnknown = true)
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class MemberBasic implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer memberId;
	private String email;
	private String password;
	private String name;
	private String tel;
	private Integer favorId;
	private Integer areaId;
	private String gender;
	private Date registTime;
	private String loginType;

	private MemberArea memberArea;
	private Favor favor;
	private MemberAdvanced memberAdvanced;
	private MemberAuth memberAuth;
//	private Set<MyFavorite> myFavorites = new HashSet<MyFavorite>();

	// ---------------------------------
	private String areaIdStr;
	private String favorIdStr;
//-----------------------------------

	@Id
	@Column(name = "MEMBERID")
	@SequenceGenerator(name = "MEMBERBASIC_SEQ", sequenceName = "MEMBERBASIC_SEQ", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "MEMBERBASIC_SEQ")
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	@Column(name = "EMAIL")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "PASSWORD")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "NAME")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "TEL")
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Transient
	@JsonIgnore
	public Integer getFavorId() {
		return favorId;
	}

	public void setFavorId(Integer favorId) {
		this.favorId = favorId;
	}

	@Transient
	@JsonIgnore
	public Integer getAreaId() {
		return areaId;
	}

	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}

	@Column(name = "GENDER")
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	@JsonFormat(pattern = "yyyy-MM-dd",timezone = "Asia/Taipei")
	@Column(name = "REGISTTIME")
	public Date getRegistTime() {
		return registTime;
	}

	public void setRegistTime(Date registTime) {
		this.registTime = registTime;
	}
	
	@Column(name = "LOGINTYPE")
	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "AREAID")
	public MemberArea getMemberArea() {
		return memberArea;
	}

	public void setMemberArea(MemberArea memberArea) {
		this.memberArea = memberArea;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FAVORID")
	@JsonBackReference
	public Favor getFavor() {
		return favor;
	}

	public void setFavor(Favor favor) {
		this.favor = favor;
	}

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "memberBasic", cascade = CascadeType.ALL)
	@JsonManagedReference
	public MemberAdvanced getMemberAdvanced() {
		return memberAdvanced;
	}

	public void setMemberAdvanced(MemberAdvanced memberAdvanced) {
		this.memberAdvanced = memberAdvanced;
	}

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "memberBasic", cascade = CascadeType.ALL)
	@JsonManagedReference
	public MemberAuth getMemberAuth() {
		return memberAuth;
	}

	public void setMemberAuth(MemberAuth memberAuth) {
		this.memberAuth = memberAuth;
	}

//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "memberBasic", cascade = CascadeType.ALL)
//	@JsonManagedReference
//	public Set<MyFavorite> getMyFavorites() {
//		return myFavorites;
//	}
//
//	public void setMyFavorites(Set<MyFavorite> myFavorites) {
//		this.myFavorites = myFavorites;
//	}

	public MemberBasic() {

	}

	public MemberBasic(String name, String password, String gender, Integer areaId, String tel, String email,
			Integer favorId, Date registTime, String loginType) {
		this.name = name;
		this.password = password;
		this.gender = gender;
		this.areaId = areaId;
		this.tel = tel;
		this.email = email;
		this.favorId = favorId;
		this.registTime = registTime;
		this.loginType = loginType;
	}

	@Transient
	@JsonIgnore
	public String getAreaIdStr() {
		return areaIdStr;
	}

	public void setAreaIdStr(String areaIdStr) {
		this.areaIdStr = areaIdStr;
		int area = Integer.valueOf(areaIdStr);
		// MemberArea id change
		memberArea.setAreaId(area);
		setMemberArea(memberArea);
	}

	@Transient
	@JsonIgnore
	public String getFavorIdStr() {
		return favorIdStr;
	}

	public void setFavorIdStr(String favorIdStr) {
		this.favorIdStr = favorIdStr;
		Integer favor2 = Integer.valueOf(favorIdStr);
		favor.setFavorId(favor2);
		setFavor(favor);
	}

}
