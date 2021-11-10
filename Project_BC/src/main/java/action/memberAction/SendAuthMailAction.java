package action.memberAction;

import java.io.PrintWriter;

import java.sql.Connection;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import vo.ActionForward;


public class SendAuthMailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SAMA 작동완류!");
		ActionForward forward = null;
		
		String id = request.getParameter("member_id");
		String email = request.getParameter("member_email");
		
		System.out.println(email);
		
		// 난수 생성을 위한 GenerateUserAuthenticationCode 클래스 인스턴스 생성 후 
		// 생성된 난수 가져오기 
		GenerationUserAuthenticationCode genAuthCode = new GenerationUserAuthenticationCode(50);
		String authCode = genAuthCode.getAuthCode();
		System.out.println("인증코드 : " + authCode);
		
		
		// 인증코드를 사용자의 메일에 함께 링크로 첨부하고
		// 데이터베이스의 auth_info 테이블에 아이디와 인증코드값을 추가 
		// 단, 기존에 아이디에 인증코드가 존재할 경우에는 코드값만 덮어쓰고 
		// 아이디가 존재하지 않으면 아이디와 코드값을 추가 
		// -----------------------------------------------------------------------------
		// 인증 메일 발송하기 
		String sender = "k.byoeng.man1@gmail.com"; // 관리자메일
		String receiver = email;
		String subject = "[더 반찬] 가입 인증 메일입니다.";
		String content = "<a href=http://localhost:8091/StudyJSP/MemberAuth.auth?id=" + id + 
				"&authCode=" + authCode + "><b>인증하려면 다음 링크를 클릭하세요.</b></a>";

				 
//		System.out.println("보내는 사람 : " + sender);
//		System.out.println("받는 사람 : " + receiver);
//		System.out.println("제목 : " + subject);
//		System.out.println("내용 : " + content);
		
		// 결과 출력을 위한 설정
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			// ------------- 메일 전송을 위한 설정 작업 -------------
			// 메일 전송 프로토콜 : SMTP(Simple Mail Transfer Protocol) - TCP 포트 587번 사용
			// 서버의 속성 정보 객체를 리턴받기
			Properties properties = System.getProperties();
			// 서버 속성 정보에 메일 전송에 필요한 정보 추가
			properties.put("mail.smtp.starttls.enable", true);
			// 메일을 전송하는데 사용할 서버 지정(구글, 네이버, Outlook 등)
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.auth", "true"); // 인증 여부 설정
			properties.put("mail.smtp.port", "587"); // 메일 전송 포트 설정
			
			// 메일 서버 인증 정보를 생성하는 사용자 정의 클래스 인스턴스 생성
			// => 슈퍼클래스 타입인 Authenticator 타입으로 업캐스팅하여 사용
			Authenticator auth = new GoogleAuthentication();
			
			// 자바메일에서 기본 전송 단위를 Session 단위로 관리하며
			// 해당 javax.mail.Session 객체를 가져오기
			// => Session 클래스의 getDefaultInstance() 메서드 호출하여
			//    파라미터로 서버 정보(Properties), 인증정보(Authenticator) 객체 전달
			Session session = Session.getDefaultInstance(properties, auth);
			// 서버정보와 인증 정보를 포함하는 Message 객체 생성
			// => 파라미터로 Session 객체 전달
			// => Message 객체를 사용하여 전송할 메일에 대한 정보 생성
			Message message = new MimeMessage(session);
			// 전송할 메일에 대한 정보 생성
			// 1. 발신자 정보 설정(발신자 주소, 발신자 주소와 함께 표시될 이름)
			//    => 단, 스팸메일 정책으로 인해 상용 메일 사이트는 발신자 주소 변경 불가능
			Address sender_address = new InternetAddress(sender, "더 반찬");
			// 2. 수신자 정보 설정(수신자 주소)
			Address receiver_address = new InternetAddress(receiver);
			// 3. Message 객체를 통해 정보 생성 
			// 1) 메일 헤더 타입 설정
			message.setHeader("content-type", "text/html;charset=UTF-8");
			// 2) 발신자 정보 설정
			message.setFrom(sender_address);
			// 3) 수신자 정보 설정
			message.addRecipient(Message.RecipientType.TO, receiver_address);
			// 4) 메일 제목 설정
			message.setSubject(subject);
			// 5) 메일 본문 설정
			message.setContent(content, "text/html;charset=UTF-8");
			// 6) 메일 전송 날짜 정보 설정
			message.setSentDate(new Date());
			
			// 4. 메일 전송
			// javax.mail.Transport 클래스의 static 메서드 send() 메서드 호출
			// => 파라미터로 Message 객체 전달
			Transport.send(message);
			out.println("<h3>메일이 정상적으로 전송되었습니다.</h3>");
		} catch (Exception e) {
			out.println("SMTP 서버 설정 문제 또는 서비스 문제 발생!");
			e.printStackTrace();
		}
	
		return forward;
	}

}
