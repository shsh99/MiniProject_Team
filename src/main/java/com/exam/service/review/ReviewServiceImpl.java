package com.exam.service.review;

import com.exam.dto.review.ReviewDTO;
import com.exam.mapper.ReviewMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

	ReviewMapper reviewMapper;
	
	public ReviewServiceImpl(ReviewMapper reviewMapper) {
		this.reviewMapper = reviewMapper;
	}

	@Override
	public int reviewAdd(ReviewDTO dto) {
		return reviewMapper.reviewAdd(dto);
	}

	@Override
	public List<ReviewDTO> reviewList(int id) {
		return reviewMapper.reviewList(id);
	}
	
	@Override
	public List<ReviewDTO> reviewList2(int id) {
		return reviewMapper.reviewList(id);
	}

	@Override
	public int deleteReview(ReviewDTO dto) {
		return reviewMapper.deleteReview(dto);
	}

	@Override
	public List<ReviewDTO> allReviewList() {
		return reviewMapper.allReviewList();
	}

	@Override
	public boolean isDuplicateItem(int us_id, int cs_id) {
        // 해당 사용자의 장바구니에 이미 동일 상품이 있는지 체크하는 로직
        List<ReviewDTO> reviewList = reviewMapper.reviewList2(us_id);
        for (ReviewDTO reviewItem : reviewList) {
            if (reviewItem.getCs_id() == cs_id) {
                return true; // 동일 상품이 존재하면 true 반환
            }
        }
        return false; // 동일 상품이 없으면 false 반환
    }

}
