package com.board.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.board.mapper.BoardReviewMapper;
import com.board.model.BoardReviewVO;
import com.board.model.ReviewImageVO;
import com.product.model.ProductForm;
import com.product.model.ProductImageVO;
import com.user.model.PagingVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Service
@Log4j
public class BoardReviewServiceImpl implements BoardReviewService {
	@Autowired
	BoardReviewMapper boardReviewMapper;
	
	@Override
	public List<BoardReviewVO> getReview(int pidx) {
		 
		
		List<BoardReviewVO> ReviewI =boardReviewMapper.getReview(pidx);	
		for(BoardReviewVO vo : ReviewI) {
			
			List<ReviewImageVO> ri = getReviewImages(vo.getRidx());
			vo.setBoardReviewImageList(ri);
		}
		return ReviewI;
	}


	@Override
	public int updateReview(BoardReviewVO review) {

		return boardReviewMapper.updateReview(review);
	}

	@Override
	public int deleteReview(int ridx) {

		return boardReviewMapper.deleteReview(ridx);
	}

	@Override
	public int updateReadnum(Integer ridx) {

		return boardReviewMapper.updateReadnum(ridx);
	}

	@Override
	public BoardReviewVO selectBoardByIdx(Integer ridx) {

		return boardReviewMapper.selectBoardByIdx(ridx);
	}

	@Override
	public BoardReviewVO getReviewVO(BoardReviewVO review) {

		return boardReviewMapper.getReviewVO(review);
	}

	@Override
	public int like_check(BoardReviewVO review) {
		// TODO Auto-generated method stub
		return boardReviewMapper.like_check(review);
	}

	@Override
	public int like_check_cancel(BoardReviewVO review) {
		// TODO Auto-generated method stub
		return boardReviewMapper.like_check_cancel(review);
	}
	
	
	
	@Override
	public List<ReviewImageVO> getReviewImages(Integer ridx) {
		// TODO Auto-generated method stub
		return boardReviewMapper.getReviewImages(ridx);
	}

	@Override
	public int insertImage(ReviewImageVO riVo) {

		return boardReviewMapper.insertRimage(riVo);
	}

	@Override
	public ReviewImageVO uploadImage(MultipartFile mf, HttpServletRequest req) {

		ReviewImageVO riVo = new ReviewImageVO();

		ServletContext app = req.getServletContext();
		String upDir = app.getRealPath("/resources/Review_image");
		log.info("upDir===" + upDir);

		File dir = new File(upDir);
		if (!dir.exists()) {
			dir.mkdirs();// 업로드할 디렉토리 생성
		}

		/* 파일 이름 */
		String uploadFileName = mf.getOriginalFilename();
		riVo.setRoriginfilename(uploadFileName);

		/* uuid 적용 파일 이름 */
		String uuid = UUID.randomUUID().toString();
		uploadFileName = uuid + "_" + uploadFileName;
		riVo.setRimage(uploadFileName);
		String ThumbnailFileName = "Thumb_" + uploadFileName;
		riVo.setRthumbnail(ThumbnailFileName);

		/* 파일 저장 */
		try {
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(upDir, uploadFileName);

			if (checkImageType(saveFile)) {
				FileOutputStream thumbnail = new FileOutputStream(new File(upDir, ThumbnailFileName));
				Thumbnailator.createThumbnail(mf.getInputStream(), thumbnail, 100, 100);

			}
			mf.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return riVo;
	}

	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;

	}


	@Override
	public int insertReview(BoardReviewVO review, HttpServletRequest req) {
		// prod db에 먼저 저장
				int result = this.boardReviewMapper.insertReview(review);

				// pk 받아와서 변수에 저장
				int image_ridx = review.getRidx();

				if (result == 0)
					return 0;

				// 이미지 업로드
				List<MultipartFile> imageList = review.getRimage();
				if (imageList != null && !imageList.isEmpty()) {
					for (MultipartFile mf : imageList) {

						// 원본 이미지 저장
						ReviewImageVO riVo = uploadImage(mf, req);

						// 저장된 이름들 p i vo setter db에 저장
						riVo.setRidx(image_ridx);
						int result2 = insertImage(riVo);

						if (result2 == 0) {
							log.info(mf.getOriginalFilename() + " DB 저장 실패");

						}

					}
				}
				// 0:1
				return result;		
	}


	@Override
	public int getReviewCount(PagingVO paging) {
		
		return boardReviewMapper.getReviewCount(paging);
	}

}
