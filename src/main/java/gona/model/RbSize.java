package main.java.gona.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="RBSIZE")
@Component
@JsonIgnoreProperties(value = {"hibernateLazyInitializer","handler"})
public class RbSize implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String rbSize;
	private String sizeDetail;
	private String sizeOther;
	private Set<RentalBike> rentalBike;
	
	public RbSize() {
		
	}
	
	@Id
	@Column(name="RBSIZE")
	public String getRbSize() {
		return rbSize;
	}

	public void setRbSize(String rbSize) {
		this.rbSize = rbSize;
	}
	
	@Column(name="sizeDetail")
	public String getSizeDetail() {
		return sizeDetail;
	}

	public void setSizeDetail(String sizeDetail) {
		this.sizeDetail = sizeDetail;
	}
	
	@Column(name="sizeOther")
	public String getSizeOther() {
		return sizeOther;
	}

	public void setSizeOther(String sizeOther) {
		this.sizeOther = sizeOther;
	}
	
	@OneToMany(mappedBy = "rbSize",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@JsonIgnoreProperties("rbSize")
	public Set<RentalBike> getRentalBike() {
		return rentalBike;
	}

	public void setRentalBike(Set<RentalBike> rentalBike) {
		this.rentalBike = rentalBike;
	}
	
}
