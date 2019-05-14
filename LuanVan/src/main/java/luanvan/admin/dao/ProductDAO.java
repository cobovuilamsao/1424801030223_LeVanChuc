package luanvan.admin.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import luanvan.model.Product;

@Repository
public class ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Thêm sản phẩm
	 * 
	 * @param product
	 */
	public void insertProduct(Product product) {
		Session session = sessionFactory.getCurrentSession();
		session.save(product);
	}

	/**
	 * Sửa sản phẩm
	 * 
	 * @param product
	 */
	public void updateProduct(Product product) {
		Session session = sessionFactory.getCurrentSession();
		session.update(product);
	}

	/**
	 * Xóa sản phẩm
	 * 
	 * @param product
	 */
	public void deleteProduct(Product product) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(product);
	}

	/**
	 * Lấy id sản phẩm
	 * 
	 * @param id
	 * @return
	 */
	public Product getIDProduct(int id) {
		Session session = sessionFactory.getCurrentSession();
		Product product = (Product) session.get(Product.class, id);
		return product;
	}

	/**
	 * Lấy danh sách sản phẩm
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Product> getAllProduct() {
		Session session = sessionFactory.getCurrentSession();
		List<Product> list = session.createQuery("FROM Product").list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Product> filterStatus(String filter) {
		Session session = sessionFactory.getCurrentSession();
		List<Product> list = session.createQuery("FROM Product WHERE Status LIKE '%" + filter + "%'").list();
		return list;
	}

	/**
	 * Tìm kiếm sản phẩm
	 * 
	 * @param search
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Product> searchProduct(String search) {
		Session session = sessionFactory.getCurrentSession();
		List<Product> list = session.createQuery("FROM Product WHERE nameProduct LIKE '%" + search
				+ "%' OR Quantity LIKE '%" + search + "%' OR Description LIKE '%" + search + "%' OR UnitBrief LIKE '%"
				+ search + "%' OR UnitPrice LIKE '%" + search + "%'").list();
		return list;
	}

	/**
	 * Lấy danh sách sản phẩm từ danh mục
	 * 
	 * @param idCategory
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Product> getProductByCategory(String idCategory) {
		Session session = sessionFactory.getCurrentSession();
		List<Product> list = session.createQuery("FROM Product WHERE category.id = '" + idCategory + "'").list();
		return list;
	}

	/**
	 * Lấy danh sách sản phẩm từ hãng
	 * 
	 * @param idProducer
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Product> getProductByProducer(String idProducer) {
		Session session = sessionFactory.getCurrentSession();
		List<Product> list = session.createQuery("FROM Product WHERE producer.id = '" + idProducer + "'").list();
		return list;
	}

	/**
	 * Lấy danh sách sản phẩm từ hãng và danh mục
	 * 
	 * @param idProducer
	 * @param idCategory
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Product> getProducerAndCategory(String idProducer, String idCategory) {
		Session session = sessionFactory.getCurrentSession();
		List<Product> list = session
				.createQuery(
						"FROM Product WHERE producer.id = '" + idProducer + "' AND  category.id ='" + idCategory + "'")
				.list();
		return list;
	}

	/**
	 * Tìm kiếm cả 3
	 * 
	 * @param search
	 * @param idCategory
	 * @param idProducer
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Product> searchBy3(String search, String idCategory, String idProducer) {
		Session session = sessionFactory.getCurrentSession();
		List<Product> list = session.createQuery("FROM Product WHERE nameProduct LIKE '%" + search
				+ "%' OR Quantity LIKE '%" + search + "%' OR Description LIKE '%" + search + "%' OR UnitBrief LIKE '%"
				+ search + "%' OR UnitPrice LIKE '%" + search + "%'" + "AND category.id = '" + idCategory + "'"
				+ "AND producer.id = '" + idProducer + "'").list();
		return list;
	}

	/**
	 * Phân trang
	 * 
	 * @param page
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Product> loadProductPage(String page) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Product");
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

	@SuppressWarnings({ "unchecked", "unused" })
	public int getRowProduct() {
		Session session = sessionFactory.getCurrentSession();
		List<Product> list = session.createQuery("FROM Product").list();
		int i = 0;
		for (Product product : list) {
			i++;
		}
		return i;
	}

}
