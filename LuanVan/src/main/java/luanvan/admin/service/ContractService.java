package luanvan.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import luanvan.admin.dao.ContractDAO;
import luanvan.model.*;

@Service("contractService")
@Transactional
public class ContractService {

	@Autowired
	private ContractDAO contractDAO;

	/**
	 * Hàm Thêm Hợp Đồng
	 * 
	 * @param contract
	 */
	public void insertContract(Contract contract) {
		contractDAO.insertContract(contract);
	}

	/**
	 * Hàm Sửa Hợp Đồng
	 * 
	 * @param contract
	 */
	public void editContract(Contract contract) {
		contractDAO.editContract(contract);
	}

	/**
	 * Hàm Xóa Hợp Đồng
	 * 
	 * @param contract
	 */
	public void deleteContract(Contract contract) {
		contractDAO.deleteContract(contract);
	}

	/**
	 * Lấy Mã Hợp Đồng
	 * 
	 * @param id
	 */
	public Contract getIDContract(String id) {
		return contractDAO.getIDContract(id);
	}

	/**
	 * Kiểm tra id
	 */
	public int checkIDContract(String id) {
		return contractDAO.checkIDContract(id);
	}

	/**
	 * Lấy Tất Cả Hợp Đồng
	 * 
	 * @return
	 */
	public List<Contract> getAllContract() {
		return contractDAO.getAllContract();
	}

	/**
	 * Tìm kiếm
	 * 
	 * @param search
	 * @return
	 */
	public List<Contract> searchContract(String search) {
		return contractDAO.searchContract(search);
	}

	/**
	 * Tìm kiếm theo cả 2
	 * 
	 * @param search
	 * @param idDepart
	 * @return
	 */
	public List<Contract> searchByBoth(String search, String idDepart) {
		return contractDAO.searchByBoth(search, idDepart);
	}

	/**
	 * Load hợp đồng theo phòng ban
	 * 
	 * @param idDepart
	 * @return
	 */
	public List<Contract> loadContractByDepart(String idDepart) {
		return contractDAO.loadContractByDepart(idDepart);
	}

	/**
	 * Lọc
	 * 
	 * @param nameContract
	 * @return
	 */
	public List<Contract> filterContract(String status) {
		return contractDAO.filterContract(status);
	}

	/**
	 * Lấy nhân viên từ phòng ban
	 */
	public List<Employee> loadEmplByDepart(String id) {
		return contractDAO.loadEmplByDepart(id);
	}

	/**
	 * Phân trang hợp đồng
	 * 
	 * @param page
	 * @return
	 */
	public List<Contract> loadContractPage(String page) {
		return contractDAO.loadContractPage(page);
	}

	public int getRowContract() {
		return contractDAO.getRowContract();
	}
}
