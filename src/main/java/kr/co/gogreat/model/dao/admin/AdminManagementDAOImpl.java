package kr.co.gogreat.model.dao.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gogreat.domain.admin.AdminMember;
import kr.co.gogreat.dto.SentimentDTO;

@Repository
public class AdminManagementDAOImpl implements AdminManagementDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public AdminMember selectAdminInfoList(String id) {
		return session.selectOne("admin.management.selectAdminInfoList", id);
	}

	@Override
	public int updateAdminPassword(Map map) {
		session.selectOne("admin.management.updateAdminPassword", map);
		return 1;
	}

	@Override
	public int insertIPExclude(Map map) {
		return session.insert("admin.management.insertIPExclude", map);
	}

	@Override
	public int deleteEj_IPByIP(Map map) {
		return session.delete("admin.management.deleteEj_IPByIP", map);
	}

	@Override
	public List selectAuditOpts(Map map) {
		return session.selectList("admin.management.selectAuditOpts", map);
	}

	@Override
	public List selectDBUserList(Map map) {
		return session.selectList("admin.management.selectDBUserList", map);
	}

	@Override
	public List selectDBTableList(Map map) {
		return session.selectList("admin.management.selectDBTableList", map);
	}

	@Override
	public void proTableAudit(Map map) {
		session.insert("admin.management.proTableAudit", map);
	}

	@Override
	public void updateDBListInstanceName(Map map) {
		session.update("admin.management.updateDBListInstanceName", map);
	}

	@Override
	public List getChart1(Map map) {
		return session.selectList("admin.management.chart1", map);
	}
	
	@Override
	public List getChart1_1(Map map) {
		return session.selectList("admin.management.chart1_1", map);
	}
	
	@Override
	public List getChart1_2(Map map) {
		return session.selectList("admin.management.chart1_2", map);
	}
	
	@Override
	public List getChart2(Map map) {
		return session.selectList("admin.management.chart2", map);
	}
	
	@Override
	public List getChart2_1(Map map) {
		return session.selectList("admin.management.chart2_1", map);
	}
	
	@Override
	public List getChart3(Map map) {
		return session.selectList("admin.management.chart3", map);
	}
	
	@Override
	public List getChart4(Map map) {
		return session.selectList("admin.management.chart4", map);
	}
	
	@Override
	public List getChart5(Map map) {
		return session.selectList("admin.management.chart5", map);
	}
	
	@Override
	public List getChart6(Map map) {
		return session.selectList("admin.management.chart6", map);
	}
	
	@Override
	public List getChart7(Map map) {
		return session.selectList("admin.management.chart7", map);
	}
	
	@Override
	public List getrealtime() {
		return session.selectList("admin.management.realtime");
	}
	
	@Override
	public List getrealtime_senti() {
		return session.selectList("admin.management.realtime_senti");
	}
	
	@Override
	public List getrealtime_con() {
		return session.selectList("admin.management.realtime_con");
	}
	
	@Override
	public List getrealtime_td() {
		return session.selectList("admin.management.realtime_td");
	}
	
	@Override
	public List getChart1_m(Map map) {
		return session.selectList("admin.management.chart1_m", map);
	}
	
	@Override
	public List getChart1_1_m(Map map) {
		return session.selectList("admin.management.chart1_1_m", map);
	}
	
	@Override
	public List getChart1_2_m(Map map) {
		return session.selectList("admin.management.chart1_2_m", map);
	}
	
	@Override
	public List getChart2_m(Map map) {
		return session.selectList("admin.management.chart2_m", map);
	}
	
	@Override
	public List getChart2_1_m(Map map) {
		return session.selectList("admin.management.chart2_1_m", map);
	}
	
	@Override
	public List getChart3_m(Map map) {
		return session.selectList("admin.management.chart3_m", map);
	}
	
	@Override
	public List getChart4_m(Map map) {
		return session.selectList("admin.management.chart4_m", map);
	}
	
	@Override
	public List getChart5_m(Map map) {
		return session.selectList("admin.management.chart5_m", map);
	}
	
	@Override
	public List getChart6_m(Map map) {
		return session.selectList("admin.management.chart6_m", map);
	}
	
	@Override
	public List getChart7_m(Map map) {
		return session.selectList("admin.management.chart7_m", map);
	}
	
	@Override
	public List getMonthkey(Map map) {
		return session.selectList("admin.management.monthkey", map);
	}
	
	@Override
	public List getmonthbuzz(Map map) {
		return session.selectList("admin.management.monthbuzz", map);
	}
	
	@Override
	public List getmonthbuzz2(Map map) {
		return session.selectList("admin.management.monthbuzz2", map);
	}
	
	@Override
	public List getmonthbuzz3(Map map) {
		return session.selectList("admin.management.monthbuzz3", map);
	}
	
	@Override
	public List getmonthsenti(Map map) {
		return session.selectList("admin.management.monthsenti", map);
	}
	
	@Override
	public List getmonthrelation(Map map) {
		return session.selectList("admin.management.monthrelation", map);
	}
	
	@Override
	public List getmonthhc(Map map) {
		return session.selectList("admin.management.monthhc", map);
	}

	@Override
	public List<SentimentDTO> getSentiData(Map map) {
		return session.selectList("admin.management.getSentiData", map);
	}
	
}













