package com.exam.service.course;

import java.util.List;

import org.springframework.stereotype.Service;

import com.exam.dto.course.CourseDTO;
import com.exam.mapper.CourseMapper;

@Service
public class CourseServiceImpl implements CourseService{

	CourseMapper courseMapper;
	
	public CourseServiceImpl(CourseMapper courseMapper) {
		this.courseMapper = courseMapper;
	}

	@Override
	public List<CourseDTO> courseList(String category) {
		return courseMapper.courseList(category);
	}

	@Override
	public CourseDTO courseRetrieve(int id) {
		return courseMapper.courseRetrieve(id);
	}

}
