package com.kh.RoundTheVillage.member.model.service;

import com.kh.RoundTheVillage.member.model.vo.Member;

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



}
