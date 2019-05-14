package luanvan.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Departments", schema = "dbo", catalog = "HieuBoyShop")
public class Department implements java.io.Serializable {

	private static final long serialVersionUID = 8281057723158888384L;
	private String id;
	private String nameDepartment;
	private Set<Employee> employee = new HashSet<Employee>(0);

	public Department() {
	}

	public Department(String id, String nameDepartment) {
		this.id = id;
		this.nameDepartment = nameDepartment;
	}

	public Department(String id, String nameDepartment, Set<Employee> employee) {
		this.id = id;
		this.nameDepartment = nameDepartment;
		this.employee = employee;
	}

	@Id

	@Column(name = "ID", unique = true, nullable = false, length = 12)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "NameDepartment", nullable = false)
	public String getNameDepartment() {
		return this.nameDepartment;
	}

	public void setNameDepartment(String nameDepartment) {
		this.nameDepartment = nameDepartment;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "department")
	public Set<Employee> getEmployee() {
		return this.employee;
	}

	public void setEmployee(Set<Employee> employee) {
		this.employee = employee;
	}

}
