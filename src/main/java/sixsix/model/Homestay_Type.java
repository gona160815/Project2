package main.java.sixsix.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "homestay_type")
@JsonIgnoreProperties(value = {"hibernateLazyInitializer","handler"})
@Component
public class Homestay_Type {
	
	@Id
	@Column(name = "ID", unique = true, nullable = false, length = 20)
	@GeneratedValue(generator = "system_uuid")
	@GenericGenerator(name = "system_uuid", strategy = "uuid")
	private Integer id;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
    @Cascade(value = CascadeType.ALL)
    @JoinColumn(name="HOMESTAY_ID1")
	@JsonIgnore
    private Homestay homestay;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @Cascade(value = CascadeType.ALL)
    @JoinColumn(name="HOTEL_TYPE_HOTEL_ID")
    @JsonIgnore
    private Hotel_type hotel_type;
    
    
    @JoinColumn(name="NUM")
    private Integer num;

    
    

	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Homestay getHomestay() {
		return homestay;
	}


	public void setHomestay(Homestay homestay) {
		this.homestay = homestay;
	}


	public Hotel_type getHotel_type() {
		return hotel_type;
	}


	public void setHotel_type(Hotel_type hotel_type) {
		this.hotel_type = hotel_type;
	}


	public Integer getNum() {
		return num;
	}


	public void setNum(Integer num) {
		this.num = num;
	}
    
    
	
}
