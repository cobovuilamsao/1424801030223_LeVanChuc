package luanvan.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import luanvan.admin.dao.ProducerDAO;
import luanvan.model.Producer;

@Service("producerService")
@Transactional
public class ProducerService {
	@Autowired
	private ProducerDAO producerDAO;

	/**
	 * Thêm hãng
	 * 
	 * @param producer
	 */
	public void insertProducer(Producer producer) {
		producerDAO.insertProducer(producer);
	}

	/**
	 * Sửa hãng
	 * 
	 * @param producer
	 */
	public void updateProducer(Producer producer) {
		producerDAO.upadateProducer(producer);
	}

	/**
	 * Xóa hãng
	 * 
	 * @param producer
	 */
	public void deleteProducer(Producer producer) {
		producerDAO.deleteProducer(producer);
	}

	/**
	 * Lấy id
	 * 
	 * @param id
	 * @return
	 */
	public Producer getIDProducer(int id) {
		return producerDAO.getIDProducer(id);
	}

	/**
	 * Lấy danh sách
	 * 
	 * @param id
	 * @return
	 */
	public List<Producer> getAllProducer() {
		return producerDAO.getAllProducer();
	}

	/**
	 * Kiểm tra tên
	 * 
	 * @param nameProducer
	 * @return
	 */
	public int checkNameProducer(String nameProducer) {
		return producerDAO.checkNameProducer(nameProducer);
	}

	/**
	 * Tìm kiếm
	 * 
	 * @param search
	 * @return
	 */
	public List<Producer> searchProducer(String search) {
		return producerDAO.searchProducer(search);
	}

	/**
	 * Phân trang
	 * 
	 * @param page
	 * @return
	 */
	public List<Producer> loadProducerPage(String page) {
		return producerDAO.loadProducerPage(page);
	}

	public int getRowProducer() {
		return producerDAO.getRowProducer();
	}
}
