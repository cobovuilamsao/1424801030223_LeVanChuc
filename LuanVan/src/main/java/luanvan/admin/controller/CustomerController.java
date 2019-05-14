package luanvan.admin.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import luanvan.admin.service.CustomerService;
import luanvan.admin.validator.CustomerValidator;
import luanvan.model.Customer;
import luanvan.other.SendMail;

@Controller
@Transactional
@RequestMapping(value = "employee/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	@Autowired
	ServletContext application;

	// Trang chủ
	@RequestMapping(method = RequestMethod.GET)
	public String home(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		if (customerService.getRowCustomer() > 10) {
			if (request.getParameter("page") == null) {
				model.addAttribute("listCustomer", customerService.loadCustomerPage("1"));
			} else {
				model.addAttribute("listCustomer", customerService.loadCustomerPage(request.getParameter("page")));
			}
			double paging = Math.ceil(Double.valueOf(customerService.getRowCustomer()) / 10);
			model.addAttribute("rowCount", paging);
		} else {
			model.addAttribute("listCustomer", customerService.getAllCustomer());
		}
		return "employee/customer-home";
	}

	// Form thêm khách hàng
	@RequestMapping(value = "add-customer.htm", method = RequestMethod.GET)
	public String formAdd(ModelMap model) {
		model.addAttribute("customer", new Customer());
		return "employee/customer-add";
	}

	// Form sửa khách hàng
	@RequestMapping(value = "edit-customer/{id}.htm", method = RequestMethod.GET)
	public String formEdit(ModelMap model, @PathVariable("id") String id) {
		model.addAttribute("customer", customerService.getIDCustomer(id));
		return "employee/customer-edit";
	}

	// Thêm khách hàng
	@RequestMapping(value = "save-customer.htm", method = RequestMethod.POST)
	public String addCustomer(ModelMap model, @ModelAttribute("customer") @Validated Customer customer,
			@RequestParam("file_image") MultipartFile photo, BindingResult result) {
		try {
			CustomerValidator customerVali = new CustomerValidator();
			customerVali.validate(customer, result);
			if (customer.getEmail() == null) {
				result.reject("email");
			} else if (customerService.checkEmail(customer.getEmail()) > 0) {
				result.rejectValue("email", "error.customer.email.exit");
			}
			if (photo.isEmpty()) {
				result.rejectValue("photo", "message.photo");
			} else if (!photo.getOriginalFilename().endsWith(".jpg") && !photo.getOriginalFilename().endsWith(".png")
					&& !photo.getOriginalFilename().endsWith(".jpeg") && !photo.getOriginalFilename().endsWith(".JPG")
					&& !photo.getOriginalFilename().endsWith(".PNG")
					&& !photo.getOriginalFilename().endsWith(".JPEG")) {
				result.rejectValue("photo", "message.photo.format");
			}
			if (result.hasErrors()) {
				return "employee/customer-add";
			} else {
				if (!photo.isEmpty()) {
					String filePhoto = photo.getOriginalFilename();
					String photoPath = application.getRealPath("/images/customers/" + filePhoto);
					photo.transferTo(new File(photoPath));
					customer.setPhoto(filePhoto);
				}
				customerService.insertCustomer(customer);
				SendMail.sendMail(customer.getEmail(), "Xin Chào, Thành Viên: " + customer.getFullName(),
						"Bạn bây giờ đã có thể đăng nhập vào cửa hàng Hiếu Boy Shop. Hãy tha hồ mua sắm nhé :)))"
								+ "\nTài Khoản Email: " + customer.getEmail() + "\nMật Khẩu: "
								+ customer.getPassword());
				model.addAttribute("listCustomer", customerService.getAllCustomer());
			}
		} catch (Exception e) {
		}

		return "redirect:/employee/customer";
	}

	// Sửa khách hàng
	@RequestMapping(value = "edit-customer/{id}.htm", method = RequestMethod.POST)
	public String editCustomer(ModelMap model, @ModelAttribute("customer") Customer customer,
			@PathVariable("id") String id, @RequestParam("file_image") MultipartFile photo, BindingResult result) {
		try {
			CustomerValidator customerVali = new CustomerValidator();
			customerVali.validate(customer, result);
			if (photo.isEmpty()) {
				result.rejectValue("photo", "message.photo");
			} else if (!photo.getOriginalFilename().endsWith(".jpg") && !photo.getOriginalFilename().endsWith(".png")
					&& !photo.getOriginalFilename().endsWith(".jpeg") && !photo.getOriginalFilename().endsWith(".JPG")
					&& !photo.getOriginalFilename().endsWith(".PNG")
					&& !photo.getOriginalFilename().endsWith(".JPEG")) {
				result.rejectValue("photo", "message.photo.format");
			}
			if (result.hasErrors()) {
				return "employee/customer-edit";
			} else {
				if (!photo.isEmpty()) {
					String filePhoto = photo.getOriginalFilename();
					String photoPath = application.getRealPath("/images/customers/" + filePhoto);
					photo.transferTo(new File(photoPath));
					customer.setPhoto(filePhoto);
				}
				customerService.updateCustomer(customer);
				model.addAttribute("listCustomer", customerService.getAllCustomer());
			}
		} catch (Exception e) {
		}

		return "redirect:/employee/customer";
	}

	// Xóa khách hàng
	@RequestMapping(value = "delete-customer/{id}.htm", method = RequestMethod.GET)
	public String deleteCustomer(ModelMap model, @PathVariable("id") String id,
			@ModelAttribute("customer") Customer customer) {
		customerService.deleteCustomer(customer);
		return "redirect:/employee/customer";
	}

	// Tìm kiếm khách hàng
	@RequestMapping(value = "search.htm", method = RequestMethod.GET)
	public String searchCustomer(ModelMap model, @RequestParam("search") String search) {
		model.addAttribute("listCustomer", customerService.searchCustomer(search));
		return "employee/customer-home";
	}

}
