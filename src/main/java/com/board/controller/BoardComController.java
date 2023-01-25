package com.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.board.model.BoardComVO;
import com.board.model.BoardReviewVO;
import com.board.model.BoardVO;
import com.board.service.BoardComService;
import com.google.gson.JsonObject;
import com.user.model.GradeVO;
import com.user.model.MemberVO;
import com.user.model.PagingVO;
import com.user.service.MemberService;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class BoardComController {

	@Autowired
	BoardComService boardComService;
	
	@Autowired
	MemberService memberService;

	@GetMapping("/boardComList")
	public String boardList(Model m, @ModelAttribute("page") PagingVO page, HttpServletRequest req,
			@RequestHeader("user-Agent") String userAgent) {
		String myctx = req.getContextPath();
		HttpSession ses = req.getSession();

		int totalCount = boardComService.getBoardCount(page);

		// 2. 이거 추가
		page.setTotalCount(totalCount);
		page.setPagingBlock(5);
		page.init(ses);

		List<BoardComVO> boardComArr = boardComService.getBoardList(page);
		log.info(boardComArr);

		String loc = "boardCom/boardComList";
		String pageNavi = page.getPageNavi(myctx, loc, userAgent);

		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("paging", page);
		m.addAttribute("boardComArr", boardComArr);

		return "boardCom/boardComList";
	}// 게시만 목록 보기

	
	@GetMapping("/write")
	public String boardForm() {

		return "boardCom/boardWrite";
	}

	@PostMapping("/write")
	public String boardInsert(@ModelAttribute("boardComVO") BoardComVO boardvo, Model m, MemberVO mvo) {
		boardComService.insertBoard(boardvo);
		int point= 100;
		int n=memberService.RewardMileage(boardvo.getMidx(),point);
		mvo.setMidx(boardvo.getMidx());
		memberService.updateGrade(mvo);
		log.info("n="+n);
		return "redirect:boardComList";
	}// 게시판 글쓰기

	@PostMapping("/delete")
	public String boardDelete(int cidx, @ModelAttribute("boardComVO") BoardComVO boardvo, Model m) {
		boardComService.deleteboard(cidx);

		return "redirect:/boardComList";

	}// 게시판 삭제하기

	@PostMapping("/update")
	public String boardupdate(Model m, @ModelAttribute BoardComVO boardvo) {
		BoardComVO boardCom = boardComService.getBoardCom(boardvo);
		m.addAttribute("board", boardCom);
		return "boardCom/boardEdit";

	}

	@PostMapping("/updateEnd")
	public String boardEdit(@ModelAttribute("boardComVO") BoardComVO boardvo, Model m) {
		boardComService.updateBoard(boardvo);

		return "redirect:boardComList";

	}// 게시판 수정 하기
	
	@GetMapping("/boardGet")
	public String boardView(Model m,@RequestParam("cidx") int cidx) {
		log.info("num==="+cidx);
		
		int n=boardComService.updateReadnum(cidx);
		log.info("n==="+n);
		m.addAttribute("boardCom",boardComService.selectBoardByIdx(cidx));
		
		return "boardCom/boardComView";
		//게시판 글보기 및 조회수 업데이트
	}//-------------------------------
	
	@ResponseBody
	@PostMapping(value = "fileupload.do")
	public void noticeImageUpload(HttpServletRequest req, HttpServletResponse resp,
			MultipartHttpServletRequest multiFile) throws Exception {
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");

		if (file != null) {
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {
					try {

						String fileName = file.getOriginalFilename();
						byte[] bytes = file.getBytes();

						String uploadPath = req.getSession().getServletContext().getRealPath("/resources/Comimg"); // 저장경로
						System.out.println("uploadPath:" + uploadPath);

						File uploadFile = new File(uploadPath);
						if (!uploadFile.exists()) {
							uploadFile.mkdir();
						}
						String fileName2 = UUID.randomUUID().toString();
						uploadPath = uploadPath + "/" + fileName2 + fileName;

						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);

						printWriter = resp.getWriter();
						String fileUrl = req.getContextPath() + "/resources/Comimg/" + fileName2 + fileName; // url경로
						JsonObject json = new JsonObject();
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						printWriter.print(json);
						System.out.println(json);

					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}
					}
				}

			}

		}
	}//-----------
	
	

}
