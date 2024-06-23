package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.course.CourseDTO;

@Mapper
public interface CourseMapper {
	
	public List<CourseDTO> courseList(String category);
	public CourseDTO courseRetrieve(int id);
	public int addCourse(CourseDTO dto);
	public int updateCourse(CourseDTO dto);
	public int deleteCourse(CourseDTO dto);
	public int deleteAllCourse(CourseDTO dto);


}
