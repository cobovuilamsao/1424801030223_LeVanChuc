package luanvan.admin.controller;

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

import luanvan.admin.service.ContractService;
import luanvan.admin.validator.ContractValidator;
import luanvan.model.*;

@Transactional
@Controller
@RequestMapping(value = "admin/contract")
public class ContractController extends ShopController {

	@Autowired
	private ContractService contractService;

	// Trang chủ
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("contract", new Contract());
		model.addAttribute("listDepartment", getDepartment());
		model.addAttribute("listContract", contractService.getAllContract());
		if (contractService.getRowContract() > 10) {
			if (request.getParameter("page") == null) {
				model.addAttribute("listContract", contractService.loadContractPage("1"));
			} else {
				model.addAttribute("listContract", contractService.loadContractPage(request.getParameter("page")));
			}
			double paging = Math.ceil(Double.valueOf(contractService.getRowContract()) / 10);
			model.addAttribute("rowCount", paging);
		} else {
			model.addAttribute("contract", new Contract());
			model.addAttribute("listContract", contractService.getAllContract());
			model.addAttribute("listDepartment", getDepartment());
		}
		return "admin/contract-home";
	}

	// Form thêm hợp đồng
	@RequestMapping(value = "add-contract.htm", method = RequestMethod.GET)
	public String formAdd(ModelMap model) {
		model.addAttribute("contract", new Contract());
		model.addAttribute("listContract", contractService.getAllContract());
		model.addAttribute("listDepartment", getDepartment());
		return "admin/contract-add";
	}

	// Form sửa hợp đồng
	@RequestMapping(value = "edit-contract/{id}.htm", method = RequestMethod.GET)
	public String formEdit(ModelMap model, @PathVariable("id") String id) {
		model.addAttribute("contract", contractService.getIDContract(id));
		model.addAttribute("listContract", contractService.getAllContract());
		model.addAttribute("listDepartment", getDepartment());
		return "admin/contract-edit";
	}

	// Lưu dữ liệu
	@RequestMapping(value = "save-contract.htm", method = RequestMethod.POST)
	public String saveContract(ModelMap model, @ModelAttribute(value = "contract") @Validated Contract contract,
			BindingResult result) {
		ContractValidator contrVali = new ContractValidator();
		contrVali.validate(contract, result);
		if (result.hasErrors()) {
			model.addAttribute("listDepartment", getDepartment());
			return "admin/contract-add";
		} else {
			contractService.insertContract(contract);;
			model.addAttribute("listContract", contractService.getAllContract());
			model.addAttribute("listDepartment", getDepartment());
		}
		return "redirect:/admin/contract";

	}

	// Sửa dữ liệu
	@RequestMapping(value = "edit-contract/{id}.htm", method = RequestMethod.POST)
	public String editContract(ModelMap model, @PathVariable("id") String id,
			@ModelAttribute(value = "contract") @Validated Contract contract, BindingResult result) {
		ContractValidator contrVali = new ContractValidator();
		contrVali.validate(contract, result);
		if (result.hasErrors()) {
			return "admin/contract-edit";
		} else {
			contractService.editContract(contract);
			model.addAttribute("listContract", contractService.getAllContract());
		}
		return "redirect:/admin/contract";
	}

	// Xóa dữ liệu
	@RequestMapping(value = "delete-contract/{id}.htm", method = RequestMethod.GET)
	public String deleteContract(ModelMap model, @PathVariable("id") String id,
			@ModelAttribute("contract") Contract contract) {
		contractService.deleteContract(contract);
		model.addAttribute("listContract", contractService.getAllContract());
		return "redirect:/admin/contract";
	}

	// Tìm kiếm
	@RequestMapping(value = "search.htm", method = RequestMethod.GET)
	public String searchContract(ModelMap model, @RequestParam("search") String search,
			@RequestParam("filter") String filter) {
		if (search.equals("") && filter.equals("")) {
			model.addAttribute("listContract", contractService.getAllContract());
		} else if (search.equals("")) {
			model.addAttribute("listContract", contractService.loadContractByDepart(filter));
		} else if (filter.equals("")) {
			model.addAttribute("listContract", contractService.searchContract(search));
		} else {
			model.addAttribute("listContract", contractService.searchByBoth(search, filter));
		}
		model.addAttribute("listDepartment", getDepartment());
		return "admin/contract-home";
	}

	// Lọc
	@RequestMapping(value = "filter.htm", method = RequestMethod.GET)
	public String filterContract(ModelMap model, @RequestParam("filter") String filter) {
		model.addAttribute("listContract", contractService.filterContract(filter));
		model.addAttribute("listDepartment", getDepartment());
		return "admin/contract-home";
	}

	// Load nhân viên từ phòng ban
	@RequestMapping(value = "loadEmpl.htm")
	public String loadEmployee(ModelMap model, @RequestParam("load") String load) {
		model.put("contract", new Contract());
		model.addAttribute("listEmployee", contractService.loadEmplByDepart(load));
		model.addAttribute("listContract", contractService.getAllContract());
		model.addAttribute("listDepartment", getDepartment());
		return "admin/contract-add";
	}
}
