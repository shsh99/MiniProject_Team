package com.exam.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.dto.course.CourseDTO;
import com.exam.service.course.CourseService;

@Controller
public class CourseRetrieveController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	CourseService courseService;
	
	public CourseRetrieveController(CourseService courseService) {
		this.courseService = courseService;
	}


	@GetMapping("/courseRetrieve")
	public String courseRetrieve(@RequestParam int id, ModelMap m) {
		
		CourseDTO dto =courseService.courseRetrieve(id);
		m.addAttribute("courseRetrieve", dto);
		return "courseRetrieve";
	}


}
