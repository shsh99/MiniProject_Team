package com.exam.dto.cart;

import java.util.List;

import org.apache.ibatis.type.Alias;

import com.exam.dto.course.CourseDTO;

@Alias("CartDTO")
public class CartDTO {

	int id;
	int us_id;
	int cs_id;
	
	List<CourseDTO> courseList;

	public CartDTO() {}

	public CartDTO(int id, int us_id, int cs_id, List<CourseDTO> courseList) {
		this.id = id;
		this.us_id = us_id;
		this.cs_id = cs_id;
		this.courseList = courseList;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUs_id() {
		return us_id;
	}

	public void setUs_id(int us_id) {
		this.us_id = us_id;
	}

	public int getCs_id() {
		return cs_id;
	}

	public void setCs_id(int cs_id) {
		this.cs_id = cs_id;
	}

	public List<CourseDTO> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<CourseDTO> courseList) {
		this.courseList = courseList;
	}

	@Override
	public String toString() {
		return "CartDTO [id=" + id + ", us_id=" + us_id + ", cs_id=" + cs_id + ", courseList=" + courseList + "]";
	}
	

	
}
