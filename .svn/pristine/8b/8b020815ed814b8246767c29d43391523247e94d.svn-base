package gapp.model.dao;

import java.util.List;

import gapp.model.Additional_Info;
import gapp.model.Department;
import gapp.model.Grad_Programs;

public interface DepartmentDao {

	Department getDept( Integer id );
	
	List<Department> getDepartments();
	
	List<Grad_Programs> getPrograms();
	
	List<Grad_Programs> getPrograms( Integer id );
	
	List<Grad_Programs> getPrograms( String deptName );
	
	Department saveDepartment( Department dept );
	
	Additional_Info saveAdditionalInfo ( Additional_Info addinfo );
	
	Grad_Programs savePrograms ( Grad_Programs programs );
	
	Grad_Programs getProgram ( Integer id );
	
	Additional_Info getAddInfo ( Integer id );
	
	void removeProgram (Grad_Programs deptPrograms );
	
	void removeAddInfo ( Additional_Info addinfo );
	
}
