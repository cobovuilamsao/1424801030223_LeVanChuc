package luanvan.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import luanvan.model.Admin;

import org.springframework.web.servlet.ModelAndView;

public class AdminAuthorizeInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("loginForm", new Admin());
		if (session.getAttribute("account") == null) {
			response.sendRedirect(request.getContextPath() + "/admin");
			return false;
		}
		System.out.println("AdminAuthorizeInterceptor.preHandler()");
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("AdminAuthorizeInterceptor.postHandler()");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		System.out.println("AdminAuthorizeInterceptor.afterCompletion()");
	}
}
