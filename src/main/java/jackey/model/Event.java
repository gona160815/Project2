package main.java.jackey.model;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "EVENT")
@Component
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class Event implements Serializable {
	private static final long serialVersionUID = 1L;

	public Event() {

	}

	@Id
	@Column(name = "EVENTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer eventId;

	@Column(name = "TITLE")
	private String title;

	@JsonIgnore
	@Transient
	private Integer categoryId;

	@Column(name = "LOCATION")
	private String location;

	@Column(name = "LOCATIONNAME")
	private String locationName;

	@Column(name = "ONSALES")
	private String onsales;

	@Column(name = "PRICE")
	private String price;

	@Column(name = "SHOWUNIT")
	private String showunit;

	@Column(name = "DESCRIPTION")
	private String description;

	@Column(name = "WEBSITE")
	private String website;

	@JsonFormat(pattern = "yyyy-MM-dd")
	@Column(name = "STARTDATE")
	private Date startDate;

	@JsonFormat(pattern = "yyyy-MM-dd")
	@Column(name = "ENDDATE")
	private Date endDate;

	@Column(name = "IMAGE")
	private String image;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CATEGORYID")
	@JsonBackReference
	private EventCat eventCat;

	@OneToMany(mappedBy = "event", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JsonManagedReference
	private Set<EventComment> eventComment;

	@OneToMany(mappedBy = "event", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JsonManagedReference
	private Set<EventDetail> eventDetail;

	public Set<EventDetail> getEventDetail() {
		return eventDetail;
	}

	public void setEventDetail(Set<EventDetail> eventDetail) {
		this.eventDetail = eventDetail;
	}

	public EventCat getEventCat() {
		return eventCat;
	}

	public void setEventCat(EventCat eventCat) {
		this.eventCat = eventCat;
	}

	public Integer getEventId() {
		return eventId;
	}

	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getOnsales() {
		return onsales;
	}

	public void setOnsales(String onsales) {
		this.onsales = onsales;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getShowunit() {
		return showunit;
	}

	public void setShowunit(String showunit) {
		this.showunit = showunit;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Set<EventComment> getEventComment() {
		return eventComment;
	}

	public void setEventComment(Set<EventComment> eventComment) {
		this.eventComment = eventComment;
	}

	@Override
	public String toString() {
		return "Event [eventId=" + eventId + ", title=" + title + ", categoryId=" + categoryId + ", location="
				+ location + ", locationName=" + locationName + ", onsales=" + onsales + ", price=" + price
				+ ", showunit=" + showunit + ", description=" + description + ", website=" + website + ", startDate="
				+ startDate + ", endDate=" + endDate + ", image=" + image + ", eventCat=" + eventCat + ", eventComment="
				+ eventComment + ", eventDetail=" + eventDetail + "]";
	}

}
