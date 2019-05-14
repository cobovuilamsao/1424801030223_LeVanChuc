package luanvan.admin.controller;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Transactional
@RequestMapping(value = "employee/revenue")
public class Revenue2Controller extends ShopController {

	@RequestMapping(method = RequestMethod.GET)
	public String homeRevenue() {
		return "employee/revenue-home";
	}

	// Doanh thu theo danh mục
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "by-category")
	public String byCategory(ModelMap model, @RequestParam(defaultValue = "01/01/2018") Date min,
			@RequestParam(defaultValue = "31/12/2900") Date max) {

		String hql = "SELECT od.product.category.nameCategory, " + "SUM(od.quantity),"
				+ "SUM(od.quantity*od.amount*(1-od.discount))," + "MIN(od.amount), MAX(od.amount)," + " AVG(od.amount) "
				+ "FROM OrderDetail od " + "WHERE od.order.status=4 and od.order.orderDate BETWEEN :min AND :max "
				+ "GROUP BY od.product.category.nameCategory";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("min", min);
		query.setParameter("max", max);
		List<Object[]> list = query.list();
		model.addAttribute("arrays", list);
		return "employee/revenue";
	}

	// Doanh thu theo hãng
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "by-producer")
	public String byProducer(ModelMap model, @RequestParam(defaultValue = "01/01/2018") Date min,
			@RequestParam(defaultValue = "31/12/2900") Date max) {
		String hql = "SELECT " + "od.product.producer.nameProducer, " + "SUM(od.quantity), "
				+ "SUM(od.quantity*od.amount*(1-od.discount)), " + "MIN(od.amount), " + "MAX(od.amount), "
				+ "AVG(od.amount) " + "FROM OrderDetail od " + "WHERE od.order.status=4 and od.order.orderDate BETWEEN :min AND :max "
				+ "GROUP BY od.product.producer.nameProducer";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("min", min);
		query.setParameter("max", max);
		List<Object[]> list = query.list();
		model.addAttribute("arrays", list);
		return "employee/revenue";
	}

	// Doanh thu theo khách hàng
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "by-customer")
	public String byCustomer(ModelMap model, @RequestParam(defaultValue = "01/01/2018") Date min,
			@RequestParam(defaultValue = "31/12/2900") Date max) {
		String hql = "SELECT " + "od.order.customer.fullName, " + "SUM(od.quantity), "
				+ "SUM(od.quantity*od.amount*(1-od.discount)), " + "MIN(od.amount), " + "MAX(od.amount), "
				+ "AVG(od.amount) " + "FROM OrderDetail od " + "WHERE od.order.status=4 and od.order.orderDate BETWEEN :min AND :max "
				+ "GROUP BY od.order.customer.fullName";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("min", min);
		query.setParameter("max", max);
		List<Object[]> list = query.list();
		model.addAttribute("arrays", list);
		return "employee/revenue";
	}

	// Doanh thu theo sản phẩm
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "by-product")
	public String byProduct(ModelMap model, @RequestParam(defaultValue = "01/01/2018") Date min,
			@RequestParam(defaultValue = "31/12/2900") Date max) {
		String hql = "SELECT " + "od.product.nameProduct, " + "SUM(od.quantity), "
				+ "SUM(od.quantity*od.amount*(1-od.discount)), " + "MIN(od.amount), " + "MAX(od.amount), "
				+ "AVG(od.amount) " + "FROM OrderDetail od " + "WHERE od.order.status=4 and od.order.orderDate BETWEEN :min AND :max "
				+ "GROUP BY od.product.nameProduct";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("min", min);
		query.setParameter("max", max);
		List<Object[]> list = query.list();
		model.addAttribute("arrays", list);
		return "employee/revenue";
	}

	// Doanh thu theo tháng
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "by-month")
	public String byMonth(ModelMap model, @RequestParam(defaultValue = "01/01/2018") Date min,
			@RequestParam(defaultValue = "31/12/2900") Date max) {
		String hql = "SELECT " + "MONTH(od.order.orderDate)," + "SUM(od.quantity), "
				+ "SUM(od.quantity*od.amount*(1-od.discount)), " + "MIN(od.amount), " + "MAX(od.amount), "
				+ "AVG(od.amount) " + "FROM OrderDetail od " + "WHERE od.order.status=4 and od.order.orderDate BETWEEN :min AND :max "
				+ "GROUP BY MONTH(od.order.orderDate)";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("min", min);
		query.setParameter("max", max);
		List<Object[]> list = query.list();
		model.addAttribute("arrays", list);
		return "employee/revenue";
	}

	// Doanh thu theo quý
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "by-quarter")
	public String byQuarter(ModelMap model, @RequestParam(defaultValue = "01/01/2018") Date min,
			@RequestParam(defaultValue = "31/12/2900") Date max) {
		String hql = "SELECT " + "CAST(CEILING(MONTH(od.order.orderDate)/3.0) as int)," + "SUM(od.quantity), "
				+ "SUM(od.quantity*od.amount*(1-od.discount)), " + "MIN(od.amount), " + "MAX(od.amount), "
				+ "AVG(od.amount) " + "FROM OrderDetail od " + "WHERE od.order.status=4 and od.order.orderDate BETWEEN :min AND :max "
				+ "GROUP BY CAST(CEILING(MONTH(od.order.orderDate)/3.0) as int)";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("min", min);
		query.setParameter("max", max);
		List<Object[]> list = query.list();
		model.addAttribute("arrays", list);
		return "employee/revenue";
	}

	// Doanh thu theo năm
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "by-year")
	public String byYear(ModelMap model, @RequestParam(defaultValue = "01/01/2018") Date min,
			@RequestParam(defaultValue = "31/12/2900") Date max) {
		String hql = "SELECT " + "YEAR(od.order.orderDate)," + "SUM(od.quantity), "
				+ "SUM(od.quantity*od.amount*(1-od.discount)), " + "MIN(od.amount), " + "MAX(od.amount), "
				+ "AVG(od.amount) " + "FROM OrderDetail od " + "WHERE od.order.status=4 and od.order.orderDate BETWEEN :min AND :max "
				+ "GROUP BY YEAR(od.order.orderDate)";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("min", min);
		query.setParameter("max", max);
		List<Object[]> list = query.list();
		model.addAttribute("arrays", list);
		return "employee/revenue";
	}
}
