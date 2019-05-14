package luanvan.other;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class PagerModel {

	public static Object getSession(String attribute, HttpServletRequest request) {
		HttpSession httpSession;
		httpSession = request.getSession();
		return httpSession.getAttribute(attribute);
	}

	public static void setSession(String attribute, Object value, HttpServletRequest request) {
		HttpSession httpSession;
		request.removeAttribute(attribute);
		httpSession = request.getSession();
		httpSession.setAttribute(attribute, value);
	}

	public static void removeSession(String attribute, HttpServletRequest request) {
		HttpSession httpSession;
		httpSession = request.getSession();
		httpSession.removeAttribute(attribute);
	}

	public int pageNo = 0, pageSize = 10, rowCount;

	public static PagerModel getPager(String id, int pageSize, int rowCount, HttpServletRequest request) {
		removeSession(id, request);
		PagerModel pager = getPager(id, request);
		pager.setPageSize(pageSize);
		pager.setRowCount(rowCount);
		return pager;
	}

	public static PagerModel getPager(String id, HttpServletRequest request) {
		PagerModel pager = (PagerModel) getSession(id, request);
		if (pager == null) {
			pager = new PagerModel();
			setSession(id, pager, request);
		}
		return pager;
	}

	public int getPageNo() {
		return this.pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getStartRow() {
		return pageNo * pageSize;
	}

	public int getPageCount() {
		return (int) Math.ceil(1.0 * rowCount / pageSize);
	}

	public int getLastPageNo() {
		return getPageCount() - 1;
	}

	public void navigate(int pageNo) {
		if (pageNo < 0) {
			this.pageNo = getLastPageNo();
		} else if (pageNo > getLastPageNo()) {
			this.pageNo = 0;
		} else {
			this.pageNo = pageNo;
		}
	}

	public void navigate(HttpServletRequest request) {
		Enumeration<String> names = request.getParameterNames();
		while (names.hasMoreElements()) {
			String name = names.nextElement().toLowerCase();
			int i = name.lastIndexOf("pageno:");
			if (i >= 0) {
				this.pageNo = Integer.parseInt(name.substring(i + 7));
				break;
			}
		}
		this.navigate(this.pageNo);

	}

	/*
	 * Paging by group
	 */
	public int groupSize = 5;

	public int getGroupSize() {
		return groupSize;
	}

	public void setGroupSize(int groupSize) {
		this.groupSize = groupSize;
	}

	public int getGroupNo() {
		return pageNo / groupSize;
	}

	public int getGroupCount() {
		return (int) Math.ceil(1.0 * getPageCount() / groupSize);
	}

	public int getLastGroupNo() {
		return getGroupCount() - 1;
	}

	public int getStartPage() {
		return getGroupNo() * groupSize;
	}

	public int getEndPage() {
		if (getGroupNo() == getLastGroupNo()) {
			return getLastPageNo();
		}
		return getStartPage() + groupSize - 1;
	}
}
