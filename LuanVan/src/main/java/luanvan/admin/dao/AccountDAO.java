package luanvan.admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import luanvan.model.Admin;

@Repository
public class AccountDAO {

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Thêm tài khoản admin
	 * 
	 * @param admin
	 */
	public void insertAdmin(Admin admin) {
		Session session = sessionFactory.getCurrentSession();
		session.save(admin);
	}

	/**
	 * Sửa tài khoản
	 * 
	 * @param admin
	 */
	public void updateAdmin(Admin admin) {
		Session session = sessionFactory.getCurrentSession();
		session.update(admin);
	}

	/**
	 * Xóa tài khoản
	 * 
	 * @param admin
	 */
	public void deleteAdmin(Admin admin) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(admin);
	}

	/**
	 * Lấy username admin
	 * 
	 * @param username
	 * @return
	 */
	public Admin getIDAdmin(String username) {
		Session session = sessionFactory.getCurrentSession();
		Admin admin = (Admin) session.get(Admin.class, username);
		return admin;
	}

	/**
	 * Lấy danh sách admin
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Admin> getAllAdmin() {
		Session session = sessionFactory.getCurrentSession();
		List<Admin> list = session.createQuery("FROM Admin").list();
		return list;
	}

	/**
	 * Kiểm tra username
	 * 
	 * @param username
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public int checkUsername(String username) {
		Session session = sessionFactory.getCurrentSession();
		List<Admin> list = session.createQuery("FROM Admin WHERE username ='" + username + "'").list();
		return list.size();
	}

	/**
	 * Kiểm tra password
	 * 
	 * @param password
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public int checkPassword(String password) {
		Session session = sessionFactory.getCurrentSession();
		List<Admin> list = session.createQuery("FROM Admin WHERE password ='" + password + "'").list();
		return list.size();
	}

	/**
	 * Tìm kiếm
	 * 
	 * @param search
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Admin> searchAdmin(String search) {
		Session session = sessionFactory.getCurrentSession();
		List<Admin> list = session
				.createQuery("FROM Admin WHERE username LIKE '%" + search + "%' OR fullName LIKE '%" + search + "%'")
				.list();
		return list;
	}

	/**
	 * Phân trang
	 * 
	 * @param page
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Admin> loadAdminPage(String page) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Admin");
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
	public int getRowAdmin() {
		Session session = sessionFactory.getCurrentSession();
		List<Admin> list = session.createQuery("FROM Admin").list();
		int i = 0;
		for (Admin admin : list) {
			i++;
		}
		return i;
	}

	// ==> LOGIN

	/**
	 * Kiểm tra đăng nhập
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public Admin login(String username, String password) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Admin WHERE username = :username and password = :password");
		query.setString("username", username);
		query.setString("password", password);
		Admin admin = (Admin) query.uniqueResult();
		return admin;
	}
}
