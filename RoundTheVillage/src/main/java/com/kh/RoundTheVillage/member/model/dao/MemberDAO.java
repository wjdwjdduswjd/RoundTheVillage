package com.kh.RoundTheVillage.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.RoundTheVillage.member.model.vo.Member;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 회원가입 DAO
	 * @param signUpMember
	 * @return result
	 */
	public int signUp(Member signUpMember) {
		return sqlSession.insert("memberMapper.signUp", signUpMember);
	}

	/** 아이디 중복 체크 DAO
	 * @param memberId
	 * @return result
	 */
	public int idDupCheck(String memberId) {
		return sqlSession.selectOne("memberMapper.idDupCheck", memberId);
	}

	/** 이메일 중복 체크 DAO
	 * @param memberEmail
	 * @return result
	 */
	public int emailDupCheck(String memberEmail) {
		return sqlSession.selectOne("memberMapper.emailDupCheck", memberEmail);
	}

	/** 닉네임 중복 체크 DAO
	 * @param memberNickname
	 * @return result
	 */
	public int nickNameDupCheck(String memberNickname) {
		return sqlSession.selectOne("memberMapper.nickNameDupCheck", memberNickname);
	}

	// 로그인 DAO
	public Member loginAction(Member inputMember) {
		return sqlSession.selectOne("memberMapper.loginAction", inputMember);
	}

}
