package luanvan.admin.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import luanvan.model.Producer;

public class ProducerValidator implements Validator {

	public boolean supports(Class<?> arg0) {
		return Producer.class.equals(arg0);
	}

	public void validate(Object object, Errors errors) {
		Producer producer = (Producer) object;

		if (producer.getEmail() == null) {
			errors.reject("email");
		} else if (producer.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "error.producer.email");
		}
		if (producer.getNameProducer().trim().length() == 0) {
			errors.rejectValue("nameProducer", "error.producer.nameProducer");
		}
		if (producer.getAddress().trim().length() == 0) {
			errors.rejectValue("address", "error.producer.address");
		}
		if (producer.getNumberPhone().trim().length() == 0) {
			errors.rejectValue("numberPhone", "error.producer.numberPhone");
		}

	}

}
