package luanvan.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import luanvan.model.Customer;

import org.springframework.web.servlet.ModelAndView;

public class UserAuthorizeInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Customer user = (Customer) request.getSession().getAttribute("user");
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/user");
			return false;
		}
		System.out.println("UserAuthorizeInterceptor.preHandler()");
		return true;
		
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("UserAuthorizeInterceptor.postHandler()");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		System.out.println("UserAuthorizeInterceptor.afterCompletion()");
	}
}
