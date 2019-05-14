package luanvan.admin.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import luanvan.model.Customer;

public class CustomerValidator implements Validator {

	public boolean supports(Class<?> arg0) {
		return Customer.class.equals(arg0);
	}

	public void validate(Object object, Errors errors) {
		Customer customer = (Customer) object;

		if (customer.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "error.customer.email");
		}
		if (customer.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "error.customer.password");
		}
		if (customer.getFullName().trim().length() == 0) {
			errors.rejectValue("fullName", "error.customer.fullName");
		}
		if (customer.getAddress().trim().length() == 0) {
			errors.rejectValue("address", "error.customer.address");
		}
		if (customer.getNumberPhone().trim().length() == 0) {
			errors.rejectValue("numberPhone", "error.customer.numberPhone");
		}
		if (customer.getBirthday() == null) {
			errors.rejectValue("birthday", "DateTimeFormat");
		}
		if (customer.getGender() == 0) {
			errors.rejectValue("gender", "error.customer.gender");
		}
	}

}
