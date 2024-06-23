package com.exam.service.review;

import java.util.List;

import com.exam.dto.review.ReviewDTO;

public interface ReviewService {

	public int reviewAdd( ReviewDTO dto);
	public List<ReviewDTO> reviewList(int id);
	public List<ReviewDTO> reviewList2(int id);
	public int deleteReview(ReviewDTO dto);
	public List<ReviewDTO> allReviewList();
	
    boolean isDuplicateItem(int us_id, int cs_id);

}
