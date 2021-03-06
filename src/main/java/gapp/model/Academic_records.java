package gapp.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "academic_records")
public class Academic_records implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue
    private Integer id;
	
	private String toefl_score;
	
	private String gre_score;
	
	private String gpa;
	
	private byte[]  transcript;
	
	private String fileName;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getToefl_score() {
		return toefl_score;
	}

	public void setToefl_score(String toefl_score) {
		this.toefl_score = toefl_score;
	}

	public String getGre_score() {
		return gre_score;
	}

	public void setGre_score(String gre_score) {
		this.gre_score = gre_score;
	}

	public String getGpa() {
		return gpa;
	}

	public void setGpa(String gpa) {
		this.gpa = gpa;
	}

	public byte[] getTranscript() {
		return transcript;
	}

	public void setTranscript(byte[] transcript) {
		this.transcript = transcript;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}	
	
}
