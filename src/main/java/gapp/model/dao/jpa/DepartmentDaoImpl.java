package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Additional_Info;
import gapp.model.Department;
import gapp.model.Grad_Programs;
import gapp.model.dao.DepartmentDao;

@Repository
public class DepartmentDaoImpl implements DepartmentDao{

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Department> getDepartments() {
		return entityManager.createQuery( "from Department order by id", Department.class )
				.getResultList();
	}

	@Override
	public Department getDept(Integer id) {
		return entityManager.find( Department.class, id );
	}

	@Override
	@Transactional
	public Department saveDepartment( Department dept ) {
		return entityManager.merge(dept);
	}

	@Override
	@Transactional
	public Additional_Info saveAdditionalInfo(Additional_Info addinfo) {
		return entityManager.merge(addinfo);
	}

	@Override
	@Transactional
	public Grad_Programs savePrograms(Grad_Programs programs) {
		return entityManager.merge(programs);
	}

	@Override
	public Grad_Programs getProgram(Integer id) {
		return entityManager.find( Grad_Programs.class, id );
	}

	@Override
	public Additional_Info getAddInfo(Integer id) {
		return entityManager.find( Additional_Info.class, id );
	}

	@Override
	@Transactional
	public void removeProgram(Grad_Programs programs) {
		programs.setDept_id(null);
		  entityManager.remove(entityManager.contains(programs)?programs:entityManager.merge(programs));			
	}

	@Override
	@Transactional
	public void removeAddInfo(Additional_Info addinfo) {
		addinfo.setDept_id(null);
		  entityManager.remove(entityManager.contains(addinfo)?addinfo:entityManager.merge(addinfo));
	}

	@Override
	public List<Grad_Programs> getPrograms() {
		return entityManager.createQuery( "from Grad_Programs order by id", Grad_Programs.class )
				.getResultList();
	}

	@Override
	public List<Grad_Programs> getPrograms(Integer id) {
		return entityManager.createQuery( "from Grad_Programs where dept_id.id = :dept ", Grad_Programs.class )
				.setParameter("dept", id)
				.getResultList();
	}

	@Override
	public List<Grad_Programs> getPrograms(String deptName) {
		return entityManager.createQuery("from Department where dept_name = :name",Department.class).setParameter("name", deptName).getSingleResult().getPrograms();
	}

}
