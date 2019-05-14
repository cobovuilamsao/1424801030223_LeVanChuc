package luanvan.admin.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import luanvan.model.Bonus;

public class BonusValidator implements Validator {

	public boolean supports(Class<?> arg0) {
		return Bonus.class.equals(arg0);
	}

	public void validate(Object object, Errors errors) {
		Bonus bonus = (Bonus) object;
		if (bonus.getReason().trim().length() == 0) {
			errors.rejectValue("reason", "error.bonus.reason");
		}
		if (bonus.getAmount() == null) {
			errors.rejectValue("amount", "error.bonus.amount");
		}
	}

}
