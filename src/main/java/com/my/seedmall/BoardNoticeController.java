package com.my.seedmall;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
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

import com.board.model.BoardNoticeVO;
import com.board.model.BoardVO;
import com.board.model.PagingVO;
import com.board.service.BoardNoticeService;
import com.google.gson.JsonObject;
import com.user.model.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@Log4j
public class BoardNoticeController {

	@Inject
	private BoardNoticeService boardNoticeService;

	@GetMapping("/notice")
	public String boardNotice(Model m, @ModelAttribute PagingVO page, HttpServletRequest req,
			@RequestHeader("User-Agent") String userAgent) {
		String myctx = req.getContextPath();// 컨텍스트명 "/seedmall"

		HttpSession ses = req.getSession();
		// 1. 총 게시글 수 기져오기 or 검색한 게시글 수 가져오기
		int totalCount = this.boardNoticeService.getTotalCount(page);
		page.setTotalCount(totalCount);
		// page.setPageSize(5);//한 페이지 당 보여줄 목록 개수 <==파라미터로 받는다
		page.setPagingBlock(5);// 페이징 블럭 단위값: 5
		////////////////////
		page.init(ses); // 페이징 관련 연산을 수행하는 메서드 호출
		/////////////////////
		// 2. 게시글 목록 가져오기 or 검색한 게시글 목록 가져오기
		List<BoardVO> noticeArr = this.boardNoticeService.selectNoticeAllPaging(page);
		// 3. 페이지 네비게이션 문자열 받아오기
		String loc = "board/notice";
		String pageNavi = page.getPageNavi(myctx, loc, userAgent);
		m.addAttribute("noticeArr", noticeArr);
		m.addAttribute("paging", page);
		m.addAttribute("pageNavi", pageNavi);

		return "/board/notice";

	}

	@GetMapping("/noticeWriteForm")
	public String boardNoticeWrite(Model m, HttpSession ses) {
		MemberVO loginUser = (MemberVO) ses.getAttribute("loginUser");
		if (loginUser == null) {
			String str = "로그인 후 이용 가능합니다";
			String loc = "javascript:history.back()";

			m.addAttribute("message", str);
			m.addAttribute("loc", loc);
			return "msg";
		} else if (loginUser.getStatus() != 9) {
			String str = "관리자만 등록 할 수 있습니다";
			String loc = "javascript:history.back()";

			m.addAttribute("message", str);
			m.addAttribute("loc", loc);
			return "msg";
		}
		m.addAttribute(loginUser);
		return "board/noticewriteForm";
	}

	@PostMapping("/noticeWrite")
	public String boardInsert(Model m, @ModelAttribute BoardNoticeVO bnvo, HttpServletRequest req) {
		// 유효성 체크 (subject, name)==> redirect "write"
		if (bnvo.getNtitle() == null || bnvo.getNtitle().trim().isEmpty()) {
			return "redirect:noticewrite";
		}

		// boardService의 insertBoard()호출하기
		int n = this.boardNoticeService.insertBoard(bnvo);
		// 이미지 소스 추출
		getImgSources(bnvo);
		log.info("bnvo=" + bnvo);
		int x = this.boardNoticeService.copyImage(bnvo, req);

		String str = "", loc = "";

		str += (n > 0 && x > 0) ? "작성 성공" : "작성 실패";
		loc = (n > 0) ? "notice" : "javascript:history.back()";

		// 그 결과 message, loc 저장
		m.addAttribute("message", str);
		m.addAttribute("loc", loc);

		return "msg";
	}// --------------------------------------

	@ResponseBody
	@PostMapping(value = "noticeImg")
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

						String uploadPath = req.getSession().getServletContext().getRealPath("/resources/temp"); // 저장경로
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
						String fileUrl = req.getContextPath() + "/resources/temp/" + fileName2 + fileName; // url경로
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
	}

	@GetMapping("/view/{nidx}")
	public String boardNoticeView(Model m, @PathVariable("nidx") int nidx) {
		// 조회수 증가
		boardNoticeService.updateReadnum(nidx);

		BoardNoticeVO notice = this.boardNoticeService.selectBoardByNidx(nidx);
		m.addAttribute("notice", notice);

		return "board/boardNoticeView";
	}// -------------------------------

	@GetMapping("/noticeEdit/{nidx}")
	public String noticeEdit(Model m, @PathVariable("nidx") int nidx, HttpSession ses) {
		MemberVO loginUser = (MemberVO) ses.getAttribute("loginUser");
		if (loginUser == null) {
			String str = "로그인 후 이용 가능합니다";
			String loc = "javascript:history.back()";

			m.addAttribute("message", str);
			m.addAttribute("loc", loc);
			return "msg";
		} else if (loginUser.getStatus() != 9) {
			String str = "관리자만 등록 할 수 있습니다";
			String loc = "javascript:history.back()";

			m.addAttribute("message", str);
			m.addAttribute("loc", loc);
			return "msg";
		}
		m.addAttribute(loginUser);

		BoardNoticeVO notice = this.boardNoticeService.selectBoardByNidx(nidx);
		m.addAttribute("notice", notice);

		return "board/noticeEditForm";
	}// -------------------------------

	@PostMapping(value = "/noticeEdit")
	public String noticeEditEnd(Model m, BoardNoticeVO bnvo, HttpServletRequest req) {
		//수정 전 이미지 소스 삭제
		boardNoticeService.deleteImgSources(bnvo.getNidx(), req);
		//db 업데이트
		int n = this.boardNoticeService.updateNotice(bnvo);
		// 이미지 소스 추출
		getImgSources(bnvo);
		//수정 후 이미지 소스 카피
		int x = this.boardNoticeService.copyImage(bnvo, req);

		String str = (n > 0 && x > 0) ? "수정 성공" : "수정 실패";
		m.addAttribute("message", str);
		m.addAttribute("loc", "view/" + bnvo.getNidx());
		
		return "msg";
	}

	@GetMapping(value = "/noticeDelete/{nidx}")
	public String notiveDelete(Model m, @PathVariable("nidx") int nidx, HttpSession ses, HttpServletRequest req) {
		MemberVO loginUser = (MemberVO) ses.getAttribute("loginUser");
		if (loginUser == null) {
			String str = "로그인 후 이용 가능합니다";
			String loc = "javascript:history.back()";

			m.addAttribute("message", str);
			m.addAttribute("loc", loc);
			return "msg";
		} else if (loginUser.getStatus() != 9) {
			String str = "관리자만 삭제 할 수 있습니다";
			String loc = "javascript:history.back()";

			m.addAttribute("message", str);
			m.addAttribute("loc", loc);
			return "msg";
		}
		int n = boardNoticeService.deleteNotice(nidx, req);
		String str = (n > 0) ? "삭제 성공" : "삭제 실패";
		m.addAttribute("message", str);
		m.addAttribute("loc", "../notice");
		return "msg";
	}

	public BoardNoticeVO getImgSources(BoardNoticeVO bnvo) {
		// 이미지 태그를 추출하기 위한 정규식.
		Pattern pattern = Pattern.compile("([0-9a-zA-Z\\._-]+.(png|PNG|gif|GIF|jp[e]?g|JP[E]?G))");

		// 추출할 내용.
		String content = bnvo.getNcontent();

		// 내용 중에서 이미지 태그를 찾아라!
		Matcher match = pattern.matcher(content);

		List<String> sources = new ArrayList<String>();

		while (match.find()) { // 이미지 태그를 찾았다면,,
			sources.add(match.group(1));
		}

		bnvo.setSources(sources);

		return bnvo;
	}

}
