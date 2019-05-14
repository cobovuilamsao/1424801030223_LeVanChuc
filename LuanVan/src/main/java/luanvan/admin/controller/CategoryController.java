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

import luanvan.admin.service.CategoryService;
import luanvan.admin.validator.CategoryValidator;
import luanvan.model.Category;

@Transactional
@Controller
@RequestMapping(value = "employee/category")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	// Trang Chủ
	@RequestMapping(method = RequestMethod.GET)
	public String viewIndex(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		if (categoryService.getRowCategory() > 10) {
			if (request.getParameter("page") == null) {
				model.addAttribute("listCategory", categoryService.loadCategoryPage("1"));
			} else {
				model.addAttribute("listCategory", categoryService.loadCategoryPage(request.getParameter("page")));
			}
			double paging = Math.ceil(Double.valueOf(categoryService.getRowCategory()) / 10);
			model.addAttribute("rowCount", paging);
		} else {
			model.addAttribute("listCategory", categoryService.getAllCategory());
		}
		return "employee/category-home";
	}

	// Mở Form tạo dữ liệu
	@RequestMapping(value = "add-category.htm", method = RequestMethod.GET)
	public String formAdd(ModelMap model) {
		model.addAttribute("category", new Category());
		return "employee/category-add";
	}

	// Mở Form sửa dữ liệu
	@RequestMapping(value = "edit-category/{id}.htm", method = RequestMethod.GET)
	public String formEdit(ModelMap model, @PathVariable(value = "id") Integer id) {
		model.addAttribute("category", categoryService.getIDCategory(id));
		return "employee/category-edit";
	}

	// Thêm dữ liệu
	@RequestMapping(value = "save-category.htm", method = RequestMethod.POST)
	public String saveCategory(ModelMap model, @ModelAttribute(value = "category") @Validated Category category,
			BindingResult result) {
		CategoryValidator categoryVali = new CategoryValidator();
		categoryVali.validate(category, result);
		if (categoryService.checkNameCategory(category.getNameCategory()) > 0) {
			result.rejectValue("nameCategory", "message.name");
		}
		if (result.hasErrors()) {
			return "employee/category-add";
		} else {
			categoryService.insertCategory(category);
			model.addAttribute("listCategory", categoryService.getAllCategory());
		}
		return "redirect:/employee/category";
	}

	// Sửa dữ liệu
	@RequestMapping(value = "edit-category/{id}.htm", method = RequestMethod.POST)
	public String editCategory(ModelMap model, @PathVariable(value = "id") Integer id,
			@ModelAttribute(value = "category") @Validated Category category, BindingResult result) {
		CategoryValidator categoryVali = new CategoryValidator();
		categoryVali.validate(category, result);
		if (result.hasErrors()) {
			return "employee/category-edit";
		} else {
			categoryService.updateCategory(category);
			model.addAttribute("listCategory", categoryService.getAllCategory());
		}
		return "redirect:/employee/category";
	}

	// Xóa dữ liệu
	@RequestMapping(value = "delete-category/{id}.htm", method = RequestMethod.GET)
	public String deleteCategory(ModelMap model, @PathVariable(value = "id") Integer id,
			@ModelAttribute(value = "category") Category category) {
		categoryService.deleteCategory(category);
		model.addAttribute("listCategory", categoryService.getAllCategory());
		return "redirect:/employee/category";
	}

	// Tìm kiếm
	@RequestMapping(value = "search.htm", method = RequestMethod.GET)
	public String searchCategory(ModelMap model, @RequestParam(value = "search") String search) {
		model.addAttribute("listCategory", categoryService.searchCategory(search));
		return "employee/category-home";
	}
}
