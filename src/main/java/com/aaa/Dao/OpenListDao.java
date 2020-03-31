package com.aaa.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.aaa.Entity.Commodity;
import com.aaa.Entity.DepartmentTable;
import com.aaa.Entity.OpenList;
import com.aaa.Entity.Pet;
import com.aaa.Entity.PetUser;
import com.aaa.Entity.StaffTable;
import com.aaa.Entity.TherapeuticDrugs;

@Mapper
public interface OpenListDao {


	//孙斌写的上
	void svaeOpenList(OpenList o);

	List<OpenList> StarttheorderLoad(StaffTable s);

	Long countStarttheorderLoad(StaffTable s);


	List<TherapeuticDrugs> selectaddForm(@Param("commodityno")Long commodityno,
			@Param("hangsinglenumber")Long hangsinglenumber);

	Long selectcountAdd(@Param("commodityno")Long commodityno,
			@Param("hangsinglenumber")Long hangsinglenumber);

	void updateForm(@Param("commodityno")Long commodityno,
			@Param("hangsinglenumber")Long hangsinglenumber);

	void AddFormaa(@Param("commodityno")Long commodityno,
			@Param("hangsinglenumber")Long hangsinglenumber);

	void NextClick(@Param("openlistno")Long openlistno);

	void submitOpenList(OpenList o);

	void updatereduce(@Param("commodityno")Long commodityno);

	List<TherapeuticDrugs> oenlistnowherecommodity(@Param("openlistno")Long openlistno);

	void Getthemedicineaaaa(Long openlistno);

	void updateCommodity(@Param("tnumber")Long tnumber, @Param("commodityno")Integer commodityno);

	List<TherapeuticDrugs> oenlistnowherecommoditywhere1(@Param("openlistno")Long openlistno);
	List<TherapeuticDrugs> oenlistnowherecommoditys(
			@Param("openlistno") Long openlistno);

	void updateTherapeuticDrugs(@Param("terapeuticdrugsno")Long terapeuticdrugsno);

	Long selectreduce(@Param("commodityno")Long commodityno);

	void deletereduce(@Param("commodityno")Long commodityno);

	void openlistnoyuefuqian(@Param("openlistno")String openlistno);

	void updateopenlist(@Param("openlistno")String openlistno);

	Long selectGetthemedicineaaaaWhere4(@Param("openlistno")Long openlistno);

	List<OpenList> OpenListStafftable(@Param("petno")String petno);

	Long selectcountopemlist(@Param("petno")Long petno);

	List<TherapeuticDrugs> kaidanxingqing(@Param("openlistno")String openlistno);

	OpenList kaidanxingqing123(@Param("openlistno")String openlistno);

	//孙斌写的下
}
