package gapp.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "dept")
public class Department implements Serializable {
			
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue
    private Integer id;
	
	private String dept_name;
	
	private boolean is_gre_required;
	
	@OneToMany
	(mappedBy="dept_id")
	private List<Grad_Programs> programs;
	
	@OneToMany(mappedBy="dept_id")
	private List<Additional_Info> add_info;

	public Department () {}
	
	public Department(String dept_name, boolean is_gre_required, List<Grad_Programs> programs) {
		this.dept_name = dept_name;
		this.is_gre_required = is_gre_required;
		this.programs = programs;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public boolean isIs_gre_required() {
		return is_gre_required;
	}

	public void setIs_gre_required(boolean is_gre_required) {
		this.is_gre_required = is_gre_required;
	}

	public List<Additional_Info> getAdd_info() {
		return add_info;
	}

	public void setAdd_info(List<Additional_Info> add_info) {
		this.add_info = add_info;
	}

	public List<Grad_Programs> getPrograms() {
		return programs;
	}

	public void setPrograms(List<Grad_Programs> programs) {
		this.programs = programs;
	}
	
	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	
}
