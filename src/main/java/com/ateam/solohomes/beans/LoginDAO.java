package com.ateam.solohomes.beans;

public interface LoginDAO {

	public LoginDTO selectById(String id);						//	로그인
	public LoginDTO findIdPw(String nn, String email);			// ID/PW 찾기
	public int checkId(String id);							// 아이디중복검사
	public int checkNN(String nn);							// 닉네임중복검사
	public int insertMember(LoginDTO mdto);						// 회원 등록
	public int signCheck(String id);						// 이메일 사인 체크
	public String findEmail(String id);				// 이메일 찾기
	public int emailSignUp(String id);
	public int deleteById(String id);						// 아이디로 유저지우기
}
