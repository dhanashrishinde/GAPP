package gapp.web.controller;

//import java.io.File;
//import java.io.FileInputStream;
import java.io.IOException;
//import java.io.InputStream;
//import java.io.OutputStream;
import java.util.HashSet;
//import java.util.List;
import java.util.Set;

//import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import gapp.model.dao.ApplicationDao;
import gapp.model.dao.UserDao;
import gapp.web.validator.UserValidator;
import gapp.model.User;

@Controller
@SessionAttributes("user")
public class UserController {

	@Autowired
	private UserDao userDao;

	/*@Autowired
	private ServletContext context;*/

	@Autowired
	private ApplicationDao appDao;

	@Autowired
	private UserValidator userValidator;

	//------------------Index page-------------------------

	@RequestMapping("/index.html")
	public String index( ModelMap models )
	{
		return "/index";
	}

	//------------------User Registration -------------------------

	@RequestMapping(value = "/user/register.html", method = RequestMethod.GET)
	public String register( ModelMap models )
	{
		models.put( "user", new User() );
		return "user/register";
	}

	@RequestMapping(value = "/user/register.html", method = RequestMethod.POST)
	public String register( @ModelAttribute User user, BindingResult result, HttpSession session )
	{
		String email_id = user.getEmail_id().toLowerCase();

		userValidator.validate( user, result );
		if( result.hasErrors() ) return "user/register";

		if(userDao.getUser(email_id) != null)
		{
			userValidator.checkIfExist( user, result );
			if(result.hasErrors()) return "user/register";
			return "user/register";
		}

		else {
			Set<String> newSet = new HashSet<String>();
			newSet.add("Student");
			user.setRoles(newSet);
			user.setEmail_id(email_id);
			userDao.saveUser( user );
			return "redirect:/user/login.html";
		}

	}

	//------------------User Login -------------------------

	@RequestMapping(value = "/user/login.html", method = RequestMethod.GET)
	public String login( ModelMap models )
	{
		models.put( "user", new User() );
		return "user/login";
	}

	@RequestMapping(value = "/user/login.html", method = RequestMethod.POST)
	public String login( @ModelAttribute User user, BindingResult result, HttpSession session)
	{
		String email_id = user.getEmail_id().toLowerCase();

		userValidator.validateLogin( user, result );
		if( result.hasErrors() ) return "user/login";

		if(userDao.getUser(email_id) == null)
		{
			return "user/login";
		}
		else{

			if(!(userDao.getUser(email_id).getPassword().equals(user.getPassword())))
			{
				return "user/login";

			} 
			else {
				if(	userDao.getUser(email_id).isAdmin()	)
				{
					session.setAttribute("email_id", user.getEmail_id());
					return "redirect:home.html";
				}

				else if( userDao.getUser(email_id).isStaff())	
				{
					session.setAttribute("email_id", user.getEmail_id());
					return "redirect:staffManagement.html";
				}
				session.setAttribute("email_id", user.getEmail_id());
				return "redirect:studentDetails.html";
			}
		}
	}

	//------------------User Logout -------------------------

	@RequestMapping("/user/logout.html")
	public String logout( ModelMap models, HttpSession session ){
		System.out.println("inside logout");
		session.removeAttribute("email_id");
		session.invalidate();
		return "redirect:/";
	}

	//------------------Admin home page-------------------------

	@RequestMapping("/user/home.html")
	public String home( ModelMap models, HttpSession session )
	{
		return "user/home";

	}

	//------------------Staff Home page-------------------------

	@RequestMapping("/user/staffManagement.html")
	public String staffManagement( ModelMap models, HttpSession session )
	{
		return "user/staffManagement";
	}

	//------------------Student home page & Details-------------------------

	@RequestMapping("/user/studentDetails.html")
	public String studentDetails( ModelMap models, HttpSession session )
	{
		String emailid = (String) session.getAttribute("email_id");
		System.out.println(emailid);
		models.put( "user", userDao.getUser(emailid) );

		return "user/studentDetails";
	}

	//------------------Get user by email id-------------------------

	@RequestMapping("/user/users.html")
	public String users( ModelMap models, HttpSession session)
	{
		models.put( "users", userDao.getUser( "student1@localhost.localdomain" ));
		return "user/users";
	}

	//------------------List of Users-------------------------

	@RequestMapping("/user/list.html")
	public String list( ModelMap models )
	{
		models.put( "users", userDao.getUsers() );
		return "user/list";
	}

	//------------------Get Application Details-------------------------

	@RequestMapping("/user/applicationDetails.html")
	public String applicationDetails( @RequestParam Integer id, ModelMap models, HttpSession session )
	{
		String emailid = (String) session.getAttribute("email_id");
		System.out.println(emailid);
		models.put( "user", userDao.getUser(emailid) );
		models.put( "app", appDao.getAppId(id) );
		return "user/applicationDetails";
	}

	//------------------Get File path-------------------------

	/*private File getFileDirectory()
	{
		String path = context.getRealPath ( "/WEB-INF/files" );
		return new File(path);

	}*/

	//------------------File Download -------------------------

	@RequestMapping("/user/download.html")
	public String download( @RequestParam Integer id, ModelMap models, HttpSession session, HttpServletResponse response  ) 
			throws IOException
	{
		/*String transcriptName = appDao.getRecords(id).getFileName();
		response.setContentType( "text/plain" );
		response.setHeader( "Content-Disposition",
				"attachment; filename="+transcriptName+"" );

		FileInputStream in = new FileInputStream( new File ( getFileDirectory(), transcriptName ) ) ;
		OutputStream out = response.getOutputStream();

		byte buffer[] = new byte[2048];
		int bytesRead;
		while( (bytesRead = in.read( buffer )) > 0 )
			out.write( buffer, 0, bytesRead );

		in.close();

		return null;*/
		
		String transcriptName = appDao.getRecords(id).getFileName();
        byte[] b = appDao.getRecords(id).getTranscript();
        response.setContentType( "text/plain" );
        response.setHeader( "Content-Disposition",
				"attachment; filename="+transcriptName+"" );
        response.getOutputStream().write(b);
        response.getOutputStream().flush();
	        
	        return null;
		
	}


}