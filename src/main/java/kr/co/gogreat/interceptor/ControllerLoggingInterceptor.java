package kr.co.gogreat.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class ControllerLoggingInterceptor implements HandlerInterceptor{

	private Logger logger = LoggerFactory.getLogger(ControllerLoggingInterceptor.class);
	
	@Override
	public void afterCompletion(HttpServletRequest req,
			HttpServletResponse res, Object arg2, Exception arg3)
			throws Exception {
		
		//Logger logger = LoggerFactory.getLogger(ControllerLoggingInterceptor.class);
		String ipAddress = req.getRemoteAddr();
		String vsql = req.getQueryString();
		
		//System.out.println("AfterCompletion!!!"+ ipAddress);
		System.out.println("After : "+vsql);
		MDC.put("ipAddress", ipAddress);
		
		
		logger.info(ipAddress);
		
		/*logger.debug("welcome() is executed, value {}", "mkyong");
		
		logger.error("This is Error message", new Exception("Testing"));
		
		model.addAttribute("msg", "Hello Spring MVC + Logback");
		return "welcome";*/
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView model) throws Exception {
		System.out.println("PostHandle!!!");
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2) throws Exception {
		System.out.println("PreHandle!!!");
		//return true;
		
		logger.debug("welcome() is executed, value {}", "mkyong");
		logger.trace("trace : ");
		
		//logger.error("This is Error message", new Exception("Testing"));
		
		//model.addAttribute("msg", "Hello Spring MVC + Logback");
		//return "welcome";
		return true;
	}

}
