package gapp.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "status")
public class Status implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Integer id;

	private String status;

	private String time_stamp;

	private String comments;

	@ManyToOne
	@JoinColumn(name="user_status_id")
	private User user_status;

	@ManyToOne
	@JoinColumn(name="applications_status_id")
	private Application applications_status_id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTime_stamp() {
		return time_stamp;
	}

	public void setTime_stamp(String time_stamp) {
		this.time_stamp = time_stamp;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Application getApplications_status_id() {
		return applications_status_id;
	}

	public void setApplications_status_id(Application applications_status_id) {
		this.applications_status_id = applications_status_id;
	}


}
