package main.java.gona.model;

import javax.persistence.Transient;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.sql.SQLException;

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
import javax.persistence.Table;
import javax.sql.rowset.serial.SerialException;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.util.Set;

@Entity
@Table(name="SIMPLEBIKE")
@Component
@JsonIgnoreProperties(value = {"hibernateLazyInitializer","handler"})
public class SimpleBike implements Serializable{

	private static final long serialVersionUID = 1L;
	
	
	private String simRbId;	
	private String rbName;
	private String typeId;
	private String rbImg;
	private RbType rbType;
	private Set<RentalBike> rentalbike;
	private MultipartFile multipartFile;
	
	public SimpleBike() {
		
	}
	
	public SimpleBike(String simRbId,String rbName, String typeId, String rbImg, RbType rbType) {
		this.simRbId = simRbId;
		this.rbName = rbName;
		this.typeId = typeId;
		this.rbImg = rbImg;
		this.rbType = rbType;
	}

	@Id
	@Column(name="SIMBIKEID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public String getSimRbId() {
		return simRbId;
	}

	public void setSimRbId(String simRbId) {
		this.simRbId = simRbId;
	}
	
	@Column(name="RBNAME")
	public String getRbName() {
		return rbName;
	}

	public void setRbName(String rbName) {
		this.rbName = rbName;
	}
	
	@JsonIgnore
	@Transient
	public String getTypeId() {
		return typeId;
	}
	
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	
	public String getRbImg() {
		return rbImg;
	}
	
	@Column(name="RBIMG")
	public void setRbImg(String rbImg) {
		this.rbImg = rbImg;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="TYPEID")
	@JsonBackReference
	public RbType getRbType() {
		return rbType;
	}

	public void setRbType(RbType rbType) {
		this.rbType = rbType;
	}
	
	@OneToMany(mappedBy = "simpleBike",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	@JsonIgnoreProperties("simBike")
	public Set<RentalBike> getRentalbike() {
		return rentalbike;
	}

	public void setRentalbike(Set<RentalBike> rentalbike) {
		this.rentalbike = rentalbike;
	}

	@Transient
	@JsonIgnore
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) throws SerialException, SQLException, IOException  {
		String oldFileName = multipartFile.getOriginalFilename();
		String suffix = FilenameUtils.getExtension(oldFileName);
		String fileName = null; //圖片檔案名稱
		String bikeName = getRbName();
		fileName = bikeName+"."+suffix;
		
		File dirPath = new File("C://bikeImage"); //決定上傳路徑(本機)	
		if(!dirPath.exists()) { //如果該資料夾不存在變創造一個
			dirPath.mkdirs();
		}
		
		String imgsrc = dirPath+"/"+fileName; //檔案名稱
		File saveFile = new File(imgsrc); //圖片路徑
		multipartFile.transferTo(saveFile); //把圖片給存到這個路徑
		setRbImg(fileName);
	}		
	
}
