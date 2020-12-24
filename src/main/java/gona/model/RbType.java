package main.java.gona.model;

import javax.persistence.Transient;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashSet;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.util.Set;


@Entity
@Table(name="RB_TYPE")
@Component
@JsonIgnoreProperties(value = {"hibernateLazyInitializer","handler"})
public class RbType implements Serializable {
	private  static final long serialVersionUID = 1L;
	
	private String typeId;
	private String typeName;
	private String typeDes;
	private Blob typeImg;	
	private Integer hrPrice;
	private Integer dayPrice;
	private Integer weekPrice;
	private Integer latePrice;
	private String shortDes;
	private  Set<SimpleBike> simpleBike;
	private MultipartFile multipartFile;
	
	public RbType() {
		
	}

	public RbType(String typeId, String typeName, String typeDes, Blob typeImg, Integer hrPrice, Integer dayPrice,
			Integer weekPrice,Integer latePrice,String shortDes) {
		this.typeId = typeId;
		this.typeName = typeName;
		this.typeDes = typeDes;
		this.typeImg = typeImg;
		this.hrPrice = hrPrice;
		this.dayPrice = dayPrice;
		this.weekPrice = weekPrice;
		this.latePrice = latePrice;
		this.shortDes = shortDes;
	}
	
	public void setMultipartFile(MultipartFile multipartFile) throws SerialException, SQLException, IOException {
		this.multipartFile = multipartFile;
		if(multipartFile.getBytes().length>0) {
			SerialBlob sb = new SerialBlob(multipartFile.getBytes());
			setTypeImg(sb);
		}
	}
	
	@JsonIgnore
	@Transient
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}
	
	@Id
	@Column(name="TYPEID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	
	@Column(name="TYPENAME")
	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	@Column(name="TYPEDES")
	public String getTypeDes() {
		return typeDes;
	}

	public void setTypeDes(String typeDes) {
		this.typeDes = typeDes;
	}
	
	@Column(name="TYPEIMG")
	@JsonIgnore
	public Blob getTypeImg() {
		return typeImg;
	}

	public void setTypeImg(Blob typeImg) {
		this.typeImg = typeImg;
	}
	
	@Column(name="HRPRICE")
	public Integer getHrPrice() {
		return hrPrice;
	}

	public void setHrPrice(Integer hrPrice) {
		this.hrPrice = hrPrice;
	}
	
	@Column(name="DAYPRICE")
	public Integer getDayPrice() {
		return dayPrice;
	}

	public void setDayPrice(Integer dayPrice) {
		this.dayPrice = dayPrice;
	}
	
	@Column(name="WEEKPRICE")
	public Integer getWeekPrice() {
		return weekPrice;
	}

	public void setWeekPrice(Integer weekPrice) {
		this.weekPrice = weekPrice;
	}
	
	@Column(name="LATEPRICE")
	public Integer getLatePrice() {
		return latePrice;
	}

	public void setLatePrice(Integer latePrice) {
		this.latePrice = latePrice;
	}
	
	@Column(name="SHORTDES")
	public String getShortDes() {
		return shortDes;
	}

	public void setShortDes(String shortDes) {
		this.shortDes = shortDes;
	}
	
	@OneToMany(mappedBy = "rbType",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	@JsonManagedReference
	public Set<SimpleBike> getSimpleBike() {
		return simpleBike;
	}

	public void setSimpleBike(Set<SimpleBike> simpleBike) {
		this.simpleBike = simpleBike;
	}
	
}
