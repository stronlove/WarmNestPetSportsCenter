package com.aaa.Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aaa.Entity.CommoditTypeTable;
import com.aaa.Entity.Commodity;
import com.aaa.Entity.Delivery;
import com.aaa.Entity.DepartmentTable;
import com.aaa.Entity.FinancialRecords;
import com.aaa.Entity.OpenList;
import com.aaa.Entity.PermissionsTable;
import com.aaa.Entity.Pet;
import com.aaa.Entity.PetUser;
import com.aaa.Entity.RegistrationForm;
import com.aaa.Entity.RoleTable;
import com.aaa.Entity.StaffTable;
import com.aaa.Entity.TherapeuticDrugs;
import com.aaa.Entity.statistics;
import com.aaa.Service.AreaService;
import com.aaa.Service.CommoditTypeTableService;
import com.aaa.Service.CommodityService;
import com.aaa.Service.DepartmentTableService;
import com.aaa.Service.FinancialRecordsService;
import com.aaa.Service.OpenListService;
import com.aaa.Service.PetService;
import com.aaa.Service.PetUserService;
import com.aaa.Service.RegistrationFormService;
import com.aaa.Service.RoleTableService;
import com.aaa.Service.StaffTableService;
import com.aaa.pager.Pager;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
/**
 * 这里是后台的Controller
 * @author Administrator
 * 
 * 请不要把前台跟后台的Controller搞混，
 * 记得备注名字嫩个功能谁打的要注释名字，格式全部跟第一个方法(EmployeeLogin上的注释)一样，谢谢合作
 */
@Controller
public class BackstageController {
	@Autowired
	private PetUserService pet;

	@Autowired
	private StaffTableService staf;
	
	@Autowired
	private PetService pets;
	
	@Autowired
	private DepartmentTableService dts;
	
	@Autowired 
	private RoleTableService rts;
	
	@Autowired
	private CommodityService cc;

	// 商品类型Service
	@Autowired
	private CommoditTypeTableService ct;

	// 地区Service
	@Autowired
	private AreaService areas;
	
	@Autowired
	private RegistrationFormService rfs;
	
	@Autowired
	private OpenListService ols;
	//假数据
	@Autowired
	private FinancialRecordsService  fservice;
	/**
	 * 跳转页面到后台登陆
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/EmployeeLogin")
	public String EmployeeLogin(){
		return "Background/EmployeeLogin";
	}
	/**
	 * 登录并查询出角色的权限
	 * @param model
	 * @param session
	 * @param s
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/employeeloginverification")
	public String employeeloginverification(Model model,HttpSession session,StaffTable s){
		Long count=staf.loginStaffTablecoun(s);
		if(count == 0){
			model.addAttribute("LoginFailure", "0");
			return this.EmployeeLogin();
		}else{
			Long forbidden=staf.loginuforbidden(s);
			if(forbidden == 0){
				model.addAttribute("LoginFailure", "1");
				return this.EmployeeLogin();
			}else{
				List<StaffTable> list=staf.loginStaffTable(s);
				List<PermissionsTable> list1 = staf.StaffTablePermissionsTable(list.get(0).getStafftableno());
				session.setAttribute("Department", list1);
				session.setAttribute("petusers", list.get(0));
				session.setMaxInactiveInterval(-1);
				model.addAttribute("LoginFailure", "2");
				return "Background/iframe";
			}
		}
	}
	/**
	 * 后台注销
	 * @return
	 */
	@RequestMapping("/acancellation")
	public String acancellation(HttpSession session){
		session.invalidate();
		return this.EmployeeLogin();
	}
	/**
	 * 跳转到欢迎登陆后台页面
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/LoginInitializationPage")
	public String LoginInitializationPage(){
		return "Background/LoginInitializationPage";
	}
	/**
	 * 分页查询（挂号表）
	 * @param request
	 * @param model
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/registered")
	public String registered(HttpServletRequest request,Model model,
			@ModelAttribute("likewhere")String likewhere,@ModelAttribute("rstate")String rstate){
		
		Pager<RegistrationForm> pager = new Pager<RegistrationForm>();
		pager.setPagesize(5L);
		String offsetStr = request.getParameter("pager.offset");
		if(offsetStr!=null){
			pager.setOffset(Long.valueOf(offsetStr));
		}
		if(rstate==null){
			rstate += 0L;
		}
		Pager<RegistrationForm> pm= rfs.listAllRegistrationForm(likewhere,pager,rstate);
		model.addAttribute("pm",pm);
		model.addAttribute("rstate", rstate);
		return "Background/registered";
	}
	/**
	 * 修改状态(挂号表)
	 * @param request
	 * @param model
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/onclickJH")
	public String onclickJH(HttpServletRequest request,Model model,OpenList o,
			@ModelAttribute("registrationformno")Long registrationformno){
		rfs.onclickJH(registrationformno);
		o.setOstate("1");
		ols.svaeOpenList(o);
		model.addAttribute("h", o.getHangsinglenumber());
		return this.registered(request,model,"","0");
	}
	/**
	 * 表单提交事件（挂号表）(后台)
	 * @param r
	 * @param userno
	 * @param model
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/submittoRegistrationFormb")
	public String submittoRegistrationForm(HttpServletRequest request,RegistrationForm r,Long userno,Model model){
		Long aa=rfs.selectcountRegistrationForm(r);
		if(aa>0){
			model.addAttribute("q", 4);
			model.addAttribute("x", 0);
		}else{
			Long a=rfs.submittoRegistrationForm(r,userno);
			model.addAttribute("q", 3);
			model.addAttribute("x", a);
		}
		return this.registered(request, model, null, "0");
	}
	/**跳入挂号界面
	 * 
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/InsertRegistrationForm")
	public String InsertRegistrationForm(Model model){
		List<DepartmentTable> DepartmentTablelist=dts.selectDepartmentTable();
		model.addAttribute("DepartmentTablelist", DepartmentTablelist);
		return "Background/InsertRegistrationForm";
	}
	/**
	 * ajax事件
	 * @param a
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/utelephoneselectajax")
	@ResponseBody
	public List<Pet> utelephoneselectajax(@ModelAttribute("a")String a){
		return pets.utelephoneselectajax(a);
	}
	/**
	 * 进入出单表
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/FillOutTheForm")
	public String FillOutTheForm(HttpServletRequest request,HttpSession session
			,Model model,@ModelAttribute("likewhere")String likewhere){
		StaffTable staff=(StaffTable) session.getAttribute("petusers");
		Pager<OpenList> pager = new Pager<OpenList>();
		pager.setPagesize(5L);
		String offsetStr = request.getParameter("pager.offset");
		if(offsetStr!=null){
			pager.setOffset(Long.valueOf(offsetStr));
		}
		Pager<OpenList> pm= rfs.listAllOpenList(likewhere,pager,staff.getStafftableno());
		model.addAttribute("pm",pm);
		return "Background/FillOutTheForm";
	}
	/**
	 * 
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/FillOutTheForm123")
	public String FillOutTheForm123(Model model,
			@ModelAttribute("openlistno")String openlistno){
		model.addAttribute("ols123", ols.kaidanxingqing123(openlistno));
		model.addAttribute("clist", ols.kaidanxingqing(openlistno));
		return "Background/FillOutTheForm123";
	}
	/**
	 * 出单主页面
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/SingleHomePage")
	public String SingleHomePage(){
		return "Background/SingleHomePage";
	}
	/**
	 * 开始出单
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/Starttheorder")
	public String Starttheorder(HttpSession session,Model model){
		StaffTable s=(StaffTable) session.getAttribute("petusers");
		OpenList o=ols.StarttheorderLoad(s);
		if(o==null){
			model.addAttribute("q", 5);
			return "Background/SingleHomePage";
		}else{
			model.addAttribute("olist", cc.listAll1());
			model.addAttribute("o", o);
			List<TherapeuticDrugs> tt=ols.selectformaa(0L,o.getOpenlistno());
			model.addAttribute("olstt", tt);
			float count = 0;
			for (int i = 0; i < tt.size(); i++) {
				count += Float.valueOf(tt.get(i).getTcommoditys().getCprice()) * tt.get(i).getTnumber();
			}
			Long counbb =ols.selectcountopemlist(o.getOpets().getPetno());
			model.addAttribute("counbb", counbb);
			model.addAttribute("countaa", count);
			return "Background/Starttheorder";
		}
	}
	/**
	 * 加入表单
	 * @param commodityno
	 * @param hangsinglenumber
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/AddFormaaa")
	@ResponseBody
	public List<TherapeuticDrugs> AddFormaaa(@ModelAttribute("a")Long commodityno,
			@ModelAttribute("b")Long hangsinglenumber){
		List<TherapeuticDrugs> tt=ols.AddForm(commodityno,hangsinglenumber);
		return tt;
	}
	/**
	 * 下一个
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/NextClickaa")
	public String NextClickaa(HttpSession session,Model model,@ModelAttribute("openlistno")Long openlistno){
		ols.NextClick(openlistno);
		return this.Starttheorder(session,model);
	}
	/**
	 * 
	 * @param session
	 * @param model
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/submitOpenList")
	public String submitOpenList(HttpSession session,Model model,OpenList o){
		ols.submitOpenList(o);
		return this.Starttheorder(session,model);
	}
	/**
	 * 查询宠物以前的病例
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/chakanyiwangtable")
	@ResponseBody
	public List<OpenList> chakanyiwangtable(@ModelAttribute("petno")String petno){
		List<OpenList> o=ols.OpenListStafftable(petno);
		return o;
	}
	/**
	 * 处方ajax事件
	 * @param wherelike
	 * @param openlist
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("selectopenlistwherelike")
	@ResponseBody
	public List<Commodity> selectopenlistwherelike(
			@ModelAttribute("wherelike")String wherelike,
			@ModelAttribute("openlist") String openlist){
		return cc.listAll222(0L,openlist,wherelike);
	}
	
	
	/**
	 * 分页查询（用户表）
	 * @param request
	 * @param model
	 * @return
	 * 编码人：康宁
	 * 修改人：
	 */
	@RequestMapping("/DisableStartUser")
	public String registereda(HttpServletRequest request,Model model){
		Pager<PetUser> pager = new Pager<PetUser>();
		pager.setPagesize(5L);
		String offsetStr = request.getParameter("pager.offset");
		if(offsetStr!=null){
			pager.setOffset(Long.valueOf(offsetStr));
		}
		Pager<PetUser> pu= pet.QueryUser(pager);
		model.addAttribute("pu",pu);
		return "Background/DisableStartUser";
	}
	/*
	 * 修改用户状态
	 * 康宁
	 * */
	@RequestMapping("/updateuser")
	public String updateuser(Long userno,Long urole){
		pet.updateuser(userno, urole);
		return "redirect:DisableStartUser";
	}
	/**
	 * 
	 * @param model
	 * @param openlistno
	 * @param commodityno
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/reduce")
	@ResponseBody
	public List<TherapeuticDrugs> reduce(Model model,@ModelAttribute("openlistno")Long openlistno,
			@ModelAttribute("commodityno")Long commodityno){
		ols.updatereduce(commodityno);
		return ols.selectformaa(0L,openlistno);
	}
	/**
	 * 进入取药页面
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/Getthemedicine")
	public String Getthemedicine(HttpServletRequest request,Model model
			,@ModelAttribute("likewhere")String likewhere){
		Pager<PetUser> pager = new Pager<PetUser>();
		pager.setPagesize(5L);
		String offsetStr = request.getParameter("pager.offset");
		if(offsetStr!=null){
			pager.setOffset(Long.valueOf(offsetStr));
		}
		Pager<PetUser> pu= pet.QueryOpenList(pager,likewhere);
		model.addAttribute("pm",pu);
		return "Background/Getthemedicine";
	}
	/**取药
	 * 王金格
	 */
	@RequestMapping("/Getthemedicinee")
	public String Getthemedicinee(HttpServletRequest request,Model model
			,@ModelAttribute("likewhere")String likewhere){
		Pager<PetUser> pager = new Pager<PetUser>();
		pager.setPagesize(5L);
		String offsetStr = request.getParameter("pager.offset");
		if(offsetStr!=null){
			pager.setOffset(Long.valueOf(offsetStr));
		}
		Pager<PetUser> pu= pet.QueryOpenStaList(pager, likewhere);
		model.addAttribute("pm",pu);
		return "Background/Getthemedicinee";
	}	
	/**
	 * 王金格
	 */
	@RequestMapping("/Getthemedicineee")
	public String Getthemedicineee(HttpServletRequest request,Model model
			,@ModelAttribute("likewhere")String likewhere){
		Pager<PetUser> pager = new Pager<PetUser>();
		pager.setPagesize(5L);
		String offsetStr = request.getParameter("pager.offset");
		if(offsetStr!=null){
			pager.setOffset(Long.valueOf(offsetStr));
		}
		Pager<PetUser> pu= pet.QueryOpenStateList(pager, likewhere);
		model.addAttribute("pm",pu);
		return "Background/Getthemedicineee";
	}	


/**
	 * 点击编号查询商品
	 * @param model
	 * @param openlistno
	 * @return
	 * 编码人： 王金格
	 * 修改人：
	 */
	@RequestMapping("/Commodityselectss")
	public String Commodityselectss(Model model,
			@ModelAttribute("openlistno")Long openlistno){
		model.addAttribute("ols123", ols.kaidanxingqing123(openlistno.toString()));
		List<TherapeuticDrugs> clist=ols.oenlistnowherecommodity(openlistno);
		model.addAttribute("clist", clist);
		return "Background/OpenListCommodityy";
	}
	
	
	
	/**
	 * 点击编号查询商品
	 * @param model
	 * @param openlistno
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/Commodityselect")
	public String Commodityselect(Model model,
			@ModelAttribute("openlistno")Long openlistno){
		model.addAttribute("ols123", ols.kaidanxingqing123(openlistno.toString()));
		List<TherapeuticDrugs> clist=ols.oenlistnowherecommodity(openlistno);
		model.addAttribute("clist", clist);
		return "Background/OpenListCommodity";
	}
	/**
	 * 点击编号查询商品
	 * @param model
	 * @param openlistno
	 * @return
	 * 编码人： 王金格
	 * 修改人：
	 */
	@RequestMapping("/Getthemedicinne")
	public String Getthemedicinne(Model model,
			@ModelAttribute("openlistno")Long openlistno){
		model.addAttribute("ols123", ols.kaidanxingqing123(openlistno.toString()));
		List<TherapeuticDrugs> clist=ols.oenlistnowherecommodity(openlistno);
		model.addAttribute("clist", clist);
		return "Background/Getthemedicinne";
	}
	/**
	 * 点击编号查询商品
	 * @param model
	 * @param openlistno
	 * @return
	 * 编码人： 王金格
	 * 修改人：
	 */
	@RequestMapping("/Getthemedicinnne")
	public String Getthemedicinnne(Model model,
			@ModelAttribute("openlistno")Long openlistno){
		model.addAttribute("ols123", ols.kaidanxingqing123(openlistno.toString()));
		List<TherapeuticDrugs> clist=ols.oenlistnowherecommodity(openlistno);
		model.addAttribute("clist", clist);
		return "Background/Getthemedicinnne";
	}

	/**
	 * 取出药品
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/Getthemedicineaaaa")
	public String Getthemedicineaaaa(HttpServletRequest request,Model model,Long openlistno){
		ols.Getthemedicineaaaa(openlistno);
		return this.Getthemedicine(request, model, null);
	}
	/**
	 * 医疗服务
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/MedicalServices")
	public String MedicalServices(HttpServletRequest request,Model model
			,@ModelAttribute("likewhere")String likewhere){
		Pager<PetUser> pager = new Pager<PetUser>();
		pager.setPagesize(5L);
		String offsetStr = request.getParameter("pager.offset");
		if(offsetStr!=null){
			pager.setOffset(Long.valueOf(offsetStr));
		}
		Pager<PetUser> pu= pet.QueryOpenListwhere1(pager,likewhere);
		model.addAttribute("pm",pu);
		return "Background/MedicalServices";
	}
	/**
	 * 医疗服务
	 * 
	 * @return 编码人：周鹏 修改人：
	 */
	@RequestMapping("/MedicalServicea")
	public String MedicalServicea(HttpServletRequest request, Model model,
			@ModelAttribute("likewhere") String likewhere) {
		Pager<PetUser> pager = new Pager<PetUser>();
		pager.setPagesize(5L);
		String offsetStr = request.getParameter("pager.offset");
		if (offsetStr != null) {
			pager.setOffset(Long.valueOf(offsetStr));
		}
		Pager<PetUser> pu = pet.QueryOpenListwhere1a(pager, likewhere);
		model.addAttribute("pm", pu);
		return "Background/MedicalServicea";
	}

	/**
	 * 医疗服务
	 * 
	 * @return 编码人：周鹏 修改人：
	 */
	@RequestMapping("/MedicalServicew")
	public String MedicalServicew(HttpServletRequest request, Model model,
			@ModelAttribute("likewhere") String likewhere) {
		Pager<PetUser> pager = new Pager<PetUser>();
		pager.setPagesize(5L);
		String offsetStr = request.getParameter("pager.offset");
		if (offsetStr != null) {
			pager.setOffset(Long.valueOf(offsetStr));
		}
		Pager<PetUser> pu = pet.QueryOpenListwhere1w(pager, likewhere);
		model.addAttribute("pm", pu);
		return "Background/MedicalServicew";
	}

	/**
	 * 点击编号查询医疗服务
	 * @return 
	 * 编码人：周鹏 
	 * 修改人：
	 */
	@RequestMapping("/MedicalServicesas")
	public String MedicalServicesas(Model model, String openlistno) {
		model.addAttribute("ols123", ols.kaidanxingqing123(openlistno.toString()));
		List<TherapeuticDrugs> clist = ols
				.oenlistnowherecommoditywhere1(Long.valueOf(openlistno));
		model.addAttribute("clist", clist);
		return "Background/MedicalServicesas";
	}
	/**
	 * 点击编号查询医疗服务
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/MedicalServicesa")
	public String MedicalServicesa(Model model,String openlistno){
		model.addAttribute("ols123", ols.kaidanxingqing123(openlistno.toString()));
		List<TherapeuticDrugs> clist=ols.oenlistnowherecommoditywhere1(Long.valueOf(openlistno));
		model.addAttribute("clist", clist);
		return "Background/MedicalServicesa";
	}
	/**
	 * 点击编号查询医疗服务
	 * 
	 * @return 编码人：周鹏 修改人：
	 */
	@RequestMapping("/MedicalServiceas")
	public String MedicalServiceas(Model model, String openlistno) {
		model.addAttribute("ols123", ols.kaidanxingqing123(openlistno.toString()));
		List<TherapeuticDrugs> clist = ols
				.oenlistnowherecommoditywhere1(Long.valueOf(openlistno));
		model.addAttribute("clist", clist);
		return "Background/MedicalServiceas";
	}

	/**
	 * 点击编号查询医疗服务
	 * 
	 * @return 编码人：周鹏 修改人：
	 */
	@RequestMapping("/MedicalServicews")
	public String MedicalServicews(Model model, String openlistno) {
		model.addAttribute("ols123", ols.kaidanxingqing123(openlistno.toString()));
		List<TherapeuticDrugs> clist = ols
				.oenlistnowherecommoditywhere1(Long.valueOf(openlistno));
		model.addAttribute("clist", clist);
		return "Background/MedicalServicews";
	}
	/**
	 * 进行服务
	 * @param request
	 * @param model
	 * @param openlistno
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/Treatment")
	public String Treatment(HttpServletRequest request,Model model,Long openlistno){
		ols.Treatmentssss(openlistno);
		return this.MedicalServices(request, model, null);
	}
	/**
	 * 进入修改权限的方法
	 * @param model
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/RoleSelection")
	public String RoleSelection(Model model){
		List<RoleTable> rlist=staf.SelectRList();
		model.addAttribute("rlist", rlist);
		return "Background/RoleSelection";
	}
	/**
	 * 根据角色id查询这个角色的权限
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/UpdateRoletableno")
	public String UpdateRoletableno(@ModelAttribute("roletableno")Long roletableno
			,Model model,@ModelAttribute("rname")String rname){
		List<PermissionsTable> slist=staf.SelectRListwhere(roletableno);
		List<PermissionsTable> rlist=staf.SelectRListwhere1();
		
		model.addAttribute("slist", slist);
		
		model.addAttribute("rlist", rlist);
		
		model.addAttribute("roletableno", roletableno);
		model.addAttribute("rname", rname);
		
		return "Background/ModifyPermissions";
	}
	/**
	 * 添加角色
	 * @param r
	 * @param model
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/AddRoleTable")
	public String AddRoleTable(RoleTable r,Model model){
		staf.AddRoleTable(r);
		model.addAttribute("q", 1);
		return this.RoleSelection(model);
	}
	/**
	 * 修改权限
	 * @param model
	 * @param permissionstableno
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/Modifypermissionsa")
	public String Modifypermissionsa(Model model
			,@ModelAttribute("roletableno")Long roletableno
			,@RequestParam("permissionstableno")Long[] permissionstableno){
		staf.Modifypermissionsa(permissionstableno,roletableno);
		model.addAttribute("q", 2);
		return this.RoleSelection(model);
	}
	/**
	 * 进入用户付钱页面
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/UserPays")
	public String UserPays(HttpServletRequest request,Model model,
			@ModelAttribute("likewhere")String likewhere){
		Pager<OpenList> pager = new Pager<OpenList>();
		pager.setPagesize(5L);
		String offsetStr = request.getParameter("pager.offset");
		if(offsetStr!=null){
			pager.setOffset(Long.valueOf(offsetStr));
		}
		Pager<OpenList> pu= staf.selectUserPays(pager,likewhere);
		model.addAttribute("pm",pu);
		return "Background/UserPays";
	}
	/**
	 * 处方详情的ajax事件
	 * @param openlistno
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/kaidanxingqing123")
	@ResponseBody
	public OpenList kaidanxingqing123(String openlistno){
		return ols.kaidanxingqing123(openlistno);
	}
	/**
	 * 进入用户付钱页面
	 * 
	 * @return 编码人：周鹏 修改人：
	 */
	@RequestMapping("/UserPaya")
	public String UserPaya(HttpServletRequest request, Model model,
			@ModelAttribute("likewhere") String likewhere) {
		Pager<OpenList> pager = new Pager<OpenList>();
		pager.setPagesize(5L);
		String offsetStr = request.getParameter("pager.offset");
		if (offsetStr != null) {
			pager.setOffset(Long.valueOf(offsetStr));
		}
		Pager<OpenList> pu = staf.selectUserPaya(pager, likewhere);
		model.addAttribute("pm", pu);
		return "Background/UserPaya";
	}
	/**
	 * 进入用户付钱页面
	 * 
	 * @return 编码人：周鹏 修改人：
	 */
	@RequestMapping("/UserPayw")
	public String UserPayw(HttpServletRequest request, Model model,
			@ModelAttribute("likewhere") String likewhere) {
		Pager<OpenList> pager = new Pager<OpenList>();
		pager.setPagesize(5L);
		String offsetStr = request.getParameter("pager.offset");
		if (offsetStr != null) {
			pager.setOffset(Long.valueOf(offsetStr));
		}
		Pager<OpenList> pu = staf.selectUserPayw(pager, likewhere);
		model.addAttribute("pm", pu);
		return "Background/UserPayw";
	}
	/**
	 * 点击编号查询用户状态
	 * 
	 * @param model
	 * @param openlistno
	 * @return 编码人：孙斌 修改人：
	 */
	@RequestMapping("/Commodityselects")
	public String Commodityselects(Model model,
			@ModelAttribute("openlistno") Long openlistno) {
		model.addAttribute("ols123", ols.kaidanxingqing123(openlistno.toString()));
		List<TherapeuticDrugs> clist = ols.oenlistnowherecommoditys(openlistno);
		model.addAttribute("clist", clist);
		return "Background/OpenListCommoditys";
	}
	/**
	 * 查询这个订单一共需要多少钱
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/HowMuchIsIt")
	@ResponseBody
	public List<TherapeuticDrugs> HowMuchIsIt(@ModelAttribute("a")Long a){
		List<TherapeuticDrugs> tt=ols.selectformaa(0L,a);
		return tt;
	}
	/**
	 * 用户余额付钱
	 * @param request
	 * @param model
	 * @param userno
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/yuefuqian")
	public String yuefuqian(HttpServletRequest request,
			Model model,HttpSession session,
			@ModelAttribute("userno")String userno,
			@ModelAttribute("HowMuchIsIt")String HowMuchIsIt,
			@ModelAttribute("openlistno")String openlistno){
		Long yue=pet.yuefuqiancount(userno,HowMuchIsIt);
		if(yue==0){
			model.addAttribute("q", 7);
		}else{
			pet.yuefuqian(userno,HowMuchIsIt);
			ols.openlistnoyuefuqian(openlistno);
			StaffTable s=(StaffTable) session.getAttribute("petusers");
			fservice.addJumpPayPage(userno,HowMuchIsIt,s.getStafftableno());
			model.addAttribute("q", 8);
		}
		return this.UserPays(request, model, null);
	}
	
	/**
	 * 用户付钱，跳入支付宝付钱页面
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/JumpPayPage")
	public String JumpPayPage(@ModelAttribute("openlistno")String openlistno,
			@ModelAttribute("howmuchisit")String howmuchisit,
			@ModelAttribute("usernoa")String usernoa,Model model,HttpSession session){
		model.addAttribute("howmuchisit", howmuchisit);
		model.addAttribute("openlistno", openlistno);
		model.addAttribute("usernoa", usernoa);
		return "forward:index.jsp";
	}
	/**
	 * 用户完付钱，跳入的页面
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/ReturnToMerchant")
	public String ReturnToMerchant(HttpSession session){
		Long howmuchisit=(Long) session.getAttribute("DDSC");
		fservice.addFinancialStatement(howmuchisit);
		String openlistno = (String) session.getAttribute("openlistno");
		if(openlistno!=null && openlistno!=""){
			ols.updateopenlist(openlistno);
		}else{
			PetUser p=(PetUser) session.getAttribute("petuser");
			fservice.reducebalance(p.getUserno(),howmuchisit);
			PetUser p1=pet.selectpetusersession(p.getUserno());
			session.setAttribute("petuser", p1);
		}
		return "Background/ReturnToMerchant";
	}
	/**
	 * 财务查询
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/FinancialInquiries")
	public String FinancialInquiries(HttpServletRequest request,Model model
			,@ModelAttribute("likewhere")String likewhere){
			Pager<FinancialRecords> pager = new Pager<FinancialRecords>();
			pager.setPagesize(5L);
			String[] ss=likewhere.split("\\?");
			if(ss[0].toString()==""){
				model.addAttribute("likewhere", likewhere);
			}else{
				model.addAttribute("likewhere", ss[0]);
				likewhere=ss[0];
			}
			String offsetStr = request.getParameter("pager.offset");
			if(offsetStr!=null){
				pager.setOffset(Long.valueOf(offsetStr));
			}
			if(ss.length>1){
				String[] ssa=ss[1].split("=");
				pager.setOffset(Long.valueOf(ssa[1]));
			}
			Pager<FinancialRecords> pu= fservice.SelectlimitFinancialRecords(pager,likewhere);
			model.addAttribute("pm",pu);
			Long fservi = fservice.selectFinancialStatementcount();
			model.addAttribute("fservi", fservi);
		return "Background/FinancialInquiries";
	}
	/**
	 * 出单以往病历的查看详情
	 * @param openlistno
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/kaidanxingqing")
	@ResponseBody
	public List<TherapeuticDrugs> kaidanxingqing(String openlistno){
		return ols.kaidanxingqing(openlistno);
	}
	/**
	 * 确认送货
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/ConfirmationOfDelivery")
	public String ConfirmationOfDelivery(Model model, HttpSession session,
			@ModelAttribute("keyword") String keyword,
			HttpServletRequest request) {
		Pager<Delivery> pager = new Pager<Delivery>();
		pager.setPagesize(5L);
		String offsetStr = request.getParameter("pager.offset");
		if (offsetStr != null) {
			pager.setOffset(Long.valueOf(offsetStr));
		}
		Pager<Delivery> pm = pet.listDeliveryqwe(keyword, pager);
		model.addAttribute("pm", pm);
		return "Background/ConfirmationOfDelivery";
	}
	/**
	 * 修改状态确认送货
	 * @param model
	 * @param session
	 * @param request
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/ConfirmationOfDeliveryqwe")
	public String ConfirmationOfDeliveryqwe(Model model,
			HttpSession session,HttpServletRequest request,
			@ModelAttribute("delivery")String delivery){
		pet.ConfirmationOfDeliveryqwe(delivery);
		model.addAttribute("q", 1);
		return this.ConfirmationOfDelivery(model, session, null, request);
	}
	/**
	 * 添加商品
	 * @param commodityno
	 * @param hangsinglenumber
	 * @return
	 * 编码人：康宁
	 */
	@RequestMapping("/AddProducta")
	public String AddProducta(Model model,Commodity comm,@ModelAttribute("merstorephots2")MultipartFile merstorephots2){
        String uuid = UUID.randomUUID().toString();
        String name = "E:/upload/" + uuid;
        try {
			merstorephots2.transferTo(new File(name));
	        comm.setCpicture(uuid);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
        model.addAttribute("q", 1);

		cc.AddProduct(comm);
		return "Background/AddProduct";
	}
	/**
	 * 进入商品添加
	 * @return
	 * 编码人：康宁
	 */
	@RequestMapping("/AddProduct")
	public String AddProduct(Model model){
		List<CommoditTypeTable> l=ct.selcommtype();
		model.addAttribute("sel", l);
		return "Background/AddProduct";
	}
	
	
	/**
	 * 查询商品类型
	 * 编码人：康宁
	 * 修改人:
	 * */
	@RequestMapping("/selcommtype")
		public String selcommtype(Model model){
		List<CommoditTypeTable> l=ct.selcommtype();
		model.addAttribute("sel", l);
			return "Background/AddProduct";
		}
	/*
	 * 
	 * 财务统计
	 * 杨志祥 康宁
	 * */
	
	@RequestMapping("/FinancialStatistics")
	public String FinancialStatistics(Model model,@ModelAttribute("month")Integer month){
		if(month==null||month==0)
		{
			month=new Date().getMonth()+1;
		}
		System.out.println(month);
		ObjectMapper mapper = new ObjectMapper();
		List<statistics> l=fservice.selMoney(month);
		String stajson;
		try {
			stajson = mapper.writeValueAsString(l);
			model.addAttribute("sel", stajson);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "Background/FinancialStatistics";
	}
	
	
	
	/***
	 * 刘欢编写上
	 */
	/*后台用户管理*/
	@RequestMapping("/PetUserManage")
	public String PetUserManage(HttpSession session,HttpServletRequest request, Model model/*,Long puser*/){	
		
		List<Pet> petq = pets.petall();
		model.addAttribute("petss", petq);
		
		/*PetUser puser= (PetUser) session.getAttribute("petuser");*/
		
		Pager<PetUser> pager = new Pager<PetUser>();
		pager.setPagesize(5L);
		String offsetStr = request.getParameter("pager.offset");
		if(offsetStr!=null){
			pager.setOffset(Long.valueOf(offsetStr));
		}
		Pager<PetUser> pu= pet.QueryUser(pager);
		model.addAttribute("pu",pu);
		
		return "Background/PetUserManage";
	}
	//添加宠物

	
	
//添加宠物
		@RequestMapping("/savepets")
			public String savepets(HttpSession session,Pet pets1,@ModelAttribute("pimgs")MultipartFile pimgs){
			String uuid = UUID.randomUUID().toString();
		        String name = "E:/upload/" + uuid;
				try {
					pimgs.transferTo(new File(name));
			        pets1.setPimg(uuid);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				pets.addpet(pets1);
				pet.insertunumberOfPets(pets1.getPusers().getUserno());
				return "redirect:PetUserManage.action";
			
			}



			
		
	//修改宠物
	@RequestMapping("/updpets")
	public String updpets(Pet pet){
		pets.updatepet(pet);
		return "redirect:PetUserManage.action";
	}
	//添加用户
	@RequestMapping("/savepetuser")
	public String savepetuser(PetUser petuser){
		pet.addpetuser(petuser);
		
		return "redirect:PetUserManage.action";
		
	}
	//修改用户
	@RequestMapping("/updpetuser")
	public String updpetuser(PetUser petuser){
		pet.updatepetuser(petuser);
		
		return "redirect:PetUserManage.action";
	}
	//我的宠物
	@RequestMapping("/findbypuser")
	@ResponseBody
	public List<Pet> findbypuser(Long userno,Model model){
		List<Pet> petsss= pets.findbyuserno(userno);
		return petsss;
	}
	
		
		@RequestMapping("/findbyname")
		public String findbyname(HttpServletRequest request,String search,Model model){
			
			Pager<PetUser> pager = new Pager<PetUser>();
			pager.setPagesize(5L);
			String offsetStr = request.getParameter("pager.offset");
			if(offsetStr!=null){
				pager.setOffset(Long.valueOf(offsetStr));
			}
			
			Pager<PetUser> pu = pet.findbyuname(pager, search);
			model.addAttribute("pu", pu);//movices需要跟jsp页面下面的查询字符所对应
			
			return "Background/PetUserManage";
		}
		
		
		
		//验证真实姓名唯一
		//我的宠物
		@RequestMapping("/findbyunamesname")
		@ResponseBody
		public Long findbyunamesname(String unamesname){
			Long aa= pet.findbyunamesname(unamesname);
			return aa;
		}
		
		@RequestMapping("/findByUid")
		@ResponseBody
		public Long findByUid(String uid){
			Long qw= pet.findByUid(uid);
			return qw;
		}
		
		@RequestMapping("/findByPhone")
		@ResponseBody
		public Long findByPhone(String utelephone){
			Long bn= pet.findByPhone(utelephone);
			return bn;
		}
		
		
		
		
		@RequestMapping("/commoditys")
		public String Commoditys(Model model,
				@ModelAttribute("keyword") String keyword,
				HttpServletRequest request) {
			// 查询商品分页
			Pager<Commodity> pagers = new Pager<Commodity>();
			pagers.setPagesize(6L);
			String offsetStr = request.getParameter("pagers.offset");
			if (offsetStr != null) {
				pagers.setOffset(Long.valueOf(offsetStr));
			}
			// 查询商品
			Pager<Commodity> pm = cc.listAllss(keyword, pagers);
			model.addAttribute("pm", pm);

			return "Background/BuyGoods";
		}



		@RequestMapping("/saveDeliverys")
		public String saveDeliverys(
				HttpSession session,
				@ModelAttribute("cprice") String cprice) {

			// 添加总金额
			pet.updateFinancialStatements(Float.valueOf(cprice));

			return "redirect:commoditys";
		}


		
		
		
		
		
		
		
		
		
		/**
		 * 王金格
		 * @param model
		 * @param staffTable
		 * @return
		 */
		@RequestMapping("/StaffTableOperation")
		public String listStaffTable(Model model,@ModelAttribute("keyword")String keyword,HttpServletRequest request){
				Pager<StaffTable> pager = new Pager<StaffTable>();
				pager.setPagesize(5L);
				String offsetStr = request.getParameter("pager.offset");
				if(offsetStr!=null){
					pager.setOffset(Long.valueOf(offsetStr));
				}
				Pager<StaffTable> pm= staf.listStaffTable(keyword, pager);
				model.addAttribute("pm",pm);
			
			return "Background/StaffTableOperation";
		}
		@RequestMapping("/listStaffTable")
		public String StaffTableOperation(Model model,Long stafftableno){
			List<RoleTable> roleTables = rts.listRoleTable();
			model.addAttribute("roleTables",roleTables);
			List<DepartmentTable> departmentTables= dts.selectDepartmentTable();
			model.addAttribute("departmentTables", departmentTables);
			StaffTable staffTable = staf.findById(stafftableno);
			model.addAttribute("staffTable", staffTable);
			return "Background/listStaffTable";
			
		}
		
		@RequestMapping("/saveOrUpdate")
		public String saveOrUpdate(Model model,StaffTable staffTable){
			staf.saveOrUpdateStaffTable(staffTable);
			return "redirect:StaffTableOperation";
			
		}
		
		/*以账号进行查询*/
		@RequestMapping("/findBysname")
		@ResponseBody
	    public void findByStaffTablename(Model model,@ModelAttribute("UserRegistrationval")String sname,HttpServletResponse response)throws IOException{
	    	PrintWriter out = response.getWriter();

	    	List<StaffTable> list  =staf.findBysname(sname);
	    	if(list.size()>0){
	    		out.print("1");

	    	}
	    	else {
				out.print("0");
			}
	    	out.flush();
	    	out.close();
	    }
		

		/*以身份证进行查询*/
		@RequestMapping("/findBysidcard")
	    public void distinctByuid(Model model,@ModelAttribute("RegisteredIdentityCardNumber")String sid,HttpServletResponse response)throws IOException{
	    	PrintWriter out = response.getWriter();
	    	
	    	List<StaffTable> list  =staf.findBysid(sid);
	    	if(list.size()>0){
	    		out.print("1");
	    	}
	    	else {
				out.print("0");
			}
	    	out.flush();
	    	out.close();
		}
		
		@RequestMapping("/findStaffSrole")
		public String  StaffSrole(Model  model,Long srole,Long stafftableno){
			staf.StaffSrole( srole,stafftableno);
			return "redirect:StaffTableOperation";
			 
			
		}
}