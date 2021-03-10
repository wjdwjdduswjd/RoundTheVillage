package com.kh.RoundTheVillage.member.model.service;

import java.util.Map;

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

	// 아이디 찾기
	@Override
	public String idFind(Member findMember) {
		
		String memberIdFind = dao.idFind(findMember);
		
		return memberIdFind;
	}

	// 비밀번호 찾기
	@Override
	public String pwdFind(Member findMember) {
		String memberPwdFind = dao.pwdFind(findMember);
		return memberPwdFind;
	}

	// 비밀번호 찾기의 새로운 비밀번호 등록
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updatePwd(Map<String, Object> map) {
		
		String newPwd = enc.encode((String)(map.get("newPwd")));
		
		map.put("newPwd", newPwd);
		
		return dao.updatePwd(map);
	}



	
	//------------------------------------------------------------------------------------------------------
	//마이페이지 관련
	
	//회원 정보 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateAction(Member updateMember) {
		return dao.updateAction(updateMember);
	}

	// 내 정보 수정 비밀번호 변경 Service
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int myInfoUpdatePwd(Map<String, Object> map) {
		
		String savePwd = dao.selectPwd((int)map.get("memberNo"));
		
		int result = 0;
		
		if(savePwd != null) {
			
			if(enc.matches( (String)map.get("memberPwd"), savePwd )) {
				
				// 새 비밀번호 암호화
				String encPwd = enc.encode( (String)map.get("newPwd") );
				
				// 암호화된 비밀번호를 다시 map에 세팅
				map.put("newPwd", encPwd);
				
				// 비밀번호 수정 DAO 호출
				result = dao.myInfoUpdatePwd(map);
				 
			}
		}
		
		return result;
	}

	// 회원 탈퇴
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteMember(Member loginMember) {
		int result = 0; 
		String savePwd = dao.selectPwd(loginMember.getMemberNo());
		
		if(savePwd != null) {  
			if(enc.matches(loginMember.getMemberPwd(), savePwd)) {
				
				result = dao.deleteMember(loginMember.getMemberNo());
			}
		}
		
		return result;
	}

	//---------------- 카카오 로그인 ----------------------
	// 카카오 회원 조회 Service 구현
	@Override
	public Member selectKakaoMember(String id) {
		return dao.selectKakaoMember(id);
	}

	@Override
	public int selectMemberNo() {
		return dao.selectMemberNo();
	}
	
	
	
	
	
	




}
