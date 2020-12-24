package main.java.hugo.test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import main.java.hugo.model.MemberBasic;
import main.java.hugo.util.DateUtils;
import main.java.hugo.util.PasswordUtils;

public class TestPassword {

	public static void main(String[] args) {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		String aString  = "asd123";
		String encrypt = PasswordUtils.encrypt(aString);
		System.out.println("en:"+encrypt);
		String decrypt = PasswordUtils.decrypt(encrypt);
		System.out.println("de:"+decrypt);
		String oneWayen = PasswordUtils.oneWayEncrypt(aString);
		System.out.println("one:"+oneWayen);
		String bCrypt = bCryptPasswordEncoder.encode(aString);
		System.err.println("bCrypt:"+bCrypt);
		boolean matches = bCryptPasswordEncoder.matches("asd123", "$2a$10$X9dLiwVTyYJgUZWtQyeh2eek6nuZCEU4XKTgtLLj5fKtN3GFyxwwO");
		System.err.println("match"+matches);
		Date now = new Date();
		boolean inDate = DateUtils.isInDate(now, "2020-11-29", "2020-11-25");
		System.out.println(inDate);
		// get now time(string)
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				String nowStr = sf.format(now);
				// 6days ago(string)
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.DATE, -6);
				String yesterday = new SimpleDateFormat("dd-MM月-yy").format(cal.getTime());
				System.out.println("6days ago" + yesterday);
				// get member time(sql to util)
				boolean inDate2 = DateUtils.isInDate(now, yesterday, nowStr);
				System.out.println(inDate2);
		int a =0;
		for (int i = 0; i < 5; i++) {
			a++;
			System.out.println(a);
		}
		
		Date date = new Date();
		System.out.println(date);
		Calendar instance = Calendar.getInstance();
		instance.setTime(date);
		int i = instance.get(Calendar.MONTH)+1;
		System.out.println(i);
		boolean checkPSW = PasswordUtils.checkPSW("gfg58a4eya4veCGpoNOK4vXplzaeixPo", "uaM4ZxCKGW0n5W/RlwR3ODjUk9sfFh++");
		System.out.println(checkPSW);
		UUID uuid = UUID.randomUUID();
		String uuString = uuid.toString();
		System.out.println(uuString);
	}
	

}
