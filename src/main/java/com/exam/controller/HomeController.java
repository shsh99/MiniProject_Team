package com.exam.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.dto.course.CourseDTO;
import com.exam.service.course.CourseService;

@Controller
public class HomeController {
    
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    private final CourseService courseService;

    public HomeController(CourseService courseService) {
        this.courseService = courseService;
    }

    @GetMapping("/home")
    public String home(@RequestParam(required = false) String category,
                       @RequestParam(required = false) Boolean saleOnly,
                       ModelMap model) {
        
        List<CourseDTO> courseList = new ArrayList<>();
        
        // 전체 강의 목록 조회
        if (category == null || "all".equals(category)) {
            courseList.addAll(courseService.courseList("front"));
            courseList.addAll(courseService.courseList("back"));
        } else if ("front".equals(category) || "back".equals(category)) {
            courseList.addAll(courseService.courseList(category));
        }
        
        // saleOnly가 true이면 sale이 0보다 큰 강의만 필터링
        if (saleOnly != null && saleOnly) {
            courseList = courseList.stream()
                                   .filter(course -> course.getSale() > 0)
                                   .collect(Collectors.toList());
        }

        model.addAttribute("courseList", courseList);
        return "home";
    }
}
