package luanvan.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import luanvan.admin.dao.AccountDAO;
import luanvan.model.Admin;

@Service("accountService")
@Repository
public class AccountService {

	@Autowired
	private AccountDAO accountDAO;

	/**
	 * Thêm tài khoản
	 * 
	 * @param admin
	 */
	public void insertAdmin(Admin admin) {
		accountDAO.insertAdmin(admin);
	}

	/**
	 * Sửa tài khoản
	 * 
	 * @param admin
	 */
	public void updateAdmin(Admin admin) {
		accountDAO.updateAdmin(admin);
	}

	/**
	 * Xóa tài khoản
	 * 
	 * @param admin
	 */
	public void deleteAdmin(Admin admin) {
		accountDAO.deleteAdmin(admin);
	}

	/**
	 * Lấy username
	 * 
	 * @param username
	 * @return
	 */
	public Admin getIDAdmin(String username) {
		return accountDAO.getIDAdmin(username);
	}

	/**
	 * Lấy danh sách tài khoản
	 * 
	 * @return
	 */
	public List<Admin> getAllAdmin() {
		return accountDAO.getAllAdmin();
	}

	/**
	 * Kiểm tra username
	 * 
	 * @param username
	 * @return
	 */
	public int checkUsername(String username) {
		return accountDAO.checkUsername(username);
	}

	/**
	 * Kiểm tra password
	 * 
	 * @param password
	 * @return
	 */
	public int checkPassword(String password) {
		return accountDAO.checkPassword(password);
	}

	/**
	 * Tìm kiếm
	 * 
	 * @param search
	 * @return
	 */
	public List<Admin> searchAdmin(String search) {
		return accountDAO.searchAdmin(search);
	}

	/**
	 * Phân trang
	 * 
	 * @param page
	 * @return
	 */
	public List<Admin> loadAdminPage(String page) {
		return accountDAO.loadAdminPage(page);
	}

	public int getRowAdmin() {
		return accountDAO.getRowAdmin();
	}

	// ==> LOGIN

	/**
	 * Kiểm tra login
	 * @param username
	 * @param password
	 * @return
	 */
	public Admin login(String username, String password) {
		return accountDAO.login(username, password);
	}
}
