package main.java.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	UserDetailService userDetailService;
	
	@Autowired
	UserAcessDeniedHandler userAcessDeniedHandler;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception  {
		
		http.authorizeRequests()
//			.antMatchers("/**").permitAll() //allowed url
			.antMatchers("/adminPage.controller","/maintainStorePre.controller","/MaintainBikePre.controller",
					"/bikeMgrEntry.controller?pageNo=1","/REMgrEntry.controller?pageNo=1","/bikeErrorMgrEntry.controller?pageNo=1",
					"/eventDashboard","/eventMgr","/eventInsertEntryPage","/eventUpdateEntry.controller","/eventDelete.controller",
					"/saveEvent","/eventDetail/**","/dashboard","/commentList","/activityMgr").hasAuthority("ROLE_ADMIN")/*.authenticated()*/ //must be invalid
			.and()
//			.formLogin()
			.formLogin() //if not match authorize,make default login form
				.loginPage("/adminLogin")
				.loginProcessingUrl("/adminPage")
//				.loginProcessingUrl("/adminLoginController")
				.defaultSuccessUrl("/dashboard",true)
				.permitAll()
			.and().exceptionHandling()
				.accessDeniedHandler(userAcessDeniedHandler)
			.and()
				.csrf().disable();
//				.failureUrl("/homepage");
//			.and()
//			.httpBasic();//make basic form
	}
	@Autowired
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//		auth.inMemoryAuthentication()
//			.withUser("admin")
//			.password("{noop}admin12345")
//			.roles("ADMIN","USER")
//			.and()
//			.withUser("user")
//			.password(passwordEncoder.encode("{noop}user12345"))
//			.roles("USER");
//		auth.userDetailsService(userDetailService);
		auth.userDetailsService(userDetailService)
		.passwordEncoder(new BCryptPasswordEncoder());
	}
	
	 
}
