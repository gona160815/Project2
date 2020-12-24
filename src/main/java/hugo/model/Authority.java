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
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Component
@Entity
@Table(name = "authority")
@JsonIgnoreProperties(value = {"hibernateLazyIntializer","handler"})
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class Authority implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private Integer authorityId;
	private String authority;
	private Set<MemberAuth> memberAuths = new HashSet<MemberAuth>();
	
	@Id @Column(name = "authorityId")
	@GeneratedValue(generator = "Generator")    
	@GenericGenerator(name = "Generator", strategy = "assigned")
	public Integer getAuthorityId() {
		return authorityId;
	}

	public void setAuthorityId(Integer authorityId) {
		this.authorityId = authorityId;
	}
	@Column(name = "authority")
	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL , mappedBy = "authority")
	@JsonManagedReference
	public Set<MemberAuth> getMemberAuths() {
		return memberAuths;
	}
	
	public void setMemberAuths(Set<MemberAuth> memberAuths) {
		this.memberAuths = memberAuths;
	}

}
