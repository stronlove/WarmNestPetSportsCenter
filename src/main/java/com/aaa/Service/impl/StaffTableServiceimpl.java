package com.aaa.Service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.aaa.Dao.StaffTableDao;
import com.aaa.Entity.OpenList;
import com.aaa.Entity.PermissionsTable;
import com.aaa.Entity.PetUser;
import com.aaa.Entity.RoleTable;
import com.aaa.Entity.StaffTable;
import com.aaa.Service.StaffTableService;
import com.aaa.pager.Pager;
	
@Service
@Transactional
public class StaffTableServiceimpl implements StaffTableService{
	@Autowired
	private StaffTableDao sta;

	//孙斌编写上
	public Long loginStaffTablecoun(StaffTable s) {
		return sta.loginStaffTablecoun(s);
	}

	public Long loginuforbidden(StaffTable s) {
		return sta.loginuforbidden(s);
	}

	public List<StaffTable> loginStaffTable(StaffTable s) {
		return sta.loginStaffTable(s);
	}

	public List<PermissionsTable> StaffTablePermissionsTable(Long long1) {
		return sta.StaffTablePermissionsTable(long1); 
	}

	public List<StaffTable> StaffTableAjaxSelect(@Param("a")Long a) {
		return sta.StaffTableAjaxSelect(a);
	}

	public List<RoleTable> SelectRList() {
		return sta.SelectRList();
	}

	public List<PermissionsTable> SelectRListwhere(@ModelAttribute("roletableno")Long roletableno) {
		return sta.SelectRListwhere(roletableno);
	}

	public void AddRoleTable(RoleTable r) {
		sta.AddRoleTable(r);
	}

	public List<PermissionsTable> SelectRListwhere1() {
		return sta.SelectRListwhere1();
	}

	public void Modifypermissionsa(Long[] permissionstableno,Long roletableno) {
		sta.deleteModifypermissionsa(roletableno);
		String aa="";
		for (int i = 0; i < permissionstableno.length; i++) {
			PermissionsTable p=sta.selectModifypermissionsa(permissionstableno[i]);
			System.out.println(p.getPurl()+"+++++++++++++");
			if(p.getPurl()=="" || p.getPurl().equals("")){
				sta.AddModifypermissionsa(p,roletableno);
				List<PermissionsTable> p1=sta.selectPlevel();
				aa=p1.get(0).getPermissionstableno().toString();
			}else{
				p.setPlevel(aa);
				sta.AddModifypermissionsa(p,roletableno);
			}
		}
	}

	public Pager<OpenList> selectUserPays(Pager<OpenList> pager, String likewhere) {
		List<OpenList> rows = sta.SelectUserPays(likewhere,pager.getOffset(), pager.getPagesize());
		pager.setRows(rows);
		Long total = sta.SelectCountUserPays(likewhere);
		pager.setTotal(total);
		return pager;
	}
	@Override
	public Pager<OpenList> selectUserPaya(Pager<OpenList> pager,
			String likewhere) {
		List<OpenList> rows = sta.SelectUserPaya(likewhere, pager.getOffset(),
				pager.getPagesize());
		pager.setRows(rows);
		Long total = sta.SelectCountUserPaya(likewhere);
		pager.setTotal(total);
		return pager;
	}

	@Override
	public Pager<OpenList> selectUserPayw(Pager<OpenList> pager,
			String likewhere) {
		List<OpenList> rows = sta.SelectUserPayw(likewhere, pager.getOffset(),
				pager.getPagesize());
		pager.setRows(rows);
		Long total = sta.SelectCountUserPayw(likewhere);
		pager.setTotal(total);
		return pager;
	}

	/**
	 * 王金格
	 */
	/*@Override
	public List<StaffTable> listStaffTable() {
		// TODO Auto-generated method stub
		return sta.listStaffTable();
	}
*/
	

	@Override
	public void saveOrUpdateStaffTable(StaffTable staffTable) {
		// TODO Auto-generated method stub
          if(staffTable.getStafftableno()==null){
			
        	  sta.saveStaffTable(staffTable);;
		 }else
		 {
			 sta.updateStaffTable(staffTable);;
		 }
	 }

	@Override
	public StaffTable findById(Long stafftableno) {
		// TODO Auto-generated method stub
		return sta.findById(stafftableno);
	}

	@Override
	public List<StaffTable> findBysname(String sname) {
		// TODO Auto-generated method stub
		return sta.findBysname(sname);
	}

	@Override
	public List<StaffTable> findBysid(String sid) {
		// TODO Auto-generated method stub
		return sta.findBysid(sid);
	}

	@Override
	public void StaffSrole(Long srole, Long stafftableno) {
		// TODO Auto-generated method stub
		sta.StaffSrole(srole,stafftableno);
	}

	@Override
	public Pager<StaffTable> listStaffTable(String keyword, Pager<StaffTable> pager) {
		// TODO Auto-generated method stub
				//第一步，查询分页数据，封装到pager的rows属性里面
				List<StaffTable> rows = sta.pager(keyword,pager.getOffset(), pager.getPagesize());
				pager.setRows(rows);
				//第二步，查询总条数，封装到pager的total属性里面
				Long total = sta.count(keyword);
				pager.setTotal(total);
				return pager;
	}
	//孙斌编写下
}
