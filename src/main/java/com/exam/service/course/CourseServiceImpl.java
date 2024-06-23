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

	@Override
	public int addCourse(CourseDTO dto) {
		return courseMapper.addCourse(dto);
	}

	@Override
	public int updateCourse(CourseDTO dto) {
		return courseMapper.updateCourse(dto);
	}

	@Override
	public int deleteCourse(CourseDTO dto) {
		return courseMapper.deleteCourse(dto);
	}

	@Override
	public int deleteAllCourse(CourseDTO dto) {
		return courseMapper.deleteAllCourse(dto);

	}
	



}
