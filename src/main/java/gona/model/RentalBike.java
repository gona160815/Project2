package main.java.gona.model;

import java.beans.Transient;
import java.io.Serializable;
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
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="RENTALBIKE")
@Component
@JsonIgnoreProperties(value = {"hibernateLazyInitializer","handler"})
public class RentalBike implements Serializable{

	private static final long serialVersionUID = 1L;
	
	
	private String rbId;	
	private String simpleBike;
	private SimpleBike simBike;
	private RbSize rbSize;
	private Set<RbCart> rbCart;
	private Set<RbStock> rbStock;
	
	public RentalBike() {
		
	}

	public RentalBike(String rbId,String simpleBike) {
		this.rbId = rbId;
		this.simpleBike = simpleBike;
	}

	@Id
	@Column(name="RBID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public String getRbId() {
		return rbId;
	}

	public void setRbId(String rbId) {
		this.rbId = rbId;
	}
	
	@JsonIgnore
	@Transient
	public String getSimpleBike() {
		return simpleBike;
	}

	public void setSimpleBike(String simpleBike) {
		this.simpleBike = simpleBike;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="SIMPLEBIKE")
	@JsonIgnoreProperties("rentalbike")
	public SimpleBike getSimBike() {
		return simBike;
	}

	public void setSimBike(SimpleBike simBike) {
		this.simBike = simBike;
	}
	
	@OneToMany(mappedBy = "rentalBike",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	@JsonIgnoreProperties("rentalBike")
	public Set<RbCart> getRbCart() {
		return rbCart;
	}

	public void setRbCart(Set<RbCart> rbCart) {
		this.rbCart = rbCart;
	}
	
	@OneToMany(mappedBy = "rentalBike",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	@JsonIgnoreProperties("rentalBike")
	public Set<RbStock> getRbStock() {
		return rbStock;
	}

	public void setRbStock(Set<RbStock> rbStock) {
		this.rbStock = rbStock;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="rbSize", referencedColumnName = "rbSize")
	@JsonIgnoreProperties("rentalBike")
	public RbSize getRbSize() {
		return rbSize;
	}

	public void setRbSize(RbSize rbSize) {
		this.rbSize = rbSize;
	}
	
	
	
}
