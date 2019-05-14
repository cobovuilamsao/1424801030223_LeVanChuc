package luanvan.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import luanvan.admin.dao.EmployeeDAO;
import luanvan.model.Employee;

@Service("employeeService")
@Transactional
public class EmployeeService {

	@Autowired
	private EmployeeDAO employeeDAO;

	/**
	 * Gọi insert từ lớp DAO
	 */
	public void insertEmployee(Employee employee) {
		employeeDAO.insertEmployee(employee);

	}

	/**
	 * Gọi edit từ lớp DAO
	 */
	public void editEmployee(Employee employee) {
		employeeDAO.editEmployee(employee);

	}

	/**
	 * Gọi delete từ lớp DAO
	 */
	public void deleteEmployee(Employee employee) {
		employeeDAO.deleteEmployee(employee);

	}

	/**
	 * Lấy ID từ lớp DAO
	 */
	public Employee getIDEmployee(String id) {
		return employeeDAO.getIDEmployee(id);
	}

	/**
	 * Lấy ID từ lớp DAO
	 */
	public Employee getEmailEmployee(String email) {
		return employeeDAO.getEmailEmployee(email);
	}

	/**
	 * Kiểm tra ID
	 * 
	 * @param id
	 * @return
	 */
	public int checkIdEmployee(String id) {
		return employeeDAO.checkIDEmmployee(id);
	}

	/**
	 * Kiểm tra Email
	 * 
	 * @param id
	 * @return
	 */
	public int checkEmailEmployee(String email) {
		return employeeDAO.checkEmailEmmployee(email);
	}

	/**
	 * Kiểm tra Password
	 * 
	 * @param id
	 * @return
	 */
	public int checkPasswordEmployee(String password) {
		return employeeDAO.checkPasswordEmployee(password);
	}

	/**
	 * Kiểm tra SDT
	 * 
	 * @param id
	 * @return
	 */
	public int checkPhoneEmployee(String numberPhone) {
		return employeeDAO.checkPhoneEmmployee(numberPhone);
	}

	/**
	 * Lấy List<Employee> từ lớp DAO
	 */
	public List<Employee> getAllEmployee() {
		return employeeDAO.getAllEmployee();
	}

	/**
	 * Tìm kiếm theo tên và mã nhân viên
	 * 
	 * @param search
	 * @return
	 */
	public List<Employee> searchByEmpl(String search) {
		return employeeDAO.searchByEmpl(search);
	}

	/**
	 * Lấy nhân viên từ phòng ban
	 * 
	 * @param idDepartment
	 * @return
	 */
	public List<Employee> getEmployeeByDepartment(String idDepartment) {
		return employeeDAO.getEmployeeByDepartment(idDepartment);
	}

	/**
	 * Lấy nhân viên từ loại nhân viên
	 * 
	 * @param idEmployeeType
	 * @return
	 */
	public List<Employee> getEmployeeByEmployeeType(String idEmployeeType) {
		return employeeDAO.getEmployeeByEmployeeType(idEmployeeType);
	}

	/**
	 * Lấy nhân viên từ phòng ban và loại nhân viên
	 * 
	 * @param idDepartment
	 * @param idEmployeeType
	 * @return
	 */
	public List<Employee> getDepartmentAndEmployeeType(String idDepartment, String idEmployeeType) {
		return employeeDAO.getDepartmentAndEmployeeType(idDepartment, idEmployeeType);
	}

	/**
	 * Tìm kiếm theo cả 3
	 * 
	 * @param search
	 * @param idDepartment
	 * @param idEmployeeType
	 * @return
	 */
	public List<Employee> searchBy3(String search, String idDepartment, String idEmployeeType) {
		return employeeDAO.searchBy3(search, idDepartment, idEmployeeType);
	}

	/**
	 * Phân trang cho nhân viên
	 */
	public List<Employee> loadEmplPage(String page) {
		return employeeDAO.loadEmplPage(page);
	}

	public int getRowEmpl() {
		return employeeDAO.getRowEmpl();
	}

	/**
	 * Kiểm tra đăng nhập
	 * 
	 * @param id
	 * @param password
	 * @return
	 */
	public Employee login(String id, String password) {
		return employeeDAO.login(id, password);
	}

}
