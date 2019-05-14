package luanvan.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import luanvan.admin.controller.ShopController;
import luanvan.model.Product;
import luanvan.other.PagerModel;

@Controller
@Transactional
@RequestMapping(value = "user/product")
public class UserProductController extends ShopController {

	@Autowired
	ServletContext application;

	@Autowired
	JavaMailSender mailSender;

	// Tìm kiếm sản phẩm
	@SuppressWarnings("unchecked")
	@RequestMapping("search-product.htm")
	public String searchProduct(ModelMap model, HttpServletRequest request, @RequestParam("") String search) {
		Session session = sessionFactory.getCurrentSession();
		// Đếm sản phẩm để phân trang và tìm kiếm
		String hqlCount = "SELECT COUNT(p) FROM Product p WHERE p.status = 1 and p.nameProduct LIKE '%" + search + "%'";
		Long rowCount = (Long) session.createQuery(hqlCount).uniqueResult();
		System.out.println(rowCount);
		PagerModel pager = new PagerModel();
		pager = PagerModel.getPager("acpager", 9, rowCount.intValue(), request);
		pager.setRowCount(rowCount.intValue());
		pager.setPageSize(9);
		pager.navigate(request);
		model.addAttribute("search", search);
		model.addAttribute("flat", "search-product");
		// Tìm kiếm sản phẩm
		String hql = "FROM Product p WHERE p.status = 1 and p.nameProduct LIKE '%" + search + "%'";
		Query query = session.createQuery(hql);
		query.setFirstResult(pager.getStartRow());
		query.setMaxResults(pager.getPageSize());
		List<Product> list = query.list();
		model.addAttribute("list", list);

		return "user/product-list";
	}

	// Show danh sách sản phẩm
	@SuppressWarnings("unchecked")
	@RequestMapping("list")
	public String list(ModelMap model, HttpServletRequest request) {
		Session session = sessionFactory.getCurrentSession();
		// Đếm sản phẩm và phân trang
		String hqlCount = "SELECT COUNT(p) FROM Product p";
		Long rowCount = (Long) session.createQuery(hqlCount).uniqueResult();
		PagerModel pager = new PagerModel();
		pager = PagerModel.getPager("acpager", 9, rowCount.intValue(), request);
		pager.setRowCount(rowCount.intValue());
		pager.navigate(request);
		model.addAttribute("flat", "list");
		// Lấy danh sách sản phẩm có views giảm dần
		String hql = "FROM Product p WHERE p.status = 1 ORDER BY p.views DESC";
		Query query = session.createQuery(hql);
		query.setFirstResult(pager.getStartRow());
		query.setMaxResults(pager.getPageSize());
		List<Product> list = query.list();
		model.addAttribute("list", list);
		return "user/product-list";
	}

	// Show danh sách sản phẩm theo danh mục
	@SuppressWarnings("unchecked")
	@RequestMapping("list-by-category/{id}.htm")
	public String listCategory(ModelMap model, @PathVariable("id") Integer id, HttpServletRequest request) {
		Session session = sessionFactory.getCurrentSession();
		// Phân trang sản phẩm theo danh mục
		String hqlCount = "SELECT COUNT(p) FROM Product p WHERE p.status = 1 and p.category.id=:cid1";
		Long rowCount = (Long) session.createQuery(hqlCount).setParameter("cid1", id).uniqueResult();
		PagerModel pager = new PagerModel();
		pager = PagerModel.getPager("acpager", 9, rowCount.intValue(), request);
		pager.setRowCount(rowCount.intValue());
		pager.navigate(request);
		model.addAttribute("flat", "list-by-category/" + id);
		// Lấy danh sách sản phẩm theo danh mục
		String hql = "FROM Product p WHERE p.status = 1 and p.category.id=:cid";
		Query query = session.createQuery(hql);
		query.setParameter("cid", id);
		query.setFirstResult(pager.getStartRow());
		query.setMaxResults(pager.getPageSize());
		List<Product> list = query.list();
		model.addAttribute("list", list);
		return "user/product-list";
	}

	// Show danh sách sản phẩm theo hãng sản xuất
	@SuppressWarnings("unchecked")
	@RequestMapping("list-by-producer/{id}.htm")
	public String listProducer(ModelMap model, @PathVariable("id") Integer id, HttpServletRequest request) {
		Session session = sessionFactory.getCurrentSession();
		// Phân trang sản phẩm theo hãng
		String hqlCount = "SELECT COUNT(p) FROM Product p WHERE p.status = 1 and p.producer.id = :pid1";
		Long rowCount = (Long) session.createQuery(hqlCount).setParameter("pid1", id).uniqueResult();
		PagerModel pager = new PagerModel();
		pager = PagerModel.getPager("acpager", 9, rowCount.intValue(), request);
		pager.setRowCount(rowCount.intValue());
		pager.navigate(request);
		model.addAttribute("flat", "list-by-producer/" + id);
		// Show danh sách sản phẩm theo hãng
		String hql = "FROM Product p WHERE p.status = 1 and p.producer.id = :pid";
		Query query = session.createQuery(hql);
		query.setParameter("pid", id);
		query.setFirstResult(pager.getStartRow());
		query.setMaxResults(pager.getPageSize());
		List<Product> list = query.list();
		model.addAttribute("list", list);
		return "user/product-list";
	}

	// Xem chi tiết
	@RequestMapping("detail/{id}.htm")
	public String detailProduct(ModelMap model, HttpServletResponse response, @PathVariable("id") Integer id,
			@ModelAttribute("product") Product product, @CookieValue(value = "views", defaultValue = "") String views) {
		product.setId(id);
		Session session = sessionFactory.getCurrentSession();
		session.refresh(product);
		// Tăng số lần xem
		product.setViews(product.getViews() + 1);
		session.update(product);

		// Ghi nhận mặt hàng đã xem vào cookie
		if (!views.contains(id.toString())) {
			views += "," + id;
		}
		String hql = "FROM Product " + " WHERE id IN(2018" + views + ")";
		Query query = session.createQuery(hql);
		model.addAttribute("views", query.list());

		Cookie cookie = new Cookie("views", views);
		cookie.setMaxAge(60 * 60 * 24 * 30);
		response.addCookie(cookie);

		return "user/product-detail";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("type/{value}.htm")
	public String listSpecial(ModelMap model, @PathVariable("value") String value, HttpServletRequest request) {
		Session session = sessionFactory.getCurrentSession();
		Long rowCount = (long) 0;
		Query query = null;
		// Danh sách hàng bán chạy
		if (value.equalsIgnoreCase("best")) {
			// Đếm sản phẩm trên 40 đơn hàng chi tiết
			String hqlCount = "SELECT COUNT(p) FROM Product p WHERE p.status = 1 and SIZE(p.orderDetail) >40";
			rowCount = (Long) session.createQuery(hqlCount).uniqueResult();
			System.out.println(rowCount);
			PagerModel pager = new PagerModel();
			pager = PagerModel.getPager("acpager", 9, rowCount.intValue(), request);
			pager.setRowCount(rowCount.intValue());
			pager.navigate(request);
			// Lấy danh sách sản phẩm trên 40 đơn hàng chi tiết
			String hql = "FROM Product p " + " WHERE p.status = 1 and SIZE(p.orderDetail) > 40 "
					+ " ORDER BY SIZE(p.orderDetail) DESC ";
			query = session.createQuery(hql);
			query.setFirstResult(pager.getStartRow());
			query.setMaxResults(pager.getPageSize());
			model.addAttribute("flat", "type/best");
		}
		// Danh sách hàng mới nhất
		else if (value.equalsIgnoreCase("latest")) {
			// Đếm sản phẩm mới nhất để phân trang
			String hqlCount = "SELECT COUNT(p) FROM Product p WHERE p.status =1 and p.latest=1";
			rowCount = (Long) session.createQuery(hqlCount).uniqueResult();
			if (rowCount > 24) {
				rowCount = (long) 24;
			}
			PagerModel pager = new PagerModel();
			pager = PagerModel.getPager("acpager", 9, rowCount.intValue(), request);
			pager.navigate(request);
			// Lấy danh sách sản phẩm mới nhất
			String hql = "FROM Product p WHERE p.status = 1 and p.latest = 1";
			query = session.createQuery(hql);
			query.setFirstResult(pager.getStartRow());
			query.setMaxResults(pager.getPageSize());
			model.addAttribute("flat", "type/latest");
		}
		// Danh sách hàng có lượt xem cao nhất
		else if (value.equalsIgnoreCase("views")) {
			// Đếm sản phẩm với lượt view cao hơn 0
			String hqlCount = "SELECT COUNT(p) FROM Product p WHERE p.status = 1 and p.views > 0";
			rowCount = (Long) session.createQuery(hqlCount).uniqueResult();
			if (rowCount > 24) {
				rowCount = (long) 24;
			}
			PagerModel pager = new PagerModel();
			pager = PagerModel.getPager("acpager", 9, rowCount.intValue(), request);
			pager.setRowCount(rowCount.intValue());
			pager.navigate(request);
			// Lấy danh sách sản phẩm theo views
			String hql = "FROM Product p WHERE p.status = 1 and p.views > 0 ORDER BY p.views DESC";
			query = session.createQuery(hql);
			query.setFirstResult(pager.getStartRow());
			query.setMaxResults(pager.getPageSize());
			model.addAttribute("flat", "type/views");
		}
		// Danh sách hàng có kiểu đăc biệt
		else if (value.equalsIgnoreCase("special")) {
			// Đếm danh sách sản phẩm và phân trang theo spcecial
			String hqlCount = "SELECT COUNT(p) FROM Product p WHERE p.status=1 and p.special = 1";
			rowCount = (Long) session.createQuery(hqlCount).uniqueResult();
			if (rowCount > 24) {
				rowCount = (long) 24;
			}
			PagerModel pager = new PagerModel();
			pager = PagerModel.getPager("acpager", 9, rowCount.intValue(), request);
			pager.setRowCount(rowCount.intValue());
			pager.navigate(request);
			// Lấy danh sách sản phẩm theo kiểu đặc biệt
			String hql = "FROM Product p WHERE p.status = 1 and p.special=1";
			query = session.createQuery(hql);
			query.setFirstResult(pager.getStartRow());
			query.setMaxResults(pager.getPageSize());
			model.addAttribute("flat", "type/special");
		}
		// Danh sách hàng giảm giá
		else if (value.equalsIgnoreCase("saleoff")) {
			// Đếm sản phẩm theo loại giảm giá và phân trang
			String hqlCount = "SELECT COUNT(p) FROM Product p WHERE p.status = 1 and p.discount > 0 ";
			rowCount = (Long) session.createQuery(hqlCount).uniqueResult();
			if (rowCount > 24) {
				rowCount = (long) 24;
			}
			PagerModel pager = new PagerModel();
			pager = PagerModel.getPager("acpager", 9, rowCount.intValue(), request);
			pager.setRowCount(rowCount.intValue());
			pager.navigate(request);
			// Lấy danh sách sản phẩm theo giảm giá
			String hql = "FROM Product p WHERE p.status = 1 and p.discount > 0 ORDER BY p.discount DESC ";
			query = session.createQuery(hql);
			query.setFirstResult(pager.getStartRow());
			query.setMaxResults(pager.getPageSize());
			model.addAttribute("flat", "type/saleoff");
		}
		// Danh sách hàng được yêu thích
		else if (value.equalsIgnoreCase("favorite")) {
			Map<Integer, Integer> map = new HashMap<Integer, Integer>();
			String path = application.getRealPath("like.txt");
			try {
				@SuppressWarnings("resource")
				Scanner scanner = new Scanner(new File(path));
				String values = scanner.nextLine();
				values = values.substring(1, value.length() - 1);
				System.out.println("values:" + values);
				String[] keyValuePairs = values.split(",");
				for (String pair : keyValuePairs) {
					String[] entry = pair.split("=");
					map.put(Integer.parseInt(entry[0].trim()), Integer.parseInt(entry[1].trim()));
					rowCount++;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			Set<Integer> key = map.keySet();
			String listId = key.toString();
			listId = listId.substring(1, listId.length() - 1);
			//
			PagerModel pager = new PagerModel();
			pager = PagerModel.getPager("acpager", 9, rowCount.intValue(), request);
			pager.setRowCount(rowCount.intValue());
			pager.navigate(request);
			//
			String hql = "FROM Product p WHERE p.status = 1 and p.id IN(" + listId + ")";
			query = session.createQuery(hql);
			query.setFetchSize(pager.getStartRow());
			query.setMaxResults(pager.getPageSize());
			model.addAttribute("flat", "type/favorite");
		}
		List<Product> list = query.list();
		model.addAttribute("list", list);
		return "user/product-list";
	}

	// Gửi mail link sản phẩm cho bạn bè
	@RequestMapping("sendToFriend")
	public String sendToFriend(ModelMap model, HttpServletRequest request, @RequestParam String id,
			@RequestParam String from, @RequestParam String to, @RequestParam String subject,
			@RequestParam String body) {

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setFrom(from);
			helper.setTo(to);
			helper.setSubject(subject);
			String url = request.getRequestURL().toString().replace("sendToFriend", "detail/" + id);
			System.out.println(url);
			String text = body + "<br/> Hãy click vào đây <a href='" + url + "'>Xem sản phẩm </a>";
			helper.setText(text, true);
			mailSender.send(message);
			model.addAttribute("message", "success");
		} catch (Exception e) {
			model.addAttribute("message", "error");
		}
		return "redirect:/user/product/detail/" + id + ".htm";
	}

}
