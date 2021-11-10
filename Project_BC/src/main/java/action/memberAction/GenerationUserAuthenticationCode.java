package action.memberAction;
import java.util.Random;

// 인증 메일에서 사용할 인증 코드 생성을 위한 클래스 정의
public class GenerationUserAuthenticationCode {
	
		private String authCode; // 인증코드값을 저장할 변수 
	
	// 인증 코드를 생성하기 위해 필요한 코드값 집합을 배열로 생성
	private final char[] codeTable = {
			'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
			'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
			'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
			'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 
			'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'
		};

	public GenerationUserAuthenticationCode(int codeLength) {

		// Random 클래스를 활용하여 배열 길이 범위 내의 값을 난수로 생성하여 
		// 난수에 해당하는 배열 인덱스에 위치한 문자를 문자열에 추가하여 난수 생성
		// => 이 때, 난수로 생성한 문자열의 길이는 전달받은 길이만큼 반복하여 생성
		Random r = new Random();
		int tableLength = codeTable.length; // 배열 크기 
		
		// 난수 문자열을 결합하여 저장할 StringBuffer 객체 생성
		// => StringBuffer 클래스는 버퍼를 활용하여 문자열을 다루므로 
		//    String 클래스보다 편집에 유리함
		StringBuffer buffer = new StringBuffer();
		
		// for문을 사용하여 전달받은 코드길이 만큼 반복
		for(int i =0; i< 7; i++) {
			// Random 인스턴스의 nextInt() 메서드를 호출하여 난수 범위를 테이블 크기로 한정
			// => 배열 내의 인덱스에 있는 문자를 버퍼에 저장
			buffer.append(codeTable[r.nextInt(tableLength)]);
		}
		
		// 생성된 버퍼 내의 인증코드를 문자열로 변환하여 변수에 저장 
		authCode = buffer.toString();
	}

	public String getAuthCode() {
		return authCode;
	}

}
