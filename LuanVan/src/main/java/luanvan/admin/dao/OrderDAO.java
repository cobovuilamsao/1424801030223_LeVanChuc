package luanvan.admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import luanvan.model.Order;
import luanvan.model.OrderDetail;

@Repository
public class OrderDAO {

	@Autowired
	SessionFactory sessionFactory;

	/**
	 * Sửa đơn hàng
	 * 
	 * @param order
	 */
	public void updateOrder(Order order) {
		Session session = sessionFactory.getCurrentSession();
		session.update(order);
	}

	/**
	 * Lấy id
	 * 
	 * @param id
	 * @return
	 */
	public Order getIDOrder(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Order order = (Order) session.get(Order.class, id);
		return order;
	}

	/**
	 * Lấy tất cả các danh sách hóa đơn
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Order> getAllOrder() {
		Session session = sessionFactory.getCurrentSession();
		List<Order> list = session.createQuery("FROM Order").list();
		return list;
	}

	/**
	 * Tìm kiếm
	 * 
	 * @param search
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Order> searchOrder(String search) {
		Session session = sessionFactory.getCurrentSession();
		List<Order> list = session.createQuery(
				"FROM Order WHERE customerID LIKE '%" + search + "%' OR ID LIKE '%" + search + "%' OR Amount LIKE '%"
						+ search + "%' OR Address LIKE '%" + search + "%' OR Receiver LIKE '%" + search + "%'")
				.list();
		return list;
	}

	/**
	 * Lọc trạng thái
	 * 
	 * @param filter
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Order> filterStatus(String filter) {
		Session session = sessionFactory.getCurrentSession();
		List<Order> list = session.createQuery("FROM Order WHERE Status LIKE '%" + filter + "%'").list();
		return list;
	}

	/**
	 * Phân trang
	 * 
	 * @param page
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Order> loadOrderPage(String page) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Order");
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

	@SuppressWarnings("unused")
	public int getRowOrder() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Order> list = session.createQuery("FROM Order").list();
		int i = 0;
		for (Order order : list) {
			i++;
		}
		return i;
	}

	/**
	 * Lấy danh sách đơn hàng chi tiết thông qua id đơn hàng
	 * 
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<OrderDetail> getAllOrderDetailByID(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM OrderDetail WHERE order.id = '" + id + "' ");
		return query.list();
	}

}
