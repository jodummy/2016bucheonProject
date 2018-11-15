package kr.co.gogreat.model.service.admin;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import kr.co.gogreat.domain.admin.AdminMember;
import kr.co.gogreat.dto.SentimentDTO;
import kr.co.gogreat.model.dao.admin.AdminManagementDAO;

@Service
public class AdminManagementServiceImpl implements AdminManagementService{

	@Autowired
	private AdminManagementDAO dao;
	
	@Override
	public AdminMember getAdminMember(AdminMember adm) {

		String pw = adm.getPassword();
		adm.setPassword(encryption(pw));
		AdminMember admInfo = idAndPwCheck(adm);
		
		if(admInfo != null) {
			return admInfo;
		}else {
			return null;
		}
	}
	
	@Override
	public Map changePassword(AdminMember adm, String pw, String newPw) {
		
		AdminMember admInfo = idAndPwCheck(adm);
		pw = encryption(pw);
		if(admInfo != null) {
			if(pw.equals(admInfo.getPassword())) {
				HashMap map = new HashMap();
				pw = encryption(newPw);
				map.put("id", admInfo.getId());
				map.put("newPw", pw);
				int result = dao.updateAdminPassword(map);
				if(result != 0) {
					map.put("adm", dao.selectAdminInfoList(admInfo.getId()));
					map.put("result", result);
					return map;
				}
			}
			return null;
		}
		
		return null;
	}
	
	private AdminMember idAndPwCheck(AdminMember adm) {
		
		String id = adm.getId();
		String pw = adm.getPassword();
		AdminMember admInfo = dao.selectAdminInfoList(id);
		if(admInfo != null) {
			if(pw.equals(admInfo.getPassword())) {
				return admInfo;
			}
		}
		return null;
	}
	
	private String encryption( String pw ) {
		
		String password = "";
		pw = "G"+pw+"O";
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			md.update(pw.getBytes());
			byte[] mdByte = md.digest();
			for(int i = 0; i < mdByte.length; i++){
				byte temp = mdByte[i];
				String s = Integer.toHexString(new Byte(temp));
				while(s.length() < 2){
					s = "0"+s;
				}
				s = s.substring(s.length() -2);
				password += s;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return password;
	}

	@Override
	public String putIPExclude(String sid, String ip) {
		
		Map map = new HashMap();
		map.put("sid", sid);
		map.put("ip", ip);
		
		int result = dao.insertIPExclude(map);
		String rsString = "";
		if(result == 1) {
			rsString = "IP 제외 성공!!";
		}
		
		return rsString; 
	}

	@Override
	public String ExcludeIPRemove(String sid, String ip) {
		
		Map map = new HashMap();
		map.put("sid", sid);
		map.put("ip", ip);
		
		int result = dao.deleteEj_IPByIP(map);
		String rsString = "";
		
		if(result == 1) {
			rsString = "IP 추가 성공!!";
		}
		
		return rsString;
	}

	@Override
	public List getAuditSituation(String sid, String userName) {
		
		Map map = new HashMap();
		map.put("sid", sid);
		map.put("userName", userName);
		
		return dao.selectAuditOpts(map);
	}

	@Override
	public List getDBUserList(String sid) {
		
		Map map = new HashMap();
		map.put("sid", sid);
		
		return dao.selectDBUserList(map);
	}

	@Override
	public List getDBTableList(String sid, String userName) {
		
		Map map = new HashMap();
		map.put("sid", sid);
		map.put("userName", userName);
		
		return dao.selectDBTableList(map);
	}

	@Override
	public void getAuditProcedure(String sid, String auditParam) {
		
		String[] temp = auditParam.split("/_/");
		String owner = temp[0];
		String objectName = temp[1];
		String activeName = temp[2];
		String choice = "ON";
		if(temp[3].equals("CANCEL")) {
			choice = "OFF";
		}else {
			choice = "ON";
		}
		
		Map map = new HashMap();
		map.put("sid", sid);
		map.put("owner", owner);
		map.put("objectName", objectName);
		map.put("activeName", activeName);
		map.put("choice", choice);
		
		dao.proTableAudit(map);
	}

	@Override
	public void updateInstanceName(Map map) {
		dao.updateDBListInstanceName(map);
	}
	
	@Override
	public List getChart1(Map map) {
		return dao.getChart1(map);
	}
	
	@Override
	public List getChart1_1(Map map) {
		return dao.getChart1_1(map);
	}
	
	@Override
	public List getChart1_2(Map map) {
		return dao.getChart1_2(map);
	}
	
	@Override
	public List getChart2(Map map) {
		return dao.getChart2(map);
	}
	
	@Override
	public List getChart2_1(Map map) {
		return dao.getChart2_1(map);
	}
	
	@Override
	public List getChart3(Map map) {
		return dao.getChart3(map);
	}
	
	@Override
	public List getChart4(Map map) {
		return dao.getChart4(map);
	}
	
	@Override
	public List getChart5(Map map) {
		return dao.getChart5(map);
	}
	
	@Override
	public List getChart6(Map map) {
		return dao.getChart6(map);
	}
	
	@Override
	public List getChart7(Map map) {
		return dao.getChart7(map);
	}
	
	@Override
	public List getrealtime() {
		return dao.getrealtime();
	}
	
	@Override
	public List getrealtime_senti() {
		return dao.getrealtime_senti();
	}
	
	
	@Override
	public List getrealtime_con() {
		return dao.getrealtime_con();
	}
	
	@Override
	public List getrealtime_td() {
		return dao.getrealtime_td();
	}
	
	
	@Override
	public List getChart1_m(Map map) {
		return dao.getChart1_m(map);
	}
	
	@Override
	public List getChart1_1_m(Map map) {
		return dao.getChart1_1_m(map);
	}
	
	@Override
	public List getChart1_2_m(Map map) {
		return dao.getChart1_2_m(map);
	}
	
	@Override
	public List getChart2_m(Map map) {
		return dao.getChart2_m(map);
	}
	
	@Override
	public List getChart2_1_m(Map map) {
		return dao.getChart2_1_m(map);
	}
	
	@Override
	public List getChart3_m(Map map) {
		return dao.getChart3_m(map);
	}
	
	@Override
	public List getChart4_m(Map map) {
		return dao.getChart4_m(map);
	}
	
	@Override
	public List getChart5_m(Map map) {
		return dao.getChart5_m(map);
	}
	
	@Override
	public List getChart6_m(Map map) {
		return dao.getChart6_m(map);
	}
	
	@Override
	public List getChart7_m(Map map) {
		return dao.getChart7_m(map);
	}
	
	@Override
	public List getMonthkey(Map map) {
		return dao.getMonthkey(map);
	}
	
	@Override
	public List getmonthbuzz(Map map) {
		return dao.getmonthbuzz(map);
	}
	
	@Override
	public List getmonthbuzz2(Map map) {
		return dao.getmonthbuzz2(map);
	}
	
	@Override
	public List getmonthbuzz3(Map map) {
		return dao.getmonthbuzz3(map);
	}
	
	@Override
	public List getmonthsenti(Map map) {
		return dao.getmonthsenti(map);
	}
	
	@Override
	public List getmonthrelation(Map map) {
		return dao.getmonthrelation(map);
	}
	
	@Override
	public List getmonthhc(Map map) {
		return dao.getmonthhc(map);
	}

	@Override
	public String getSentiData(Map map) {
		
		ArrayList<SentimentDTO> list = (ArrayList<SentimentDTO>) dao.getSentiData(map);
		System.out.println(list);
		Gson gson = new Gson();
		String data = gson.toJson(list);
		return data ;
	}
}









