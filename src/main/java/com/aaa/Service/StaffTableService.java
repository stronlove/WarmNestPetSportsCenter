package com.aaa.Service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.aaa.Entity.OpenList;
import com.aaa.Entity.PermissionsTable;
import com.aaa.Entity.RoleTable;
import com.aaa.Entity.StaffTable;
import com.aaa.pager.Pager;

public interface StaffTableService {

	Long loginStaffTablecoun(StaffTable s);

	Long loginuforbidden(StaffTable s);

	List<StaffTable> loginStaffTable(StaffTable s);

	List<PermissionsTable> StaffTablePermissionsTable(Long long1);

	List<StaffTable> StaffTableAjaxSelect(Long a);

	List<RoleTable> SelectRList();

	List<PermissionsTable> SelectRListwhere(Long roletableno);

	void AddRoleTable(RoleTable r);

	List<PermissionsTable> SelectRListwhere1();

	void Modifypermissionsa(Long[] permissionstableno, Long roletableno);

	Pager<OpenList> selectUserPays(Pager<OpenList> pager, String likewhere);
	Pager<OpenList> selectUserPaya(Pager<OpenList> pager, String likewhere);

	Pager<OpenList> selectUserPayw(Pager<OpenList> pager, String likewhere);

	
	/*王金格
	 * 员工
	 */
	 /*public List<StaffTable> listStaffTable();*/
	 public void saveOrUpdateStaffTable(StaffTable staffTable);
	 public StaffTable findById(Long stafftableno);
	 //ajax判断
	 public List<StaffTable> findBysname(@Param("UserRegistrationval")String sname);
	 public List<StaffTable> findBysid(@Param("RegisteredIdentityCardNumber")String sid);
	 void StaffSrole(Long srole, Long stafftableno);
	 //分页
	public Pager<StaffTable> listStaffTable(String keyword,Pager<StaffTable> pager);
		

}
