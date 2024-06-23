package com.exam.service.course;

import java.util.List;

import com.exam.dto.course.CourseDTO;

public interface CourseService {

	public List<CourseDTO> courseList(String category);
	public CourseDTO courseRetrieve(int id);
	public int addCourse(CourseDTO dto);
	public int updateCourse(CourseDTO dto);
	public int deleteCourse(CourseDTO dto);
	public int deleteAllCourse(CourseDTO dto);



}
