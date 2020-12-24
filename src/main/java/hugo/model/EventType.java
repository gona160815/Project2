package main.java.hugo.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

//@Entity
//@Table(name = "EVENTTYPE")
//@JsonIgnoreProperties(value = { "hibernateLazyIntializer", "handler" })
//@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class EventType implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer typeId;
	private String type;
	private Set<MyFavorite> myFavorites = new HashSet<MyFavorite>();

	@Id
	@Column(name = "TYPEID")
	@GeneratedValue(generator = "Generator")
	@GenericGenerator(name = "Generator", strategy = "assigned")
	public Integer getTypeId() {

		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	@Column(name = "TYPE")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "eventType", cascade = CascadeType.ALL)
//	@JsonBackReference
	public Set<MyFavorite> getMyFavorites() {
		return myFavorites;
	}

	public void setMyFavorites(Set<MyFavorite> myFavorites) {
		this.myFavorites = myFavorites;
	}

}
