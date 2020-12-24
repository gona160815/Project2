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
@Table(name="area")
@Component
@JsonIgnoreProperties(value = {"hibernateLazyInitializer","handler"})
public class Area implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="area_id")
	private int area_id;
	
	@Column(name="area_name")
	private String area_name;
	
	@OneToMany(mappedBy = "area",fetch = FetchType.LAZY)
//	@JsonIgnoreProperties("area")
	@JsonManagedReference
	private Set<Store> stores;

	public int getArea_id() {
		return area_id;
	}

	public void setArea_id(int area_id) {
		this.area_id = area_id;
	}

	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}

	public Set<Store> getStores() {
		return stores;
	}

	public void setStores(Set<Store> stores) {
		this.stores = stores;
	}
	
	
	
	
}
