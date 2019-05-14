package luanvan.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import luanvan.admin.controller.ShopController;
import luanvan.model.Product;
import luanvan.other.Json;

@Controller
@Transactional
@RequestMapping("shopping-cart")
public class UserCartController extends ShopController {


	@RequestMapping("index")
	public String index() {
		return "user/shopping-cart";
	}

	// Xử lý thêm giỏ hàng
	@RequestMapping("add/{id}")
	public String addToCart(@PathVariable Integer id) {
		cart.add(id);
		return "redirect:/shopping-cart/index";
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("add-ajax/{id}")
	public String addToCartByAjax(HttpServletResponse response, @PathVariable Integer id)
			throws JsonProcessingException {
		cart.add(id);
		Map map = new HashMap();
		map.put("count", cart.getCount());
		map.put("amount", String.format("%.3f", cart.getAmount()));

		ObjectMapper om = new ObjectMapper();
		return om.writeValueAsString(map);
	}

	// Xử lý xóa giỏ hàng
	@RequestMapping("remove/{id}")
	public String removeFromCart(@PathVariable Integer id) {
		cart.remove(id);
		return "redirect:/shopping-cart/index";
	}

	@RequestMapping("remove-ajax/{id}")
	public void removeFromCartAjax(HttpServletResponse response, @PathVariable Integer id) {
		cart.remove(id);
		Json.writePairs(response, "count", cart.getCount(), "amount", String.format("%.3f", cart.getAmount()));
	}

	// Xử lý xóa hết giỏ hàng
	@RequestMapping("clear")
	public String clearCart() {
		cart.clear();
		return "user/shopping-cart";
	}

	// Xử lý cật nhập giỏ hàng
	@RequestMapping("update")
	public String updateCart(HttpServletRequest request) {
		for (Product p : cart.getItems()) {
			String id = p.getId().toString();
			int newQuantity = Integer.parseInt(request.getParameter(id));
			p.setQuantity(newQuantity);
		}
		return "user/shopping-cart";
	}
}
