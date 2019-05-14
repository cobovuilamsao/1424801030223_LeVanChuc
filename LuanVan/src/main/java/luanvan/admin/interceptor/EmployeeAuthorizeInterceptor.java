package luanvan.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import luanvan.model.Employee;

import org.springframework.web.servlet.ModelAndView;

public class EmployeeAuthorizeInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("loginForm", new Employee());
		if (session.getAttribute("employee") == null) {
			response.sendRedirect(request.getContextPath() + "/employee");
			return false;
		}
		System.out.println("EmployeeAuthorizeInterceptor.preHandler()");
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("EmployeeAuthorizeInterceptor.postHandler()");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		System.out.println("EmployeeAuthorizeInterceptor.afterCompletion()");
	}
}
