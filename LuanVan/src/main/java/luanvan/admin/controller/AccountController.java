package luanvan.admin.controller;

import javax.servlet.http.HttpServletRequest;

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

import luanvan.admin.service.AccountService;
import luanvan.model.Admin;

@Controller
@Transactional
@RequestMapping(value = "admin/account")
public class AccountController {

	@Autowired
	private AccountService accountService;

	// Trang chủ
	@RequestMapping(method = RequestMethod.GET)
	public String home(ModelMap model, HttpServletRequest request) {
		if (accountService.getRowAdmin() > 10) {
			if (request.getParameter("page") == null) {
				model.addAttribute("listAccount", accountService.loadAdminPage("1"));
			} else {
				model.addAttribute("listAccount", accountService.loadAdminPage(request.getParameter("page")));
			}
			double paging = Math.ceil(Double.valueOf(accountService.getRowAdmin()) / 10);
			model.addAttribute("rowCount", paging);
		} else {
			model.addAttribute("listAccount", accountService.getAllAdmin());
		}
		return "admin/account-home";
	}

	// Mở form thêm tài khoản
	@RequestMapping(value = "add-account.htm", method = RequestMethod.GET)
	public String formAdd(ModelMap model) {
		model.addAttribute("account", new Admin());
		return "admin/account-add";
	}

	// Mở form sửa tài khoản
	@RequestMapping(value = "edit-account/{username}.htm", method = RequestMethod.GET)
	public String formEdit(ModelMap model, @PathVariable("username") String username) {
		model.addAttribute("account", accountService.getIDAdmin(username));
		return "admin/account-edit";
	}

	// Lưu tài khoản
	@RequestMapping(value = "save-account.htm", method = RequestMethod.POST)
	public String saveAccount(ModelMap model, @ModelAttribute("account") @Validated Admin admin, BindingResult result) {
		if (admin.getUsername().trim().length() == 0) {
			result.rejectValue("username", "error.account.email");
		} else if (accountService.checkUsername(admin.getUsername()) > 0) {
			result.rejectValue("username", "message.email");
		}
		if (admin.getPassword().trim().length() == 0) {
			result.rejectValue("password", "error.account.password");
		}
		if (admin.getFullName().trim().length() == 0) {
			result.rejectValue("fullName", "error.account.fullName");
		}
		if (result.hasErrors()) {
			return "admin/account-add";
		} else {
			accountService.insertAdmin(admin);
		}
		return "redirect:/admin/account";
	}

	// Sửa dữ liệu
	@RequestMapping(value = "edit-account/{username}.htm", method = RequestMethod.POST)
	public String editAccount(ModelMap model, @PathVariable("username") String username,
			@ModelAttribute("account") Admin admin) {
		accountService.updateAdmin(admin);
		return "redirect:/admin/account";
	}


	// Xóa dữ liệu
	@RequestMapping(value = "delete-account/{username}.htm", method = RequestMethod.GET)
	public String deleteAccount(ModelMap model, @PathVariable("username") String username,
			@ModelAttribute(value = "account") Admin admin) {
		accountService.deleteAdmin(admin);
		return "redirect:/admin/account";
	}

	// Tìm kiếm
	@RequestMapping(value = "search.htm", method = RequestMethod.GET)
	public String searchAccount(ModelMap model, @RequestParam("search") String search) {
		model.addAttribute("listAccount", accountService.searchAdmin(search));
		return "admin/account-home";
	}

}
