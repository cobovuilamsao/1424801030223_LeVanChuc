package luanvan.admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import luanvan.model.Employee;

@Repository
public class EmployeeDAO {

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Thêm nhân viên
	 */
	public void insertEmployee(Employee employee) {
		Session session = sessionFactory.getCurrentSession();
		/* employee.setId(new Date().getTime()); */
		session.save(employee);

	}

	/**
	 * Sửa nhân viên
	 */
	public void editEmployee(Employee employee) {
		Session session = sessionFactory.getCurrentSession();
		session.update(employee);
	}

	/**
	 * Xóa nhân viên
	 */
	public void deleteEmployee(Employee employee) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(employee);
	}

	/**
	 * Lấy ID nhân viên
	 */
	public Employee getIDEmployee(String id) {
		Session session = sessionFactory.getCurrentSession();
		Employee employee = (Employee) session.get(Employee.class, id);
		return employee;
	}

	/**
	 * Lấy Email nhân viên
	 */
	public Employee getEmailEmployee(String email) {
		Session session = sessionFactory.getCurrentSession();
		Employee employee = (Employee) session.get(Employee.class, email);
		return employee;
	}

	/**
	 * Kiểm tra ID đã tồn tại chưa
	 */
	@SuppressWarnings("unchecked")
	public int checkIDEmmployee(String id) {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session.createQuery("FROM Employee WHERE id = '" + id + "'").list();
		return list.size();
	}

	/**
	 * Kiểm tra địa chỉ Email đã tồn tại chưa
	 */
	@SuppressWarnings("unchecked")
	public int checkEmailEmmployee(String email) {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session.createQuery("FROM Employee WHERE email = '" + email + "'").list();
		return list.size();
	}

	/**
	 * Kiểm tra địa chỉ Password
	 */
	@SuppressWarnings("unchecked")
	public int checkPasswordEmployee(String password) {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session.createQuery("FROM Employee WHERE password = '" + password + "'").list();
		return list.size();
	}

	/**
	 * Kiểm tra địa chỉ SDT đã tồn tại chưa
	 */
	@SuppressWarnings("unchecked")
	public int checkPhoneEmmployee(String numberPhone) {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session.createQuery("FROM Employee WHERE numberPhone = '" + numberPhone + "'").list();
		return list.size();
	}

	/**
	 * Lấy danh sách nhân viên
	 */
	@SuppressWarnings("unchecked")
	public List<Employee> getAllEmployee() {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session.createQuery("FROM Employee").list();
		return list;
	}

	/**
	 * Tìm kiếm theo ID + Name nhân viên + Email + Địa chỉ
	 * 
	 * @param search
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Employee> searchByEmpl(String search) {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session
				.createQuery("FROM Employee WHERE id Like '%" + search + "%' OR nameEmployee LIKE '%" + search
						+ "%' OR email LIKE '%" + search + "%' OR address LIKE '%" + search + "%'")
				.list();
		return list;
	}

	/**
	 * Lấy nhân viên từ phòng ban
	 */
	@SuppressWarnings("unchecked")
	public List<Employee> getEmployeeByDepartment(String idDepartment) {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session.createQuery("FROM Employee WHERE department.id = '" + idDepartment + "'").list();
		return list;
	}

	/**
	 * Lấy nhân viên từ loại nhân viên
	 * 
	 * @param idEmployeeType
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Employee> getEmployeeByEmployeeType(String idEmployeeType) {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session.createQuery("FROM Employee WHERE employeeType.id = '" + idEmployeeType + "'")
				.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Employee> getDepartmentAndEmployeeType(String idDepartment, String idEmployeeType) {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session.createQuery("FROM Employee WHERE employeeType.id = '" + idEmployeeType
				+ "' AND department.id ='" + idDepartment + "'").list();
		return list;
	}

	/**
	 * Tìm kiếm theo cả 3
	 */
	@SuppressWarnings("unchecked")
	public List<Employee> searchBy3(String search, String idDepartment, String idEmployeeType) {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session.createQuery("FROM Employee WHERE ID LIKE '%" + search
				+ "%' OR nameEmployee LIKE '%" + search + "%' " + " AND department.id = '" + idDepartment + "'"
				+ "AND employeeType.id = '" + idEmployeeType + "'").list();
		return list;
	}

	/**
	 * Phân trang nhân viên
	 */
	@SuppressWarnings("unchecked")
	public List<Employee> loadEmplPage(String page) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Employee");
		int result = 0;
		if (page.equals("1")) {
			result = 0;
		} else {
			String temp = String.valueOf(page) + "0";
			result = Integer.parseInt(temp) - 10;
		}
		query.setFirstResult(result);
		query.setMaxResults(10);
		return query.list();
	}

	@SuppressWarnings({ "unchecked", "unused" })
	public int getRowEmpl() {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session.createQuery("FROM Employee").list();
		int i = 0;
		for (Employee employee : list) {
			i++;
		}
		return i;
	}

	/**
	 * Kiểm tra đăng nhập
	 * 
	 * @param id
	 * @param password
	 * @return
	 */
	public Employee login(String id, String password) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Employee WHERE id = :id and password = :password");
		query.setString("id", id);
		query.setString("password", password);
		Employee employee = (Employee) query.uniqueResult();
		return employee;
	}

}
