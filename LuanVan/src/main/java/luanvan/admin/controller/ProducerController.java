package luanvan.admin.controller;

import java.io.File;

import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.MultipartFile;

import luanvan.admin.service.ProducerService;
import luanvan.admin.validator.ProducerValidator;
import luanvan.model.Producer;

@Transactional
@Controller
@RequestMapping(value = "employee/producer")
public class ProducerController {

	@Autowired
	private ProducerService producerService;
	@Autowired
	ServletContext application;

	// Trang chủ
	@RequestMapping(method = RequestMethod.GET)
	public String viewIndex(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		if (producerService.getRowProducer() > 10) {
			if (request.getParameter("page") == null) {
				model.addAttribute("listProducer", producerService.loadProducerPage("1"));
			} else {
				model.addAttribute("listProducer", producerService.loadProducerPage(request.getParameter("page")));
			}
			double paging = Math.ceil(Double.valueOf(producerService.getRowProducer()) / 10);
			model.addAttribute("rowCount", paging);
		} else {
			model.addAttribute("listProducer", producerService.getAllProducer());
		}
		return "employee/producer-home";
	}

	// Form thêm hãng
	@RequestMapping(value = "add-producer.htm", method = RequestMethod.GET)
	public String formAdd(ModelMap model) {
		model.addAttribute("producer", new Producer());
		return "employee/producer-add";
	}

	// Form sửa hãng
	@RequestMapping(value = "edit-producer/{id}.htm", method = RequestMethod.GET)
	public String foromEdit(ModelMap model, @PathVariable(value = "id") Integer id) {
		model.addAttribute("producer", producerService.getIDProducer(id));
		return "employee/producer-edit";
	}

	// Thêm hãng
	@RequestMapping(value = "save-producer.htm", method = RequestMethod.POST)
	public String saveProducer(ModelMap model, @ModelAttribute(value = "producer") @Validated Producer producer,
			@RequestParam("file_image") MultipartFile photo, BindingResult result) {
		try {
			ProducerValidator producerVali = new ProducerValidator();
			producerVali.validate(producer, result);

			if (producerService.checkNameProducer(producer.getNameProducer()) > 0) {
				result.rejectValue("nameProducer", "message.name");
			}
			if (photo.isEmpty()) {
				result.rejectValue("logo", "message.photo");
			} else if (!photo.getOriginalFilename().endsWith(".jpg") && !photo.getOriginalFilename().endsWith(".png")
					&& !photo.getOriginalFilename().endsWith(".jpeg") && !photo.getOriginalFilename().endsWith(".JPG")
					&& !photo.getOriginalFilename().endsWith(".PNG")
					&& !photo.getOriginalFilename().endsWith(".JPEG")) {
				result.rejectValue("photo", "message.photo.format");
			}
			if (result.hasErrors()) {
				return "employee/producer-add";
			} else {
				if (!photo.isEmpty()) {
					String filePhoto = photo.getOriginalFilename();
					String photoPath = application.getRealPath("/images/producers/" + filePhoto);
					photo.transferTo(new File(photoPath));
					producer.setLogo(filePhoto);
				}
				producerService.insertProducer(producer);
				model.addAttribute("listProducer", producerService.getAllProducer());
			}
		} catch (Exception e) {
		}
		return "redirect:/employee/producer";
	}

	// Sửa hãng
	@RequestMapping(value = "edit-producer/{id}.htm", method = RequestMethod.POST)
	public String editProducer(ModelMap model, @PathVariable(value = "id") Integer id,
			@ModelAttribute(value = "producer") @Validated Producer producer,
			@RequestParam("file_image") MultipartFile photo, BindingResult result) {
		try {
			ProducerValidator producerVali = new ProducerValidator();
			producerVali.validate(producer, result);
			if (photo.isEmpty()) {
				result.rejectValue("logo", "message.photo");
			} else if (!photo.getOriginalFilename().endsWith(".jpg") && !photo.getOriginalFilename().endsWith(".png")
					&& !photo.getOriginalFilename().endsWith(".jpeg") && !photo.getOriginalFilename().endsWith(".JPG")
					&& !photo.getOriginalFilename().endsWith(".PNG")
					&& !photo.getOriginalFilename().endsWith(".JPEG")) {
				result.rejectValue("photo", "message.photo.format");
			}
			if (result.hasErrors()) {
				return "employee/producer-edit";
			} else {
				if (!photo.isEmpty()) {
					String fileName = photo.getOriginalFilename();
					String photoPath = application.getRealPath("/images/producers/" + photo.getOriginalFilename());
					photo.transferTo(new File(photoPath));
					producer.setLogo(fileName);
				}
				producerService.updateProducer(producer);
				model.addAttribute("listProducer", producerService.getAllProducer());
			}
		} catch (Exception e) {

		}
		return "redirect:/employee/producer";
	}

	// Xóa hãng
	@RequestMapping(value = "delete-producer/{id}.htm", method = RequestMethod.GET)
	public String deleteProducer(ModelMap model, @PathVariable(value = "id") Integer id,
			@ModelAttribute(value = "producer") Producer producer) {
		producerService.deleteProducer(producer);
		model.addAttribute("listProducer", producerService.getAllProducer());
		return "redirect:/employee/producer";
	}

	// Tìm kiếm
	@RequestMapping(value = "search.htm", method = RequestMethod.GET)
	public String searchProducer(ModelMap model, @RequestParam(value = "search") String search) {
		model.addAttribute("listProducer", producerService.searchProducer(search));
		return "employee/producer-home";
	}
}
