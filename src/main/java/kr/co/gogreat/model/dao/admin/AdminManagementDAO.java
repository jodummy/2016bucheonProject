package kr.co.gogreat.model.dao.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.co.gogreat.domain.admin.AdminMember;
import kr.co.gogreat.dto.SentimentDTO;

public interface AdminManagementDAO {

	public AdminMember selectAdminInfoList(String id);
	
	public int updateAdminPassword(Map map);
	
	public int insertIPExclude(Map map);
	
	public int deleteEj_IPByIP(Map map);
	
	public List selectAuditOpts(Map map);
	
	public List selectDBUserList(Map map);
	
	public List selectDBTableList(Map map);
	
	public void proTableAudit(Map map);
	
	public void updateDBListInstanceName(Map map);
	
	public List<SentimentDTO> getSentiData(Map map); // 레포트 페이지 감성단어 로우데이터 불러옴
	
	public List getChart1(Map map);
	
	public List getChart1_1(Map map);
	
	public List getChart1_2(Map map);
	
	public List getChart2(Map map);
	
	public List getChart2_1(Map map);
	
	public List getChart3(Map map);
	
	public List getChart4(Map map);
	
	public List getChart5(Map map);
	
	public List getChart6(Map map);
	
	public List getChart7(Map map);
	
	public List getrealtime();
	
	public List getrealtime_senti();
	
	public List getrealtime_con();
	
	public List getrealtime_td();
	
	public List getChart1_m(Map map);
	
	public List getChart1_1_m(Map map);
	
	public List getChart1_2_m(Map map);
	
	public List getChart2_m(Map map);
	
	public List getChart2_1_m(Map map);
	
	public List getChart3_m(Map map);
	
	public List getChart4_m(Map map);
	
	public List getChart5_m(Map map);
	
	public List getChart6_m(Map map);
	
	public List getChart7_m(Map map);
	
	public List getMonthkey(Map map);
	
	public List getmonthbuzz(Map map);
	
	public List getmonthbuzz2(Map map);
	
	public List getmonthbuzz3(Map map);

	public List getmonthsenti(Map map);
	
	public List getmonthrelation(Map map);
	
	public List getmonthhc(Map map);
		
}
