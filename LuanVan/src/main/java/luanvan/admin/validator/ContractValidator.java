package luanvan.admin.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import luanvan.model.Contract;

public class ContractValidator implements Validator {

	public boolean supports(Class<?> arg0) {
		return Contract.class.equals(arg0);
	}

	public void validate(Object object, Errors errors) {
		Contract contract = (Contract) object;
		if (contract.getNameContract().trim().length() == 0) {
			errors.rejectValue("nameContract", "error.contract.nameContract");
		}
		if (contract.getSubsidize() == 0) {
			errors.rejectValue("subsidize", "error.contract.subsidize");
		}
		if (contract.getInsurrance() == 0) {
			errors.rejectValue("insurrance", "error.contract.insurrance");
		}
	}

}
