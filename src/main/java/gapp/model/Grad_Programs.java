package gapp.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "grad_progs")
public class Grad_Programs implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue
    private Integer id;
	
	private String prog_name;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="dept_id")
	private Department dept_id;
	
	public Grad_Programs(){}
	
	public Grad_Programs(String prog_name, Department dept_id) {
		super();
		this.prog_name = prog_name;
		this.dept_id = dept_id;
	}

	public String getProg_name() {
		return prog_name;
	}

	public void setProg_name(String prog_name) {
		this.prog_name = prog_name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Department getDept_id() {
		return dept_id;
	}

	public void setDept_id(Department dept_id) {
		this.dept_id = dept_id;
	}
	
	
}
