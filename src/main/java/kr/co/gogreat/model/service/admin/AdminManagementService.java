package kr.co.gogreat.model.service.admin;

import java.util.List;
import java.util.Map;

import kr.co.gogreat.domain.admin.AdminMember;

public interface AdminManagementService {

	public AdminMember getAdminMember(AdminMember adm);
	
	public Map changePassword(AdminMember adm, String pw, String newPw);
	
	public String putIPExclude(String sid, String ip);
	
	public String ExcludeIPRemove(String sid, String ip);
	
	public List getAuditSituation(String sid, String userName);
	
	public List getDBUserList(String sid);
	
	public List getDBTableList(String sid, String userName);
	
	public void getAuditProcedure(String sid, String auditParam);
	
	public void updateInstanceName(Map map);
	
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
	
	public String getSentiData(Map map);
}
