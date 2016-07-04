package gapp.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
/*import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;*/
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import javax.persistence.Table;

@Entity
@Table(name = "applications")
public class Application implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Integer id;

	private String date_submitted;
	private String term;

	private String firstName;
	private String lastName;
	private String emailId;
	private String CIN;
	private String gender;
	private String DateOfBirth;
	private String citizenship;
    private String phoneNo;
	
	private boolean is_International;

	@OneToMany(mappedBy = "applications_field_id")
	private List<Additional_Field_Value> add_field_value;

	@OneToOne
	@JoinColumn(name="dept_applications")
	private Department dept_id;

	@OneToOne
	@JoinColumn(name="applications_records")
	private Academic_records record_id;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="program_applications")
	private Grad_Programs prog_id;

	@ManyToOne
	@JoinColumn(name="student_applications")
	private User student;

	@OneToMany(mappedBy="application_degree")
	private List<Degree> degrees;

	@OneToMany(mappedBy="applications_status_id")
	private List<Status> status;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDate_submitted() {
		return date_submitted;
	}

	public void setDate_submitted(String date_submitted) {
		this.date_submitted = date_submitted;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public Department getDept_id() {
		return dept_id;
	}

	public void setDept_id(Department dept_id) {
		this.dept_id = dept_id;
	}

	public Academic_records getRecord_id() {
		return record_id;
	}

	public void setRecord_id(Academic_records record_id) {
		this.record_id = record_id;
	}

	public Grad_Programs getProg_id() {
		return prog_id;
	}

	public void setProg_id(Grad_Programs prog_id) {
		this.prog_id = prog_id;
	}

	public User getStudent() {
		return student;
	}

	public void setStudent(User student) {
		this.student = student;
	}

	public String getCIN() {
		return CIN;
	}

	public void setCIN(String cIN) {
		CIN = cIN;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDateOfBirth() {
		return DateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		DateOfBirth = dateOfBirth;
	}

	public String getCitizenship() {
		return citizenship;
	}

	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
	}

	public List<Degree> getDegrees() {
		return degrees;
	}

	public void setDegrees(List<Degree> degrees) {
		this.degrees = degrees;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public boolean isIs_International() {
		return is_International;
	}

	public void setIs_International(boolean is_International) {
		this.is_International = is_International;
	}

	public List<Additional_Field_Value> getAdd_field_value() {
		return add_field_value;
	}

	public void setAdd_field_value(List<Additional_Field_Value> add_field_value) {
		this.add_field_value = add_field_value;
	}

	public List<Status> getStatus() {
		return status;
	}

	public void setStatus(List<Status> status) {
		this.status = status;
	}
	
	
}
