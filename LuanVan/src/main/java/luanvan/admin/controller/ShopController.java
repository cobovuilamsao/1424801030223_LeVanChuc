package luanvan.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import luanvan.model.Category;
import luanvan.model.Department;
import luanvan.model.EmployeeType;
import luanvan.model.Producer;
import luanvan.model.Product;
import luanvan.other.ShoppingCart;

@Controller
@Transactional
public class ShopController {

	@Autowired
	protected SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@ModelAttribute("saleOffProducts")
	public List<Product> get9SaleOffProducts() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Product p WHERE p.status = 1 AND p.discount > 0 ORDER BY p.discount DESC";
		Query query = session.createQuery(hql);
		query.setMaxResults(9);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("employeeType")
	public List<EmployeeType> getEmployeeType() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM EmployeeType").list();
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("department")
	public List<Department> getDepartment() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM Department").list();
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("category")
	public List<Category> getCategory() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM Category").list();
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("producer")
	public List<Producer> getProducer() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM Producer").list();
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "admin/home")
	public String adminHome(ModelMap model, HttpServletRequest request) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT hieuboy.employee.id, hieuboy.employee.nameEmployee, hieuboy.employee.photo, "
				+ "SUM(CASE WHEN hieuboy.type = 1 THEN 1 ELSE 0 END), SUM(CASE WHEN hieuboy.type = 0 THEN 1 ELSE 0 END),"
				+ "SUM(CASE WHEN type = 1 THEN 1 ELSE 0 END) - SUM(CASE WHEN type = 0 THEN 1 ELSE 0 END),"
				+ "SUM(hieuboy.amount) AS Tongket "
				+ "FROM Bonus hieuboy GROUP BY hieuboy.employee.id, hieuboy.employee.nameEmployee, hieuboy.employee.photo "
				+ "ORDER BY Tongket DESC";
		List<Object[]> list = session.createQuery(hql).list();
		model.addAttribute("topEmployee", list);
		/*
		 * model.addAttribute("productRevenue", getProRevenue());
		 * model.addAttribute("categoryRevenue", getCateRevenue());
		 * model.addAttribute("producerRevenue", getSupRevenue());
		 * model.addAttribute("yearRevenue", getYearRevenue());
		 */
		return "admin/index";
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("productRevenue")
	public List<Object[]> getProRevenue() {
		String hql = "SELECT " + " d.product.nameProduct, " + " SUM(d.quantity*d.amount*(1-d.discount)) "
				+ " FROM OrderDetail d " + " WHERE d.order.status =4 " + " GROUP BY d.product.nameProduct";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("categoryRevenue")
	public List<Object[]> getCateRevenue() {
		String hql = "SELECT " + " d.product.category.nameCategory, " + " SUM(d.quantity*d.amount*(1-d.discount)) "
				+ " FROM OrderDetail d " + " WHERE d.order.status = 4 " + " GROUP BY d.product.category.nameCategory";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("producerRevenue")
	public List<Object[]> getSupRevenue() {
		String hql = "SELECT " + " d.product.producer.nameProducer, " + " SUM(d.quantity*d.amount*(1-d.discount)) "
				+ " FROM OrderDetail d " + " WHERE d.order.status = 4 " + " GROUP BY d.product.producer.nameProducer";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("yearRevenue")
	public List<Object[]> getYearRevenue() {
		String hql = "SELECT " + " YEAR(d.order.orderDate), " + " SUM(d.quantity*d.amount*(1-d.discount)) "
				+ " FROM OrderDetail d " + " WHERE d.order.status = 4 " + " GROUP BY YEAR(d.order.orderDate)";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "employee/home")
	public String employeeHome(ModelMap model) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT hieuboy.employee.id, hieuboy.employee.nameEmployee, hieuboy.employee.photo, "
				+ "SUM(CASE WHEN hieuboy.type = 1 THEN 1 ELSE 0 END), SUM(CASE WHEN hieuboy.type = 0 THEN 1 ELSE 0 END),"
				+ "SUM(CASE WHEN type = 1 THEN 1 ELSE 0 END) - SUM(CASE WHEN type = 0 THEN 1 ELSE 0 END),"
				+ "SUM(hieuboy.amount) AS Tongket "
				+ "FROM Bonus hieuboy GROUP BY hieuboy.employee.id, hieuboy.employee.nameEmployee, hieuboy.employee.photo "
				+ "ORDER BY Tongket DESC";
		List<Object[]> list = session.createQuery(hql).list();
		model.addAttribute("topEmployee", list);
		return "employee/layout";
	}

	@Autowired
	protected ShoppingCart cart;

	@ModelAttribute("cart")
	public ShoppingCart getShoppingCart() {
		return cart;
	}

}
