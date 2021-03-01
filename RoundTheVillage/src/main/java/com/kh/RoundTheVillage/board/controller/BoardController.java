package com.kh.RoundTheVillage.board.controller;




import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.RoundTheVillage.board.model.service.BoardService;
import com.kh.RoundTheVillage.board.model.vo.Board;
import com.kh.RoundTheVillage.board.model.vo.PageInfo;
import com.kh.RoundTheVillage.member.model.vo.Member;
import com.kh.RoundTheVillage.board.model.vo.Attachment;


@Controller // 컨트롤러임을 알려줌 + bean 등록
@SessionAttributes({"loginMember"})
@RequestMapping("/board/*") // 최상위 요청
public class BoardController {
	
	
 @Autowired // 등록된 bean 중에서 같은 타입인 bean을 자동적으로 의존성 주입
 private BoardService service; 
	   
   private String swalIcon = null;
   private String swalTitle = null;
   private String swalText = null;
   
	      
   // 게시글 목록 조회 Controller
   @RequestMapping("list")
   public String boardList(
                      @RequestParam(value="cp", required = false, defaultValue = "1" )int cp,
                      Model model) { 

	PageInfo pInfo = service.getPageInfo(cp);
	  
	List<Board> bList = service.selectList(pInfo);
	  
		  if(bList != null && !bList.isEmpty()) { // 게시글 목록 조회 성공 시 List<Attachment>
			  List<Attachment> thumbnailList = service.selectThumbnailList(bList);
		  
		 if(thumbnailList != null) { 
			 model.addAttribute("thList", thumbnailList);
			 
		 }
		  
	}
		  
	  
	  model.addAttribute("bList",bList);
      model.addAttribute("pInfo",pInfo); 
	  
      return "board/boardList";
   }
   
   @RequestMapping("{boardNo}")
   public String boardView(@PathVariable("boardNo") int boardNo,
		   					Model model, 
		   				 @RequestHeader(value="referer", required = false) String referer,
		   				   RedirectAttributes ra) {
	  
	   Board board = service.selectBoard(boardNo);
	   
	   
	   
	   
	   
	   
	   return null;
	   
   }
   
   
   
   
   
   
   
   
   @RequestMapping("insert")
  public String insertView() {
	 
	  return "board/boardInsert";
	  
	  
  }
   
  // 게시글 등록 Controller
   @RequestMapping("insertAction")
   public String insertAction( 
		  @ModelAttribute Board board, // 작성한 글제목, 내용, 카테고리코드를 얻기위한 어노테이션 
		  @ModelAttribute("loginMember") Member loginMember, 
		  @RequestParam(value="images", required = false) List<MultipartFile> images,
		  HttpServletRequest request,
		  RedirectAttributes ra) {
	   
	  Map<String, Object> map = new HashMap<String, Object>(); // 맵을 이용해 받아온 정보들을 한곳에 담기
	  // map.put("memberNo", loginMember.getMemberNo()); // 세션에 올려져있는 멤버넘버
	   map.put("boardTitle", board.getBoardTitle()); // 내가 작성한 글제목
	   map.put("boardContent", board.getBoardContent()); // 내가 작성한 글 내용
	   map.put("categoryNo", board.getClassCategoryNo()); // 카테고리 코드
	   map.put("classNo", board.getClassNo()); // 공방 번호
	  
	  String savePath = null;
	   
	  savePath = request.getSession().getServletContext().getRealPath("resources/boardImages");
   
	  int result = service.insertBoard(map, images, savePath);
	 
	  
	   
	   return null;
	   
   }
   
}


   
	   


