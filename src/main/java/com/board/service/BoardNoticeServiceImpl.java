package com.board.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.board.mapper.BoardNoticeMapper;
import com.board.model.BoardNoticeVO;
import com.board.model.BoardVO;
import com.board.model.PagingVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service("BoardNoticeServiceImpl")
public class BoardNoticeServiceImpl implements BoardNoticeService {

	@Inject
	private BoardNoticeMapper boardNoticeMapper;

	@Override
	public int insertBoard(BoardNoticeVO bnvo) {
		return this.boardNoticeMapper.insertBoard(bnvo);
	}

	@Override
	public List<BoardVO> selectNoticeAll(Map<String, Integer> map) {
		return this.boardNoticeMapper.selectNoticeAll(map);
	}

	@Override
	public List<BoardVO> selectNoticeAllPaging(PagingVO page) {
		return this.boardNoticeMapper.selectNoticeAllPaging(page);
	}

	@Override
	public List<BoardVO> findBoard(PagingVO page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount() {
		return 0;
	}

	@Override
	public int getTotalCount(PagingVO page) {
		return this.boardNoticeMapper.getTotalCount(page);
	}

	@Override
	public BoardNoticeVO selectBoardByNidx(Integer nidx) {
		return this.boardNoticeMapper.selectBoardByNidx(nidx);
	}

	@Override
	public int updateReadnum(Integer nidx) {
		return this.boardNoticeMapper.updateReadnum(nidx);
	}

	@Override
	public int deleteNotice(Integer nidx, HttpServletRequest req) {
		deleteImgSources(nidx,req);
		return this.boardNoticeMapper.deleteNotice(nidx);
	}

	@Override
	public int updateNotice(BoardNoticeVO bnvo) {
		return this.boardNoticeMapper.updateNotice(bnvo);
	}

	@Override
	public int copyImage(BoardNoticeVO bnvo, HttpServletRequest req) {

		ServletContext app = req.getServletContext();
		String upDir = app.getRealPath("resources/notice_image");
		String temp = app.getRealPath("resources/temp");

		File dir = new File(upDir);
		if (!dir.exists()) {
			dir.mkdirs();// 업로드할 디렉토리 생성
		}

		String content = bnvo.getNcontent();
		List<String> sources = bnvo.getSources();
		for (String str : sources) {
			File img = new File(temp, str);
			log.info("img=" + img);
			if (content.contains(str)) {
				File upImg = new File(upDir, str);
				try {

					FileInputStream fis = new FileInputStream(img); // 읽을파일
					FileOutputStream fos = new FileOutputStream(upImg); // 복사할파일

					int fileByte = 0;
					// fis.read()가 -1 이면 파일을 다 읽은것
					while ((fileByte = fis.read()) != -1) {
						fos.write(fileByte);
					}
					// 자원사용종료
					fis.close();
					fos.close();

				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		content = content.replace("resources/temp", "resources/notice_image");
		bnvo.setNcontent(content);
		System.out.println(content);
		int n = this.boardNoticeMapper.updateImgSrc(bnvo);
		return n;
	}

	public int deleteImgSources(int nidx,HttpServletRequest req) {
		BoardNoticeVO bnvo = this.boardNoticeMapper.selectBoardByNidx(nidx);
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

		ServletContext app = req.getServletContext();
		String upDir = app.getRealPath("/resources/notice_image");

		for (String str : sources) {
			File img = new File(upDir, str);

			if (img.exists()) {
				img.delete();
			} else {
				return 0;
			}
		}
		return 1;
	}

}
