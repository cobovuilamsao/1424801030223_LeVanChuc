package luanvan.model;

import java.util.Collection;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Products", schema = "dbo", catalog = "HieuBoyShop")
public class Product implements java.io.Serializable {

	private static final long serialVersionUID = 4208468054445602750L;
	private Integer id;
	private Category category;
	private Producer producer;
	private String nameProduct;
	private String photo;
	private Integer quantity;
	private Date productDate;
	private String unitBrief;
	private Double unitPrice;
	private Double discount;
	private String description;
	private Integer views;
	private Boolean available;
	private Boolean special;
	private Boolean latest;
	private Boolean status;
	private Collection<OrderDetail> orderDetail;

	public Product() {
	}

	public Product(Integer id, Category category, Producer producer, String nameProduct, Integer quantity,
			Date productDate, String unitBrief, Double unitPrice) {
		this.id = id;
		this.category = category;
		this.producer = producer;
		this.nameProduct = nameProduct;
		this.quantity = quantity;
		this.productDate = productDate;
		this.unitBrief = unitBrief;
		this.unitPrice = unitPrice;
	}

	public Product(Integer id, Category category, Producer producer, String nameProduct, String photo, Integer quantity,
			Date productDate, String unitBrief, Double unitPrice, Double discount, String description, Integer views,
			Boolean available, Boolean special, Boolean latest, Boolean status, Collection<OrderDetail> orderDetail) {
		this.id = id;
		this.category = category;
		this.producer = producer;
		this.nameProduct = nameProduct;
		this.photo = photo;
		this.quantity = quantity;
		this.productDate = productDate;
		this.unitBrief = unitBrief;
		this.unitPrice = unitPrice;
		this.discount = discount;
		this.description = description;
		this.views = views;
		this.available = available;
		this.special = special;
		this.latest = latest;
		this.status = status;
		this.orderDetail = orderDetail;
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

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "CategoryID", nullable = false)
	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ProducerID", nullable = false)
	public Producer getProducer() {
		return this.producer;
	}

	public void setProducer(Producer producer) {
		this.producer = producer;
	}

	@Column(name = "NameProduct", nullable = false)
	public String getNameProduct() {
		return this.nameProduct;
	}

	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}

	@Column(name = "Photo")
	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Column(name = "Quantity", nullable = false)
	public Integer getQuantity() {
		return this.quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "ProductDate", nullable = false, length = 23)
	public Date getProductDate() {
		return this.productDate;
	}

	public void setProductDate(Date productDate) {
		this.productDate = productDate;
	}

	@Column(name = "UnitBrief", nullable = false)
	public String getUnitBrief() {
		return this.unitBrief;
	}

	public void setUnitBrief(String unitBrief) {
		this.unitBrief = unitBrief;
	}

	@Column(name = "UnitPrice", nullable = false, precision = 53, scale = 0)
	public Double getUnitPrice() {
		return this.unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	@Column(name = "Discount", precision = 53, scale = 0)
	public Double getDiscount() {
		return this.discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	@Column(name = "Description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "Views")
	public Integer getViews() {
		return this.views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	@Column(name = "Available")
	public Boolean getAvailable() {
		return this.available;
	}

	public void setAvailable(Boolean available) {
		this.available = available;
	}

	@Column(name = "Special")
	public Boolean getSpecial() {
		return this.special;
	}

	public void setSpecial(Boolean special) {
		this.special = special;
	}

	@Column(name = "Latest")
	public Boolean getLatest() {
		return this.latest;
	}

	public void setLatest(Boolean latest) {
		this.latest = latest;
	}

	@Column(name = "Status", nullable = false)
	public Boolean getStatus() {
		return this.status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "product")
	public Collection<OrderDetail> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(Collection<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}

}
