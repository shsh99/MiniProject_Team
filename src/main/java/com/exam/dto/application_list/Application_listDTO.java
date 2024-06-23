package com.exam.dto.application_list;

import java.time.LocalDate;
import java.util.List;
import org.apache.ibatis.type.Alias;
import com.exam.dto.course.CourseDTO;

@Alias("Application_listDTO")
public class Application_listDTO {

    int id;
    int us_id;
    int cs_id;
    LocalDate application_date;
    String user_name; // 유저 이름 필드 추가

    List<CourseDTO> courseList;

	public Application_listDTO() {
	}

	public Application_listDTO(int id, int us_id, int cs_id, LocalDate application_date, String user_name,
			List<CourseDTO> courseList) {
		this.id = id;
		this.us_id = us_id;
		this.cs_id = cs_id;
		this.application_date = application_date;
		this.user_name = user_name;
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

	public LocalDate getApplication_date() {
		return application_date;
	}

	public void setApplication_date(LocalDate application_date) {
		this.application_date = application_date;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public List<CourseDTO> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<CourseDTO> courseList) {
		this.courseList = courseList;
	}

	@Override
	public String toString() {
		return "Application_listDTO [id=" + id + ", us_id=" + us_id + ", cs_id=" + cs_id + ", application_date="
				+ application_date + ", user_name=" + user_name + ", courseList=" + courseList + "]";
	}

	

    
}
