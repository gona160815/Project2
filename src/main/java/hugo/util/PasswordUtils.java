package main.java.hugo.util;

import org.jasypt.util.password.BasicPasswordEncryptor;
import org.jasypt.util.text.BasicTextEncryptor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordUtils {
	
	
	public static String encrypt(String password) {
		BasicTextEncryptor basicTextEncryptor = new BasicTextEncryptor();
		basicTextEncryptor.setPassword("member");
		String encrypt = basicTextEncryptor.encrypt(password);	
		return encrypt;
	}
	
	public static String decrypt(String password) {
		BasicTextEncryptor basicTextEncryptor = new BasicTextEncryptor();
		basicTextEncryptor.setPassword("member");
		String decrypt = basicTextEncryptor.decrypt(password);
		return decrypt;
	}
	
	public static String oneWayEncrypt(String password) {
		BasicPasswordEncryptor basicTextEncryptor = new BasicPasswordEncryptor();
		String decrypt = basicTextEncryptor.encryptPassword(password);
		return decrypt;
	}
	public static String BCryptPasswordEncoder(String password) {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		String encode = bCryptPasswordEncoder.encode(password);
		return encode;
	}
	//(待驗證密碼，資料庫待比對密碼)
	public static boolean checkBCryptPSW(String password,String password2) {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		boolean matches = bCryptPasswordEncoder.matches(password, password2);
		return matches;
	}
	
	public static boolean checkPSW(String password,String password2) {
		BasicPasswordEncryptor basicTextEncryptor = new BasicPasswordEncryptor();
		boolean checkPassword = basicTextEncryptor.checkPassword(password, password2);
		return checkPassword;
	}
	
	
}
