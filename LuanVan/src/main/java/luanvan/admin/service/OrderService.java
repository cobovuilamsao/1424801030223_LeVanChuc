package luanvan.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import luanvan.admin.dao.OrderDAO;
import luanvan.model.Order;
import luanvan.model.OrderDetail;

@Service("orderService")
@Transactional
public class OrderService {

	@Autowired
	OrderDAO orderDAO;

	/**
	 * Sủa đơn hàng
	 * 
	 * @param order
	 */
	public void updateOrder(Order order) {
		orderDAO.updateOrder(order);
	}

	/**
	 * Lấy mã đơn hàng
	 * 
	 * @param id
	 * @return
	 */
	public Order getIDOrder(Integer id) {
		return orderDAO.getIDOrder(id);
	}

	/**
	 * Lấy danh sách đơn hàng
	 * 
	 * @return
	 */
	public List<Order> getAllOrder() {
		return orderDAO.getAllOrder();
	}

	/**
	 * Tìm kiếm đơn hàng
	 * 
	 * @param search
	 * @return
	 */
	public List<Order> searchOrder(String search) {
		return orderDAO.searchOrder(search);
	}

	/**
	 * Lọc trạng thái
	 * 
	 * @param filter
	 * @return
	 */
	public List<Order> filterStatus(String filter) {
		return orderDAO.filterStatus(filter);
	}

	/**
	 * Phân trang
	 * 
	 * @param page
	 * @return
	 */
	public List<Order> loadOrderPage(String page) {
		return orderDAO.loadOrderPage(page);
	}

	public int getRowOrder() {
		return orderDAO.getRowOrder();
	}

	/**
	 * Lấy danh sách đơn hàng chi tiết qua mã đơn hàng
	 * @param id
	 * @return
	 */
	public List<OrderDetail> getAllOrderDetailByID(Integer id) {
		return orderDAO.getAllOrderDetailByID(id);
	}
}
