package luanvan.model;

import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Email;

@Entity
@Table(name = "Producers", schema = "dbo", catalog = "HieuBoyShop")
public class Producer implements java.io.Serializable {

	private static final long serialVersionUID = -8462373376182782228L;
	private Integer id;
	private String nameProducer;
	private String logo;
	private String address;
	@Email
	private String email;
	private String numberPhone;
	private Collection<Product> product;

	public Producer() {
	}

	public Producer(Integer id, String nameProducer, String address, String email, String numberPhone) {
		this.id = id;
		this.nameProducer = nameProducer;
		this.address = address;
		this.email = email;
		this.numberPhone = numberPhone;
	}

	public Producer(Integer id, String nameProducer, String logo, String address, String email, String numberPhone,
			Collection<Product> product) {
		this.id = id;
		this.nameProducer = nameProducer;
		this.logo = logo;
		this.address = address;
		this.email = email;
		this.numberPhone = numberPhone;
		this.product = product;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "NameProducer", nullable = false)
	public String getNameProducer() {
		return this.nameProducer;
	}

	public void setNameProducer(String nameProducer) {
		this.nameProducer = nameProducer;
	}

	@Column(name = "Logo")
	public String getLogo() {
		return this.logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	@Column(name = "Address", nullable = false)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "Email", nullable = false)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "NumberPhone", nullable = false)
	public String getNumberPhone() {
		return this.numberPhone;
	}

	public void setNumberPhone(String numberPhone) {
		this.numberPhone = numberPhone;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "producer")
	public Collection<Product> getProduct() {
		return product;
	}

	public void setProduct(Collection<Product> product) {
		this.product = product;
	}

}
