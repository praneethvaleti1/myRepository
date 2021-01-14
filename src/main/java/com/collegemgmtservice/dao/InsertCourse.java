package com.collegemgmtservice.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.collegemgmtservice.model.Course;

import java.util.Set;

public class InsertCourse 
{
	
	
	private  Map<String,String> depts;
	private  List<Integer> sems;
	
	public InsertCourse()
	{
		depts = new HashMap<>();
		sems = new ArrayList<>();
		depts.put("CS", "Computer Science");
		depts.put("IT", "Information and Technology");
		
		for(int semesters = 1 ;semesters<=3;semesters++)
			sems.add(semesters);
	}
	
	public List<Course> insertCourses()
	{
		List<Course> courseList = new ArrayList<>();
		for(Integer semester : sems)
		{
			Set<Entry<String, String>> departments = depts.entrySet();
			for(Entry<String, String> department :departments)
			{
				for(int i=1;i<=3;i++)
				{
					Course course = new Course(department.getKey()+semester+"0"+i, "course" + i, department.getValue(), "Semester-"+semester);
					courseList.add(course);
				}
			}
		}
		return courseList;
	}
}
