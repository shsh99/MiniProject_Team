package com.exam.dto.review;

import java.time.LocalDate;
import java.util.List;

import com.exam.dto.course.CourseDTO;

public class ReviewDTO {

	int id;
    int us_id; // 사용자 ID
    int cs_id; // 강의 ID
    LocalDate date;
    String re_title;
    String content;
    int rating;
    String login_id;
    
	List<CourseDTO> courseList;

	public ReviewDTO() {
	}

	public ReviewDTO(int id, int us_id, int cs_id, LocalDate date, String re_title, String content, int rating,
			String login_id, List<CourseDTO> courseList) {
		this.id = id;
		this.us_id = us_id;
		this.cs_id = cs_id;
		this.date = date;
		this.re_title = re_title;
		this.content = content;
		this.rating = rating;
		this.login_id = login_id;
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

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	public String getRe_title() {
		return re_title;
	}

	public void setRe_title(String re_title) {
		this.re_title = re_title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public List<CourseDTO> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<CourseDTO> courseList) {
		this.courseList = courseList;
	}

	@Override
	public String toString() {
		return "ReviewDTO [id=" + id + ", us_id=" + us_id + ", cs_id=" + cs_id + ", date=" + date + ", re_title="
				+ re_title + ", content=" + content + ", rating=" + rating + ", login_id=" + login_id + ", courseList="
				+ courseList + "]";
	}


    
}
