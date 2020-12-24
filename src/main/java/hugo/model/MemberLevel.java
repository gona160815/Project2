package main.java.hugo.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Component
@Entity
@Table(name = "MEMBERLEVEL")
@JsonIgnoreProperties(value = {"hibernateLazyIntializer","handler"})
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class MemberLevel implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer levelId;
	private String mLevel;
	private Set<MemberAuth> memberAuths = new HashSet<MemberAuth>();

	@Id
	@Column(name = "LEVELID")
	@GeneratedValue(generator = "Generator")
	@GenericGenerator(name = "Generator", strategy = "assigned")
	public Integer getLevelId() {
		return levelId;
	}

	public void setLevelId(Integer levelId) {
		this.levelId = levelId;
	}

	@Column(name = "MLEVEL")
	public String getmLevel() {
		return mLevel;
	}

	public void setmLevel(String mLevel) {
		this.mLevel = mLevel;
	}

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "memberLevel")
	@JsonManagedReference
	public Set<MemberAuth> getMemberAuths() {
		return memberAuths;
	}

	public void setMemberAuths(Set<MemberAuth> memberAuths) {
		this.memberAuths = memberAuths;
	}

}
