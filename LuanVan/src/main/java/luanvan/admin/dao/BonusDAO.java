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
public class BonusDAO {

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Thêm khen thưởng
	 */
	public void insertBonus(Bonus bonus) {
		Session session = sessionFactory.getCurrentSession();
		bonus.setDateWrite(new Date());
		session.save(bonus);
		
	}

	/**
	 * Sửa khen thưởng
	 */
	public void editBonus(Bonus bonus) {
		Session session = sessionFactory.getCurrentSession();
		session.update(bonus);
	}

	/**
	 * Xóa khen thưởng
	 */

	public void deleteBonus(Bonus bonus) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(bonus);
	}

	/**
	 * Lấy ID bản ghi
	 */
	public Bonus getIDBonus(int id) {
		Session session = sessionFactory.getCurrentSession();
		Bonus bonus = (Bonus) session.get(Bonus.class, id);
		return bonus;
	}

	/**
	 * Kiểm tra địa chỉ ID đã tồn tại chưa
	 */
	@SuppressWarnings("unchecked")
	public int checkIDBonus(int id) {
		Session session = sessionFactory.getCurrentSession();
		List<Bonus> list = session.createQuery("FROM Bonus WHERE id ='" + id + "'").list();
		return list.size();
	}

	/**
	 * Lấy danh sách Bàn Ghi
	 */
	@SuppressWarnings("unchecked")
	public List<Bonus> getAllBonus() {
		Session session = sessionFactory.getCurrentSession();
		List<Bonus> list = session.createQuery("FROM Bonus").list();
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
	 * Phân trang cho Bản Ghi
	 */
	@SuppressWarnings("unchecked")
	public List<Bonus> loadBonusPage(String page) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Bonus");
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
	public int getRowBonus() {
		Session session = sessionFactory.getCurrentSession();
		List<Bonus> list = session.createQuery("FROM Bonus").list();
		int i = 0;
		for (Bonus category : list) {
			i++;
		}
		return i;
	}

	/**
	 * Báo cáo thành tích
	 */
	@SuppressWarnings("unchecked")
	public List<Object[]> reportBonus() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT hieu.employee.id, hieu.employee.nameEmployee, "
				+ "SUM(case when hieu.type=1 then 1 else 0 end)," + "SUM(case when hieu.type=0 then 1 else 0 end),"
				+ "SUM(hieu.amount)" + "FROM Bonus hieu " + "GROUP BY hieu.employee.id, hieu.employee.nameEmployee";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		return list;
	}

	@SuppressWarnings({ "unchecked", "unused" })
	public int getRows(String month) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT hieu.employee.id, hieu.employee.nameEmployee, "
				+ "SUM(CASE WHEN hieu.type = 1 THEN 1 ELSE 0 END), SUM(CASE WHEN hieu.type = 0 THEN 1 ELSE 0 END),"
				+ "SUM(CASE WHEN TYPE = 1 THEN 1 ELSE 0 END) - SUM(CASE WHEN TYPE = 0 THEN 1 ELSE 0 END) AS TONGKET "
				+ "FROM Bonus hieu WHERE dateWrite LIKE '" + month + "%' "
				+ "GROUP BY hieu.employee.id, hieu.employee.nameEmployee " + "ORDER BY TONGKET DESC";
		List<Object[]> list = session.createQuery(hql).list();
		int i = 0;
		for (Object[] hieu : list) {
			i++;
		}
		return i;
	}

	/**
	 * Tìm kiếm
	 */
	@SuppressWarnings("unchecked")
	public List<Bonus> searchBonus(String search) {
		Session session = sessionFactory.getCurrentSession();
		List<Bonus> list = session.createQuery("FROM Bonus WHERE employee.id LIKE '%" + search + "%'  or amount LIKE '%"
				+ search + "%' or employee.nameEmployee LIKE '%" + search + "%' or reason LIKE '%" + search
				+ "%' or dateWrite LIKE '%" + search + "%'").list();
		return list;
	}

	/**
	 * Tìm kiếm cả 2
	 */
	@SuppressWarnings("unchecked")
	public List<Bonus> searchByBoth(String search, String idDepart) {
		Session session = sessionFactory.getCurrentSession();
		List<Bonus> list = session.createQuery("FROM Bonus WHERE employee.id LIKE '%" + search + "%'  or amount LIKE '%"
				+ search + "%' or employee.nameEmployee LIKE '%" + search + "%' or reason LIKE '%" + search
				+ "%' or dateWrite LIKE '%" + search + "%' AND employee.department.id LIKE '%" + idDepart + "%'")
				.list();
		return list;
	}

	/**
	 * Lọc Phòng Ban
	 */
	@SuppressWarnings("unchecked")
	public List<Bonus> loadBonusByDepart(String idDepart) {
		Session session = sessionFactory.getCurrentSession();
		List<Bonus> list = session.createQuery("FROM Bonus Where employee.department.id = '" + idDepart + "'").list();
		return list;

	}

}
