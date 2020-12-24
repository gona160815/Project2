//package main.java.config;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.authentication.AuthenticationProvider;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.stereotype.Service;
//
//import main.java.hugo.model.MemberAdvanced;
//import main.java.hugo.model.MemberAuth;
//import main.java.hugo.model.MemberBasic;
//import main.java.hugo.service.MemberAuthServiceImpl;
//import main.java.hugo.service.MemberBasicServiceImpl;
//import main.java.hugo.util.PasswordUtils;
//@Service
//public class AuthenticationService implements AuthenticationProvider {
//	
//	@Autowired
//	MemberBasicServiceImpl memberBasicServiceImpl;
//	@Autowired
//	MemberAuthServiceImpl memberAuthServiceImpl;
//	
//	
//	@Override
//	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
//		String name = authentication.getName();
//		String password = authentication.getCredentials().toString();
//		MemberBasic result = memberBasicServiceImpl.queryone(name);
//		System.out.println("-----是否有此會員-----------" + result == null);
//		System.out.println("9999999999999999999999999999999999999999999999999999999999999");
//		if (result != null) {
//			// check password
//			// 解密
//			String password2 = result.getPassword();
////			String decrypt = PasswordUtils.decrypt(password2);
////			System.out.println("typePWD"+password);
////			System.out.println("DBPWD"+decrypt);
//			boolean checkPSW = PasswordUtils.checkPSW(password, password2);
//
////			if (password.equals(decrypt)) {
//			if (checkPSW) {
//				// 檢查是否被停權
//				MemberAuth memberAuth = memberAuthServiceImpl.select(result.getMemberId());
//				System.out.println("------帳號狀態------------" + memberAuth.getStatus().getStatus());
//				System.out.println("------帳號狀態------------" + memberAuth.getStatus().getStatusId());
//				System.out.println("------帳號LEVEL------------" + memberAuth.getMemberLevel().getmLevel());
//				
//
//					if (memberAuth.getStatus().getStatusId() != 3) {
////						model.addAttribute("loginOK", result);// 设定登入会员物件
//						// 用ID查詢此會員的進階表格取得其他資訊以便顯示在網頁上
//						int memberId = result.getMemberId();
//						MemberAdvanced memberAdvanced = memberAdvancedServiceImpl.select(memberId);
//						if (memberAdvanced != null) {
////							model.addAttribute("MemberAdvanced", memberAdvanced);
//						}
//						System.out.println("7777777777777777777777777777777777777777777777777777777");
//						System.out.println("------advance exist:-----------" + memberAdvanced == null);
////						System.out.println(
////								"------進階表格ID:-----------" + memberAdvanced.getMemberBasic().getMemberId());
////						System.out.println("------進階表格ID:-----------" + memberAdvanced.getMemberId());
//						if (2 == memberAuth.getAuthority().getAuthorityId()) {
////						return "redirect:/adminPage.controller";
////							msg.put("loginSuccess", "2");
////							return msg;
//						}
////					return "member/Homepage";
////						msg.put("loginSuccess", "1");
////						return msg;
//					} else {
//						System.out.println("帳號已被停權，無法登入");
////					return "member/new_login";
////						msg.put("loginError", "此帳號已停權，如有疑問請洽詢客服人員");
////						return msg;
//					}
//				
//			} else {
//				System.out.println("帳號或密碼錯誤");
////				return "member/new_login";
////				msg.put("loginError", "帳號或密碼錯誤");
////				return msg;
//			}
//		} else {
//			System.out.println("查無此帳號");
////			return "member/new_login";
////			msg.put("loginError", "帳號或密碼錯誤");
////			return msg;
//		}
//		return null;
//	}
//
//	@Override
//	public boolean supports(Class<?> authentication) {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//}
