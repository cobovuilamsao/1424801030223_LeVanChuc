package luanvan.admin.controller;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Transactional
public class InventoryController {

	@Autowired
	public SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@ModelAttribute("categoryInventory")
	public List<Object[]> getCategoryInventory() {
		String hql = "SELECT " + "p.category.nameCategory, " + "SUM(p.quantity), " + "SUM(p.quantity*p.unitPrice), "
				+ "MIN(p.unitPrice),MAX(p.unitPrice), " + "AVG(p.unitPrice) " + "FROM Product p "
				+ "GROUP BY p.category.nameCategory";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		return list;
	
	}
	

	@SuppressWarnings("unchecked")
	@ModelAttribute("producerInventory")
	public List<Object[]> getProducerInventory() {
		String hql = "SELECT p.producer.nameProducer, " + "SUM(p.quantity), " + "SUM(p.quantity*p.unitPrice), "
				+ "MIN(p.unitPrice), MAX(p.unitPrice)," + "AVG(p.unitPrice) FROM Product p "
				+ "GROUP BY p.producer.nameProducer";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("cateproInventory")
	public List<Object[]> getCateProInventory() {
		String hql = "SELECT p.producer.nameProducer, p.category.nameCategory, " + "SUM(p.quantity), "
				+ "SUM(p.quantity*p.unitPrice) FROM Product p "
				+ "GROUP BY p.producer.nameProducer,p.category.nameCategory";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		return list;
	}

	@RequestMapping(value = "admin/inventory")
	public String adminInventory(ModelMap model) {
		model.addAttribute("arrays", getCategoryInventory());
		model.addAttribute("brrays", getProducerInventory());
		model.addAttribute("crrays", getCateProInventory());
		return "admin/inventory";
	}

	@RequestMapping(value = "employee/inventory")
	public String employeeInventory(ModelMap model) {
		model.addAttribute("arrays", getCategoryInventory());
		model.addAttribute("brrays", getProducerInventory());
		model.addAttribute("crrays", getCateProInventory());
		return "employee/inventory";
	}
}
