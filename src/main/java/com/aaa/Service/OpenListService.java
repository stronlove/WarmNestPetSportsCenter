package com.aaa.Service;

import java.util.List;

import com.aaa.Entity.Commodity;
import com.aaa.Entity.DepartmentTable;
import com.aaa.Entity.OpenList;
import com.aaa.Entity.StaffTable;
import com.aaa.Entity.TherapeuticDrugs;

public interface OpenListService {

	void svaeOpenList(OpenList o);

	OpenList StarttheorderLoad(StaffTable s);

	List<TherapeuticDrugs> AddForm(Long commodityno, Long hangsinglenumber);

	void NextClick(Long openlistno);

	void submitOpenList(OpenList o);

	List<TherapeuticDrugs> selectformaa(Long commodityno,
			Long hangsinglenumber);

	void updatereduce(Long commodityno);

	List<TherapeuticDrugs> oenlistnowherecommodity(Long openlistno);
	List<TherapeuticDrugs> oenlistnowherecommoditys(Long openlistno);

	void Getthemedicineaaaa(Long openlistno);

	List<TherapeuticDrugs> oenlistnowherecommoditywhere1(Long openlistno);

	void Treatmentssss(Long openlistno);

	void openlistnoyuefuqian(String openlistno);

	void updateopenlist(String openlistno);

	List<OpenList> OpenListStafftable(String petno);

	Long selectcountopemlist(Long petno);

	List<TherapeuticDrugs> kaidanxingqing(String openlistno);

	OpenList kaidanxingqing123(String openlistno);
	
}
