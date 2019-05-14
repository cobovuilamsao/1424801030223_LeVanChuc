package luanvan.controller;

import java.io.File;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import luanvan.admin.controller.ShopController;
import luanvan.model.Customer;

@Controller
@Transactional
@RequestMapping(value = "user")
public class UserAccountController extends ShopController {

	@Autowired
	ServletContext application;
	@Autowired
	JavaMailSender mailSender;
	@Autowired
	HttpSession httpSession;

	// Mở form quên mật khẩu
	@RequestMapping(value = "forgot", method = RequestMethod.GET)
	public String formForgot(ModelMap model) {
		model.addAttribute("user", new Customer());
		return "user/forgot";
	}

	// Xử lý láy lại mật khẩu
	@RequestMapping(value = "forgot", method = RequestMethod.POST)
	public String forgot(ModelMap model, @ModelAttribute("user") Customer user) {
		String email = user.getEmail();
		Session session = sessionFactory.getCurrentSession();
		try {
			session.refresh(user);
			if (email.equals(user.getEmail())) {
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(message, true);
					helper.setFrom("Hiếu Boy Shop <hieuboyfc@gmail.com>");
					helper.setTo(email);
					helper.setReplyTo("Hiếu Boy Shop <hieuboyfc@gmail.com>");
					helper.setSubject("Nhận Lại Mật Khẩu - Người Dùng");
					helper.setText("Địa chỉ email: " + user.getEmail() + "<br> + Tài khoản của bạn: " + user.getId()
							+ "<br>+ Mật khẩu của bạn là: " + user.getPassword(), true);
					mailSender.send(message);
					model.addAttribute("message", "Mật khẩu đã được gửi đến địa chỉ email của bạn !");
				} catch (Exception ex) {
					model.addAttribute("message", ex.getMessage());
				}
			} else {
				model.addAttribute("message", "Sai địa chỉ email !");
			}
		} catch (Exception e) {
			model.addAttribute("message", "Sai tài khoản !");
		}
		model.addAttribute("user", new Customer());
		return "user/forgot";
	}

	// Mở Form đổi thông tin cá nhân
	@RequestMapping(value = "change-info/{id}.htm", method = RequestMethod.GET)
	public String formChangeInfo(ModelMap model, @PathVariable(value = "id") String id) {
		Session session = sessionFactory.getCurrentSession();
		Customer user = (Customer) session.get(Customer.class, id);
		model.addAttribute("user", user);
		return "user/changeInfo";
	}

	// Thực hiện thay đổi thông tin cá nhân
	@RequestMapping(value = "change-info/{id}.htm", method = RequestMethod.POST)
	public String changeInfo(ModelMap model, @PathVariable(value = "id") String id,
			@ModelAttribute("user") Customer user, @RequestParam("file_image") MultipartFile photo) {
		Session session = sessionFactory.getCurrentSession();
		try {
			if (!photo.isEmpty()) {
				String filePhoto = photo.getOriginalFilename();
				String path = application.getRealPath("/images/customers/" + filePhoto);
				photo.transferTo(new File(path));
				user.setPhoto(filePhoto);
			}
			session.update(user);
			session.refresh(user);
			httpSession.setAttribute("user", user);
			model.addAttribute("message", "Cập nhật thành công");
		} catch (Exception e) {
			model.addAttribute("message", "Cập nhật thất bại");
		}
		return "user/changeInfo";
	}

	// Mở Form đổi mật khẩu
	@RequestMapping(value = "change-pass/{id}.htm", method = RequestMethod.GET)
	public String formChangePass(ModelMap model, @PathVariable("id") String id) {
		Session session = sessionFactory.getCurrentSession();
		Customer user = (Customer) session.get(Customer.class, id);
		model.addAttribute("user", user);
		return "user/changePass";
	}

	// Thực hiện đổi mật khẩu
	@RequestMapping(value = "change-pass/{id}.htm", method = RequestMethod.POST)
	public String changePass(ModelMap model, @PathVariable("id") String id, @ModelAttribute("user") Customer user,
			@RequestParam("password1") String password1, @RequestParam("password2") String password2) {

		Customer oldPass = (Customer) httpSession.getAttribute("user");
		if (oldPass.getPassword().equals(user.getPassword())) {
			if (!password1.equals(password2)) {
				model.addAttribute("message", "Xác nhận mật khẩu không đúng");
			} else if (password1.equals(password2)) {
				oldPass.setPassword(password1);
				Session session = sessionFactory.getCurrentSession();
				session.update(oldPass);
				model.addAttribute("message", "Đổi mật khẩu thành công");
			}
		} else {
			model.addAttribute("message", "Mật khẩu cũ không đúng");
		}
		return "user/changePass";

	}

	// Mở form đăng nhập
	@RequestMapping(method = RequestMethod.GET)
	public String formLogin(ModelMap model, @CookieValue(defaultValue = "") String id,
			@CookieValue(defaultValue = "") String pw) {
		Customer user = new Customer();
		user.setId(id);
		user.setPassword(pw);
		model.addAttribute("user", user);
		return "user/login";
	}

	// Thực hiện đăng nhập
	@RequestMapping(method = RequestMethod.POST)
	public String login(ModelMap model, @ModelAttribute("user") Customer user,
			@RequestParam(defaultValue = "false") boolean remember, HttpServletResponse response) {

		Customer customer = new Customer();
		customer.setId(user.getId());

		Session session = sessionFactory.getCurrentSession();
		try {
			session.refresh(customer);

			if (user.getPassword().equals(customer.getPassword())) {
				if (!customer.getActivated()) {
					model.addAttribute("message", "Tài khoản chưa được kích hoạt !");
					return "user/login";
				} else {
					httpSession.setAttribute("user", customer);
					// Ghi nhớ tài khoản bằng cookie
					Cookie ckUser = new Cookie("id", user.getId());
					Cookie ckPass = new Cookie("pw", user.getPassword());
					int expiry = 30 * 24 * 60 * 60;
					if (!remember) {
						expiry = 0;
					}
					ckUser.setMaxAge(expiry);
					ckPass.setMaxAge(expiry);

					response.addCookie(ckUser);
					response.addCookie(ckPass);

					return "user/index";
				}
			} else {
				model.addAttribute("message", "Mật khẩu không đúng !");
			}
		} catch (Exception ex) {
			model.addAttribute("message", "Tài khoản không đúng !");
		}
		return "user/login";
	}

	// Mở form đăng ký
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String formRegister(ModelMap model) {
		model.addAttribute("register", new Customer());
		return "user/register";
	}

	// Thực hiện đăng ký
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(ModelMap model, @ModelAttribute("register") Customer customer,
			@RequestParam("file_image") MultipartFile photo, HttpServletRequest request) {
		try {
			Session session = sessionFactory.getCurrentSession();

			if (!photo.isEmpty()) {
				String filePhoto = photo.getOriginalFilename();
				String path = application.getRealPath("/images/customers/" + filePhoto);
				photo.transferTo(new File(path));
				customer.setPhoto(filePhoto);
			}
			session.save(customer);
			// Gửi mật khẩu qua mail

			/*
			 * try { MimeMessage massage = mailSender.createMimeMessage(); MimeMessageHelper
			 * helper = new MimeMessageHelper(massage, true);
			 * helper.setFrom("Shop Online <caogiachuc@gmail.com>");
			 * helper.setTo(customer.getEmail());
			 * helper.setReplyTo("Quản trị admin <caogiachuc@gmail.com>");
			 * helper.setSubject("Welcome: " + customer.getFullName()); String url =
			 * request.getRequestURL().toString().replace("register", "activate/" +
			 * customer.getId() + ".htm"); String text = "Xin chào: " +
			 * customer.getFullName() +
			 * "<br> Bạn đã đăng ký thành công tài khoản tại Shop online của chúng tôi" +
			 * "<br> Hãy click vào đường dẫn này <a href='" + url +
			 * "'>Kích Hoạt </a> để kích hoạt tài khoản của bạn !"; helper.setText(text,
			 * true); mailSender.send(massage); } catch (Exception ex) {
			 * model.addAttribute("message", "Lỗi gửi mail"); }
			 */

			
			
				//String status_note_login= "Welcome: " + customer.getFullName();
				String url = request.getRequestURL().toString().replace("register",
						"activate/" + customer.getId() + ".htm");
				String text = "Xin chào: " + customer.getFullName()
						+ "<br> Bạn đã đăng ký thành công tài khoản tại Shop online của chúng tôi"
						+ "<br> Click vào <a style='color:green' href='" + url
						+ "'>Đây </a> để kích hoạt tài khoản của bạn !";
				

		
				model.addAttribute("status_note_login", text);
			// customer.setActivated(true);
			// model.addAttribute("status_note_login", "Login successfully");
			// model.addAttribute("status_message", "Bạn phải login lại lần nữa để vào hệ
			// thống mua hàng nhé");

		} catch (Exception ex) {
			model.addAttribute("message", "Đăng ký lỗi");

		}
		return "user/register";

	}

	// Kích hoạt tài khoản

	@RequestMapping(value = "activate/{id}.htm", method = RequestMethod.GET)
	public String activate(ModelMap model, @PathVariable("id") String id) {
		Session session = sessionFactory.getCurrentSession();
		Customer user = (Customer) session.load(Customer.class, id);
		user.setActivated(true);
		session.update(user);
		return "redirect:/user";
	}

	// Đăng xuất
	@RequestMapping("logout")
	public String logout(ModelMap model) {
		httpSession.removeAttribute("user");
		return "redirect:/user";
	}
}
