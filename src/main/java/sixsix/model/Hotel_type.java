package main.java.sixsix.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "hotel_type")
@JsonIgnoreProperties(value = {"hibernateLazyInitializer","handler"})
@Component
public class Hotel_type {
	
	@Id @Column(name = "HOTEL_ID", unique = true, nullable = false, length = 20)
	@GeneratedValue(generator="system_uuid")
	@GenericGenerator(name="system_uuid", strategy="uuid")
	private String id;
	@Column(name = "H_TYPE")
	private String h_type;
	@Column(name = "H_TYPE_COUNT")
	private int h_type_count;
	@Column(name = "PRICE")
	private String price;
	@Override
	public String toString() {
		return "Hotel_type [id=" + id + ", h_type=" + h_type + ", h_type_count=" + h_type_count + ", price=" + price
				+ ", homestay=" + homestay + "]";
	}

	@ManyToMany(mappedBy = "hotel_type",fetch = FetchType.LAZY)
	@JsonIgnore
	private Set<Homestay> homestay = new HashSet<>();
	
	
	@OneToMany(mappedBy="hotel_type", fetch = FetchType.LAZY)
	@JsonIgnore
    private Set<Homestay_Type> homestay_type;
	
	public Set<Homestay> getHomestay() {
		return homestay;
	}

	public void setHomestay(Set<Homestay> homestay) {
		this.homestay = homestay;
	}

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	public String getH_type() {
		return h_type;
	}

	public void setH_type(String h_type) {
		this.h_type = h_type;
	}
	
	
	public int getH_type_count() {
		return h_type_count;
	}

	public void setH_type_count(int h_type_count) {
		this.h_type_count = h_type_count;
	}
	
	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Set<Homestay_Type> getHomestay_type() {
		return homestay_type;
	}

	public void setHomestay_type(Set<Homestay_Type> homestay_type) {
		this.homestay_type = homestay_type;
	}
	
	
	
	
}
