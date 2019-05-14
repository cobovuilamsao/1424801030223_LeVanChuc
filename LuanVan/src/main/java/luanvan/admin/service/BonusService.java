package luanvan.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import luanvan.admin.dao.BonusDAO;
import luanvan.model.*;

@Service("bonusService")
@Transactional
public class BonusService {

	@Autowired
	private BonusDAO bonusDAO;

	/**
	 * Thêm bản ghi
	 */
	public void insertBonus(Bonus bonus) {
		bonusDAO.insertBonus(bonus);
	}

	/**
	 * Sửa bản ghi
	 */
	public void editBonus(Bonus bonus) {
		bonusDAO.editBonus(bonus);
	}

	/**
	 * Xóa bản ghi
	 */
	public void deleteBonus(Bonus bonus) {
		bonusDAO.deleteBonus(bonus);
	}

	/**
	 * Lấy ID Bản ghi
	 */
	public Bonus getIDBonus(int id) {
		return bonusDAO.getIDBonus(id);
	}

	/**
	 * Kiểm tra bản ghi
	 */
	public int checkIDBonus(int id) {
		return bonusDAO.checkIDBonus(id);
	}

	/**
	 * Lấy tất cả các bản ghi
	 */
	public List<Bonus> getAllBonus() {
		return bonusDAO.getAllBonus();
	}

	/**
	 * Lấy nhân viên từ phòng ban
	 */
	public List<Employee> loadEmplByDepart(String id) {
		return bonusDAO.loadEmplByDepart(id);
	}

	/**
	 * Phân trang record
	 */
	public List<Bonus> loadBonusPage(String page) {
		return bonusDAO.loadBonusPage(page);
	}

	public int getRowBonus() {
		return bonusDAO.getRowBonus();
	}

	/**
	 * Báo cáo thành tích
	 */
	public List<Object[]> reportBonus() {
		return bonusDAO.reportBonus();
	}

	/**
	 * Load Bảng Xếp Hàng
	 */
	public int getRows(String month) {
		return bonusDAO.getRows(month);
	}

	/**
	 * Tìm kiếm
	 */

	public List<Bonus> searchBonus(String search) {
		return bonusDAO.searchBonus(search);
	}

	/**
	 * Tìm kiếm theo cả 2
	 */
	public List<Bonus> searchByBoth(String search, String idDepart) {
		return bonusDAO.searchByBoth(search, idDepart);
	}

	/**
	 * Lấy nhân viên từ phòng ban
	 */
	public List<Bonus> loadBonusByDepart(String idDepart) {
		return bonusDAO.loadBonusByDepart(idDepart);
	}
}
