package com.collegemgmtservice.services;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.util.ResourceUtils;

import com.collegemgmtservice.model.Course;

public class AddCourses {

	private AddCourses()
	{
		super();
	}
	
	public static List<Course> readfromCsv() throws IOException
	{
		
		List<Course> courseList = new ArrayList<>();
		
		File file = ResourceUtils.getFile("classpath:config/courses.csv");
				 				 
		FileReader fReader = new FileReader(file);
		
		CSVParser parser = new CSVParser(fReader, CSVFormat.DEFAULT.withFirstRecordAsHeader());
		
		for(CSVRecord csvRecord : parser)
		{
			Course course = new Course();
			course.setCourseId(csvRecord.get("CourseId"));
			course.setCourseName(csvRecord.get("Course Name"));
			course.setDepartment(csvRecord.get("Department"));
			course.setSemester(csvRecord.get("Semester"));
			courseList.add(course);
		}
		
		parser.close();
		return courseList;
	}
}
