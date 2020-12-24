package main.java.gona.util;

import java.security.GeneralSecurityException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

public class BikeMailUtil { //email 收件人的信箱  subject 信件標題 emailMsg 信件內容
	public  static void sendBikeMail(String email, String subject, String emailMsg)
			 throws AddressException, MessagingException, GeneralSecurityException {
		
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "SMTP");//郵件發送協議
		props.setProperty("mail.smtp.host", "smtp.gmail.com");//指定發送服務器
		props.setProperty("mail.smtp.auth", "true");//驗證
		String from = "eeit124group1@gmail.com"; //發件人
		System.out.println("寄郵件方法開始");
		
		try {

			MailSSLSocketFactory sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true);
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.socketFactory", sf);

			Authenticator auth = new Authenticator() {
				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("eeit124group1@gmail.com", "ncgcnhmhlqpfksct");
				}
			};

			Session session = Session.getInstance(props, auth);
			
			// 郵件內容
	        Message message = new MimeMessage(session);
	        message.setFrom(new InternetAddress(from)); // 發件者信箱
	        message.setRecipient(RecipientType.TO, new InternetAddress(email)); //設置傳送方式
	        message.setSubject(subject);//信件名稱
	        message.setContent(emailMsg, "text/html;charset=utf-8");//信件內容
	 
	        Transport.send(message);//寄送內容
	        System.out.println("郵件傳送成功");
			
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
	
				e.printStackTrace();
			}
    
	}

} 
