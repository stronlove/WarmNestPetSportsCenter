package com.aaa.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.Dao.DepartmentTableDao;
import com.aaa.Dao.OpenListDao;
import com.aaa.Dao.PetDao;
import com.aaa.Entity.Commodity;
import com.aaa.Entity.DepartmentTable;
import com.aaa.Entity.OpenList;
import com.aaa.Entity.Pet;
import com.aaa.Entity.PetUser;
import com.aaa.Entity.StaffTable;
import com.aaa.Entity.TherapeuticDrugs;
import com.aaa.Service.DepartmentTableService;
import com.aaa.Service.OpenListService;
import com.aaa.Service.PetService;

@Service
@Transactional
public class OpenListServiceimpl implements OpenListService {
	@Autowired
	private OpenListDao dt;
	//孙斌编写上

	public void svaeOpenList(OpenList o) {
		dt.svaeOpenList(o);
	}

	public OpenList StarttheorderLoad(StaffTable s) {
		Long a=dt.countStarttheorderLoad(s);
		if(a>0){
			return dt.StarttheorderLoad(s).get(0);
		}else{
			return null;
		}
	}

	public List<TherapeuticDrugs> AddForm(Long commodityno,
			Long hangsinglenumber) {
		Long count=dt.selectcountAdd(commodityno,hangsinglenumber);
		if(count==0){
			dt.AddFormaa(commodityno,hangsinglenumber);
		}else{
			dt.updateForm(commodityno,hangsinglenumber);
		}
		return dt.selectaddForm(commodityno,hangsinglenumber);
	}

	public void NextClick(Long openlistno) {
		dt.NextClick(openlistno);
	}

	public void submitOpenList(OpenList o) {
		dt.submitOpenList(o);
	}

	public List<TherapeuticDrugs> selectformaa(Long commodityno,
			Long hangsinglenumber) {
		return dt.selectaddForm(commodityno,hangsinglenumber);
	}

	public void updatereduce(Long commodityno) {
		Long tnumber = dt.selectreduce(commodityno);
		if(tnumber==1 || tnumber==0){
			dt.deletereduce(commodityno);
		}else{
			dt.updatereduce(commodityno);
		}
	}

	public List<TherapeuticDrugs> oenlistnowherecommodity(Long openlistno) {
		return dt.oenlistnowherecommodity(openlistno);
	}

	public void Getthemedicineaaaa(Long openlistno) {
		List<TherapeuticDrugs> cdt=dt.oenlistnowherecommodity(openlistno);
		for (int i = 0; i < cdt.size(); i++) {
			TherapeuticDrugs t=cdt.get(i);
			dt.updateCommodity(t.getTnumber(),t.getTcommoditys().getCommodityno());
			dt.updateTherapeuticDrugs(t.getTerapeuticdrugsno());
		}
		Long long1=dt.selectGetthemedicineaaaaWhere4(openlistno);
		if(long1<1){
			dt.Getthemedicineaaaa(openlistno);
		}
	}

	public List<TherapeuticDrugs> oenlistnowherecommoditywhere1(Long openlistno) {
		return dt.oenlistnowherecommoditywhere1(openlistno);
	}
	@Override
	public List<TherapeuticDrugs> oenlistnowherecommoditys(Long openlistno) {
		// TODO Auto-generated method stub
		return dt.oenlistnowherecommoditys(openlistno);
	}
	//孙斌编写下

	public void Treatmentssss(Long openlistno) {
		List<TherapeuticDrugs> cdt=dt.oenlistnowherecommoditywhere1(openlistno);
		for (int i = 0; i < cdt.size(); i++) {
			TherapeuticDrugs t=cdt.get(i);
			dt.updateCommodity(t.getTnumber(),t.getTcommoditys().getCommodityno());
			dt.updateTherapeuticDrugs(t.getTerapeuticdrugsno());
		}
		Long long1=dt.selectGetthemedicineaaaaWhere4(openlistno);
		System.out.println((long1<1)+" "+long1);
		if(long1<1){
			dt.Getthemedicineaaaa(openlistno);
		}
	}

	public void openlistnoyuefuqian(String openlistno) {
		dt.openlistnoyuefuqian(openlistno);
	}

	public void updateopenlist(String openlistno) {
		dt.updateopenlist(openlistno);
	}

	public List<OpenList> OpenListStafftable(String petno) {
		return dt.OpenListStafftable(petno);
	}

	public Long selectcountopemlist(Long petno) {
		return dt.selectcountopemlist(petno);
	}

	public List<TherapeuticDrugs> kaidanxingqing(String openlistno) {
		return dt.kaidanxingqing(openlistno);
	}

	public OpenList kaidanxingqing123(String openlistno) {
		return dt.kaidanxingqing123(openlistno);
	}
}
