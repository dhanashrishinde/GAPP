package gapp.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "degrees")
public class Degree implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private Integer id;

	private String collegeUniv_name;

	private String date_start;
	
	private String date_end;

	private String degree_name;

	private String major_name;
	
	@ManyToOne
	@JoinColumn(name="application_degree")
	private Application application_degree;

	public Application getApplication_degree() {
		return application_degree;
	}

	public void setApplication_degree(Application application_degree) {
		this.application_degree = application_degree;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDate_start() {
		return date_start;
	}

	public void setDate_start(String date_start) {
		this.date_start = date_start;
	}

	public String getDate_end() {
		return date_end;
	}

	public void setDate_end(String date_end) {
		this.date_end = date_end;
	}

	public String getDegree_name() {
		return degree_name;
	}

	public void setDegree_name(String degree_name) {
		this.degree_name = degree_name;
	}

	public String getMajor_name() {
		return major_name;
	}

	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}

	public String getCollegeUniv_name() {
		return collegeUniv_name;
	}

	public void setCollegeUniv_name(String collegeUniv_name) {
		this.collegeUniv_name = collegeUniv_name;
	}



}
