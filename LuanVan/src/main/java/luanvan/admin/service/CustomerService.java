package luanvan.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import luanvan.admin.dao.CustomerDAO;
import luanvan.model.Customer;

@Service("customerService")
@Transactional
public class CustomerService {

	@Autowired
	CustomerDAO customerDAO;

	/**
	 * Thêm khách hàng
	 * 
	 * @param customer
	 */
	public void insertCustomer(Customer customer) {
		customerDAO.insertCustomer(customer);
	}

	/**
	 * Sửa khách hàng
	 * 
	 * @param customer
	 */
	public void updateCustomer(Customer customer) {
		customerDAO.updateCustomer(customer);
	}

	/**
	 * Xóa khách hàng
	 * 
	 * @param customer
	 */
	public void deleteCustomer(Customer customer) {
		customerDAO.deleteCustomer(customer);
	}

	/**
	 * Lấy id khách hàng
	 * 
	 * @param id
	 * @return
	 */
	public Customer getIDCustomer(String id) {
		return customerDAO.getIDCustomer(id);
	}

	/**
	 * Lấy danh sách khách hàng
	 * 
	 * @return
	 */
	public List<Customer> getAllCustomer() {
		return customerDAO.getAllCustomer();
	}

	/**
	 * Kiểm tra email
	 * 
	 * @param email
	 * @return
	 */
	public int checkEmail(String email) {
		return customerDAO.checkEmail(email);
	}

	/**
	 * Kiểm tra password
	 * 
	 * @param password
	 * @return
	 */
	public int checkPassword(String password) {
		return customerDAO.checkPassword(password);
	}

	/**
	 * Tìm kiếm
	 * 
	 * @param search
	 * @return
	 */
	public List<Customer> searchCustomer(String search) {
		return customerDAO.searchCustomer(search);
	}

	/**
	 * Phân trang
	 * 
	 * @param page
	 * @return
	 */
	public List<Customer> loadCustomerPage(String page) {
		return customerDAO.loadCustomerPage(page);
	}

	public int getRowCustomer() {
		return customerDAO.getRowCustomer();
	}
}
