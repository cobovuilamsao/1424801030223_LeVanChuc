package luanvan.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Email;

@Entity
@Table(name = "Admin", schema = "dbo", catalog = "HieuBoyShop")
public class Admin implements java.io.Serializable {

	private static final long serialVersionUID = -456728136936818503L;

	@Email
	private String username;
	private String password;
	private String fullName;
	private Integer access;

	public Admin() {
	}

	public Admin(String username, String password, String fullName, Integer access) {
		this.username = username;
		this.password = password;
		this.fullName = fullName;
		this.access = access;
	}

	@Id

	@Column(name = "Username", unique = true, nullable = false, length = 50)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "Password", nullable = false, length = 50)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "FullName", nullable = false)
	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	@Column(name = "Access", nullable = false)
	public Integer getAccess() {
		return this.access;
	}

	public void setAccess(Integer access) {
		this.access = access;
	}

}
