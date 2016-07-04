package gapp.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "additional_field_values")
public class Additional_Field_Value implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue
    private Integer id;
	
	private String field_value;
	
	private byte[] extra_file;
	
	private String extraFileName;
	
	@ManyToOne
	@JoinColumn(name="add_info_field_id")
	private Additional_Info add_info_field_id;
	
	@ManyToOne
	@JoinColumn(name="applications_field_id")
	private Application applications_field_id;
	
	public Additional_Field_Value(){	
	}

	public Additional_Field_Value(String field_value, byte[] extra_file, String extraFileName,
			Additional_Info add_info_field_id, Application applications_field_id) {
		this.field_value = field_value;
		this.extra_file = extra_file;
		this.extraFileName = extraFileName;
		this.add_info_field_id = add_info_field_id;
		this.applications_field_id = applications_field_id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getField_value() {
		return field_value;
	}

	public void setField_value(String field_value) {
		this.field_value = field_value;
	}

	public Additional_Info getAdd_info_field_id() {
		return add_info_field_id;
	}

	public void setAdd_info_field_id(Additional_Info add_info_field_id) {
		this.add_info_field_id = add_info_field_id;
	}

	public Application getApplications_field_id() {
		return applications_field_id;
	}

	public void setApplications_field_id(Application applications_field_id) {
		this.applications_field_id = applications_field_id;
	}

	public byte[] getExtra_file() {
		return extra_file;
	}

	public void setExtra_file(byte[] extra_file) {
		this.extra_file = extra_file;
	}

	public String getExtraFileName() {
		return extraFileName;
	}

	public void setExtraFileName(String extraFileName) {
		this.extraFileName = extraFileName;
	}

}
