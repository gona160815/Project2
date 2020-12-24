package main.java.hugo.model;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.hibernate.Hibernate;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Component
@Entity
@Table(name = "MEMBERADVANCED")
@JsonIgnoreProperties(value = { "hibernateLazyIntializer", "handler" })
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class MemberAdvanced implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer memberId;
	private String address;
	private String nickName;
	private String intro;
	private Blob icon;
	private Date birthday;
	private String iconFileName;
	private MemberBasic memberBasic;
	private MultipartFile mFile;
	private String birthStr;

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

	@Column(name = "ADDRESS")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "NICKNAME")
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Column(name = "INTRO")
	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	@Column(name = "ICON")
	@JsonIgnore
	public Blob getIcon() {
		return icon;
	}

	public void setIcon(Blob icon) {
		this.icon = icon;
	}

	@Column(name = "BIRTHDAY")
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Column(name = "ICONFILENAME")
	public String getIconFileName() {
		return iconFileName;
	}

	public void setIconFileName(String iconFileName) {
		this.iconFileName = iconFileName;
	}

	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	@JsonBackReference
	public MemberBasic getMemberBasic() {
		return memberBasic;
	}

	public void setMemberBasic(MemberBasic memberBasic) {
		this.memberBasic = memberBasic;
	}

	public MemberAdvanced() {

	}

	public MemberAdvanced(Integer memberId, String address, String nickName, String intro, Blob icon, Date birthday,
			String iconFileName, MemberBasic memberBasic) {
		this.memberId = memberId;
		this.address = address;
		this.nickName = nickName;
		this.intro = intro;
		this.icon = icon;
		this.birthday = birthday;
		this.iconFileName = iconFileName;
		this.memberBasic = memberBasic;
	}

	@JsonIgnore
	@Transient
	public MultipartFile getmFile() {
		return mFile;
	}

	public void setmFile(MultipartFile mFile) throws IOException, SerialException, SQLException {
		this.mFile = mFile;
		if (mFile.getBytes().length > 0) {
			Blob blob = new SerialBlob(mFile.getBytes());
			String fileName = mFile.getOriginalFilename();
			setIcon(blob);
			setIconFileName(fileName);
		}
	}

	@JsonIgnore
	@Transient
	public String getBirthStr() {
		return birthStr;
	}

	public void setBirthStr(String birthStr) {
		this.birthStr = birthStr;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if (!birthStr.isEmpty()) {

				java.util.Date dateUtil = simpleDateFormat.parse(birthStr);
				Date dateSql = new Date(dateUtil.getTime());
				setBirthday(dateSql);
			}
		} catch (ParseException e) {
			System.out.println("-----DATE ERROR-----");
			e.printStackTrace();
		}
	}

}
