package SHA256test;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class SHA256SALT {

	public static void main(String[] args) {
		SHA256SALT en = new SHA256SALT();
		
		String pwd = "1234";
		System.out.println("pwd : "+ pwd);
		
		//Salt 생성
        // 현재 랜덤으로 Salt값을 생성하였지만, 실제 구현시 고정시키거나 Salt값을 저장해 두어야합니다.
		String salt = en.getSalt();
		System.out.println("salt : "+salt);
		
		//최종 비밀번호 생성
		String res = en.getEncrypt(pwd, salt);
	}

	public String getSalt() {
		
		// 1. Random, byte 객체 생성
		SecureRandom  r = new SecureRandom ();
		byte[] salt = new byte[20];
		
		// 2. 난수 생성
		r.nextBytes(salt);
		
		// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
		// 1~2의 과정은 예시(랜덤생성)
		// 랜덤 생성하지 않고 미리 약속된 salt를 생성하여 관리자끼리 공유하는것이 좋다
		// byte에 들어갈수 있는 숫자의 범위는 0~255이므로 각 배열의 자리에 0~255를 자유롭게 지정 가능
		// byte[] salt = new byte[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 };
		//
		// 내용추가
		// salt값이 고정되어있으면 내부자로부터 유출될 보안위험이 있으므로
		// 회원가입시마다 salt를 랜덤 생성하고 회원 정보와 함께 DB에 저장하는것이 보다 올바른 방법이다.
		// 
		// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
		
		//3. byte To String (10진수의 문자열로 변경)
		StringBuffer sb = new StringBuffer();
		for(byte b : salt) {
			sb.append(String.format("%02x", b));
		};
		
		return sb.toString();
	}
	
	public String getEncrypt(String pwd, String salt) {
		
		String result = "";
		try {
			//1. SHA256 알고리즘 객체 생성
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			
			//2. 비밀번호와 salt 합친 문자열에 SHA 256 적용
			// System.out.println("비밀번호 + salt 적용 전 : " + pwd+salt); //이러면 기존과 비교가 힘들지,
			System.out.println("비밀번호 + salt 적용 전 : " + SHA256.encrypt(pwd));
			md.update((pwd+salt).getBytes());
			byte[] pwdsalt = md.digest();
			
			//3. byte To String (10진수의 문자열로 변경)
			StringBuffer sb = new StringBuffer();
			for (byte b : pwdsalt) {
				sb.append(String.format("%02x", b));
			}
			
			result=sb.toString();
			System.out.println("비밀번호 + salt 적용 후 : " + result);
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return result;
	}
}