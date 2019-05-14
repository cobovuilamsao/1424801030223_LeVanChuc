package luanvan.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

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

import luanvan.admin.service.BonusService;
import luanvan.admin.validator.BonusValidator;
import luanvan.model.Bonus;

@Transactional
@Controller
@RequestMapping(value = "admin/bonus")
public class BonusController extends ShopController {

	@Autowired
	private BonusService bonusService;

	// Show báo cáo
	@RequestMapping(value = "report")
	public String report(ModelMap model) {
		String currentMonth = new SimpleDateFormat("MM/yyyy").format(new Date());
		model.addAttribute("bxh", bonusService.getRows(currentMonth));
		model.addAttribute("arrays", bonusService.reportBonus());
		return "admin/bonus-report";
	}

	// Trang chủ
	@RequestMapping(method = RequestMethod.GET)
	public String viewIndex(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("listBonus", bonusService.getAllBonus());
		if (bonusService.getRowBonus() > 10) {
			if (request.getParameter("page") == null) {
				model.addAttribute("listBonus", bonusService.loadBonusPage("1"));
			} else {
				model.addAttribute("listBonus", bonusService.loadBonusPage(request.getParameter("page")));
			}
			double paging = Math.ceil(Double.valueOf(bonusService.getRowBonus()) / 10);
			model.addAttribute("rowCount", paging);
		} else {
			model.addAttribute("listBonus", bonusService.getAllBonus());
		}
		model.addAttribute("listDepartment", getDepartment());
		return "admin/bonus-home";
	}

	// Mở Form tạo dữ liệu
	@RequestMapping(value = "add-bonus.htm", method = RequestMethod.GET)
	public String fromAdd(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("bonus", new Bonus());
		model.addAttribute("listBonus", bonusService.getAllBonus());
		model.addAttribute("listDepartment", getDepartment());
		return "admin/bonus-add";
	}

	// Mở Form sửa dữ liệu
	@RequestMapping(value = "edit-bonus/{id}.htm", method = RequestMethod.GET)
	public String formEdit(ModelMap model, @PathVariable(value = "id") Integer id) {
		model.put("bonus", bonusService.getIDBonus(id));
		model.addAttribute("listBonus", bonusService.getAllBonus());
		return "admin/bonus-edit";
	}

	// Sửa dữ liệu
	@RequestMapping(value = "edit-bonus/{id}.htm", method = RequestMethod.POST)
	public String editBonus(ModelMap model, @PathVariable(value = "id") Integer id,
			@ModelAttribute(value = "bonus") @Validated Bonus bonus, BindingResult result) {
		BonusValidator bonusVali = new BonusValidator();
		bonusVali.validate(bonus, result);
		if (result.hasErrors()) {
			return "admin/bonus-edit";
		} else {
			bonusService.editBonus(bonus);
			model.put("listBonus", bonusService.getAllBonus());
		}

		return "redirect:/admin/bonus";
	}

	// Lưu dữ liệu
	@RequestMapping(value = "save-bonus.htm", method = RequestMethod.POST)
	public String saveBonus(ModelMap model, @ModelAttribute(value = "bonus") @Validated Bonus bonus,
			BindingResult result) {
		BonusValidator bonusVali = new BonusValidator();
		bonusVali.validate(bonus, result);
		if (result.hasErrors()) {
			model.addAttribute("listDepartment", getDepartment());
			return "admin/bonus-add";
		} else {
			bonusService.insertBonus(bonus);
			model.put("listBonus", bonusService.getAllBonus());
		}
		return "redirect:/admin/bonus";
	}

	// Xóa dữ liệu
	@RequestMapping(value = "delete-bonus/{id}.htm", method = RequestMethod.GET)
	public String deleteBonus(ModelMap model, @PathVariable(value = "id") Integer id,
			@ModelAttribute(value = "bonus") Bonus bonus) {
		bonusService.deleteBonus(bonus);
		model.put("listBonus", bonusService.getAllBonus());
		return "redirect:/admin/bonus";
	}

	// Load nhân viên từ phòng ban
	@RequestMapping(value = "loadEmpl.htm")
	public String loadEmployee(ModelMap model, @RequestParam("load") String load) {
		model.put("bonus", new Bonus());
		model.addAttribute("listEmployee", bonusService.loadEmplByDepart(load));
		model.addAttribute("listBonus", bonusService.getAllBonus());
		model.addAttribute("listDepartment", getDepartment());
		return "admin/bonus-add";
	}

	// Tìm kiếm bản ghi

	@RequestMapping(value = "search.htm", method = RequestMethod.GET)
	public String search(ModelMap model, @RequestParam("search") String search, @RequestParam("filter") String filter) {
		if (search.equals("") && filter.equals("")) {
			model.addAttribute("listBonus", bonusService.getAllBonus());
		} else if (search.equals("")) {
			model.addAttribute("listBonus", bonusService.loadBonusByDepart(filter));
		} else if (filter.equals("")) {
			model.addAttribute("listBonus", bonusService.searchBonus(search));
		} else {
			model.addAttribute("listBonus", bonusService.searchByBoth(search, filter));
		}
		model.addAttribute("listDepartment", getDepartment());
		return "admin/bonus-home";
	}

}
