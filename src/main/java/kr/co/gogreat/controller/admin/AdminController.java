package kr.co.gogreat.controller.admin;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Base64.Decoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.gogreat.domain.admin.AdminMember;
import kr.co.gogreat.model.service.admin.AdminManagementService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	private AdminManagementService service;
	

	@RequestMapping("administrator")
	public String adminLoad( ModelMap map, HttpSession session ) {		
		String message = (String)session.getAttribute("message");
		if(message != null && message.length() != 0) {
			session.removeAttribute("message");
		}
		return "/admin/administrator";
	}
		
	@RequestMapping("/dashboard")
	public String dashBoard( Model model ) {
		return "/dash/dashboard";
	}
	
	@RequestMapping("/demodashboard")
	public String demodashBoard( Model model ) {
		return "/dash/demodashboard";
	}
	@RequestMapping("/demorelation")
	public String demorelation( Model model ) {
		return "/dash/demorelation";
	}
	
	@RequestMapping("/sentiment")
	public String sentiment( Model model ) {
		return "/dash/sentiment";
	}
	
	
	
	@RequestMapping("/relation")
	public String relation( Model model ) {
		return "/dash/relation";
	}
	
	@RequestMapping("/report")
	public String report( Model model ) {
		return "/dash/report";
	}
	
	@RequestMapping("/wordcloud")
	public String wordcloud( Model model ) {
		return "/dash/wordcloud";
	}
	
	
	@RequestMapping("/monthreport")
	public String monthreport( Model model ) {
		return "/dash/monthreport";
	}
	
	@RequestMapping("/issue")
	public String issueKey( Model model ) {
		return "/dash/issuekey";
	}
	
	@RequestMapping("/realtime")
	public String realtime( Model model ) {
		return "/dash/realtime";
	}
	
	
	@RequestMapping(value="chart1", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart1( HttpServletRequest request ) {
		
		String start_time = request.getParameter("start_time") != null ? request.getParameter("start_time") : "";
		String end_time = request.getParameter("end_time") != null ? request.getParameter("end_time") : "";
	
		Map map = new HashMap();
		map.put("start_time", start_time);
		map.put("end_time", end_time);

		List list = service.getChart1(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="chart1_1", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart1_1( HttpServletRequest request ) {
		
		String start_time = request.getParameter("start_time") != null ? request.getParameter("start_time") : "";
		String end_time = request.getParameter("end_time") != null ? request.getParameter("end_time") : "";
	
		Map map = new HashMap();
		map.put("start_time", start_time);
		map.put("end_time", end_time);

		List list = service.getChart1_1(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="chart1_2", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart1_2( HttpServletRequest request ) {
		
		String start_time = request.getParameter("start_time") != null ? request.getParameter("start_time") : "";
		String end_time = request.getParameter("end_time") != null ? request.getParameter("end_time") : "";
	
		Map map = new HashMap();
		map.put("start_time", start_time);
		map.put("end_time", end_time);

		List list = service.getChart1_2(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="chart2", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart2( HttpServletRequest request ) {
		
		String start_time = request.getParameter("start_time") != null ? request.getParameter("start_time") : "";
		String end_time = request.getParameter("end_time") != null ? request.getParameter("end_time") : "";
	
		Map map = new HashMap();
		map.put("start_time", start_time);
		map.put("end_time", end_time);

		List list = service.getChart2(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="chart2_1", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart2_1( HttpServletRequest request ) {
		
		String start_time = request.getParameter("start_time") != null ? request.getParameter("start_time") : "";
		String end_time = request.getParameter("end_time") != null ? request.getParameter("end_time") : "";
	
		Map map = new HashMap();
		map.put("start_time", start_time);
		map.put("end_time", end_time);

		List list = service.getChart2_1(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="chart3", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart3( HttpServletRequest request ) {
		
		String start_time = request.getParameter("start_time") != null ? request.getParameter("start_time") : "";
		String end_time = request.getParameter("end_time") != null ? request.getParameter("end_time") : "";
	
		Map map = new HashMap();
		map.put("start_time", start_time);
		map.put("end_time", end_time);

		List list = service.getChart3(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="report_sentiData", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String sentiData( HttpServletRequest request ) {
		
		String word = request.getParameter("sentiWord") != null ? request.getParameter("sentiWord") : "";
		String start = request.getParameter("start") != null ? request.getParameter("start") : "";
		String end = request.getParameter("end") != null ? request.getParameter("end") : "";
		String time = request.getParameter("time") != null ? request.getParameter("time") : "";
		try {
			word = URLDecoder.decode(word, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(word);
		
		Map map = new HashMap();
		map.put("word", word);
		map.put("start", start);
		map.put("end", end);
		map.put("time", time);

		String data = service.getSentiData(map);
		
		
		return data;
	}
	
	@RequestMapping(value="chart4", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart4( HttpServletRequest request ) {
		
		String start_time = request.getParameter("start_time") != null ? request.getParameter("start_time") : "";
		String end_time = request.getParameter("end_time") != null ? request.getParameter("end_time") : "";
	
		Map map = new HashMap();
		map.put("start_time", start_time);
		map.put("end_time", end_time);

		List list = service.getChart4(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="chart5", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart5( HttpServletRequest request ) {
		
		String start_time = request.getParameter("start_time") != null ? request.getParameter("start_time") : "";
		String end_time = request.getParameter("end_time") != null ? request.getParameter("end_time") : "";
	
		Map map = new HashMap();
		map.put("start_time", start_time);
		map.put("end_time", end_time);

		List list = service.getChart5(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="chart6", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart6( HttpServletRequest request ) {
		
		String start_time = request.getParameter("start_time") != null ? request.getParameter("start_time") : "";
		String end_time = request.getParameter("end_time") != null ? request.getParameter("end_time") : "";
	
		Map map = new HashMap();
		map.put("start_time", start_time);
		map.put("end_time", end_time);

		List list = service.getChart6(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="chart7", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart7( HttpServletRequest request ) {
		
		String start_time = request.getParameter("start_time") != null ? request.getParameter("start_time") : "";
		String end_time = request.getParameter("end_time") != null ? request.getParameter("end_time") : "";
	
		Map map = new HashMap();
		map.put("start_time", start_time);
		map.put("end_time", end_time);

		List list = service.getChart7(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="realtime_cal", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String realtime( HttpServletRequest request ) {
				
		List list = service.getrealtime();
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="realtime_senti", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String getrealtime_senti( HttpServletRequest request ) {
				
		List list = service.getrealtime_senti();
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="realtime_con", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String getrealtime_con( HttpServletRequest request ) {
				
		List list = service.getrealtime_con();
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="realtime_td", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String realtime_td( HttpServletRequest request ) {
				
		List list = service.getrealtime_td();
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	
	@RequestMapping(value="chart1_m", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart1M( HttpServletRequest request ) {
		
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";
		
		Map map = new HashMap();
		map.put("month", month);

		List list = service.getChart1_m(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="chart1_1_m", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart1_1M( HttpServletRequest request ) {
		
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";
		
		Map map = new HashMap();
		map.put("month", month);

		List list = service.getChart1_1_m(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="chart1_2_m", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart1_2M( HttpServletRequest request ) {
		
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";
		
		Map map = new HashMap();
		map.put("month", month);


		List list = service.getChart1_2_m(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="chart2_m", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart2M( HttpServletRequest request ) {
		
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";
	
		Map map = new HashMap();
		map.put("month", month);

		List list = service.getChart2_m(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="chart2_1_m", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart2_1M( HttpServletRequest request ) {
		
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";
		
		Map map = new HashMap();
		map.put("month", month);


		List list = service.getChart2_1_m(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="chart3_m", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart3M( HttpServletRequest request ) {
		
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";
		
		Map map = new HashMap();
		map.put("month", month);


		List list = service.getChart3_m(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="chart4_m", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart4M( HttpServletRequest request ) {
		
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";
	
		Map map = new HashMap();
		map.put("month", month);

		List list = service.getChart4_m(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="chart5_m", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart5M( HttpServletRequest request ) {
		
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";
		
		Map map = new HashMap();
		map.put("month", month);

		List list = service.getChart5_m(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="chart6_m", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart6M( HttpServletRequest request ) {
		
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";
		
		Map map = new HashMap();
		map.put("month", month);

		List list = service.getChart6_m(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="chart7_m", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String dashDepthOneChart7M( HttpServletRequest request ) {
		
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";
		
		Map map = new HashMap();
		map.put("month", month);


		List list = service.getChart7_m(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="monthkey", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String monthkey( HttpServletRequest request ) {
		
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";
		
		Map map = new HashMap();
		map.put("month", month);


		List list = service.getMonthkey(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="monthbuzz", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String monthbuzz( HttpServletRequest request ) {
		
		
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";
		
		String key = "";
		try {
			key = request.getParameter("key") != null ? URLDecoder.decode(request.getParameter("key"), "utf-8") : "";
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Map map = new HashMap();
		map.put("month", month);
		map.put("key", key);

		List list = service.getmonthbuzz(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="monthbuzz2", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String monthbuzz2( HttpServletRequest request ) {
		
		
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";
		
		String key = "";
		try {
			key = request.getParameter("key") != null ? URLDecoder.decode(request.getParameter("key"), "utf-8") : "";
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Map map = new HashMap();
		map.put("month", month);
		map.put("key", key);

		List list = service.getmonthbuzz2(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="monthbuzz3", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String monthbuzz3( HttpServletRequest request ) {
		
		
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";
		
		String key = "";
		try {
			key = request.getParameter("key") != null ? URLDecoder.decode(request.getParameter("key"), "utf-8") : "";
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Map map = new HashMap();
		map.put("month", month);
		map.put("key", key);

		List list = service.getmonthbuzz3(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="monthsenti", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String monthsenti( HttpServletRequest request ) {
		
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";
		
		String key = "";
		try {
			key = request.getParameter("key") != null ? URLDecoder.decode(request.getParameter("key"), "utf-8") : "";
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Map map = new HashMap();
		map.put("month", month);
		map.put("key", key);

		List list = service.getmonthsenti(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="monthrelation", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String monthrelation( HttpServletRequest request ) {
		
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";
		
		String key = "";
		try {
			key = request.getParameter("key") != null ? URLDecoder.decode(request.getParameter("key"), "utf-8") : "";
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Map map = new HashMap();
		map.put("month", month);
		map.put("key", key);

		
		List list = service.getmonthrelation(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
	
	@RequestMapping(value="monthhc", method=RequestMethod.POST, produces="text/plan;charset=UTF-8")
	public @ResponseBody String monthhc( HttpServletRequest request ) {
		
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";
		
		//String key = request.getParameter("key") != null ? request.getParameter("key") : "";
		
		String key = "";
		try {
			key = request.getParameter("key") != null ? URLDecoder.decode(request.getParameter("key"), "utf-8") : "";
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Map map = new HashMap();
		map.put("month", month);
		map.put("key", key);
		
		List list = service.getmonthhc(map);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		return json;
	}
}
























