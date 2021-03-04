package com.kh.RoundTheVillage.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.RoundTheVillage.member.model.dao.MemberDAO;
import com.kh.RoundTheVillage.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO dao;

	// 암호화를 위한 객체를 의존성 주입(DI)    
	@Autowired
	private BCryptPasswordEncoder enc;
		

	// 아이디 중복 검사  ServiceS
	@Override
	public int idDupCheck(String memberId) {
		return dao.idDupCheck(memberId);
	}
	
	// 이메일 중복 검사 Service
	@Override
	public int emailDupCheck(String memberEmail) {
		return dao.emailDupCheck(memberEmail);
	}
	
	//닉네임 중복 검사 Service
	@Override
	public int nickNameDupCheck(String memberNickname) {
		return dao.nickNameDupCheck(memberNickname);
	}
	
	// 회원가입 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int signUp(Member signUpMember) {
		
		// DAO 전달 전에 비밀번호 암호화
		String encPwd = enc.encode(signUpMember.getMemberPwd());  
		
		// 암호화된 비밀번호를 signUpMember에 다시 세팅
		signUpMember.setMemberPwd(encPwd);
		
		
		return dao.signUp(signUpMember);
	}

	// 로그인  Service 구현
	@Override
	public Member loginAction(Member inputMember) {
		
		Member loginMember = dao.loginAction(inputMember);
		
		if(loginMember != null) {
			if( enc.matches(inputMember.getMemberPwd(), loginMember.getMemberPwd()) ) {
				
				loginMember.setMemberPwd(null);
			}else {
				loginMember = null;
			}
		}
		
		
		
		return loginMember;
	}







}
