package main.java.hugo.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Component
@Entity
@Table(name = "MYFAVORITE")
@JsonIgnoreProperties(value = { "hibernateLazyIntializer", "handler" })
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class MyFavorite implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer favoriteId;
	private Integer memberId;
	private Integer typeId;
	private String infoId;
	private Date addTime;
	private String favName;
	private EventType eventType;

//	private MemberBasic memberBasic;
	// 還需要放他人的表格來對照INFOID
	@Id
	@Column(name = "FAVORITEID")
	@SequenceGenerator(name = "MYFAVORITE_SEQ", sequenceName = "MYFAVORITE_SEQ", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "MYFAVORITE_SEQ")
	public Integer getFavoriteId() {
		return favoriteId;
	}

	public void setFavoriteId(Integer favoriteId) {
		this.favoriteId = favoriteId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

//	@JsonIgnore
//	@Transient
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

	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Taipei")
	@Column(name = "ADDTIME")
	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	@Column(name = "FAVNAME")
	public String getFavName() {
		return favName;
	}

	public void setFavName(String favName) {
		this.favName = favName;
	}

	@Override
	public String toString() {
		return "MyFavorite [favoriteId=" + favoriteId + ", memberId=" + memberId + ", typeId=" + typeId + ", infoId="
				+ infoId + ", addTime=" + addTime + ", favName=" + favName + "]";
	}
	
	

//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "TYPEID")
//	@JsonBackReference
//	public EventType getEventType() {
//		return eventType;
//	}
//
//	public void setEventType(EventType eventType) {
//		this.eventType = eventType;
//	}

//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "MEMBERID")
//	@JsonBackReference
//	public MemberBasic getMemberBasic() {
//		return memberBasic;
//	}
//
//	public void setMemberBasic(MemberBasic memberBasic) {
//		this.memberBasic = memberBasic;
//	}

}
