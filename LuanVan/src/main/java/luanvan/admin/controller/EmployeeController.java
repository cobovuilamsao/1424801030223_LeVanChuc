package luanvan.admin.controller;

import java.io.File;
import java.util.Date;

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

import luanvan.admin.service.ContractService;
import luanvan.admin.service.EmployeeService;
import luanvan.admin.validator.ContractValidator;
import luanvan.admin.validator.EmployeeValidator;
import luanvan.model.*;
import luanvan.other.SendMail;

@Controller
@Transactional
@RequestMapping(value = "admin/employee")
public class EmployeeController extends ShopController {

	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private ContractService contractService;
	@Autowired
	ServletContext application;

	// Trang chủ
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		if (employeeService.getRowEmpl() > 10) {
			if (request.getParameter("page") == null) {
				model.addAttribute("listEmployee", employeeService.loadEmplPage("1"));
			} else {
				model.addAttribute("listEmployee", employeeService.loadEmplPage(request.getParameter("page")));
			}
			double paging = Math.ceil(Double.valueOf(employeeService.getRowEmpl()) / 10);
			model.addAttribute("rowCount", paging);
		} else {
			model.addAttribute("listEmployee", employeeService.getAllEmployee());
			model.addAttribute("listDepartment", getDepartment());
			model.addAttribute("listEmployeeType", getEmployeeType());
		}
		return "admin/employee-home";

	}

	// Form thêm nhân viên
	@RequestMapping(value = "add-employee.htm", method = RequestMethod.GET)
	public String formAdd(ModelMap model) {
		model.addAttribute("employee", new Employee());
		return "admin/employee-add";
	}

	// Form sửa nhân viên
	@RequestMapping(value = "edit-employee/{id}.htm", method = RequestMethod.GET)
	public String formEdit(ModelMap model, @PathVariable("id") String id) {
		model.addAttribute("employee", employeeService.getIDEmployee(id));
		return "admin/employee-edit";
	}

	// Lưu dữ liệu
	@RequestMapping(value = "save-employee.htm", method = RequestMethod.POST)
	public String saveEmployee(ModelMap model, @ModelAttribute(value = "employee") @Validated Employee employee,
			BindingResult result, @RequestParam("file_image") MultipartFile photo) {
		try {
			EmployeeValidator empVali = new EmployeeValidator();
			empVali.validate(employee, result);
			if (employeeService.checkIdEmployee(employee.getId()) > 0) {
				result.rejectValue("id", "message.id");
			}
			if (employeeService.checkEmailEmployee(employee.getEmail()) > 0) {
				result.rejectValue("email", "message.email");
			}
			if (employeeService.checkPhoneEmployee(employee.getNumberPhone()) > 0) {
				result.rejectValue("numberPhone", "message.numberPhone");
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
				return "admin/employee-add";
			} else {
				if (!photo.isEmpty()) {
					String filePhoto = photo.getOriginalFilename();
					String photoPath = application.getRealPath("/images/employees/" + filePhoto);
					photo.transferTo(new File(photoPath));
					employee.setPhoto(filePhoto);
				}
				employeeService.insertEmployee(employee);
				SendMail.sendMail(employee.getEmail(), "Xin Chào, Thành Viên: " + employee.getNameEmployee(),
						"Bạn đã là thành viên chính thức là nhân viên của cửa hàng Hiếu Boy Shop" + "\nĐịa Chỉ Email: "
								+ employee.getEmail() + "\nTài Khoản: " + employee.getId() + "\nMật Khẩu: "
								+ employee.getPassword() + "\nĐịa Chỉ: " + employee.getAddress() + "\nSố Điện Thoại: "
								+ employee.getNumberPhone() + "\nNgày Sinh: " + employee.getBirthday()
								+ "\nLoại Nhân Viên: " + employee.getEmployeeType().getNameEmployeeType()
								+ "\nPhòng Ban: " + employee.getDepartment().getNameDepartment());
				model.addAttribute("listEmployee", employeeService.getAllEmployee());
			}
		} catch (Exception e) {
		}
		return "redirect:/admin/contract/add-contract.htm";

	}

	// Sửa dữ liệu
	@RequestMapping(value = "edit-employee/{id}.htm", method = RequestMethod.POST)
	public String editEmployee(ModelMap model, @PathVariable("id") String id,
			@ModelAttribute(value = "employee") @Validated Employee employee, BindingResult result) {
		EmployeeValidator empVali = new EmployeeValidator();
		empVali.validate(employee, result);
		if (result.hasErrors()) {
			return "admin/employee-edit";
		} else {
			employeeService.editEmployee(employee);
			model.addAttribute("listEmployee", employeeService.getAllEmployee());
		}
		return "redirect:/admin/employee";

	}
	// Xóa dữ liệu

	@RequestMapping(value = "delete-employee/{id}.htm", method = RequestMethod.GET)
	public String deleteEmployee(ModelMap model, @PathVariable("id") String id,
			@ModelAttribute(value = "employee") Employee employee) {
		/*
		 * Contract contract = new Contract();
		 * contractService.deleteContract(contract);
		 */
		employeeService.deleteEmployee(employee);
		model.addAttribute("listEmployee", employeeService.getAllEmployee());
		return "redirect:/admin/employee";
	}

	// Xem Chi Tiết
	@RequestMapping(value = "detail/{id}.htm", method = RequestMethod.GET)
	public String detailEmployee(ModelMap model, @PathVariable("id") String id) {
		model.addAttribute("employee", employeeService.getIDEmployee(id));
		return "admin/employee-detail";
	}

	// Thay Đổi Ảnh Trong Xem Chi Tiết
	@RequestMapping(value = "changePhoto-detail/{id}.htm", method = RequestMethod.POST)
	public String changePhotoDetail(ModelMap model, @PathVariable("id") String id,
			@RequestParam("file_image") MultipartFile photo, @ModelAttribute(value = "employee") Employee employee,
			BindingResult result) {
		try {
			if (!photo.getOriginalFilename().endsWith(".jpg") && !photo.getOriginalFilename().endsWith(".png")
					&& !photo.getOriginalFilename().endsWith(".jpeg") && !photo.getOriginalFilename().endsWith(".JPG")
					&& !photo.getOriginalFilename().endsWith(".PNG")
					&& !photo.getOriginalFilename().endsWith(".JPEG")) {
				result.rejectValue("photo", "message.photo.format");
			} else if (!photo.isEmpty()) {
				String filePhoto = photo.getOriginalFilename();
				String photoPath = application.getRealPath("/images/employees/" + filePhoto);
				photo.transferTo(new File(photoPath));
				employee.setPhoto(filePhoto);
			}
			employeeService.editEmployee(employee);
			model.addAttribute("department", getDepartment());
			model.addAttribute("employeeType", getEmployeeType());
		} catch (Exception e) {

		}
		return "admin/employee-detail";
	}

	// Lọc và tìm kiếm
	@RequestMapping(value = "filter.htm", method = RequestMethod.GET)
	public String filterEmployee(ModelMap model, @RequestParam("NV") String byNV, @RequestParam("PB") String byPB,
			@RequestParam("LNV") String byLNV) {
		if (byNV.equals("") && byPB.equals("") && byLNV.equals("")) {
			model.addAttribute("listEmployee", employeeService.getAllEmployee());
		} else if (byNV.equals("") && byPB.equals("")) {
			model.addAttribute("listEmployee", employeeService.getEmployeeByEmployeeType(byLNV));
		} else if (byNV.equals("") && byLNV.equals("")) {
			model.addAttribute("listEmployee", employeeService.getEmployeeByDepartment(byPB));
		} else if (byNV.equals("")) {
			model.addAttribute("listEmployee", employeeService.getDepartmentAndEmployeeType(byPB, byLNV));
		} else if (byLNV.equals("") && byPB.equals("")) {
			model.addAttribute("listEmployee", employeeService.searchByEmpl(byNV));
		} else {
			model.addAttribute("listEmployee", employeeService.searchBy3(byNV, byPB, byLNV));
		}
		model.addAttribute("listDepartment", getDepartment());
		model.addAttribute("listEmployeeType", getEmployeeType());
		return "admin/employee-home";
	}

	// Reset Password
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "reset-password/{id}.htm", method = RequestMethod.GET)
	public String formReset(ModelMap model, @PathVariable(value = "id") String id,
			@ModelAttribute(value = "employee") Employee employee) {
		employee = employeeService.getIDEmployee(id);
		employee.setPassword("hieuboyshop" + new Date().getDate() + new Date().getMonth() + new Date().getYear());
		employeeService.editEmployee(employee);
		SendMail.sendMail(employee.getEmail(), "Xin Chào, Thành Viên: " + employee.getNameEmployee(),
				"Mật khẩu của bạn vừa khôi phục:" + "\nTài Khoản Email: " + employee.getEmail() + "\nMật Khẩu: "
						+ employee.getPassword());
		model.addAttribute("listEmployee", employeeService.getAllEmployee());
		model.addAttribute("message", "Mật khẩu đã được gửi đến email của bạn !");
		return "admin/employee-home";
	}

	// ==> TEST ADD DỮ LIỆU 1 LÚC VÀO 2 BẢNG

	// Mở form thêm nhân viên và hợp đồng
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String test(ModelMap model) {
		Employee employee = new Employee();
		Contract contract = new Contract();
		model.addAttribute("employee", employee);
		model.addAttribute("contract", contract);
		return "admin/test";
	}

	// Lưu nhân viên và hợp đồng
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(ModelMap model, @ModelAttribute Employee employee, @ModelAttribute Contract contract,
			BindingResult result, @RequestParam("id") String id, @RequestParam("file_image") MultipartFile photo) {
		try {
			EmployeeValidator empVali = new EmployeeValidator();
			empVali.validate(employee, result);
			ContractValidator contrVali = new ContractValidator();
			contrVali.validate(contract, result);
			if (photo.isEmpty()) {
				result.rejectValue("photo", "message.photo");
			} else if (!photo.getOriginalFilename().endsWith(".jpg") && !photo.getOriginalFilename().endsWith(".png")
					&& !photo.getOriginalFilename().endsWith(".jpeg") && !photo.getOriginalFilename().endsWith(".JPG")
					&& !photo.getOriginalFilename().endsWith(".PNG")
					&& !photo.getOriginalFilename().endsWith(".JPEG")) {
				result.rejectValue("photo", "message.photo.format");
			}
			if (result.hasErrors()) {
				return "admin/test";
			} else {
				if (!photo.isEmpty()) {
					String filePhoto = photo.getOriginalFilename();
					String photoPath = application.getRealPath("/images/employees/" + filePhoto);
					photo.transferTo(new File(photoPath));
					employee.setPhoto(filePhoto);
				}
				employee.setId(id);
				employeeService.insertEmployee(employee);
				contract.setId(employee.getId());
				contractService.insertContract(contract);
			}
		} catch (Exception e) {

		}
		return "redirect:/admin/employee/";

	}

	// Mở form thêm nhân viên và hợp đồng
	@RequestMapping(value = "add1", method = RequestMethod.GET)
	public String testAdd(ModelMap model) {
		return "admin/test1";
	}

	// Lưu nhân viên và hợp đồng
	@RequestMapping(value = "save1", method = RequestMethod.POST)
	public String testSave(ModelMap model, @RequestParam("id") String id, @RequestParam("email") String email,
			@RequestParam("nameEmployee") String nameEmployee, @RequestParam("employeeType") String employeeType,
			@RequestParam("department") String department, @RequestParam("password") String password,
			@RequestParam("gender") Integer gender, @RequestParam("address") String address,
			@RequestParam("numberPhone") String numberPhone, @RequestParam("birthday") Date birthday,
			@RequestParam("access") Integer access, @RequestParam("activated") Boolean activated,
			@RequestParam("photo") String photo, @RequestParam("nameContract") String nameContract,
			@RequestParam("startTime") Date startTime, @RequestParam("status") Integer status) {

		Employee employee = new Employee();
		employee.setId(id);
		employee.getEmployeeType().setId(employeeType);
		employee.getDepartment().setId(department);
		employee.setNameEmployee(nameEmployee);
		employee.setEmail(email);
		employee.setPassword(password);
		employee.setGender(gender);
		employee.setAddress(address);
		employee.setNumberPhone(numberPhone);
		employee.setBirthday(birthday);
		employee.setAccess(access);
		employee.setActivated(activated);
		employee.setPhoto(photo);
		employeeService.insertEmployee(employee);

		Contract contract = new Contract();
		contract.setId(id);
		contract.setNameContract(nameContract);
		contract.setStatus(status);
		contractService.insertContract(contract);

		return "redirect:/admin/employee/";

	}

}
