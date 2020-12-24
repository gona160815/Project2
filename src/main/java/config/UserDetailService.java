package main.java.config;

import java.security.GeneralSecurityException;
import java.util.Collection;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import main.java.hugo.model.MemberAdvanced;
import main.java.hugo.model.MemberBasic;
import main.java.hugo.service.MemberAdvancedServiceImpl;
import main.java.hugo.service.MemberBasicServiceImpl;
import main.java.hugo.util.MailUtils;

@Component
public class UserDetailService implements UserDetailsService  {
	
	
	@Autowired
	MemberBasicServiceImpl memberBasicServiceImpl;
	@Autowired
	MemberAdvancedServiceImpl memberAdvancedServiceImpl;
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	@PersistenceContext
	private EntityManager entityManager;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
		
	}
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		String hql = "from MemberBasic where email =?0";
		Query<MemberBasic> query = (Query<MemberBasic>) entityManager.createQuery(hql, MemberBasic.class);
		query.setParameter(0, username);
		System.out.println("eeee :"+username);
		MemberBasic user = query.uniqueResult();
		System.err.println("進入loadUserByUsername");
//			MemberBasic user = memberBasicServiceImpl.queryone(username);

		if (user == null) {
			throw new UsernameNotFoundException("查無此人員");
		}
		
		//
		ServletRequestAttributes attribs = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
//		HttpServletRequest request = (HttpServletRequest) ((NativeWebRequest) attribs).getNativeRequest();
		HttpServletRequest request = attribs.getRequest();
		HttpSession session = request.getSession(true);
		Integer authorityId = user.getMemberAuth().getAuthority().getAuthorityId();
		if (authorityId==2) {
			session.setAttribute("loginOK", user);// 设定登入会员物件
			// 用ID查詢此會員的進階表格取得其他資訊以便顯示在網頁上
			int memberId = user.getMemberId();
			MemberAdvanced memberAdvanced = entityManager.find(MemberAdvanced.class, memberId);
//		MemberAdvanced memberAdvanced = memberAdvancedServiceImpl.select(memberId);
			if (memberAdvanced != null) {
				session.setAttribute("MemberAdvanced", memberAdvanced);
			}
		}
		//
		Collection<? extends GrantedAuthority> authorities =
				UserAuthorityUtils.createAuthorities(user);
		return new User(user.getEmail(),user.getPassword(),authorities);
	}


}
