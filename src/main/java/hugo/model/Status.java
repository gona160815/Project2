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
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "STATUS")
@JsonIgnoreProperties(value = { "hibernateLazyIntializer", "handler" })
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class Status implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer statusId;
	private String status;
	private Set<MemberAuth> memberAuths = new HashSet<MemberAuth>();

	@Id
	@Column(name = "STATUSID")
	@GeneratedValue(generator = "Generator")
	@GenericGenerator(name = "Generator", strategy = "assigned")
	public Integer getStatusId() {
		return statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}

	@Column(name = "STATUS")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "status")
	@JsonManagedReference
	public Set<MemberAuth> getMemberAuths() {
		return memberAuths;
	}

	public void setMemberAuths(Set<MemberAuth> memberAuths) {
		this.memberAuths = memberAuths;
	}

}
