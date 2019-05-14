package luanvan.admin.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import luanvan.model.Product;

public class ProductValidator implements Validator {

	public boolean supports(Class<?> arg0) {
		return Product.class.equals(arg0);
	}

	public void validate(Object object, Errors errors) {
		Product product = (Product) object;

		if (product.getProductDate() == null) {
			errors.rejectValue("productDate", "DateTimeFormat");
		}

		if (product.getNameProduct().trim().length() == 0) {
			errors.rejectValue("nameProduct", "error.product.nameProduct");
		}
		if (product.getQuantity() == null) {
			errors.rejectValue("quantity", "error.product.quantity");
		}
		if (product.getUnitBrief().trim().length() == 0) {
			errors.rejectValue("unitBrief", "error.product.unitBrief");
		}
		if (product.getUnitPrice() == null) {
			errors.rejectValue("unitPrice", "error.product.unitPrice");
		}
	}

}
