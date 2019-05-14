package luanvan.admin.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import luanvan.model.*;

@Repository
public class ContractDAO {

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Thêm Hợp Đồng
	 */
	public void insertContract(Contract contract) {
		Session session = sessionFactory.getCurrentSession();
		contract.setStartTime(new Date());
		session.save(contract);

	}

	/**
	 * Sửa Hợp Đồng
	 */
	public void editContract(Contract contract) {
		Session session = sessionFactory.getCurrentSession();
		session.update(contract);

	}

	/**
	 * Xóa Hợp Đồng
	 */
	public void deleteContract(Contract contract) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(contract);

	}

	/**
	 * Lấy ID Hợp Đồng
	 */
	public Contract getIDContract(String id) {
		Session session = sessionFactory.getCurrentSession();
		Contract contract = (Contract) session.get(Contract.class, id);
		return contract;

	}

	/**
	 * Kiểm tra id
	 */
	@SuppressWarnings("unchecked")
	public int checkIDContract(String id) {
		Session session = sessionFactory.getCurrentSession();
		List<Contract> list = session.createQuery("FROM Contract WHERE ID = '" + id + "'").list();
		return list.size();
	}

	/**
	 * Lấy Tất Cả Hợp Đồng
	 */
	@SuppressWarnings("unchecked")
	public List<Contract> getAllContract() {
		Session session = sessionFactory.getCurrentSession();
		List<Contract> list = session.createQuery("FROM Contract").list();
		return list;
	}

	/**
	 * Tìm kiếm hợp đồng
	 */
	@SuppressWarnings("unchecked")
	public List<Contract> searchContract(String search) {
		Session session = sessionFactory.getCurrentSession();
		List<Contract> list = session
				.createQuery("FROM Contract WHERE employee.nameEmployee LIKE '%" + search + "%' or employee.id LIKE '%"
						+ search + "%' or salary LIKE '%" + search + "%' or nameContract LIKE '%" + search + "%'")
				.list();
		return list;
	}

	/**
	 * Tìm kiếm cả 2
	 */
	@SuppressWarnings("unchecked")
	public List<Contract> searchByBoth(String search, String idDepart) {
		Session session = sessionFactory.getCurrentSession();
		List<Contract> list = session.createQuery("FROM Contract WHERE employee.nameEmployee LIKE '%" + search
				+ "%' or employee.id LIKE '%" + search + "%' or salary LIKE '%" + search + "%' or nameContract LIKE '%"
				+ search + "%' AND employee.department.id = '%" + idDepart + "%'").list();
		return list;
	}

	/**
	 * Lọc Phòng Ban
	 */
	@SuppressWarnings("unchecked")
	public List<Contract> loadContractByDepart(String idDepart) {
		Session session = sessionFactory.getCurrentSession();
		List<Contract> list = session.createQuery("FROM Contract Where employee.department.id = '" + idDepart + "'")
				.list();
		return list;

	}

	/**
	 * Lọc trạng thái
	 */
	@SuppressWarnings("unchecked")
	public List<Contract> filterContract(String status) {
		Session session = sessionFactory.getCurrentSession();
		List<Contract> list = session.createQuery("FROM Contract WHERE status LIKE '%" + status + "%'").list();
		return list;
	}

	/**
	 * Lấy Nhân Viên từ Phòng Ban
	 */
	@SuppressWarnings("unchecked")
	public List<Employee> loadEmplByDepart(String id) {
		Session session = sessionFactory.getCurrentSession();
		List<Employee> list = session.createQuery("FROM Employee WHERE department.id = '" + id + "'").list();
		return list;
	}

	/**
	 * Phân trang hợp đồng
	 */
	@SuppressWarnings("unchecked")
	public List<Contract> loadContractPage(String page) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Contract");
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
	public int getRowContract() {
		Session session = sessionFactory.getCurrentSession();
		List<Contract> list = session.createQuery("FROM Contract").list();
		int i = 0;
		for (Contract contract : list) {
			i++;
		}
		return i;
	}
}
