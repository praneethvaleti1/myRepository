package com.collegemgmtservice.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.collegemgmtservice.dao.CourseRepo;
import com.collegemgmtservice.dao.UserRepository;
import com.collegemgmtservice.model.Course;
import com.collegemgmtservice.model.User;
import com.collegemgmtservice.services.AddCourses;


@Controller
public class CollegeController {
	private static final String USER_ID = "userId";
	private static final String PASS = "password";
	private static final String FIRST_NAME = "name";
	private static final String AGE = "age";
	private static final String GENDER = "gender";
	private static final String PET_NAME = "petname";
	private static final String SEMESTER = "semester";
	private static final String DEPT = "department";
	private static final String ERROR_MESSAGE = "error";
	private static final String REDIRECT_LOGIN = "redirect:login";
	private static final String USER_IS_ADMIN = "userAdmin";
	private static final String ADMIN_USER_ID = "admin01";
	private static final String ADMIN_PASS = "AdminPass01@";
	private static final String ERROR_LOGIN_REQ = "You need to Login first";
	private static final String FORGOT_LABEL = "forgotpassword";
	private static final Logger log = LoggerFactory.getLogger(CollegeController.class);

	private HttpSession session;

	@Autowired
	private UserRepository userRepo;
	@Autowired
	private CourseRepo courseRepo;

	//http://localhost:8088/collegeService/login
	@RequestMapping("/login")
	public String index(ModelMap model)
	{
		return "login";
	}


	@RequestMapping(value = "/login", method =RequestMethod.POST )
	public String login(ModelMap model, HttpServletRequest request)
	{
		if (request.getParameter(USER_ID) != null && request.getParameter(PASS) != null) {

			String userId = request.getParameter(USER_ID);
			String password = request.getParameter(PASS);
			session = request.getSession();
			
			if(userId.equalsIgnoreCase(ADMIN_USER_ID))
				addDefaultAdminUser();
			
			try {
				Optional<User> user = userRepo.findById(userId);
				
				if(user.isPresent() && user.get().getPassword().equals(password))
				{					
					session.setAttribute(USER_ID, userId);
					return "redirect:home";
				}
				else
				{
					session.setAttribute(ERROR_MESSAGE,"Invalid login credentials");
				}
			}catch(NoSuchElementException exp)
			{
				log.error("Element not available",exp);
				session.setAttribute(ERROR_MESSAGE,"Invalid login credentials");
			}


		}

		return REDIRECT_LOGIN;

	}


	@RequestMapping("/forgotpassword")
	public String forgotPassword(ModelMap model)
	{
		return FORGOT_LABEL;
	}

	@RequestMapping(value = "/forgotpassword",method =RequestMethod.POST)
	public String forgotPassword(ModelMap model,HttpServletRequest request)
	{
		String userId = request.getParameter(USER_ID);
		String petName = request.getParameter(PET_NAME);

		Optional<User> user = userRepo.findById(userId);
		if(user.isPresent() && user.get().getUserId().equals(userId) && user.get().getPetName().equals(petName) ) 
		{
			model.addAttribute("resetPwd", "true");
			model.addAttribute(USER_ID, userId);
			model.addAttribute(PET_NAME, petName);
			session = request.getSession(false);
			session.setAttribute(USER_ID, user.get().getUserId());
		}
		else
		{
			model.addAttribute(ERROR_MESSAGE,"User Id/Security answer is invalid");
		}
		return FORGOT_LABEL;
	}
	@RequestMapping(value = "/resetpassword",method =RequestMethod.POST)
	public String resetPassword(ModelMap model, HttpServletRequest request)
	{
		String pwd = request.getParameter(PASS);
		session = request.getSession(false);
		if(session!=null)
		{
			User user = userRepo.findById(session.getAttribute(USER_ID).toString()).get();
			if(user!=null)
			{
				user.setPassword(pwd);
				userRepo.save(user);
				session.setAttribute("message","Password successfully changed");
				return login(model, request);
			}
		}
		model.addAttribute("errorMsg","Password Not Changed");
		return FORGOT_LABEL;
	}



	@RequestMapping("/register")
	public String register(ModelMap model)
	{
		return "register";
	}

	@RequestMapping(value= "/register",method = RequestMethod.POST)
	public String resgisterUser(ModelMap model, HttpServletRequest request)
	{
		User user = new User();

		session = request.getSession();

		user.setUserId(request.getParameter(USER_ID));
		user.setPassword(request.getParameter(PASS));
		user.setName(request.getParameter(FIRST_NAME));
		user.setGender(request.getParameter(GENDER));
		user.setAge(Integer.parseInt(request.getParameter(AGE).toString()));
		user.setSemester(request.getParameter(SEMESTER));
		user.setPetName(request.getParameter(PET_NAME));
		user.setDepartment( request.getParameter(DEPT));

		Optional<User> optional = userRepo.findById(user.getUserId());
		if(!optional.isPresent())
		{
			model.addAttribute(USER_ID,user.getUserId());
			session.setAttribute("message", "User successfully registered. Login to continue");
			userRepo.save(user);
			return REDIRECT_LOGIN;
		}
		else
		{
			model.addAttribute(ERROR_MESSAGE, "User already exists");

		}
		return "register";


	}
	@RequestMapping(value = "/home",method = RequestMethod.GET)
	public String home(ModelMap model,HttpServletRequest request)
	{

		session = request.getSession(false);
		if(isLoggedIn(session))
		{
			try {
				courseRepo.saveAll(AddCourses.readfromCsv());
			} catch (IOException e) {
				log.error("Error occured while saving", e);
			} 
			model.addAttribute(USER_IS_ADMIN,session.getAttribute(USER_ID).equals(ADMIN_USER_ID)?true:false);
			return "home";
		}
		else
		{
			model.addAttribute(ERROR_MESSAGE, ERROR_LOGIN_REQ);
			return REDIRECT_LOGIN;
		} 
	}

	@RequestMapping("/coursesearch")
	public String courseSearch(ModelMap model,HttpServletRequest request)
	{
		session = request.getSession(false);
		if(isLoggedIn(session))
		{
			model.addAttribute(USER_IS_ADMIN,session.getAttribute(USER_ID).equals(ADMIN_USER_ID)?true:false);
			return "coursesearch";
		}
		else
		{
			model.addAttribute(ERROR_MESSAGE, ERROR_LOGIN_REQ);
			return REDIRECT_LOGIN;
		} 
	}

	@RequestMapping(value = "/coursesearch", method = RequestMethod.POST)
	public String searchCourses(ModelMap model, HttpServletRequest request)
	{
		session = request.getSession(false);
		if(isLoggedIn(session))
		{
			String dept= request.getParameter(DEPT);
			String sem = request.getParameter(SEMESTER);
			List<Course>courses = courseRepo.findBySemester(sem).stream()
					.filter(course -> course.getDepartment().equals(dept))
					.collect(Collectors.toList());

			model.addAttribute("courses",courses);
			model.addAttribute("dept",dept);
			model.addAttribute("sem",sem);
			model.addAttribute(USER_IS_ADMIN,session.getAttribute(USER_ID).equals(ADMIN_USER_ID)?true:false);

			return "coursesearch";
		}
		else
		{
			model.addAttribute(ERROR_MESSAGE, ERROR_LOGIN_REQ);
			return REDIRECT_LOGIN;
		}
	}


	@RequestMapping(value="/studentlist")
	public String studentList(ModelMap model,HttpServletRequest request)
	{
		if(isLoggedIn(request.getSession(false)))
		{
			List<User> students = userRepo.findAll().stream()
					.filter(user->!user.getUserId().equals(ADMIN_USER_ID))					
					.collect(Collectors.toList());
			Collections.sort(students);
			if(!students.isEmpty())
				model.addAttribute("users",students);
			else
				model.addAttribute("isStudentListEmpty","true");
			model.addAttribute(USER_IS_ADMIN,true);
			return "studentlist";
		}
		else
		{
			model.addAttribute(ERROR_MESSAGE, ERROR_LOGIN_REQ);
			return REDIRECT_LOGIN;
		}
	}

	@RequestMapping(value = "/deleteuser")
	public String deleteStudent(ModelMap model, @RequestParam String userId, HttpServletRequest request)
	{
		session = request.getSession(false);
		if(isLoggedIn(request.getSession(false)))
		{
			userRepo.deleteById(userId);
			if(userRepo.findAll().size()==1)
			{
				session.setAttribute("isStudentListEmpty","true");
			}
			return "redirect:studentlist";
		}
		else
		{
			model.addAttribute(ERROR_MESSAGE, ERROR_LOGIN_REQ);
			return REDIRECT_LOGIN;
		}
	}

	@RequestMapping("/logout")
	public String logout(ModelMap model,HttpServletRequest request)
	{
		request.getSession(false).invalidate();
		return REDIRECT_LOGIN;
	}

	@RequestMapping("/cancel")
	public String cancel(ModelMap model,HttpServletRequest request)
	{
		return logout(model,request);
	}

	private boolean isLoggedIn(HttpSession session)
	{
		if(session.getAttribute(USER_ID)!=null)
			return true;
		else
			return false;
		//return session.getAttribute(USER_ID)!=null ? true : false;
	}

	private void addDefaultAdminUser()
	{
		User adminUser = new User(ADMIN_USER_ID,ADMIN_PASS,"Admin","Male",50,"PetName");
		userRepo.save(adminUser);
	}
}

