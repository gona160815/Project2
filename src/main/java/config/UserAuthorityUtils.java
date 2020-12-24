package main.java.config;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;

import main.java.hugo.model.MemberBasic;

public class UserAuthorityUtils {
	
	private static final List<GrantedAuthority> AdminRoles =
			AuthorityUtils.createAuthorityList("ROLE_ADMIN","ROLE_USER");
	
	private static final List<GrantedAuthority> UserRoles =
			AuthorityUtils.createAuthorityList("ROLE_USER");
	
	public static Collection<? extends GrantedAuthority> createAuthorities(MemberBasic user){
		Integer authorityId = user.getMemberAuth().getAuthority().getAuthorityId();
		if (authorityId==2) {
			return AdminRoles;
		}else {
			return UserRoles;
		}
	}
}
