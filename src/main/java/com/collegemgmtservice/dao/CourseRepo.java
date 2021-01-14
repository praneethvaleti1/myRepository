package com.collegemgmtservice.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.collegemgmtservice.model.Course;

public interface CourseRepo extends CrudRepository<Course, String>{
	List<Course> findBySemester(String semester);
}
