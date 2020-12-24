package main.java.jackey.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "EVENTFAVORITE")
@Component
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class EventFavorite {
	private Integer favoriteId;
	private Integer memberId;
	private Integer eventId;

	@Id
	@Column(name = "FAVORITEID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getFavoriteId() {
		return favoriteId;
	}

	public void setFavoriteId(Integer favoriteId) {
		this.favoriteId = favoriteId;
	}

	@Column(name = "MEMBERID")
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	@Column(name = "EVENTID")
	public Integer getEventId() {
		return eventId;
	}

	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}

}
