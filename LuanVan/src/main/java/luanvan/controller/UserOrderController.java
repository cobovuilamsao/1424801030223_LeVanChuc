package luanvan.controller;

import java.text.DecimalFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import luanvan.admin.controller.ShopController;
import luanvan.model.Customer;
import luanvan.model.Order;
import luanvan.model.OrderDetail;
import luanvan.model.Product;
import luanvan.other.PagerModel;

@Controller
@RequestMapping("order")
public class UserOrderController extends ShopController {

	@Autowired
	HttpSession httpSession;

	Map<Integer, Product> map = new HashMap<Integer, Product>();

	// Show danh sách hàng đã mua
	@SuppressWarnings("unchecked")
	@RequestMapping("product")
	public String orderProduct(ModelMap model, HttpServletRequest request) {
		Session session = sessionFactory.getCurrentSession();
		//
		Customer user = (Customer) httpSession.getAttribute("user");
		String hqlCount = "SELECT COUNT(od.product) FROM OrderDetail od WHERE od.order.status=4 and od.order.customer.id=:cid";
		Long rowCount = (Long) session.createQuery(hqlCount).setParameter("cid", user.getId()).uniqueResult();
		PagerModel pager = new PagerModel();
		pager = PagerModel.getPager("acpager", 9, rowCount.intValue(), request);
		pager.setRowCount(rowCount.intValue());
		pager.navigate(request);
		//
		String hql = "SELECT DISTINCT od.product FROM OrderDetail od WHERE od.order.status=4 and od.order.customer.id=:cid";
		Query query = session.createQuery(hql);
		query.setParameter("cid", user.getId());
		query.setFirstResult(pager.getStartRow());
		query.setMaxResults(pager.getPageSize());
		List<Product> list = query.list();
		model.addAttribute("list", list);
		model.addAttribute("flat", "../order/product");
		return "user/product-list";
	}

	// Show danh sách đơn hàng
	@RequestMapping("list")
	public String listOrder(ModelMap model) {
		Session session = sessionFactory.getCurrentSession();
		Customer user = (Customer) httpSession.getAttribute("user");
		String hql = "FROM Order WHERE customer.id=:cid";
		Query query = session.createQuery(hql);
		query.setParameter("cid", user.getId());
		model.addAttribute("order", query.list());
		return "user/order-list";
	}

	// Show danh sách đơn hàng chi tiết
	@RequestMapping("detail/{id}")
	public String detailOrder(ModelMap model, @PathVariable("id") Integer id) {
		Session session = sessionFactory.getCurrentSession();

		Order order = new Order();
		order.setId(id);
		session.refresh(order);

		String hql = "FROM OrderDetail WHERE order.id=" + id;
		Query query = session.createQuery(hql);

		model.addAttribute("order", order);
		model.addAttribute("detail", query.list());

		double amount = 0;
		String chuc = "FROM OrderDetail WHERE order.id=" + id;
		List<OrderDetail> listorderdetail = session.createQuery(chuc).list();
		for (OrderDetail orderdetail : listorderdetail) {
			amount += orderdetail.getAmount() * orderdetail.getQuantity() * (1 - orderdetail.getDiscount());
		}

		/*
		 * OrderDetail orderdetail=new OrderDetail();
		 * 
		 * float total=(float)
		 * (orderdetail.getAmount()*orderdetail.getQuantity()*(1-orderdetail.getDiscount
		 * ()));
		 * 
		 * model.addAttribute("torally", total);
		 */
		
		
		
		String text = "Xin chào: "+order.getCustomer().getFullName() 
				+ "<br>- You have just Completely ordered this order "
				+ "<br>- Bạn vừa đặt hàng thành công "
				+ "<br>- Thời gian giao hàng đối với Hà Nội và các tỉnh thành trên cả nước "
				+ "<br>- Thời gian giao hàng: 1 - 3 ngày làm việc tại Hà Nội và 4 - 6 ngày làm việc đối với các tỉnh thành khác."
				+ "<br>- Không tính thời gian nghỉ lễ, thứ 7 - CN.";
		

		model.addAttribute("status_order", text);
		model.addAttribute("totally", amount);
		return "user/order-detail";

	}

	// Kiểm tra lại thông tin đơn hàng
	@RequestMapping("checkout")
	public String checkout(ModelMap model) {
		Customer user = (Customer) httpSession.getAttribute("user");
		Order order = new Order();
		order.setCustomer(user);
		order.setOrderDate(new Date());
		order.setAmount(cart.getAmount());
		order.setReceiver(user.getFullName());
		model.addAttribute("order", order);

		return "user/checkout";
	}

	// Đặt hàng
	@RequestMapping("purchase")
	public String purchase(ModelMap model, @ModelAttribute Order order) {

		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(order);

			for (Product p : cart.getItems()) {
				OrderDetail detail = new OrderDetail();
				detail.setOrder(order);
				detail.setProduct(p);
				detail.setAmount(p.getUnitPrice());
				detail.setQuantity(p.getQuantity());
				detail.setDiscount(p.getDiscount());
				session.save(detail);
			}
			cart.clear();

			return "redirect:/order/detail/" + order.getId();

		} catch (Exception e) {
			model.addAttribute("message", "Đặt hàng thất bại");
		}

		return "user/checkout";

	}

	@RequestMapping("cannel-order/{id}")
	public String cannel(ModelMap model, @PathVariable("id") Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Order order = (Order) session.get(Order.class, id);
		order.setId(id);
		order.setStatus(2);
		session.update(order);
		model.addAttribute("order", order);
		return "redirect:/order/list";

	}
}
