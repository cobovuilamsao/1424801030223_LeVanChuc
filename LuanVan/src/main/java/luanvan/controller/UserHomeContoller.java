package luanvan.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import luanvan.model.Category;
import luanvan.model.Producer;
import luanvan.model.Product;
import luanvan.other.ShoppingCart;

@Controller
@Transactional
@RequestMapping(value = "user")
public class UserHomeContoller {

	@Autowired
	JavaMailSender mailSender;
	@Autowired
	SessionFactory sessionFactory;

	@RequestMapping(value = "feedback")
	public String showFeedback() {
		return "user/feedback";
	}

	@RequestMapping(value = "feedback", method = RequestMethod.POST)
	public String feedback(ModelMap model, @RequestParam("name") String name, @RequestParam("email") String email,
			@RequestParam("comboCate") String comboCate, @RequestParam("info") String info) {

		String category = "";
		if (comboCate.equals("web")) {
			category = "Website";
		} else if (comboCate.equals("service")) {
			category = "Chất lượng sản phẩm - dịch vụ";
		} else {
			category = "Thái độ phục vụ của nhân viên";
		}

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setFrom(email);
			helper.setTo("thanhtuyen98hp@gmail.com");
			helper.setReplyTo("Hiếu Boy Shop <hieuboyfc@gmail.com>");
			helper.setSubject("[Feedback] Thư đóng góp ý kiến của khách hàng: " + name);
			helper.setText(
					"+ Email phản hồi: " + email + " <br>+ Chủ đề góp ý: " + category + " <br>+ Nội dung: " + info,
					true);
			mailSender.send(message);
			model.addAttribute("message", "Gửi phản hồi thành công. Cảm ơn bạn đã đóng góp ý kiến cho Hiếu Boy Shop.");
		} catch (Exception ex) {
			model.addAttribute("message", "Có lỗi xảy ra trong quá trình gửi thư phản hồi");
		}
		return "user/feedback";
	}

	@RequestMapping(value = "about")
	public String userAbout() {
		return "user/about";
	}

	@RequestMapping(value = "home")
	public String userHome() {
		return "user/index";
	}

	@RequestMapping(value = "contact")
	public String userContact() {
		return "user/contact";
	}

	@Autowired
	protected ShoppingCart cart;

	@ModelAttribute("cart")
	public ShoppingCart getShoppingCart() {
		return cart;
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
	@ModelAttribute("saleOffProducts")
	public List<Product> get9SaleOffProducts() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Product p WHERE p.status = 1 AND p.discount > 0 ORDER BY p.discount DESC";
		Query query = session.createQuery(hql);
		query.setMaxResults(9);
		return query.list();
	}
}
