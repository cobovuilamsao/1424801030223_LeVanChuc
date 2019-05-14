package luanvan.admin.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import luanvan.model.Category;

public class CategoryValidator implements Validator {

	public boolean supports(Class<?> arg0) {
		return Category.class.equals(arg0);
	}

	public void validate(Object object, Errors errors) {
		Category category = (Category) object;
		if (category.getNameCategory().trim().length() == 0) {
			errors.rejectValue("nameCategory", "error.category.nameCategory");
		}
		if (category.getNameCategoryEN().trim().length() == 0) {
			errors.rejectValue("nameCategoryEN", "error.category.nameCategoryEN");
		}
	}

}
