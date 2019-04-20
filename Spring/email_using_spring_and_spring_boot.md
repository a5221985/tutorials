# Guide to Spring Email #
## Overview ##
1. Sending emails from plain vanilla Spring application
	1. Uses [JavaMail](https://java.net/projects/javamail/pages/Home) library
2. Sending emails from Spring Boot application
	1. Uses `spring-boot-starter-mail` dependency

## Maven Dependencies ##
### Spring ###
1. Plain vanilla Spring framework

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-context-support</artifactId>
			<version>5.0.1-RELEASE</version>
		</dependency>

	1. [Latest version](https://search.maven.org/classic/#search%7Cga%7C1%7Cspring-context-support)

### Spring Boot ###

		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-mail</artifactId>
			<version>2.0.1.RELEASE</version>
		</dependency>

	1. [Latest is available in Maven Central Repository](https://search.maven.org/classic/#search%7Cga%7C1%7Cg%3A%22org.springframework.boot%22%20AND%20a%3A%22spring-boot-starter-mail%22)

## Mail Server Properties ##
1. **MailSender** interface: Top level interface that provides basic functionality for sending simple emails
2. **JavaMailSender** interface: Subinterface of `MailSender`
	1. Supports MIME messages and is mostly used in conjunction with `MimeMessageHelper` class for creation of `MimeMessage`
		1. We can use `MimeMessagePreparator` mechanism with this interface
3. **JavaMailSenderImpl** class: An implementation of `JavaMailSender` interface. Supports `MimeMessage` and `SimpleMailMessage`
4. **SimpleMailMessage** class: used for creation of a simple mail message including from, to, cc, subject and text fields
5. **MimeMessagePreparator** interface: provides a callback interface for preparation of MIME messages
6. **MimeMessageHelper** class: Helper class for creation of MIME messages. Offers support for images, typical mail attachments and text content in an HTML layout

### Spring Mail Server Properties ###
1. Mail properties such as SMTP server can be defined using `JavaMailSenderImpl`
2. GMail

		@Bean
		public JavaMailSender getJavaMailSender() {
			JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
			mailSender.setHost("smtp.gmail.com");
			mailSender.setPort(587);

			mailSender.setUsername("my.gmail@gmail.com");
			mailSender.setPassword("password");

			Properties props = mailSender.getJavaMailProperties();
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.debug", "true");

			return mailSender;
		}

### Spring Boot Mail Server Properties ###
1. `application.properties`
	1. Using `spring.mail.*` namespace

			spring.mail.host=smtp.gmail.com
			spring.mail.port=587
			spring.mail.username=<login user to smtp server>
			spring.mail.password=<login password to smtp server>
			spring.mail.properties.mail.smtp.auth=true
			spring.mail.properties.mail.smtp.starttls.enable=true

		1. Some SMTP servers require TLS connection
			1. `spring.mail.properties.mail.smtp.starttls.enable=true` (for TLS-protected connection)

#### Gmail SMTP Properties ####
1. Email can be sent via Gmail SMTP server
	1. [documentation for outgoing mail SMTP server properties](https://support.google.com/mail/answer/13273?hl=en&rd=2)
	2. Password should be application password generated for the google account
		1. [Generation of Google App Password](https://support.google.com/accounts/answer/185833)

#### SES SMTP Properties ####
1. Sending email using Amazon SES Service
2. `application.properties`

		spring.mail.host=email-smtp.us-west-2.amazonaws.com
		spring.mail.username=username
		spring.mail.password=password
		spring.mail.properties.mail.transport.protocol=smtp
		spring.mail.properties.mail.smtp.port=25
		spring.mail.properties.mail.smtp.auth=true
		spring.mail.properties.mail.smtp.starttls.enable=true
		spring.mail.properties.mail.smtp.starttls.required=true

	1. Amazon requires us to verify credentials before using them.
		1. [Verificatio of username and password](http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-email-addresses.html)

## Sending Email ##
1. `JavaMailSender` can be used to send email (Spring and Spring boot handle in a similar way)

### Sending Simple Emails ###
1. Simple emails without attachments

		@Component
		public class EmailServiceImpl implements EmailService {
			@Autowired
			public JavaMailSender emailSender;

			public void sendSimpleMessage(
				String to, String subject, String text
			) {
				...
				SimpleMailMessage message = new SimpleMailMessage();
				message.setTo(to);
				message.setSubject(subject);
				message.setText(text);
				emailSender.send(message);
				...
			}
		}

### Sending Emails with Attachments ###
1. Example: Order confirmation with invoice attached
	1. MIME multipart message from `JavaMail` library instead of `SimpleMailMessage`
	2. Spring supports `JavaMail` messaging with `org.springframework.mail.javamail.MimeMessageHelper` class
2. Add a method to `EmailServiceImpl` to send emails to attachments

		@Override
		public void sendMessageWithAttachment (
			String to, String subject, String text, String pathToAttachment
		) {
			// ...
			MimeMessage message = emailSender.createMimeMessage();

			MimeMessageHelper helper = new MimeMessageHelper(message, true);

			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(text);

			FileSystemResource file = new FileSystemResource(new File(pathToAttachment));
			helper.addAttachment("Invoice", file);

			emailSender.send(message);
			// ...
		}

### Simple Email Template ###
1. `SimpleMailMessage` supports text formatting. A template can be created for emails by defining a template bean in our config

		@Bean
		public SimpleMailMessage templateSimpleMessage() {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setText(
				"This is the test email template for your email:\n%s\n");
			return message;
		}

	1. We can use the bean as a template for email. We need to provide necessary parameters to the template

			@Autowired
			public SimpleMailMessage template;
			...
			String text = String.format(template.getText(), templateArgs);
			sendSimpleMessage(to, subject, text);

## Handling Send Errors ##
1. `JavaMail` provides `SendFailedException` to handle situations when a message cannot be sent.
	1. Incorrect address may not trigger this
		1. Protocol specs for SMTP in RFC 821 specifies the 550 return code that SMTP server should return when attempting to send email to incorrect address
			1. Most public SMTP servers don't do this
			2. Gmail SMTP server sends a "delivery failed" message (we don't get exceptions in program)
	2. Options to handle the case:
		1. Catch `SendFailedException` which cannot be thrown
		2. Check sender mailbox on "delivery failed" message for some period of time (Not straightforward and time period is non deterministic)
		3. If mail server does not give any feedback. Nothing can be done

## Conclusion ##
1. [GitHub Project](https://github.com/eugenp/tutorials/tree/master/spring-mvc-simple)