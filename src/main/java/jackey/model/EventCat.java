package main.java.jackey.model;

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

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Component
@Entity
@Table(name = "EVENTCAT")
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class EventCat implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer categoryId;
	private String type;
	private Set<Event> event = new HashSet<Event>();


	@Override
	public String toString() {
		return "EventCat [categoryId=" + categoryId + ", type=" + type + ", event=" + event + "]";
	}

	public EventCat() {

	}

	public EventCat(Integer categoryId) {
		this.categoryId = categoryId;
	}

	@Id
	@Column(name = "CATEGORYID")
	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	@Column(name = "TYPE")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "eventCat", cascade = CascadeType.ALL)
	@JsonManagedReference
	public Set<Event> getEvent() {
		return event;
	}

	public void setEvent(Set<Event> event) {
		this.event = event;
	}
}
