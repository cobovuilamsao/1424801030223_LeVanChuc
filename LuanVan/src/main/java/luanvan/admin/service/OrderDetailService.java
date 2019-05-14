package luanvan.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import luanvan.admin.dao.OrderDetailDAO;
import luanvan.model.OrderDetail;

@Service("orderDetailService")
@Transactional
public class OrderDetailService {

	@Autowired
	OrderDetailDAO orderDetailDAO;

	/**
	 * Sửa Hóa Đơn
	 * 
	 * @param order
	 */
	public void updateOrderDetail(OrderDetail order) {
		orderDetailDAO.updateOrderDetail(order);
	}

	/**
	 * Xóa hóa đơn
	 * 
	 * @param order
	 */
	public void deleteOrderDetail(OrderDetail order) {
		orderDetailDAO.deleteOrderDetail(order);
	}

	/**
	 * Lấy id hóa đơn
	 * 
	 * @param id
	 * @return
	 */
	public OrderDetail getIDOrderDetail(Integer id) {
		return orderDetailDAO.getIDOrderDetail(id);
	}

	/**
	 * Lấy danh sách tất cả hóa đơn
	 * 
	 * @return
	 */
	public List<OrderDetail> getAllOrderDetail() {
		return orderDetailDAO.getAllOrderDetail();
	}

	/**
	 * Tìm kiếm hóa đơn
	 * 
	 * @param search
	 * @return
	 */
	public List<OrderDetail> searchOrderDetail(String search) {
		return orderDetailDAO.searchOrderDetail(search);
	}

	/**
	 * Phân trang
	 * 
	 * @param page
	 * @return
	 */
	public List<OrderDetail> loadOrderDetailPage(String page) {
		return orderDetailDAO.loadOrderDetailPage(page);
	}

	public int getRowOrderDetail() {
		return orderDetailDAO.getRowOrderDetail();
	}
}
