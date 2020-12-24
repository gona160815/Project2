package main.java.hugo.util;

import java.security.GeneralSecurityException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

public class MailUtils {
	public static void sendMail(String email, String emailmessage, int choose) throws GeneralSecurityException {
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "SMTP");
		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.setProperty("mail.smtp.auth", "true");
		String from = "eeit124group1@gmail.com";

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

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
			if (choose == 1) {//主旨

				message.setSubject("帳號驗證通知");
			}
			if (choose == 2) {

				message.setSubject("密碼提示通知");
			}
			message.setContent(emailmessage, "text/html;charset=UTF-8");
			Transport.send(message);
			System.out.println("郵件傳送成功");
		} catch (AddressException e) {

			e.printStackTrace();
		} catch (MessagingException e) {

			e.printStackTrace();
		}

	}
}
