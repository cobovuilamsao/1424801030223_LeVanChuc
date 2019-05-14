package luanvan.other;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import luanvan.model.Order;
import luanvan.model.OrderDetail;
import luanvan.model.Product;

@Component("cart")
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS, value = "session")
public class ShoppingCart {

	@Autowired
	SessionFactory sessionFactory;

	Map<Integer, Product> map = new HashMap<Integer, Product>();

	/**
	 * Bỏ mặt hàng vào giỏ. Nếu mặt hàng đã có thì tăng số lượng lên 1 và ngược
	 * lại truy vấn mặt hàng từ CSDL và bỏ vào giỏ với số lượng là 1
	 * 
	 * @param id
	 *            là mặt hàng cần thêm vào
	 * 
	 */
	public void add(Integer id) {
		Product item = map.get(id);
		if (item == null) {
			Session session = sessionFactory.getCurrentSession();
			item = (Product) session.load(Product.class, id);
			item.setQuantity(1);
			map.put(id, item);
		} else {
			item.setQuantity(item.getQuantity() + 1);
		}
	}

	/**
	 * Xóa mặt hàng khỏi giỏ hàng
	 * 
	 * @param id
	 *            là mặt hàng cần xóa
	 */
	public void remove(Integer id) {
		map.remove(id);
	}

	/**
	 * Cập nhật số lượng của một mặt hàng trong giỏ
	 * 
	 * @param id
	 *            là mã mặt hàng cần cập nhật số lượng
	 * @param newQuantity
	 */
	public void update(Integer id, int newQuantity) {
		Product item = map.get(id);
		item.setQuantity(newQuantity);
	}

	/**
	 * Xóa sạch các mặt hàng trong giỏ
	 */
	public void clear() {
		map.clear();
	}

	/**
	 * Lấy tổng số lượng các mặt hàng
	 * 
	 * @return
	 */
	public int getCount() {
		int count = 0;
		Collection<Product> items = map.values();
		for (Product p : items) {
			count += p.getQuantity();
		}
		return count;
	}

	/**
	 * Lấy tổng số tiền của giỏ hàng
	 * 
	 * @return
	 */
	public double getAmount() {
		double amount = 0;
		Collection<Product> items = map.values();
		for (Product p : items) {
			amount += p.getQuantity() * p.getUnitPrice() * (1 - p.getDiscount());
		}
		return amount;
	}

	/**
	 * Lấy tập các sản phẩm trong giỏ
	 * 
	 * @return
	 */
	public Collection<Product> getItems() {
		return map.values();
	}

	/**
	 * Đặt hàng với các mặt hàng đã chọn trong giỏ hàng
	 * 
	 * @param order
	 *            là đơn hàng chứ các mặt hàng trong giỏ
	 */
	public void purchase(Order order) {
		Session session = sessionFactory.getCurrentSession();

		Collection<OrderDetail> details = new ArrayList<OrderDetail>();
		for (Product item : map.values()) {
			OrderDetail detail = new OrderDetail();
			detail.setOrder(order);
			detail.setProduct(item);
			detail.setAmount(item.getUnitPrice());
			detail.setQuantity(item.getQuantity());
			detail.setDiscount(item.getDiscount());
			
			details.add(detail);
		}
		order.setOrderDetail(details);
		session.save(order);
	}
}
