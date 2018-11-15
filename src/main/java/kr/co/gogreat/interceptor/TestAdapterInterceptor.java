package kr.co.gogreat.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class TestAdapterInterceptor extends HandlerInterceptorAdapter{

	private Logger logger = LoggerFactory.getLogger(TestAdapterInterceptor.class);
	
	public void postHandle( HttpServletRequest request, HttpServletResponse response, Object handler, 
			ModelAndView modelAndView ) throws Exception {
		
		logger.debug("welcome() is executed, value {}", "mkyong");
		logger.trace("trace : ");
		String ip = request.getRemoteAddr();
		logger.info("ipAddress", ip);
		
		//logger.error("This is Error message", new Exception("Testing"));
		
		//model.addAttribute("msg", "Hello Spring MVC + Logback");
		//return "welcome";
		
		System.out.println("TestAdapterInterceptor.postHandle");
	}
}
