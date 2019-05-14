package luanvan.admin.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import luanvan.model.*;

public class EmployeeValidator implements Validator {

	public boolean supports(Class<?> arg0) {
		return Employee.class.equals(arg0);
	}

	public void validate(Object object, Errors errors) {
		Employee empl = (Employee) object;
		if (empl.getId() == null) {
			errors.reject("id");
		}
		if (empl.getNameEmployee().trim().length() == 0) {
			errors.rejectValue("nameEmployee", "error.employee.nameEmployee");
		}
		if (empl.getEmail() == null) {
			errors.reject("email");
		} else if (empl.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "error.employee.email");
		}
		if (empl.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "error.employee.password");
		}
		if (empl.getAddress().trim().length() == 0) {
			errors.rejectValue("address", "error.employee.address");
		}
		if (empl.getNumberPhone() == null) {
			errors.reject("numberPhone");
		} else if (empl.getNumberPhone().trim().length() == 0) {
			errors.rejectValue("numberPhone", "error.employee.numberPhone");
		} else if (empl.getNumberPhone().indexOf(" ") > 0) {
			errors.rejectValue("numberPhone", "error.message.spacebar");
		}
		if (empl.getGender() == 0) {
			errors.rejectValue("gender", "error.employee.gender");
		}

		/*if (empl.getPhoto().trim().length() == 0) {
			errors.rejectValue("photo", "employee.photo");
		} else if (!empl.getPhoto().endsWith(".jpg") && !empl.getPhoto().endsWith(".png")) {
			errors.rejectValue("photo", "employee.photo.format");
		}*/
	}

}
