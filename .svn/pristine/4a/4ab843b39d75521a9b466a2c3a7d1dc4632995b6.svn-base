package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Academic_records;
import gapp.model.Additional_Field_Value;
import gapp.model.Application;
import gapp.model.Degree;
import gapp.model.Department;
import gapp.model.Grad_Programs;
import gapp.model.Status;
import gapp.model.dao.ApplicationDao;

@Repository
public class ApplicationDaoImpl implements ApplicationDao{

	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public Department getDept(String dept_name) {
		 return entityManager.createQuery( "from Department where dept_name = :dept", Department.class )
				.setParameter("dept", dept_name)
	            .getSingleResult();
		
	}
	
	@Override
	public List<Application> getApplicationNo(Integer id, String term) {
		return entityManager.createQuery( "from Application where dept_id.id = :dept and term = :term", Application.class )
				.setParameter("dept", id)
				.setParameter("term", term)
				.getResultList();
	}

	@Override
	public Academic_records getRecords(Integer id) {
		return entityManager.find(Academic_records.class, id);
	}

	@Override
	@Transactional
	public Application saveApp(Application app) {
		return entityManager.merge(app);
	}

	@Override
	public Application getAppId(Integer id) {
		return entityManager.find(Application.class, id);
	}

	@Override
	@Transactional
	public Degree saveDegrees(Degree degree) {
		return entityManager.merge(degree);
	}
	
	@Override
	@Transactional
	public Academic_records saveRecords( Academic_records records) {
		return entityManager.merge(records);
	}

	@Override
	public Grad_Programs getprog(String prog_name) {
		 return entityManager.createQuery( "from Grad_Programs where prog_name = :prog", Grad_Programs.class )
					.setParameter("prog", prog_name)
		            .getSingleResult();
	}

	@Override
	@Transactional
	public Status saveStatus(Status status) {
		return entityManager.merge(status);
	}

	@Override
	@Transactional
	public void removeDegree(Degree degrees) {
		degrees.setApplication_degree(null);
		  entityManager.remove(entityManager.contains(degrees)?degrees:entityManager.merge(degrees));
		
	}

	@Override
	public Academic_records getRecord(Integer id) {
		
		return null;
	}

	@Override
	@Transactional
	public Additional_Field_Value saveAddInfo(Additional_Field_Value addInfoValue) {
		return entityManager.merge(addInfoValue);
		
	}

	@Override
	public Additional_Field_Value getFieldValue(Integer id) {
		return entityManager.find(Additional_Field_Value.class, id);
	}

}
