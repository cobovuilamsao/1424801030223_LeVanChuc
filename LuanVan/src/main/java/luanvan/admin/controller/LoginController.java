package luanvan.admin.controller;

import java.io.File;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import org.springframework.mail.javamail.JavaMailSender;

import luanvan.admin.service.AccountService;
import luanvan.admin.service.EmployeeService;
import luanvan.admin.validator.EmployeeValidator;
import luanvan.model.Admin;
import luanvan.model.Employee;

@Controller
@Transactional
public class LoginController {

	@Autowired
	AccountService accountService;
	@Autowired
	EmployeeService employeeService;
	@Autowired
	ServletContext application;
	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	JavaMailSender mailSender;
	@Autowired
	HttpSession httpSession;

	// Form Login
	@RequestMapping(value = "admin", method = RequestMethod.GET)
	public String formLogin(ModelMap model) {
		model.addAttribute("loginForm", new Admin());
		return "admin/login";
	}

	// Xử Lý Login
	@RequestMapping(value = "admin", method = RequestMethod.POST)
	public String login(ModelMap model, @ModelAttribute("loginForm") Admin admin, HttpServletRequest request,
			HttpServletResponse response, BindingResult result) {

		if (admin.getUsername().trim().length() == 0) {
			result.rejectValue("username", "error.account.email");
		} else if (accountService.checkUsername(admin.getUsername()) == 0) {
			result.rejectValue("username", "error.email.error");
		}
		if (admin.getPassword().trim().length() == 0) {
			result.rejectValue("password", "error.account.password");
		} else if (accountService.checkPassword(admin.getPassword()) == 0) {
			result.rejectValue("password", "error.password.error");
		}

		if (result.hasErrors()) {
			return "admin/login";
		} else {
			Admin login = accountService.login(admin.getUsername(), admin.getPassword());
			if (login != null) {
				HttpSession session = request.getSession();
				session.setAttribute("account", login);
				return "redirect:/admin/home";
			}
		}
		return "admin/login";
	}

	// Mở form đổi mật khẩu
	@RequestMapping(value = "admin/change-pass/{username}.htm", method = RequestMethod.GET)
	public String formChangePass(ModelMap model, @PathVariable(value = "username") String username) {
		model.put("account", accountService.getIDAdmin(username));
		return "admin/account-changePass";
	}

	// Đổi mật khẩu
	@RequestMapping(value = "admin/change-pass/{username}.htm", method = RequestMethod.POST)
	public String changePass(ModelMap model, @PathVariable(value = "username") String username,
			@ModelAttribute(value = "account") Admin admin, BindingResult result,
			@RequestParam("password1") String password1, @RequestParam("password2") String password2) {
		/*
		 * if (admin.getPassword().trim().length() == 0) {
		 * result.rejectValue("password", "password.null"); } else if
		 * (accountService.checkPassword(admin.getPassword()) != 0) {
		 * result.rejectValue("password", "password.error"); }
		 */
		if (password1.trim().length() == 0) {
			result.rejectValue("password", "error.password.null");
		} else if (password2.trim().length() == 0) {
			result.rejectValue("password", "error.password.null");
		}
		if (result.hasErrors()) {
			return "admin/account-changePass";
		} else {
			if (!password1.equals(password2)) {
				result.rejectValue("password", "error.password.error");
				return "admin/account-changePass";
			} else if (password1.equals(admin.getPassword()) == password2.equals(admin.getPassword())) {
				Admin account = accountService.getIDAdmin(username);
				account.setPassword(password2);
				accountService.updateAdmin(account);
			}
		}
		return "redirect:/admin/account";
	}

	// Form quên mật khẩu
	@RequestMapping(value = "admin/forgot.htm", method = RequestMethod.GET)
	public String showForgotFormAdmin(ModelMap model) {
		model.addAttribute("account", new Admin());
		return "admin/forgot";
	}

	// Lấy lại mật khẩu
	@RequestMapping(value = "admin/forgot.htm", method = RequestMethod.POST)
	public String submitForgotFormAdmin(ModelMap model, @ModelAttribute Admin account, BindingResult result) {
		/*
		 * if (employee.getId() == null) { result.reject("id"); } else if
		 * (employeeService.checkIdEmployee(employee.getId()) == 0) {
		 * result.rejectValue("id", "error.employee.id.null"); } if
		 * (employee.getEmail() == null) { result.reject("email"); } else if
		 * (employee.getEmail().trim().length() == 0) {
		 * result.rejectValue("email", "error.employee.email"); } else if
		 * (employeeService.checkEmailEmployee(employee.getEmail()) == 0) {
		 * result.rejectValue("email", "error.email.exit"); } if
		 * (result.hasErrors()) { return "employee/forgot"; }
		 */
		String username = account.getFullName();
		Session session = sessionFactory.getCurrentSession();
		try {
			session.refresh(account);
			if (username.equals(account.getFullName())) {
				// Gửi mật khẩu qua email
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(message, true);
					helper.setFrom("Hiếu Boy Shop <hieuboyfc@gmail.com>");
					helper.setTo(account.getUsername());
					helper.setReplyTo("Hiếu Boy Shop <hieuboyfc@gmail.com>");
					helper.setSubject("Nhận Lại Mật Khẩu - Quản Trị");
					helper.setText("Địa chỉ email: " + account.getUsername() + " <br>+ Mật khẩu của bạn là: "
							+ account.getPassword(), true);

					mailSender.send(message);
					model.addAttribute("message", "Mật khẩu đã được gửi đến email của bạn !");
				} catch (Exception ex) {
					model.addAttribute("message", ex.getMessage());
				}
			} else {
				model.addAttribute("message2", "Sai địa chỉ email !");
			}

		} catch (Exception e) {
			model.addAttribute("message1", "Sai tên quản trị !");
		}
		model.addAttribute("account", new Admin());
		return "admin/forgot";
	}

	// Logout
	@RequestMapping(value = "admin/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.removeAttribute("account");
		return "redirect:/admin/home";
	}

	// ==> Employee

	// Form Login
	@RequestMapping(value = "employee", method = RequestMethod.GET)
	public String formLogin2(ModelMap model) {
		model.addAttribute("loginForm", new Employee());
		return "employee/login";
	}

	// Xử Lý Login
	@RequestMapping(value = "employee", method = RequestMethod.POST)
	public String login2(ModelMap model, @ModelAttribute("loginForm") Employee employee, HttpServletRequest request,
			HttpServletResponse response, BindingResult result) {

		if (employee.getId().trim().length() == 0) {
			result.rejectValue("id", "error.account.id");
		} else if (employeeService.checkIdEmployee(employee.getId()) == 0) {
			result.rejectValue("id", "error.id.error");
		}
		if (employee.getPassword().trim().length() == 0) {
			result.rejectValue("password", "error.account.password");
		} else if (employeeService.checkPasswordEmployee(employee.getPassword()) == 0) {
			result.rejectValue("password", "error.password.error");
		}

		if (result.hasErrors()) {
			return "employee/login";
		} else {
			Employee login = employeeService.login(employee.getId(), employee.getPassword());
			if (login != null) {
				HttpSession session = request.getSession();
				session.setAttribute("employee", login);
				return "redirect:/employee/home";
			}
		}
		return "employee/login";
	}

	// Mở form đổi mật khẩu
	@RequestMapping(value = "employee/change-pass/{id}.htm", method = RequestMethod.GET)
	public String formChangePass2(ModelMap model, @PathVariable(value = "id") String id) {
		model.addAttribute("employee", employeeService.getIDEmployee(id));
		return "employee/account-changePass";
	}

	// Đổi mật khẩu
	@RequestMapping(value = "employee/change-pass/{id}.htm", method = RequestMethod.POST)
	public String changePass2(ModelMap model, @PathVariable(value = "id") String id,
			@ModelAttribute(value = "employee") Employee employee, BindingResult result,
			@RequestParam("password1") String password1, @RequestParam("password2") String password2) {

		/*
		 * if (admin.getPassword().trim().length() == 0) {
		 * result.rejectValue("password", "password.null"); } else if
		 * (accountService.checkPassword(admin.getPassword()) != 0) {
		 * result.rejectValue("password", "password.error"); }
		 */
		if (password1.trim().length() == 0) {
			result.rejectValue("password", "error.password.null");
		} else if (password2.trim().length() == 0) {
			result.rejectValue("password", "error.password.null");
		}
		if (result.hasErrors()) {
			return "employee/account-changePass";
		} else {
			if (!password1.equals(password2)) {
				result.rejectValue("password", "error.password.error");
				return "employee/account-changePass";
			} else if (password1.equals(employee.getPassword()) == password2.equals(employee.getPassword())) {
				Employee account = employeeService.getIDEmployee(id);
				account.setPassword(password2);
				employeeService.editEmployee(account);
			}
		}
		return "redirect:/employee/home";
	}

	// Mở form đổi thông tin
	@RequestMapping(value = "employee/change-info/{id}.htm", method = RequestMethod.GET)
	public String formChangeInfo(ModelMap model, @PathVariable(value = "id") String id) {
		model.addAttribute("employee", employeeService.getIDEmployee(id));
		return "employee/account-changeInfo";
	}

	// Đổi thông tin
	@RequestMapping(value = "employee/change-info/{id}.htm", method = RequestMethod.POST)
	public String editChangeInfo(ModelMap model, @PathVariable("id") String id,
			@ModelAttribute(value = "employee") Employee employee, BindingResult result,
			@RequestParam("file_image") MultipartFile photo) {
		try {
			EmployeeValidator empVali = new EmployeeValidator();
			empVali.validate(employee, result);
			if (photo.isEmpty()) {
				result.rejectValue("photo", "message.photo");
			} else if (!photo.getOriginalFilename().endsWith(".jpg") && !photo.getOriginalFilename().endsWith(".png")
					&& !photo.getOriginalFilename().endsWith(".jpeg") && !photo.getOriginalFilename().endsWith(".JPG")
					&& !photo.getOriginalFilename().endsWith(".PNG")
					&& !photo.getOriginalFilename().endsWith(".JPEG")) {
				result.rejectValue("photo", "message.photo.format");
			}
			if (result.hasErrors()) {
				return "employee/account-changeInfo";
			} else {
				if (!photo.isEmpty()) {
					String filePhoto = photo.getOriginalFilename();
					String photoPath = application.getRealPath("/images/employees/" + filePhoto);
					photo.transferTo(new File(photoPath));
					employee.setPhoto(filePhoto);
				}
				httpSession.setAttribute("employee", employee);
				employeeService.editEmployee(employee);

			}
		} catch (Exception e) {
		}
		return "redirect:/employee/home";
		
	}

	// Form quên mật khẩu
	@RequestMapping(value = "employee/forgot.htm", method = RequestMethod.GET)
	public String showForgotForm(ModelMap model) {
		model.addAttribute("employee", new Employee());
		return "employee/forgot";
	}

	// Lấy lại mật khẩu
	@RequestMapping(value = "employee/forgot.htm", method = RequestMethod.POST)
	public String submitForgotForm(ModelMap model, @ModelAttribute Employee employee, BindingResult result) {
		/*
		 * if (employee.getId() == null) { result.reject("id"); } else if
		 * (employeeService.checkIdEmployee(employee.getId()) == 0) {
		 * result.rejectValue("id", "error.employee.id.null"); } if
		 * (employee.getEmail() == null) { result.reject("email"); } else if
		 * (employee.getEmail().trim().length() == 0) {
		 * result.rejectValue("email", "error.employee.email"); } else if
		 * (employeeService.checkEmailEmployee(employee.getEmail()) == 0) {
		 * result.rejectValue("email", "error.email.exit"); } if
		 * (result.hasErrors()) { return "employee/forgot"; }
		 */
		String email = employee.getEmail();
		Session session = sessionFactory.getCurrentSession();
		try {
			session.refresh(employee);
			if (email.equals(employee.getEmail())) {
				// Gửi mật khẩu qua email
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(message, true);
					helper.setFrom("Hiếu Boy Shop <hieuboyfc@gmail.com>");
					helper.setTo(email);
					helper.setReplyTo("Hiếu Boy Shop <hieuboyfc@gmail.com>");
					helper.setSubject("Nhận Lại Mật Khẩu - Nhân Viên");
					helper.setText("Địa chỉ email: " + employee.getEmail() + " <br>+ Mật khẩu của bạn là: "
							+ employee.getPassword(), true);

					mailSender.send(message);
					model.addAttribute("message", "Mật khẩu đã được gửi đến email của bạn !");
				} catch (Exception ex) {
					model.addAttribute("message", ex.getMessage());
				}
			} else {
				model.addAttribute("message2", "Sai địa chỉ email !");
			}
		} catch (Exception e) {
			model.addAttribute("message1", "Sai tên người dùng của nhân viên !");
		}
		model.addAttribute("employee", new Employee());
		return "employee/forgot";
	}

	// Logout
	@RequestMapping(value = "employee/logout", method = RequestMethod.GET)
	public String logout2(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.removeAttribute("employee");
		return "redirect:/employee/home";
	}

}
