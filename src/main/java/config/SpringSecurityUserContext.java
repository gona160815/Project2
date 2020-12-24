package main.java.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import main.java.hugo.model.MemberBasic;
import main.java.hugo.service.MemberBasicServiceImpl;
import main.java.hugo.service.UserContext;

public class SpringSecurityUserContext implements UserContext {
	
	@Autowired
	MemberBasicServiceImpl memberBasicServiceImpl;
	@Autowired
	UserDetailService userDetailService;
	@Override
	public MemberBasic getCurrentUser() {
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication auth = context.getAuthentication();
		
		if (auth == null) {
			return null;
		}
		String username = auth.getName();
		return memberBasicServiceImpl.queryone(username);
	}

	@Override
	public void setCurrentUser(MemberBasic user) {
		UserDetails userDetails =
				userDetailService.loadUserByUsername(user.getEmail());
		Authentication  auth = new UsernamePasswordAuthenticationToken(userDetails, userDetails.getPassword(),userDetails.getAuthorities());
		
		SecurityContextHolder.getContext().setAuthentication(auth);
	}

}
