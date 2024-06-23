package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.exam.dto.review.ReviewDTO;

@Mapper
public interface ReviewMapper {

	public int reviewAdd( ReviewDTO dto);
	public List<ReviewDTO> reviewList(int id);
	public List<ReviewDTO> reviewList2(int id);
	public int deleteReview(ReviewDTO dto);
	public List<ReviewDTO> allReviewList();

}
