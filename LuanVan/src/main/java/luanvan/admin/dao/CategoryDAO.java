package luanvan.admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import luanvan.model.Category;

@Repository
public class CategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Thêm danh mục
	 * 
	 * @param category
	 */
	public void insertCategory(Category category) {
		Session session = sessionFactory.getCurrentSession();
		session.save(category);
	}

	/**
	 * Sửa danh mục
	 * 
	 * @param category
	 */
	public void updateCategory(Category category) {
		Session session = sessionFactory.getCurrentSession();
		session.update(category);
	}

	/**
	 * Xóa danh mục
	 * 
	 * @param category
	 */
	public void deleteCategory(Category category) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(category);
	}

	/**
	 * Lấy ID Danh mục
	 * 
	 * @param id
	 * @return
	 */
	public Category getIDCategory(int id) {
		Session session = sessionFactory.getCurrentSession();
		Category category = (Category) session.get(Category.class, id);
		return category;
	}

	/**
	 * Lấy tất cả danh sách danh mục
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Category> getAllCategory() {
		Session session = sessionFactory.getCurrentSession();
		List<Category> list = session.createQuery("FROM Category").list();
		return list;
	}

	/**
	 * Kiểm tra tên
	 * 
	 * @param nameProducer
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public int checkNameCategory(String nameCategory) {
		Session session = sessionFactory.getCurrentSession();
		List<Category> list = session.createQuery("FROM Category WHERE nameCategory= '" + nameCategory + "'").list();
		return list.size();
	}

	/**
	 * Phân trang cho danh mục
	 * 
	 * @param page
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Category> loadCategoryPage(String page) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Category");
		int result = 0;
		if (page.equals("1")) {
			result = 0;
		} else {
			String temp = String.valueOf(page) + "0";
			result = Integer.parseInt(temp) - 10;
		}
		query.setFirstResult(result);
		query.setMaxResults(10);
		return query.list();
	}

	@SuppressWarnings({ "unused", "unchecked" })
	public int getRowCategory() {
		Session session = sessionFactory.getCurrentSession();
		List<Category> list = session.createQuery("FROM Category").list();
		int i = 0;
		for (Category category : list) {
			i++;
		}
		return i;
	}

	/**
	 * Tìm kiếm
	 * 
	 * @param search
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Category> searchCategory(String search) {
		Session session = sessionFactory.getCurrentSession();
		List<Category> list = session.createQuery(
				"FROM Category WHERE nameCategory LIKE '%" + search + "%' OR nameCategoryEN LIKE '%" + search + "%'")
				.list();
		return list;
	}
}
