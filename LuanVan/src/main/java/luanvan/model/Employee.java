package luanvan.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Employees", schema = "dbo", catalog = "HieuBoyShop")
public class Employee implements java.io.Serializable {

	private static final long serialVersionUID = -366138773887840922L;
	@NotEmpty
	private String id;
	private Department department;
	private EmployeeType employeeType;
	@Email
	private String email;
	private String password;
	private String nameEmployee;
	@NotNull
	private Integer gender;
	private String photo;
	private String address;
	private String numberPhone;
	@NotNull
	@DateTimeFormat(pattern = "dd/MM/yyyy" )
	private Date birthday;
	private Integer access;
	private Boolean activated;
	private Contract contract;
	private Set<Bonus> bonus = new HashSet<Bonus>(0);

	public Employee() {
	}

	Employee(String id, Department department, EmployeeType employeeType, String email, String password,
			String nameEmployee, Integer gender, String address, String numberPhone, Date birthday, Integer access,
			Boolean activated) {
		this.id = id;
		this.department = department;
		this.employeeType = employeeType;
		this.email = email;
		this.password = password;
		this.nameEmployee = nameEmployee;
		this.gender = gender;
		this.address = address;
		this.numberPhone = numberPhone;
		this.birthday = birthday;
		this.access = access;
		this.activated = activated;
	}

	public Employee(String id, Department department, EmployeeType employeeType, String email, String password,
			String nameEmployee, Integer gender, String photo, String address, String numberPhone, Date birthday,
			Integer access, Boolean activated, Contract contract, Set<Bonus> bonus) {
		this.id = id;
		this.department = department;
		this.employeeType = employeeType;
		this.email = email;
		this.password = password;
		this.nameEmployee = nameEmployee;
		this.gender = gender;
		this.photo = photo;
		this.address = address;
		this.numberPhone = numberPhone;
		this.birthday = birthday;
		this.access = access;
		this.activated = activated;
		this.contract = contract;
		this.bonus = bonus;
	}

	@Id

	@Column(name = "ID", unique = true, nullable = false, length = 20)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "DepartmentID", nullable = false)
	public Department getDepartment() {
		return this.department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "EmployeeTypeID", nullable = false)
	public EmployeeType getEmployeeType() {
		return this.employeeType;
	}

	public void setEmployeeType(EmployeeType employeeType) {
		this.employeeType = employeeType;
	}

	@Column(name = "Email", nullable = false)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "Password", nullable = false)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "NameEmployee", nullable = false)
	public String getNameEmployee() {
		return this.nameEmployee;
	}

	public void setNameEmployee(String nameEmployee) {
		this.nameEmployee = nameEmployee;
	}

	@Column(name = "Gender", nullable = false)
	public Integer getGender() {
		return this.gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	@Column(name = "Photo")
	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Column(name = "Address", nullable = false)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "NumberPhone", nullable = false)
	public String getNumberPhone() {
		return this.numberPhone;
	}

	public void setNumberPhone(String numberPhone) {
		this.numberPhone = numberPhone;
	}

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "Birthday", nullable = false, length = 23)
	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Column(name = "Access", nullable = false)
	public Integer getAccess() {
		return this.access;
	}

	public void setAccess(Integer access) {
		this.access = access;
	}

	@Column(name = "Activated", nullable = false)
	public Boolean getActivated() {
		return this.activated;
	}

	public void setActivated(Boolean activated) {
		this.activated = activated;
	}

	@OneToOne(fetch = FetchType.EAGER, mappedBy = "employee")
	public Contract getContract() {
		return this.contract;
	}

	public void setContract(Contract contract) {
		this.contract = contract;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "employee")
	public Set<Bonus> getBonus() {
		return this.bonus;
	}

	public void setBonus(Set<Bonus> bonus) {
		this.bonus = bonus;
	}

}
