package com.aaa.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.aaa.Entity.OpenList;
import com.aaa.Entity.PermissionsTable;
import com.aaa.Entity.PetUser;
import com.aaa.Entity.RoleTable;
import com.aaa.Entity.StaffTable;

@Mapper
public interface StaffTableDao {

	//孙斌写的上
	Long loginStaffTablecoun(StaffTable s);

	Long loginuforbidden(StaffTable s);

	List<StaffTable> loginStaffTable(StaffTable s);

	List<PermissionsTable> StaffTablePermissionsTable(@Param("long1")Long long1);

	List<StaffTable> StaffTableAjaxSelect(Long a);

	List<RoleTable> SelectRList();

	List<PermissionsTable> SelectRListwhere(Long roletableno);

	void AddRoleTable(RoleTable r);

	List<PermissionsTable> SelectRListwhere1();

	PermissionsTable selectModifypermissionsa(@Param("long1")Long long1);

	void AddModifypermissionsa(@Param("p")PermissionsTable p, @Param("roletableno")Long roletableno);

	void deleteModifypermissionsa(@Param("long1")Long long1);

	List<OpenList> SelectUserPays(@Param("likewhere")String likewhere, @Param("offset")Long offset, @Param("pagesize")Long pagesize);
	List<OpenList> SelectUserPaya(@Param("likewhere") String likewhere,
			@Param("offset") Long offset, @Param("pagesize") Long pagesize);

	List<OpenList> SelectUserPayw(@Param("likewhere") String likewhere,
			@Param("offset") Long offset, @Param("pagesize") Long pagesize);

	Long SelectCountUserPays(@Param("likewhere")String likewhere);
	Long SelectCountUserPaya(@Param("likewhere") String likewhere);

	Long SelectCountUserPayw(@Param("likewhere") String likewhere);

	//孙斌写的下
	
	/*
	 * 王金格
	 * 员工
	 */
	 public List<StaffTable> listStaffTable();
	 public StaffTable findById(Long stafftableno);
	 public void saveStaffTable(StaffTable staffTable);
	 public void updateStaffTable(StaffTable staffTable);
	 //ajax判断
	 public List<StaffTable> findBysname(@Param("UserRegistrationval")String sname);
	 public List<StaffTable> findBysid(@Param("RegisteredIdentityCardNumber")String sid);
	 void StaffSrole(@Param("srole")Long srole, @Param("stafftableno")Long stafftableno);
     //分页
	 public List<StaffTable> pager(@Param("keyword")String keyword,@Param("offset")Long offset,@Param("pagesize")Long pagesize);
	 public Long count(@Param("keyword")String keyword);

	List<PermissionsTable> selectPlevel();

		
	
	
	
}
