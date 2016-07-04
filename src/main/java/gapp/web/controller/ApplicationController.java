package gapp.web.controller;

//import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
//import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import gapp.model.Academic_records;
import gapp.model.Additional_Field_Value;
import gapp.model.Additional_Info;
import gapp.model.Application;
import gapp.model.Degree;
import gapp.model.Department;
import gapp.model.Grad_Programs;
import gapp.model.Status;
import gapp.model.User;
import gapp.model.dao.ApplicationDao;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.UserDao;

@Controller
@SessionAttributes("app")
public class ApplicationController {

	@Autowired
	ApplicationDao appDao;

	@Autowired
	DepartmentDao deptDao;

	@Autowired
	UserDao userDao;

	/*@Autowired
	private ServletContext context;*/

	//--------------Add New Application-------------

	@RequestMapping(value = "/application/application.html", method = RequestMethod.GET)
	public String addApplication( ModelMap models, HttpSession session )
	{
		String userMail = (String) session.getAttribute("email_id");

		models.put( "depts", deptDao.getDepartments() );
		models.put( "user", userDao.getUser(userMail) );
		models.put( "app", new Application() );
		return "application/application";
	}

	@RequestMapping(value = "/application/application.html", method = RequestMethod.POST)
	public String addApplication( @ModelAttribute Application app, HttpSession session )
	{
		String userMail = (String) session.getAttribute("email_id");
		app.setStudent(userDao.getUser(userMail));

		String deptName = app.getDept_id().getDept_name();
		Department depts = appDao.getDept(deptName);
		app.setDept_id(depts);

		String progName = app.getProg_id().getProg_name();
		Grad_Programs progs = appDao.getprog(progName);
		app.setProg_id(progs);
		
		Application a = appDao.saveApp( app );
		Integer app_id = a.getId();
		
		long timeStamp = System.currentTimeMillis();
		String ts = timeStamp + "";

		Status status = new Status();
		status.setStatus("Not Submitted");
		status.setTime_stamp(ts);
		status.setApplications_status_id(appDao.getAppId(app_id));
		appDao.saveStatus(status);
		
		
		return "redirect:/application/addDegrees.html?app_id="+app_id+"";
	}

	//--------------Get Programs for Selected Department-------------

	@RequestMapping(value = "/application/getProgforDept.html", method = RequestMethod.GET)
	public @ResponseBody
	String findAllPrograms(@RequestParam(value = "deptName", required = true) String dept) {
		List<Grad_Programs> progs = this.deptDao.getPrograms(dept);

		List<String> progNames = new ArrayList<String>();
		for( Grad_Programs gp:progs ){
			progNames.add( gp.getProg_name() );
		}
		String json = new Gson().toJson(progNames );
		return json;
	}

	//--------------Add Educational Background-------------

	@RequestMapping(value = "/application/addDegrees.html", method = RequestMethod.GET)
	public String addDegrees( @RequestParam Integer app_id, ModelMap models )
	{
		models.put( "app", appDao.getAppId( app_id ) );
		models.put( "degrees", new Degree() );

		return "application/addDegrees";
	}

	@RequestMapping(value = "/application/addDegrees.html", method = RequestMethod.POST, params = { "add" })
	public String addDegrees( @RequestParam Integer app_id, @ModelAttribute Degree degree )
	{
		if( degree.getDegree_name().equals("") && degree.getCollegeUniv_name().equals("") && 
				degree.getMajor_name().equals("") && degree.getDate_start().equals("") && degree.getDate_end().equals("")){
			System.out.println( "All Degree fields empty" );
		}
		else {
			degree.setApplication_degree(appDao.getAppId(app_id));
			appDao.saveDegrees(degree);
		}

		return "redirect:/application/addDegrees.html?app_id="+app_id+"";
	}

	@RequestMapping(value = "/application/addDegrees.html", method = RequestMethod.POST, params = { "save" })
	public String saveDegrees( @RequestParam Integer app_id, @ModelAttribute Degree degree )
	{
		if( degree.getDegree_name().equals("") && degree.getCollegeUniv_name().equals("") && 
				degree.getMajor_name().equals("") && degree.getDate_start().equals("") && degree.getDate_end().equals("")){
			System.out.println( "All Degree fields empty" );
		}
		else {
			degree.setApplication_degree(appDao.getAppId(app_id));
			appDao.saveDegrees(degree);
		}
		
		return "redirect:/application/addAddInfo.html?app_id="+app_id+"";
	}


	//--------------Add Additional Requirements to New Application-------------

	@RequestMapping(value = "/application/addAddInfo.html", method = RequestMethod.GET)
	public String addAddInfo( @RequestParam Integer app_id, ModelMap models, HttpSession session )
	{
		Department d = appDao.getAppId(app_id).getDept_id();

		models.put( "app", appDao.getAppId( app_id ) );
		models.put( "dept", appDao.getAppId(app_id).getDept_id() );

		models.put( "addInfos", d.getAdd_info() );
		models.put( "addInfoValue", new Additional_Field_Value() );
		//models.put( "addInfoValue", appDao.getAppId( app_id ).getAdd_field_value() );
		return "application/addAddInfo";
	}

	@RequestMapping( value = "/application/addAddInfo.html", method = RequestMethod.POST, params = { "fileType" } )
	public String fileAddInfo( @RequestParam Integer app_id, @RequestParam("file") MultipartFile[] files, 
			@ModelAttribute Additional_Field_Value addInfoValue ) throws IOException
	{

		Department d = appDao.getAppId(app_id).getDept_id();

		List<Additional_Info> addInfo = d.getAdd_info();
		String[] values = addInfoValue.getField_value().split(",");
		int i = 0;
		int j = 0;
		for( Additional_Info info : addInfo ) {
			System.out.print( info.getField_name() );

			addInfoValue.setApplications_field_id(appDao.getAppId(app_id));
			addInfoValue.setAdd_info_field_id(info);

			if ( files != null && files.length > 0 ) {
				if(info.getField_type().equals("File")){
					addInfoValue.setExtraFileName( files[j].getOriginalFilename() );
					addInfoValue.setExtra_file( files[j].getBytes() );
					addInfoValue.setField_value(null);
					j++;
				}
				else{
					addInfoValue.setField_value(values[i]);
					addInfoValue.setExtraFileName(null);
					addInfoValue.setExtra_file(null);
					i++;
				}

			}

			appDao.saveAddInfo(addInfoValue);	

		}
		return "redirect:/application/addRecords.html?app_id="+app_id+"";
	}

	@RequestMapping( value = "/application/addAddInfo.html", method = RequestMethod.POST, params = { "stringType" })
	public String stringAddInfo( @RequestParam Integer app_id, @ModelAttribute Additional_Field_Value addInfoValue )
	{

		Department d = appDao.getAppId(app_id).getDept_id();
		//Integer id = (Integer)session.getAttribute("id");
		List<Additional_Info> addInfo = d.getAdd_info();
		String[] values = addInfoValue.getField_value().split(",");
		int i = 0;
		for( Additional_Info info : addInfo ) {
			//System.out.print( info.getField_name() );

			//addInfoValue.setAdd_info_field_id(addInfo);
			addInfoValue.setApplications_field_id( appDao.getAppId(app_id) );
			addInfoValue.setAdd_info_field_id( info );
			addInfoValue.setField_value( values[i] );
			//System.out.println(addInfoValue.getField_value());

			//System.out.println("inside post");
			appDao.saveAddInfo( addInfoValue );
			i++;
		}
		return "redirect:/application/addRecords.html?app_id="+app_id+"";
	}


	//--------------Add Academic Records to New Application-------------

	@RequestMapping(value = "/application/addRecords.html", method = RequestMethod.GET)
	public String addRecords( @RequestParam Integer app_id, ModelMap models, HttpSession session )
	{
		models.put( "app", appDao.getAppId( app_id ) );
		models.put( "records", new Academic_records() );
		return "application/addRecords";
	}

	@RequestMapping( value = "/application/addRecords.html", method = RequestMethod.POST, params = { "save" } )
	public String saveRecords( @RequestParam Integer app_id, @RequestParam MultipartFile file,  @ModelAttribute Academic_records records ) throws IOException
	{
		/*String transcriptName = file.getOriginalFilename();
		file.transferTo( new File(getFileDirectory(), file.getOriginalFilename() ) );
		records.setFileName( transcriptName );*/

		if( records.getGpa().equals("") && records.getToefl_score().equals("") && records.getGre_score().equals("") 
				&& ( file.getBytes().length == 0 ) ){
			System.out.println( "All fields empty" );
		}

		records.setFileName(file.getOriginalFilename());
		records.setTranscript(file.getBytes());

		Academic_records record = appDao.saveRecords(records);
		Application a = appDao.getAppId(app_id);
		a.setRecord_id(record);

		/*Application a = appDao.getAppId(app_id);
        byte[] bFile = file.getBytes();

        if(bFile.length != 0){
        	System.out.println("not null");
        	records.setFileName( file.getOriginalFilename() );
        	records.setTranscript( bFile );
        	Academic_records record = appDao.saveRecords(records);
        	a.setRecord_id(record);

        }
       else {
        	System.out.println("null");

        }*/

		long timeStamp = System.currentTimeMillis();
		String ts = timeStamp + "";

		Status status = a.getStatus().get(0);
		status.setStatus("Not Submitted");
		status.setTime_stamp(ts);
		//status.setApplications_status_id(a);
		appDao.saveStatus(status);

		appDao.saveApp( a );

		return "redirect:/user/studentDetails.html";
		//return "redirect:/application/addAddInfo.html?app_id="+app_id+"";
	}

	@RequestMapping( value = "/application/addRecords.html", method = RequestMethod.POST, params = { "submit" } )
	public String addRecords( @RequestParam Integer app_id, @RequestParam MultipartFile file,  @ModelAttribute Academic_records records ) throws IOException
	{
		/*String transcriptName = file.getOriginalFilename();
		file.transferTo( new File(getFileDirectory(), file.getOriginalFilename() ) );
		records.setFileName( transcriptName );*/

		records.setFileName(file.getOriginalFilename());
		records.setTranscript(file.getBytes());

		Academic_records record = appDao.saveRecords(records);
		Application a = appDao.getAppId(app_id);
		a.setRecord_id(record);

		/*Application a = appDao.getAppId(app_id);
        byte[] bFile = file.getBytes();

        if(bFile.length != 0){
        	System.out.println("not null");
        	records.setFileName( file.getOriginalFilename() );
        	records.setTranscript( bFile );
        	Academic_records record = appDao.saveRecords(records);
        	a.setRecord_id(record);

        }
       else {
        	System.out.println("null");

        }*/

		long timeStamp = System.currentTimeMillis();
		String ts = timeStamp + "";

		Status status = new Status();
		status.setStatus("New");
		status.setComments( "The application is submitted by the student");
		status.setTime_stamp(ts);
		status.setApplications_status_id(a);
		appDao.saveStatus(status);

		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		String dateSubmitted = dateFormat.format(new Date());

		a.setDate_submitted( dateSubmitted );
		appDao.saveApp( a );

		return "redirect:/user/studentDetails.html";
		//return "redirect:/application/addAddInfo.html?app_id="+app_id+"";
	}

	//--------------Get the File directory----------------

	/*private File getFileDirectory()
	{
		String path = context.getRealPath( "/WEB-INF/files" );
		return new File(path);

	}*/

	/*//--------------Upload File to Records--------------------

	@RequestMapping("/application/upload.html")
	public String upload( @RequestParam MultipartFile file, ModelMap models, HttpSession session  ) 
			throws IOException
	{	
		file.transferTo( new File(getFileDirectory(), file.getOriginalFilename() ) );

		return "redirect:/application/addRecords.html";

	}*/

	//--------------Edit Application-------------

	@RequestMapping(value = "/application/editApplication.html", method = RequestMethod.GET)
	public String editApplication( @RequestParam Integer id, ModelMap models, HttpSession session )
	{
		String userMail = (String) session.getAttribute("email_id");

		models.put( "dept", appDao.getAppId(id).getDept_id() );
		models.put( "progs", appDao.getAppId(id).getDept_id().getPrograms() );
		models.put( "user", userDao.getUser(userMail) );
		models.put( "app", appDao.getAppId(id));
		models.put("record", appDao.getAppId(id).getRecord_id());

		//System.out.println("Record before"+appDao.getAppId(id).getRecord_id().getId());
		return "application/editApplication";
	}

	@RequestMapping(value = "/application/editApplication.html", method = RequestMethod.POST)
	public String editApplication( @ModelAttribute Application app, HttpSession session )
	{
		String userMail = (String) session.getAttribute("email_id");
		//app.setStudent(userDao.getUser(userMail));

		User u = userDao.getUser(userMail);
		app.setStudent(u);

		String deptName = app.getDept_id().getDept_name();
		//System.out.println( deptName );
		Department depts = appDao.getDept(deptName);
		app.setDept_id( depts );

		String progName = app.getProg_id().getProg_name();
		Grad_Programs progs = appDao.getprog(progName);
		app.setProg_id(progs);

		Application a = appDao.saveApp( app );
		Integer app_id = a.getId();
		return "redirect:/application/editDegrees.html?app_id="+app_id+"";

	}

	//--------------Edit Degrees---------------------------

	@RequestMapping("/application/editDegrees.html")
	public String editDegrees( @RequestParam Integer app_id, ModelMap models )
	{
		models.put( "app", appDao.getAppId( app_id ) );
		//System.out.println(appDao.getAppId(app_id).getRecord_id());

		return "application/editDegrees";
	}

	//--------------Add Degrees while editing-------------

	@RequestMapping(value = "/application/editAddDegrees.html", method = RequestMethod.GET)
	public String editAddDegrees( @RequestParam Integer app_id, ModelMap models )
	{
		models.put( "app", appDao.getAppId( app_id ) );
		models.put( "degrees", new Degree() );

		return "application/editAddDegrees";
	}

	@RequestMapping(value = "/application/editAddDegrees.html", method = RequestMethod.POST, params = { "add" })
	public String addEditDegrees( @RequestParam Integer app_id, @ModelAttribute Degree degree )
	{
		if( degree.getDegree_name().equals("") && degree.getCollegeUniv_name().equals("") && 
				degree.getMajor_name().equals("") && degree.getDate_start().equals("") && degree.getDate_end().equals("")){
			System.out.println( "All Degree fields empty" );
		}
		else
		{
			degree.setApplication_degree(appDao.getAppId(app_id));
			appDao.saveDegrees(degree);
		}

		return "redirect:/application/editAddDegrees.html?app_id="+app_id+"";
	}

	@RequestMapping(value = "/application/editAddDegrees.html", method = RequestMethod.POST, params = { "save" })
	public String saveEditDegrees( @RequestParam Integer app_id, @ModelAttribute Degree degree )
	{
		if( degree.getDegree_name().equals("") && degree.getCollegeUniv_name().equals("") && 
				degree.getMajor_name().equals("") && degree.getDate_start().equals("") && degree.getDate_end().equals("")){
			System.out.println( "All Degree fields empty" );
		}
		else
		{
			degree.setApplication_degree(appDao.getAppId(app_id));
			appDao.saveDegrees(degree);
		}

		return "redirect:/application/editDegrees.html?app_id="+app_id+"";
	}

	//--------------Remove Degrees-------------

	@RequestMapping("/application/removeDegrees.html")
	public String removeDegree( @RequestParam Integer id1, @RequestParam Integer id2, @ModelAttribute Degree degrees )
	{
		degrees.setId(id2);
		Application appid = appDao.getAppId(id1);
		degrees.setApplication_degree(appid);
		appDao.removeDegree(degrees);

		return "redirect:/application/editDegrees.html?app_id="+id1+"";
	}

	//--------------Edit Additional Requirements---------------------------

	@RequestMapping(value = "/application/editAddRequirement.html", method = RequestMethod.GET)
	public String editAddInfo( @RequestParam Integer app_id/*, @RequestParam Integer id2,*/ , ModelMap models, HttpSession session )
	{
		Department d = appDao.getAppId(app_id).getDept_id();

		models.put( "app", appDao.getAppId( app_id ) );
		models.put( "dept", appDao.getAppId(app_id).getDept_id() );

		models.put( "addInfos", d.getAdd_info() );
		models.put( "addInfoValue", appDao.getAppId(app_id).getAdd_field_value() );
		//models.put( "addInfoValue", appDao.getFieldValue(id2).getId() );
		//List<Additional_Field_Value> afv = appDao.getAppId(app_id).getAdd_field_value();
		
		//System.out.println( "Additional field value 1 : " + appDao.getAppId(app_id).getAdd_field_value().get(0).getExtraFileName() );
		return "application/editAddRequirement";
	}

	@RequestMapping( value = "/application/editAddRequirement.html", method = RequestMethod.POST, params = { "fileType" } )
	public String editFileAddInfo( @RequestParam Integer app_id, @RequestParam("file") MultipartFile[] files, 
			@ModelAttribute Additional_Field_Value addInfoValue, HttpServletRequest request ) throws IOException
	{
		List<Additional_Field_Value> afv = appDao.getAppId(app_id).getAdd_field_value();
		//String noVal = request.getParameter("fieldVal0");
		//String strVal = request.getParameter("fieldValString0");
		
		Department d = appDao.getAppId(app_id).getDept_id();

		List<Additional_Info> addInfo = d.getAdd_info();
		//String[] values = addInfoValue.getField_value().split(",");
		//int i = 0;
		int i = 0;
		int j = 0;
		int k = 0;
		int x = 0;
		for( Additional_Info info : addInfo ) {
			System.out.print( info.getField_name() );
			
			if ( files != null && files.length > 0 ) {
				if(info.getField_type().equals("File")){
					afv.get(k).setExtraFileName( files[x].getOriginalFilename() );
					afv.get(k).setExtra_file( files[x].getBytes() );
					afv.get(k).setField_value(null);
					x++;
					k++;
				}
				/*else {
					//addInfoValue.setField_value(values[i]);
					addInfoValue.setExtraFileName(null);
					addInfoValue.setExtra_file(null);
					//i++;
				}*/
				
				else if(info.getField_type().equals("Number")){
					String noVal = request.getParameter("fieldVal"+i);
					afv.get(k).setField_value(noVal);
					afv.get(k).setExtraFileName(null);
					afv.get(k).setExtra_file(null);
					i++;
					k++;
				}
				else{
					String strVal = request.getParameter("fieldValString"+j);
					afv.get(k).setField_value(strVal);
					afv.get(k).setExtraFileName(null);
					afv.get(k).setExtra_file(null);
					j++;
					k++;
				}

			}

			appDao.saveAddInfo(afv.get(k-1));
		}
		return "redirect:/application/editRecords.html?app_id="+app_id+"";
	}

	@RequestMapping( value = "/application/editAddRequirement.html", method = RequestMethod.POST, params = { "stringType" })
	public String editStringAddInfo( @RequestParam Integer app_id, @ModelAttribute Additional_Field_Value addInfoValue, HttpServletRequest request )
	{
		List<Additional_Field_Value> afv = appDao.getAppId(app_id).getAdd_field_value();
		//System.out.println( "Number : " + noVal );
		//System.out.println( "String : " + strVal );
		
		Department d = appDao.getAppId(app_id).getDept_id();
		//Integer id = (Integer)session.getAttribute("id");
		List<Additional_Info> addInfo = d.getAdd_info();
		//String[] values = addInfoValue.getField_value().split(",");
		int i = 0;
		int j = 0;
		int k = 0;
		for( Additional_Info info : addInfo ) {
			//System.out.print( info.getField_name() );

			//addInfoValue.setAdd_info_field_id(addInfo);
			/*addInfoValue.setApplications_field_id(appDao.getAppId(app_id));
			addInfoValue.setAdd_info_field_id(info);*/
			if(info.getField_type().equals("Number")){
				String noVal = request.getParameter("fieldVal"+i);
				afv.get(k).setField_value(noVal);
				i++;
				k++;
			}
			else{
				String strVal = request.getParameter("fieldValString"+j);
				afv.get(k).setField_value(strVal);
				j++;
				k++;
			}
			//addInfoValue.setField_value(values[i]);
			//System.out.println(addInfoValue.getField_value());

			//System.out.println("inside post");
			appDao.saveAddInfo(afv.get(k-1));
			
		}
		return "redirect:/application/editRecords.html?app_id="+app_id+"";
	}


	//--------------Edit Academic Records-------------------------------

	@RequestMapping(value = "/application/editRecords.html", method = RequestMethod.GET)
	public String editRecords( @RequestParam Integer app_id, ModelMap models, HttpSession session )
	{
		models.put( "app", appDao.getAppId( app_id ) );
		models.put("record", appDao.getAppId(app_id).getRecord_id());

		return "application/editRecords";
	}

	@RequestMapping( value = "/application/editRecords.html", method = RequestMethod.POST, params = { "save" } )
	public String saveEditRecords( @RequestParam Integer app_id, @RequestParam MultipartFile file,  @ModelAttribute Academic_records records ) throws IOException
	{
		/*String transcriptName = file.getOriginalFilename();
		file.transferTo( new File(getFileDirectory(), file.getOriginalFilename() ) );
		records.setFileName( transcriptName );*/


		Application a = appDao.getAppId(app_id);
		byte[] bFile = file.getBytes();

		Academic_records r = a.getRecord_id();

		r.setGpa(records.getGpa());
		r.setGre_score(records.getGre_score());
		r.setToefl_score(records.getToefl_score());

		if(bFile.length != 0){
			System.out.println("not null");
			r.setFileName( file.getOriginalFilename() );
			r.setTranscript( bFile );

		}
		else {
			System.out.println("null");

		}

		appDao.saveRecords(r);

		long timeStamp = System.currentTimeMillis();
		String ts = timeStamp + "";

		Status status = a.getStatus().get(0);
		status.setTime_stamp(ts);

		/*records.setFileName(file.getOriginalFilename());
        records.setTranscript(file.getBytes());

		Academic_records record = appDao.saveRecords(records);
		//Application a = appDao.getAppId(app_id);
		a.setRecord_id(record);*/

		/*Status status = new Status();
		status.setStatus("Not Submitted");*/
		//System.out.println("Recent ststaus: " + a.getStatus());
		//status.setApplications_status_id(a);
		//appDao.saveStatus(a.getStatus());

		appDao.saveApp( a );

		return "redirect:/user/studentDetails.html";
	}

	@RequestMapping( value = "/application/editRecords.html", method = RequestMethod.POST, params = { "submit" } )
	public String submitEdittedRecords( @RequestParam Integer app_id, @RequestParam MultipartFile file,  @ModelAttribute Academic_records records ) throws IOException
	{
		/*String transcriptName = file.getOriginalFilename();
		file.transferTo( new File(getFileDirectory(), file.getOriginalFilename() ) );
		records.setFileName( transcriptName );*/

		//-----------Upload file to database ------
		Application a = appDao.getAppId(app_id);
		byte[] bFile = file.getBytes();

		if(bFile.length != 0){
			System.out.println("not null");
			records.setFileName( file.getOriginalFilename() );
			records.setTranscript( bFile );
			Academic_records record = appDao.saveRecords(records);
			a.setRecord_id(record);

		}
		else {
			System.out.println("null");

		}

		/*records.setFileName(file.getOriginalFilename());
        records.setTranscript(file.getBytes());
        //fileUploadDao.save(uploadFile); 

        Academic_records record = appDao.saveRecords(records);
        Application a = appDao.getAppId(app_id);
        a.setRecord_id(record);*/

		long timeStamp = System.currentTimeMillis();
		String ts = timeStamp + "";

		Status status = new Status();
		status.setStatus("New");
		status.setComments( "The application is submitted by the student");

		status.setTime_stamp(ts);
		status.setApplications_status_id(a);
		appDao.saveStatus(status);

		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		String dateSubmitted = dateFormat.format(new Date());

		a.setDate_submitted( dateSubmitted );
		appDao.saveApp( a );

		return "redirect:/user/studentDetails.html";
	}


	//----------------------------Download files from Additional requirements-----------------------------

	@RequestMapping("/application/downloadAddRequirements.html")
	public String download( @RequestParam Integer id, ModelMap models, HttpSession session, HttpServletResponse response  ) 
			throws IOException
	{
		String extraFileName = appDao.getFieldValue(id).getExtraFileName();
		byte[] b = appDao.getFieldValue(id).getExtra_file();
		response.setContentType( "text/plain" );
		response.setHeader( "Content-Disposition",
				"attachment; filename="+extraFileName+"" );
		response.getOutputStream().write(b);
		response.getOutputStream().flush();

		return null;

	}

}



