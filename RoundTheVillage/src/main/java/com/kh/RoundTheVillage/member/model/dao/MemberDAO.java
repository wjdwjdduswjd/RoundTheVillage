package com.kh.RoundTheVillage.member.model.dao;

import java.util.Map;

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

	// 아이디 찾지
	public String idFind(Member findMember) {
		return sqlSession.selectOne("memberMapper.idFind", findMember);
	}

	// 비밀번호 찾기
	public int pwdFind(Member findMember) {
		return sqlSession.selectOne("memberMapper.pwdFind",findMember);
	}

	public int updatePwd(Map<String, Object> map) {
		return sqlSession.update("memberMapper.updatePwd", map);
	}



	
	
	//------------------------------------------------------------------------------------------------------
	//마이페이지 관련

	// 내 정보 수정
	public int updateAction(Member updateMember) {
		return sqlSession.update("memberMapper.updateAction", updateMember);
	}

	// 내 정보 수정 - 현재 비밀번호 확인
	public String selectPwd(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectPwd", memberNo);
	}

	// 내 정보 수정 -  새 비밀번호 
	public int myInfoUpdatePwd(Map<String, Object> map) {
		return sqlSession.update("memberMapper.myInfoUpdatePwd", map);
	}

	// 회원 탈퇴 DAO
	public int deleteMember(int memberNo) {
		return sqlSession.update("memberMapper.deleteMember", memberNo);
	}

	/** 카카오 회원 좋회 DAO
	 * @param id
	 * @return member
	 */
	public Member selectKakaoMember(String id) {
		return sqlSession.selectOne("memberMapper.selectKakoMember", id);
	}


	


}
