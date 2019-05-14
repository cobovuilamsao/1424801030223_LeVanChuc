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
@Table(name = "EmployeeTypes", schema = "dbo", catalog = "HieuBoyShop")
public class EmployeeType implements java.io.Serializable {

	private static final long serialVersionUID = -4250837235320825545L;
	private String id;
	private String nameEmployeeType;
	private Set<Employee> employee = new HashSet<Employee>(0);

	public EmployeeType() {
	}

	public EmployeeType(String id, String nameEmployeeType) {
		this.id = id;
		this.nameEmployeeType = nameEmployeeType;
	}

	public EmployeeType(String id, String nameEmployeeType, Set<Employee> employee) {
		this.id = id;
		this.nameEmployeeType = nameEmployeeType;
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

	@Column(name = "NameEmployeeType", nullable = false)
	public String getNameEmployeeType() {
		return this.nameEmployeeType;
	}

	public void setNameEmployeeType(String nameEmployeeType) {
		this.nameEmployeeType = nameEmployeeType;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "employeeType")
	public Set<Employee> getEmployee() {
		return this.employee;
	}

	public void setEmployee(Set<Employee> employee) {
		this.employee = employee;
	}

}
