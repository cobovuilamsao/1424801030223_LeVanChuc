package luanvan.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import luanvan.admin.service.OrderService;
import luanvan.model.Order;

@Controller
@Transactional
@RequestMapping("employee/order")
public class OrderController extends ShopController {

	@Autowired
	OrderService orderService;

	// Trang chủ
	@RequestMapping(method = RequestMethod.GET)
	public String homeOrder(ModelMap model, HttpServletRequest request) {
		if (orderService.getRowOrder() > 10) {
			if (request.getParameter("page") == null) {
				model.addAttribute("listOrder", orderService.loadOrderPage("1"));
			} else {
				model.addAttribute("listOrder", orderService.loadOrderPage(request.getParameter("page")));
			}
			double paging = Math.ceil(Double.valueOf(orderService.getRowOrder()) / 10);
			model.addAttribute("rowCount", paging);
		} else {
			model.addAttribute("listOrder", orderService.getAllOrder());
		}
		return "employee/order-home";
	}

	// Form sửa đơn hàng
	@RequestMapping(value = "edit-order/{id}.htm", method = RequestMethod.GET)
	public String formEdit(ModelMap model, @PathVariable("id") Integer id) {
		model.addAttribute("order", orderService.getIDOrder(id));
		return "employee/order-edit";
	}

	// Sửa đơn hàng
	@RequestMapping(value = "edit-order/{id}.htm", method = RequestMethod.POST)
	public String editForm(ModelMap model, @PathVariable("id") Integer id, @ModelAttribute("order") Order order) {
		orderService.updateOrder(order);
		return "redirect:/employee/order";

	}

	// Tìm kiếm đơn hàng
	@RequestMapping(value = "search.htm", method = RequestMethod.GET)
	public String searchOrder(ModelMap model, @RequestParam("search") String search) {
		model.addAttribute("listOrder", orderService.searchOrder(search));
		return "employee/order-home";
	}

	// Tìm kiếm đơn hàng
	@RequestMapping(value = "filter.htm", method = RequestMethod.GET)
	public String filterOrder(ModelMap model, @RequestParam("filter") String filter) {
		model.addAttribute("listOrder", orderService.filterStatus(filter));
		return "employee/order-home";
	}

	// Xử lý trạng thái đơn hàng
	@RequestMapping("{value}-order/{id}.htm")
	public String statusOrder(ModelMap model, @PathVariable("id") Integer id, @PathVariable("value") String value,
			@ModelAttribute("order") Order order) {
		order = orderService.getIDOrder(id);
		if (value.equalsIgnoreCase("confirm")) {
			order.setStatus(4);
			orderService.updateOrder(order);
		}
		if (value.equalsIgnoreCase("handling")) {
			order.setStatus(3);
			orderService.updateOrder(order);
		}
		if (value.equalsIgnoreCase("cannel")) {
			order.setStatus(2);
			orderService.updateOrder(order);
		}
		return "redirect:/employee/order";
	}

	// Show danh sách đơn hàng chi tiết
	@RequestMapping("detail-order/{id}.htm")
	public String detailOrder(ModelMap model, @PathVariable("id") Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Order order = new Order();
		order.setId(id);
		session.refresh(order);

		model.addAttribute("order", order);
		model.addAttribute("detail", orderService.getAllOrderDetailByID(id));

		return "employee/order-detail";
	}
}
