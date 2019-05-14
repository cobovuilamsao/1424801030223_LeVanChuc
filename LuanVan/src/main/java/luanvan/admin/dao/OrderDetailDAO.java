package luanvan.admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import luanvan.model.OrderDetail;

@Repository
public class OrderDetailDAO {

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Sửa hóa đơn
	 * 
	 * @param order
	 */
	public void updateOrderDetail(OrderDetail order) {
		Session session = sessionFactory.getCurrentSession();
		session.update(order);
	}

	/**
	 * Xóa hóa đơn
	 * 
	 * @param order
	 */
	public void deleteOrderDetail(OrderDetail order) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(order);
	}

	/**
	 * Lấy mã hóa đơn
	 * 
	 * @param id
	 * @return
	 */
	public OrderDetail getIDOrderDetail(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		OrderDetail order = (OrderDetail) session.get(OrderDetail.class, id);
		return order;
	}

	/**
	 * Lấy tất cả hóa đơn
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<OrderDetail> getAllOrderDetail() {
		Session session = sessionFactory.getCurrentSession();
		List<OrderDetail> list = session.createQuery("FROM OrderDetail").list();
		return list;
	}

	/**
	 * Tìm kiếm
	 * 
	 * @param search
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<OrderDetail> searchOrderDetail(String search) {
		Session session = sessionFactory.getCurrentSession();
		List<OrderDetail> list = session
				.createQuery("FROM OrderDetail WHERE amount LIKE '%" + search + "%' OR order.receiver LIKE '%" + search
						+ "%' OR order.address LIKE '%" + search + "%' OR order.customer.fullName LIKE '%" + search
						+ "%' OR product.nameProduct LIKE '%" + search + "%' OR quantity LIKE '%" + search + "%'")
				.list();
		return list;
	}

	/**
	 * Phân Trang
	 * 
	 * @param page
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<OrderDetail> loadOrderDetailPage(String page) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM OrderDetail");
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
	public int getRowOrderDetail() {
		Session session = sessionFactory.getCurrentSession();
		List<OrderDetail> list = session.createQuery("FROM OrderDetail").list();
		int i = 0;
		for (OrderDetail order : list) {
			i++;
		}
		return i;
	}
	
	

	
	
}
