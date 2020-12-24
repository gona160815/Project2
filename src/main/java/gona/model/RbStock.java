package main.java.gona.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "RB_STOCK")
@Component
@JsonIgnoreProperties(value = {"hibernateLazyInitializer","handler"})
public class RbStock implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String rbStockId;
	private Integer rbStock;
	private String rbId;
	private String storeId;
	private RentalBike rentalBike;
	private Store store;
	
	public RbStock() {
		
	}
	
	
	public RbStock(Integer rbStock, RentalBike rentalBike, Store store) {
		this.rbStock = rbStock;
		this.rentalBike = rentalBike;
		this.store = store;
	}


	@Id
	@Column(name="RBS_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public String getRbStockId() {
		return rbStockId;
	}
	
	
	public void setRbStockId(String rbStockId) {
		this.rbStockId = rbStockId;
	}
	
	@Column(name="RBSTOCK")
	public Integer getRbStock() {
		return rbStock;
	}

	public void setRbStock(Integer rbStock) {
		this.rbStock = rbStock;
	}
	
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="rbId")
	@JsonIgnoreProperties("rbStock")
	public RentalBike getRentalBike() {
		return rentalBike;
	}

	public void setRentalBike(RentalBike rentalBike) {
		this.rentalBike = rentalBike;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="store_id")
	@JsonIgnoreProperties("rbStock")
	public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	@Transient
	@JsonIgnore
	public String getRbId() {
		return rbId;
	}


	public void setRbId(String rbId) {
		this.rbId = rbId;
	}

	@Transient
	@JsonIgnore
	public String getStoreId() {
		return storeId;
	}


	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}
	
	
	
	
	
	

}
