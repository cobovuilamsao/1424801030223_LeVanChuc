package luanvan.model;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Orders", schema = "dbo", catalog = "HieuBoyShop")
public class Order implements java.io.Serializable {

	private static final long serialVersionUID = -1000948805752937489L;
	private Integer id;
	private Customer customer;
	private Date orderDate;
	private Date requireDate;
	private Double amount;
	private String receiver;
	private String address;
	private String description;
	private String numberPhone;
	private Integer status;
	private Collection<OrderDetail> orderDetail;

	public Order() {
	}

	public Order(Integer id, Customer customer, Date orderDate, Date requireDate, Double amount, String receiver,
			String address, String description, String numberPhone, Integer status) {
		this.id = id;
		this.customer = customer;
		this.orderDate = orderDate;
		this.requireDate = requireDate;
		this.amount = amount;
		this.receiver = receiver;
		this.address = address;
		this.description = description;
		this.numberPhone = numberPhone;
		this.status = status;
	}

	public Order(Integer id, Customer customer, Date orderDate, Date requireDate, Double amount, String receiver,
			String address, String description, String numberPhone, Integer status,
			Collection<OrderDetail> orderDetail) {
		this.id = id;
		this.customer = customer;
		this.orderDate = orderDate;
		this.requireDate = requireDate;
		this.amount = amount;
		this.receiver = receiver;
		this.address = address;
		this.description = description;
		this.numberPhone = numberPhone;
		this.status = status;
		this.orderDetail = orderDetail;
	}

	@Id
	@GeneratedValue
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "CustomerID", nullable = false)
	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "OrderDate", nullable = false, length = 23)
	public Date getOrderDate() {
		return this.orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "RequireDate", nullable = false, length = 23)
	public Date getRequireDate() {
		return this.requireDate;
	}

	public void setRequireDate(Date requireDate) {
		this.requireDate = requireDate;
	}

	@Column(name = "Amount", nullable = false, precision = 53, scale = 0)
	public Double getAmount() {
		return this.amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	@Column(name = "Receiver", nullable = false)
	public String getReceiver() {
		return this.receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	@Column(name = "Address", nullable = false)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "Description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "numberPhone", nullable = false)
	public String getNumberPhone() {
		return this.numberPhone;
	}

	public void setNumberPhone(String numberPhone) {
		this.numberPhone = numberPhone;
	}

	@Column(name = "Status", nullable = false)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "order")
	public Collection<OrderDetail> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(Collection<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}
}
