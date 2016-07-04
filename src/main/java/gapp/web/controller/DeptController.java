package gapp.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import gapp.model.Additional_Info;
import gapp.model.Department;
import gapp.model.Grad_Programs;
import gapp.model.dao.DepartmentDao;

@Controller
@SessionAttributes("dept")
public class DeptController {

	@Autowired
	DepartmentDao deptDao;

	//------------------Department List -------------------------

	@RequestMapping("dept/dlist.html")
	public String list( ModelMap models )
	{
		models.put( "depts", deptDao.getDepartments() );
		return "dept/dlist";
	}

	//------------------Department Details view -------------------------

	@RequestMapping("/dept/view.html")
	public String view1( @RequestParam Integer id, ModelMap models )
	{
		models.put( "dept", deptDao.getDept( id ) );
		return "dept/view";
	}

	@RequestMapping("/dept/{id}.html")
	public String view2( @PathVariable Integer id, ModelMap models )
	{
		return view1( id, models );
	}

	//------------------Add New Department-------------------------

	@RequestMapping(value = "/dept/addDept.html", method = RequestMethod.GET)
	public String addDept( ModelMap models )
	{
		models.put( "dept", new Department() );
		return "dept/addDept";
	}

	@RequestMapping(value = "/dept/addDept.html", method = RequestMethod.POST)
	public String addDept( @ModelAttribute Department dept, BindingResult result, HttpSession session )
	{
		Department d = deptDao.saveDepartment( dept );
		session.setAttribute("id", d.getId());
		return "redirect:/dept/addDeptProg.html";

	}

	//------------------Add New Program with Department-------------------------

	@RequestMapping(value = "/dept/addDeptProg.html", method = RequestMethod.GET)
	public String addDeptProg( ModelMap models, HttpSession session )
	{
		Integer id = (Integer)session.getAttribute("id");
		models.put( "dept", deptDao.getDept( id ) );
		models.put( "deptPrograms", new Grad_Programs() );
		return "dept/addDeptProg";
	}

	@RequestMapping(value = "/dept/addDeptProg.html", method = RequestMethod.POST, params = { "add" })
	public String addDeptProg( @ModelAttribute Grad_Programs deptPrograms, BindingResult result, HttpSession session )
	{
		Integer id = (Integer)session.getAttribute("id");
		deptPrograms.setDept_id(deptDao.getDept(id));
		deptDao.savePrograms(deptPrograms);

		return "redirect:/dept/addDeptProg.html";
	}

	@RequestMapping(value = "/dept/addDeptProg.html", method = RequestMethod.POST, params = { "save" })
	public String save( @ModelAttribute Grad_Programs deptPrograms, BindingResult result, HttpSession session )
	{
		Integer id = (Integer)session.getAttribute("id");
		deptPrograms.setDept_id(deptDao.getDept(id));
		deptDao.savePrograms(deptPrograms);

		return "redirect:/dept/addDeptInfo.html";
	}

	//------------------Add Additional Requirements with Department-------------------------

	@RequestMapping(value = "/dept/addDeptInfo.html", method = RequestMethod.GET)
	public String addDeptInfo( ModelMap models, HttpSession session )
	{
		Integer id = (Integer)session.getAttribute("id");
		models.put( "dept", deptDao.getDept( id ) );
		models.put( "deptInfo", new Additional_Info() );
		return "dept/addDeptInfo";
	}

	@RequestMapping(value = "/dept/addDeptInfo.html", method = RequestMethod.POST, params = { "add" })
	public String addDeptInfo( @ModelAttribute Additional_Info deptInfo, BindingResult result, HttpSession session )
	{
		Integer id = (Integer)session.getAttribute("id");
		deptInfo.setDept_id(deptDao.getDept(id));
		deptDao.saveAdditionalInfo( deptInfo );
		return "redirect:/dept/addDeptInfo.html";

	}


	@RequestMapping(value = "/dept/addDeptInfo.html", method = RequestMethod.POST, params = { "save" })
	public String saveDeptInfo( @ModelAttribute Additional_Info deptInfo, BindingResult result, HttpSession session )
	{
		Integer id = (Integer)session.getAttribute("id");
		deptInfo.setDept_id(deptDao.getDept(id));
		deptDao.saveAdditionalInfo( deptInfo );
		return "redirect:/dept/dlist.html";

	}

	//------------------Add New Program-------------------------

	@RequestMapping(value = "/dept/addPrograms.html", method = RequestMethod.GET)
	public String addPrograms( @RequestParam Integer id, ModelMap models )
	{
		models.put( "dept", deptDao.getDept( id ) );
		models.put( "deptPrograms", new Grad_Programs() );
		return "dept/addPrograms";
	}

	@RequestMapping(value = "/dept/addPrograms.html", method = RequestMethod.POST)
	public String addPrograms( @RequestParam Integer id, @ModelAttribute Grad_Programs deptPrograms, BindingResult result, SessionStatus sessionStatus )
	{
		deptPrograms.setDept_id(deptDao.getDept(id));
		deptDao.savePrograms(deptPrograms);
		sessionStatus.setComplete();
		return "redirect:/dept/view.html?id="+id+"";
	}

	//------------------Add Additional Requirements-------------------------

	@RequestMapping(value = "/dept/addInfo.html", method = RequestMethod.GET)
	public String addInfo( @RequestParam Integer id, ModelMap models )
	{
		models.put( "dept", deptDao.getDept( id ) );
		models.put( "deptInfo", new Additional_Info() );
		return "dept/addInfo";
	}

	@RequestMapping(value = "/dept/addInfo.html", method = RequestMethod.POST)
	public String addInfo( @RequestParam Integer id, @ModelAttribute Additional_Info deptInfo, BindingResult result, SessionStatus sessionStatus )
	{
		deptInfo.setDept_id(deptDao.getDept(id));
		deptDao.saveAdditionalInfo( deptInfo );
		sessionStatus.setComplete();
		return "redirect:/dept/view.html?id="+id+"";

	}

	//------------------Edit Department-------------------------

	@RequestMapping(value = "/dept/editDept.html", method = RequestMethod.GET)
	public String editDept( @RequestParam Integer id, ModelMap models )
	{
		models.put( "dept", deptDao.getDept(id) );
		return "dept/editDept";
	}

	@RequestMapping(value = "/dept/editDept.html", method = RequestMethod.POST)
	public String editDept( @RequestParam Integer id, @ModelAttribute Department dept, BindingResult result, HttpSession session )
	{
		deptDao.saveDepartment( dept );
		return "redirect:/dept/view.html?id="+id+"";

	}
	
	//------------------Edit Program-------------------------

	@RequestMapping(value = "/dept/editPrograms.html", method = RequestMethod.GET)
	public String editPrograms( @RequestParam Integer id1, @RequestParam Integer id2, ModelMap models )
	{
		models.put( "dept", deptDao.getDept( id1 ) );
		models.put( "deptPrograms", deptDao.getProgram( id2 ) );
		return "dept/editPrograms";
	}

	@RequestMapping(value = "/dept/editPrograms.html", method = RequestMethod.POST)
	public String editPrograms( @RequestParam Integer id1, @RequestParam Integer id2, @ModelAttribute Grad_Programs deptPrograms, SessionStatus sessionStatus )
	{
		deptPrograms.setId(id2);
		deptPrograms.setDept_id(deptDao.getDept(id1));
		deptDao.savePrograms(deptPrograms);
		sessionStatus.setComplete();
		return "redirect:/dept/view.html?id="+id1+"";

	}
	
	//------------------Edit Additional Requirements-------------------------

	@RequestMapping(value = "/dept/editAddInfo.html", method = RequestMethod.GET)
	public String editAddInfo( @RequestParam Integer id1, @RequestParam Integer id2, ModelMap models )
	{
		models.put( "dept", deptDao.getDept( id1 ) );
		models.put( "deptInfo", deptDao.getAddInfo( id2 ) );
		return "dept/editAddInfo";
	}

	@RequestMapping(value = "/dept/editAddInfo.html", method = RequestMethod.POST)
	public String editAddInfo( @RequestParam Integer id1, @RequestParam Integer id2, @ModelAttribute Additional_Info deptInfo, SessionStatus sessionStatus )
	{
		deptInfo.setId(id2);
		deptInfo.setDept_id(deptDao.getDept(id1));
		deptDao.saveAdditionalInfo(deptInfo);
		return "redirect:/dept/view.html?id="+id1+"";

	}
	
	//------------------Remove Program-------------------------

	@RequestMapping("/dept/removePrograms.html")
	public String removePrograms( @RequestParam Integer id1, @RequestParam Integer id2, @ModelAttribute Grad_Programs deptPrograms )
	{
		deptPrograms.setId(id2);
		deptPrograms.setDept_id(deptDao.getDept(id1));
		deptDao.removeProgram(deptPrograms);
		return "redirect:/dept/view.html?id="+id1+"";
	}
	
	//------------------Remove Additional Requirements-------------------------

	@RequestMapping("/dept/removeAddInfo.html")
	public String removeAddInfo( @RequestParam Integer id1, @RequestParam Integer id2, @ModelAttribute Additional_Info deptInfo )
	{
		deptInfo.setId(id2);
		deptInfo.setDept_id(deptDao.getDept(id1));
		deptDao.removeAddInfo(deptInfo);
		return "redirect:/dept/view.html?id="+id1+"";
	}

}
