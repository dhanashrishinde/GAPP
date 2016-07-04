package gapp.model.dao;

import java.util.List;

import gapp.model.Academic_records;
import gapp.model.Additional_Field_Value;
import gapp.model.Application;
import gapp.model.Degree;
import gapp.model.Department;
import gapp.model.Grad_Programs;
import gapp.model.Status;

public interface ApplicationDao {

	Department getDept( String dept_name );
	
	List<Application> getApplicationNo( Integer id, String term );
	
	Academic_records getRecords( Integer id );

	Application saveApp(Application app);
	
	Application getAppId ( Integer id );

	Degree saveDegrees(Degree degree);
	
	Grad_Programs getprog( String prog_name );

	Academic_records saveRecords(Academic_records records);
	
	Status saveStatus (Status status);

	void removeDegree(Degree degrees);
	
	Academic_records getRecord ( Integer id );

	Additional_Field_Value saveAddInfo(Additional_Field_Value addInfoValue);
	
	Additional_Field_Value getFieldValue ( Integer id );
	
	
}
