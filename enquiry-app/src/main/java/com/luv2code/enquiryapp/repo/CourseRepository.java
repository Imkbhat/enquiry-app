package com.luv2code.enquiryapp.repo;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.luv2code.enquiryapp.domain.Course;

public interface CourseRepository extends JpaRepository<Course, Integer> {
	
	
	/** This is Known as QueryMethods.
	 * This Method findCourseListByInstitute_instituteId : here, find(select), By(By Column Name), instituteId(Key)
	 * Entity Course has Institute and Institute has InstituteId.
	 * @param instituteId
	 * @return
	 */
	
	public List<Course> findCourseListByInstitute_instituteId(Integer instituteId);
	
	//Another Approach
	@Query("SELECT c.courseId AS courseId, c.name AS name, c.fees AS fees, c.institute.name AS instituteName FROM Course AS c")
	public List<Map<String, Object>> getCourses();

}
