package main.java.hugo.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
import java.sql.*;

@Entity
@Table(name="member")
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class Member implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="memberid")
	@SequenceGenerator(name = "MEMBER_SEQ", sequenceName = "MEMBER_SEQ", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "MEMBER_SEQ")
	private int id;
	@Column(name="name")
	private String name;
	@Column(name="gender")
	private String gender;
	@Column(name="tel")
	private String tel;
	@Column(name="email")
	private String email;
	@Column(name="birth")
	private Date birth;
	@Column(name="area")
	private String area;
	@Column(name="favor")
	private String favor;
	@Column(name="password")
	private String password;
	@Column(name="filename")
	private String filename;
	@JsonIgnore
	@Column(name="memberimage")
	private Blob memberimage;
	
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Blob getMemberimage() {
		return memberimage;
	}

	public void setMemberimage(Blob memberimage) {
		this.memberimage = memberimage;
	}
	
	public Member(String name,String password,String gender,String area,String tel,String email,Date birthday,String favor,String filename, Blob memberimage) {
		
		this.name=name;
		this.password=password;
		this.gender=gender;
		this.area=area;
		this.tel=tel;
		this.email=email;
		this.birth=birthday;
		this.favor=favor;
		this.filename = filename;
		this.memberimage = memberimage;
		
	}
	
	public Member(String email,String password) {
		this.email = email;
		this.password = password;
	}
	public Member() {
		
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getFavor() {
		return favor;
	}
	public void setFavor(String favor) {
		this.favor = favor;
	}
}

