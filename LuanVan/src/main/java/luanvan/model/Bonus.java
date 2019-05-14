package luanvan.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Bonus", schema = "dbo", catalog = "HieuBoyShop")
public class Bonus implements java.io.Serializable {

	private static final long serialVersionUID = 7815622182585041541L;
	private Integer id;
	private Employee employee;
	private Boolean type;
	private Double amount;
	private String reason;
	private Date dateWrite;

	public Bonus() {
	}

	public Bonus(Integer id, Employee employee, Boolean type, Date dateWrite) {
		this.id = id;
		this.employee = employee;
		this.type = type;
		this.dateWrite = dateWrite;
	}

	public Bonus(Integer id, Employee employee, Boolean type, Double amount, String reason, Date dateWrite) {
		this.id = id;
		this.employee = employee;
		this.type = type;
		this.amount = amount;
		this.reason = reason;
		this.dateWrite = dateWrite;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "EmployeeID", nullable = false)
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Column(name = "Type", nullable = false)
	public Boolean getType() {
		return this.type;
	}

	public void setType(Boolean type) {
		this.type = type;
	}

	@Column(name = "Amount", precision = 53, scale = 0)
	public Double getAmount() {
		return this.amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	@Column(name = "Reason")
	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "DateWrite", nullable = false, length = 23)
	public Date getDateWrite() {
		return this.dateWrite;
	}

	public void setDateWrite(Date dateWrite) {
		this.dateWrite = dateWrite;
	}

}
