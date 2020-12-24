package main.java.xxx30514.model;


import java.io.Serializable;
import java.sql.Blob;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "BIKEERROR")
public class BikeError implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "BE_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "BE_TITLE")
	private String title;
	@Column(name = "BE_DESCRIPTION")
	private String description;
	@Column(name = "BE_REPLY")
	private String reply;
	@Column(name = "BE_TAG")
	private String tag;
	@Column(name = "MEMBER_ID")
	private Integer memberid;
	@Column(name = "BE_STATUS")
	private String status;
	@Column(name = "BE_PICTURE")
	private Blob picture;
	@Column(name = "BE_STARTTIME")
	private LocalDateTime starttime;
	@Column(name = "BE_ENDTIME")
	private LocalDateTime endtime;
	@Transient
	private String picString;
	public LocalDateTime getStarttime() {
		return starttime;
	}

	public void setStarttime(LocalDateTime starttime) {
		this.starttime = starttime;
	}

	public LocalDateTime getEndtime() {
		return endtime;
	}

	public void setEndtime(LocalDateTime endtime) {
		this.endtime = endtime;
	}

	public String getPicString() {
		return picString;
	}

	public void setPicString(String picString) {
		this.picString = picString;
	}

	public Blob getPicture() {
		return picture;
	}

	public void setPicture(Blob picture) {
		this.picture = picture;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public Integer getMemberid() {
		return memberid;
	}

	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}
	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public BikeError() {

	}

	public BikeError(Integer id, String title, String description, String tag, Integer memberid,String status,Blob picture,LocalDateTime starttime,LocalDateTime endtime,String reply) {
		this.id = id;
		this.title = title;
		this.description = description;
		this.reply = reply;
		this.tag = tag;
		this.memberid = memberid;
		this.status=status;
		this.picture=picture;
		this.starttime=starttime;
		this.endtime=endtime;
	}
	public BikeError(Integer id, String title, String description, String tag, Integer memberid,String status,LocalDateTime endtime,String reply) {
		this.id = id;
		this.title = title;
		this.description = description;
		this.reply = reply;
		this.tag = tag;
		this.memberid = memberid;
		this.status=status;
		this.endtime=endtime;
	}

	public BikeError(String title, String description,String reply, String tag, Integer memberid,String status,Blob picture,LocalDateTime starttime,LocalDateTime endtime) {
		this.title = title;
		this.description = description;
		this.reply = reply;
		this.tag = tag;
		this.memberid = memberid;
		this.status=status;
		this.picture=picture;
		this.starttime=starttime;
		this.endtime=endtime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
