package com.exam.service.course;

import java.util.List;

import com.exam.dto.course.CourseDTO;

public interface CourseService {

	public List<CourseDTO> courseList(String category);
	public CourseDTO courseRetrieve(int id);
}
