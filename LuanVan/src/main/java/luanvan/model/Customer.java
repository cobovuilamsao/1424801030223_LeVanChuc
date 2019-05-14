package luanvan.model;

import java.util.Collection;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.validator.constraints.Email;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Customers", schema = "dbo", catalog = "HieuBoyShop")
public class Customer implements java.io.Serializable {

	private static final long serialVersionUID = 6592837700550083314L;
	private String id;
	@Email
	private String email;
	private String password;
	private String fullName;
	private String photo;
	private String address;
	private String numberPhone;
	private Date birthday;
	private Integer gender;
	private Boolean activated;
	private Collection<Order> order;

	public Customer() {
	}

	public Customer(String id, String email, String password, String fullName, String address, String numberPhone,
			Date birthday, Boolean activated, Integer gender) {
		this.id = id;
		this.email = email;
		this.password = password;
		this.fullName = fullName;
		this.address = address;
		this.numberPhone = numberPhone;
		this.birthday = birthday;
		this.activated = activated;
		this.gender = gender;
	}

	public Customer(String id, String email, String password, String fullName, String photo, String address,
			String numberPhone, Date birthday, Boolean activated, Integer gender, Collection<Order> order) {
		this.id = id;
		this.email = email;
		this.password = password;
		this.fullName = fullName;
		this.photo = photo;
		this.address = address;
		this.numberPhone = numberPhone;
		this.birthday = birthday;
		this.activated = activated;
		this.gender = gender;
		this.order = order;
	}

	@Id

	@Column(name = "ID", unique = true, nullable = false, length = 20)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
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

	@Column(name = "FullName", nullable = false)
	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
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

	@Column(name = "Activated", nullable = false)
	public Boolean getActivated() {
		return this.activated;
	}

	public void setActivated(Boolean activated) {
		this.activated = activated;
	}

	@Column(name = "Gender", nullable = false)
	public Integer getGender() {
		return this.gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "customer")
	public Collection<Order> getOrder() {
		return order;
	}

	public void setOrder(Collection<Order> order) {
		this.order = order;
	}

}
