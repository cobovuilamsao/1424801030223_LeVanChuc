package luanvan.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import luanvan.admin.dao.ProductDAO;
import luanvan.model.Product;

@Service("productService")
@Transactional
public class ProductService {

	@Autowired
	private ProductDAO productDAO;

	/**
	 * Thêm sản phẩm
	 * 
	 * @param product
	 */
	public void insertProduct(Product product) {
		productDAO.insertProduct(product);
	}

	/**
	 * Sửa sản phẩm
	 * 
	 * @param product
	 */
	public void updateProduct(Product product) {
		productDAO.updateProduct(product);
	}

	/**
	 * Xóa sản phẩm
	 * 
	 * @param product
	 */
	public void deleteProduct(Product product) {
		productDAO.deleteProduct(product);
	}

	/**
	 * Lấy ID sản phẩm
	 * 
	 * @param id
	 * @return
	 */
	public Product getIDProduct(int id) {
		return productDAO.getIDProduct(id);
	}

	/**
	 * Lấy tất cả sản phẩm
	 * 
	 * @return
	 */
	public List<Product> getAllProduct() {
		return productDAO.getAllProduct();
	}

	/**
	 * Lọc trạng thái
	 * @param filter
	 * @return
	 */
	public List<Product> filterStatus(String filter) {
		return productDAO.filterStatus(filter);
	}

	/**
	 * Tìm kiếm sản phẩm
	 * 
	 * @param search
	 * @return
	 */
	public List<Product> searchProduct(String search) {
		return productDAO.searchProduct(search);
	}

	/**
	 * Tìm kiếm cả 3
	 * 
	 * @param search
	 * @param idCategory
	 * @param idProducer
	 * @return
	 */
	public List<Product> searchBy3(String search, String idCategory, String idProducer) {
		return productDAO.searchBy3(search, idCategory, idProducer);
	}

	/**
	 * Lấy sản phẩm từ hãng
	 * 
	 * @param idProducer
	 * @return
	 */
	public List<Product> getProductByProducer(String idProducer) {
		return productDAO.getProductByProducer(idProducer);
	}

	/**
	 * Lấy sản phẩm từ danh mục
	 * 
	 * @param idCategory
	 * @return
	 */
	public List<Product> getProductByCategory(String idCategory) {
		return productDAO.getProductByCategory(idCategory);
	}

	/**
	 * Lấy danh sách sản phẩm từ hãng và danh mục
	 * 
	 * @param idProducer
	 * @param idCategory
	 * @return
	 */
	public List<Product> getProducerAndCategory(String idCategory, String idProducer) {
		return productDAO.getProducerAndCategory(idProducer, idCategory);
	}

	/**
	 * Phân trang
	 * 
	 * @param page
	 * @return
	 */
	public List<Product> loadProductPage(String page) {
		return productDAO.loadProductPage(page);
	}

	public int getRowProduct() {
		return productDAO.getRowProduct();
	}
}
