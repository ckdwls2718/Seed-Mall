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
import com.product.model.ProductVO;
import com.product.service.ProductService;
import com.user.model.PagingVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Service
@Log4j
public class BoardReviewServiceImpl implements BoardReviewService {
	@Autowired
	BoardReviewMapper boardReviewMapper;
	
	@Autowired
	ProductService prodService;
	
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
	public List<BoardReviewVO> selectReviewByMidx(Integer midx) {
		List<BoardReviewVO> reviewArr = boardReviewMapper.selectReviewByMidx(midx);
		for(BoardReviewVO review : reviewArr) {
			List<ReviewImageVO> imageArr = getReviewImages(review.getRidx());
			review.setBoardReviewImageList(imageArr);
			ProductVO prod = prodService.selectByOidx(review.getOidx());
			review.setProd(prod);
			
		}
		return reviewArr;
	}
	
	@Override
	public List<BoardReviewVO> getReviewListTop(int top) {
		List<BoardReviewVO> reviewArr = boardReviewMapper.getReviewListTop(top);
		for(BoardReviewVO review : reviewArr) {
			List<ReviewImageVO> imageArr = getReviewImages(review.getRidx());
			review.setBoardReviewImageList(imageArr);
		}
		return reviewArr;
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
			dir.mkdirs();// ???????????? ???????????? ??????
		}

		/* ?????? ?????? */
		String uploadFileName = mf.getOriginalFilename();
		riVo.setRoriginfilename(uploadFileName);

		/* uuid ?????? ?????? ?????? */
		String uuid = UUID.randomUUID().toString();
		uploadFileName = uuid + "_" + uploadFileName;
		riVo.setRimage(uploadFileName);
		String ThumbnailFileName = "Thumb_" + uploadFileName;
		riVo.setRthumbnail(ThumbnailFileName);

		/* ?????? ?????? */
		try {
			/* ?????? ??????, ?????? ????????? ?????? File ?????? */
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
		// prod db??? ?????? ??????
				int result = this.boardReviewMapper.insertReview(review);

				// pk ???????????? ????????? ??????
				int image_ridx = review.getRidx();

				if (result == 0)
					return 0;
		
				// ????????? ?????????
				List<MultipartFile> imageList = review.getRimage();
				if (imageList != null && !imageList.get(0).isEmpty()) {
					for (MultipartFile mf : imageList) {

						// ?????? ????????? ??????
						ReviewImageVO riVo = uploadImage(mf, req);

						// ????????? ????????? p i vo setter db??? ??????
						riVo.setRidx(image_ridx);
						int result2 = insertImage(riVo);

						if (result2 == 0) {
							log.info(mf.getOriginalFilename() + " DB ?????? ??????");
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
