package luanvan.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import luanvan.admin.dao.CategoryDAO;
import luanvan.model.Category;

@Service("categoryService")
@Transactional
public class CategoryService {

	@Autowired
	private CategoryDAO categoryDAO;

	/**
	 * Thêm danh mục
	 * 
	 * @param category
	 */
	public void insertCategory(Category category) {
		categoryDAO.insertCategory(category);
	}

	/**
	 * Sửa danh mục
	 * 
	 * @param category
	 */
	public void updateCategory(Category category) {
		categoryDAO.updateCategory(category);
	}

	/**
	 * Xóa danh mục
	 * 
	 * @param category
	 */
	public void deleteCategory(Category category) {
		categoryDAO.deleteCategory(category);
	}

	/**
	 * Lấy mã danh mục
	 * 
	 * @param id
	 * @return
	 */
	public Category getIDCategory(Integer id) {
		return categoryDAO.getIDCategory(id);
	}

	/**
	 * Lấy tất cả
	 * 
	 * @return
	 */
	public List<Category> getAllCategory() {
		return categoryDAO.getAllCategory();
	}

	/**
	 * Kiểm tra tên
	 * 
	 * @param nameCategory
	 * @return
	 */
	public int checkNameCategory(String nameCategory) {
		return categoryDAO.checkNameCategory(nameCategory);
	}

	/**
	 * Phân trang
	 * 
	 * @param page
	 * @return
	 */
	public List<Category> loadCategoryPage(String page) {
		return categoryDAO.loadCategoryPage(page);
	}

	public int getRowCategory() {
		return categoryDAO.getRowCategory();
	}

	/**
	 * Tìm kiếm
	 * 
	 * @param search
	 * @return
	 */
	public List<Category> searchCategory(String search) {
		return categoryDAO.searchCategory(search);
	}
}
