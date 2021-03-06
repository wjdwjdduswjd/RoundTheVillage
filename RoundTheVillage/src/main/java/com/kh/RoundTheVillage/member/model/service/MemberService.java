package com.kh.RoundTheVillage.member.model.service;

import java.util.Map;

import com.kh.RoundTheVillage.member.model.vo.Member;

/**
 * @author LeeJS
 *
 */
public interface MemberService {
	
	/** 아이디 중복 검사 Service
	 * @param memberId
	 * @return result
	 */
	public abstract int idDupCheck(String memberId);

	/** 이메일 중복 검사
	 * @param memberEmail
	 * @return result
	 */
	public abstract int emailDupCheck(String memberEmail);

	/** 닉네임 중복 검사
	 * @param memberNickname
	 * @return result
	 */
	public abstract int nickNameDupCheck(String memberNickname);
	
	/** 회원가입 Service
	 * @param signUpMember
	 * @return result
	 */
	public abstract int signUp(Member signUpMember);

	/** 로그인 Service
	 * @param inputMember
	 * @return result
	 */
	public abstract Member loginAction(Member inputMember);

	/**아이디 찾기
	 * @param findMember
	 * @return result
	 */
	public abstract String idFind(Member findMember);

	/** 비밀번호 찾기 
	 * @param findMember
	 * @return result
	 */
	public abstract int pwdFind(Member findMember);


	/** 비밀번호 찾기의 새로운 비밀번호 등록
	 * @param updatePwd
	 * @param memberPwdFind 
	 * @return result
	 */
	public abstract int updatePwd(Map<String, Object> map);


	
	//------------------------------------------------------------------------------------------------------
	//마이페이지 관련
	

	
	
	
	
	
	
	
	
	

}
