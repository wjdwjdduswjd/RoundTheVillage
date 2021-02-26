package com.kh.RoundTheVillage.board.controller;




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
import com.kh.RoundTheVillage.board.service.BoardService;


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

	      return "board/boardList";
	   }
	   
	   @RequestMapping("insert")
	  public String insertView() {
		 
		  return "board/boardInsert";
	  }

}
