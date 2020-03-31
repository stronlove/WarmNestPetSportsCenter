package com.aaa.Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aaa.Entity.Area;
import com.aaa.Entity.CommoditTypeTable;
import com.aaa.Entity.Commodity;
import com.aaa.Entity.Delivery;
import com.aaa.Entity.DepartmentTable;
import com.aaa.Entity.FinancialRecords;
import com.aaa.Entity.Pet;
import com.aaa.Entity.PetUser;
import com.aaa.Entity.RegistrationForm;
import com.aaa.Entity.StaffTable;
import com.aaa.Service.AreaService;
import com.aaa.Service.CommoditTypeTableService;
import com.aaa.Service.CommodityService;
import com.aaa.Service.DepartmentTableService;
import com.aaa.Service.FinancialRecordsService;
import com.aaa.Service.OpenListService;
import com.aaa.Service.PetService;
import com.aaa.Service.PetUserService;
import com.aaa.Service.RegistrationFormService;
import com.aaa.Service.StaffTableService;
import com.aaa.pager.Pager;

/**
 * 这里是前台的Controller
 * @author Administrator
 * 
 * 请不要把前台跟后台的Controller搞混，
 * 记得备注名字嫩个功能谁打的要注释名字，格式全部跟第一个方法(list上的注释)一样，谢谢合作
 */
@Controller
public class MyController {
	@Autowired
	private PetUserService pet;

	@Autowired
	private StaffTableService staf;
	
	@Autowired
	private PetService pets;
	
	@Autowired
	private OpenListService ols;
	//假数据
	@Autowired
	private FinancialRecordsService  fservice;
	
	@Autowired
	private DepartmentTableService dts;
	
	@Autowired
	private RegistrationFormService rfs;
	// 商品Service
	@Autowired
	private CommodityService cc;

	// 商品类型Service
	@Autowired
	private CommoditTypeTableService ct;

	// 地区Service
	@Autowired
	private AreaService areas;

	//孙斌写的上
	/**
	 * 跳转到首页
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/list")
	public String list(){
		return "HomePage";
	}
	/**
	 * 前台登录/没什么好解释的
	 * @param model
	 * @param session
	 * @param p
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/loginUser")
	public String loginUser(Model model,HttpSession session,PetUser p){
		Long count=pet.loginusercoun(p);
		if(count == 0){
			model.addAttribute("ceshiq", "0");
			return "UserLogin";
		}else{
			Long forbidden=pet.loginuforbidden(p);
			if(forbidden == 0){
				model.addAttribute("ceshiq", "1");
				return "UserLogin";
			}else{
				List<PetUser> list=pet.loginuser(p);
				session.setAttribute("petuser", list.get(0));
				session.setMaxInactiveInterval(-1);
				model.addAttribute("ceshiq", "2");
				return "HomePage";
			}
		}
	}
	/**
	 * 注销功能
	 * @param session
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/userlogout")
	public String userlogout(HttpSession session){
		session.invalidate();
		return this.list();
	}
	/**
	 * 跳转到预约登录页面
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/HAAWAD")
	public String HAAWAD(Model model,HttpSession session){
		PetUser petuser=(PetUser) session.getAttribute("petuser");
		List<Pet> petlist = pets.petwhere(petuser);
		List<DepartmentTable> DepartmentTablelist=dts.selectDepartmentTable();
		model.addAttribute("petlist", petlist);
		model.addAttribute("DepartmentTablelist", DepartmentTablelist);
		return "HAAWAD";
	}
	/**
	 * 级联菜单预约挂号选择科室的ajax
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/AjaxHAAWAD")
	@ResponseBody
	public List<StaffTable> AjaxHAAWAD(Long a){
		return staf.StaffTableAjaxSelect(a);
	}
	/**
	 * 级联菜单预约挂号选择医生的ajax 实现功能:显示出来排在第几位
	 * @return
	 * 编码人：孙斌
	 * 修改人：
	 */
	@RequestMapping("/AjaxHAAWADTO")
	@ResponseBody
	public Long AjaxHAAWADTO(Long a){
		Long ab=rfs.AjaxHAAWADTO(a)+1L;
		return ab;
	}
	/**
	 * 表单提交事件（挂号表）
	 * @param r
	 * @param userno
	 * @param model
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/submittoRegistrationForm")
	public String submittoRegistrationForm(RegistrationForm r,
			@ModelAttribute("userno")Long userno
			,@ModelAttribute("stat")Long stat
			,Model model
			,HttpSession session){
		Long aa=rfs.selectcountRegistrationForm(r);
		if(aa>0){
			model.addAttribute("q", 4);
			model.addAttribute("x", 0);
		}else{
			Long a=rfs.submittoRegistrationForm(r,userno);
			model.addAttribute("q", 3);
			model.addAttribute("x", a);
		}
		if(stat != 1){
			return "Background/InsertRegistrationForm";
		}else{
			return this.HAAWAD(model, session);
		}
	}
	/**
	 * 跳入前台余额充值
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/BalanceRecharge")
	public String BalanceRecharge(@ModelAttribute("userno")String userno){
		return "forward:index.jsp";
	}
	/**
	 * 返回个人中心
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/BackToPreviousPage")
	public String BackToPreviousPage(Model model,HttpSession session,HttpServletRequest request){
		return this.personal(session, model, request);
	}
	/**
	 * 
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/alipayaabb")
	public String alipayaabb(Model model,HttpSession session,
			@ModelAttribute("petusersnoyes")String petusersnoyes,
			@ModelAttribute("openlistno")String openlistno,
			@ModelAttribute("usernoa")String usernoa,
			@ModelAttribute("WIDout_trade_no")String WIDout_trade_no,
			@ModelAttribute("WIDsubject")String WIDsubject,
			@ModelAttribute("WIDtotal_amount")String WIDtotal_amount,
			@ModelAttribute("WIDbody")String WIDbody){
		if(petusersnoyes == "0" || petusersnoyes.equals("0")){
			StaffTable s=(StaffTable) session.getAttribute("petusers");
			Long ddsc=fservice.addJumpPayPage(usernoa,WIDtotal_amount,s.getStafftableno());
			session.setAttribute("openlistno", openlistno);
			session.setAttribute("DDSC", ddsc);
		}else{
			PetUser p=(PetUser) session.getAttribute("petuser");
			Long ddsc=fservice.qianJumpPayPage(p.getUserno().toString(),WIDtotal_amount,1L);
			session.setAttribute("DDSC", ddsc);
		}
		model.addAttribute("WIDout_trade_no", WIDout_trade_no);
		model.addAttribute("WIDsubject", WIDsubject);
		model.addAttribute("WIDtotal_amount", WIDtotal_amount);
		model.addAttribute("WIDbody", WIDbody);
		return "forward:alipay.trade.page.pay.jsp";
	}
	/**
	 * 
	 * @param userno
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/tdananLoad")
	@ResponseBody
	public String tdananLoad(String userno){
		return pet.selecttdananLoad(userno);
	}
	/**
	 * 用户确认送到
	 * @param model
	 * @param session
	 * @param request
	 * @param userno
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/Deliveredaaa")
	public String Deliveredaaa(Model model,HttpSession session,
			HttpServletRequest request,@ModelAttribute("userno")String userno
			,@ModelAttribute("delivery")String delivery){
		cc.Deliveredaaa(userno,delivery);
		model.addAttribute("q", 4);
		return this.listDelivery(model, session, null, request);
	}
	/**
	 * 登录页面
	 * @return
	 * 编码人：孙斌
	 * 修改人：孙斌
	 */
	@RequestMapping("/UserLogin")
	public String UserLogin(){
		return "UserLogin";
	}
	//孙斌写的下
	
	//刘欢写的上
		/**
		 * 余额充值
		 */
		//个人中心
		@RequestMapping("/personal")
		public String personal(HttpSession session,Model model,HttpServletRequest request){
			List<Pet> petz = pets.petall();
			model.addAttribute("pets", petz);
			PetUser user= (PetUser) session.getAttribute("petuser");
			
			Pager<Pet> pager = new Pager<Pet>();
			pager.setPagesize(5L);
			String offsetStr = request.getParameter("pager.offset");
			if(offsetStr!=null){
				pager.setOffset(Long.valueOf(offsetStr));
			}
			Pager<Pet> pu= pets.QueryPet(pager,user.getUserno());
			model.addAttribute("petzz",pu);
			
			
			PetUser petuser = pet.findByPetUserno(user.getUserno());
			model.addAttribute("petuser", petuser);
			return "PersonalCentre";
		}
		/***
		 * 余额充值
		 * @param pye
		 * @return
		 * 编码人：刘欢
		 * 修改人：孙斌
		 */
		/*@RequestMapping("/updatebalance")
		public String updatebalance(int pye){
			pet.updatepetuserbybalance(pye);
			return "updatebalance";
		}*/
		
		/**
		 * 查询出要修改的数据
		 * @param model
		 * @param petno
		 * @return
		 * 编码人：刘欢
		 * 修改人：孙斌
		 */
		@RequestMapping("/selectpet")
		public String selectpet(Model model,Long petno){
			Pet petz = pets.findByPetno(petno);
			model.addAttribute("pets", petz);
			return "updatepet";
		}
		
		//添加宠物
		/**
		 * 
		 * @param pet
		 * @return
		 * 编码人：刘欢
		 * 修改人：孙斌
		 */
		
		@RequestMapping("/savepet")
		public String savepet(HttpSession session,HttpServletRequest request,Pet petss, Model model,@ModelAttribute("pimgs")MultipartFile pimgs){
			String uuid = UUID.randomUUID().toString();
	        String name = "E:/upload/" + uuid;
			try {
				pimgs.transferTo(new File(name));
		        petss.setPimg(uuid);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			pets.addpet(petss);
			pet.insertunumberOfPets(petss.getPusers().getUserno());
			PetUser pu=(PetUser) session.getAttribute("petuser");
			return this.personal(session, model, request);
		}
		
		
		/**
		 * 
		 * @param pet
		 * @return
		 * 编码人：刘欢
		 * 修改人：孙斌
		 */
		@RequestMapping("/updpet")
		public String updpet(HttpSession session,Pet pet){
			pets.updatepet(pet);
			/*PetUser p= (PetUser) session.getAttribute("petuser");
			return this.personal(session, null, null);*/
			return "redirect:personal.action";
		}
		
		//刘欢写的下
	//王金格写的上

	/*用户添加*/
	@RequestMapping("/toadd")
	public String  toadd(){
		return "zhucePetUser";
	}
	@RequestMapping("/zhucePetUser")
	public String save(PetUser p ,Model model){
		pet.saveuser(p);
		model.addAttribute("ceshiq", 3);
		return "HomePage";
		
	}
	/*以账号进行查询*/
	@RequestMapping("/findByname")
    public void findBypetname(Model model,@ModelAttribute("UserRegistrationval")String uname,HttpServletResponse response)throws IOException{
    	PrintWriter out = response.getWriter();

    	List<PetUser> list  =pet.findBypetname(uname);
    	if(list.size()>0){
    		out.print("1");

    	}
    	else {
			out.print("0");
		}
    	out.flush();
    	out.close();
    }
	
	/*以手机号进行查询*/
	@RequestMapping("/findByphone")
    public void findByutelephone(Model model,@ModelAttribute("PhoneNumber")String utelephone,HttpServletResponse response)throws IOException{
    	PrintWriter out = response.getWriter();
		List<PetUser> list  =pet.findByutelephone(utelephone);
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
	@RequestMapping("/findByuid")
    public void distinctByuid(Model model,@ModelAttribute("RegisteredIdentityCardNumber")String uid,HttpServletResponse response)throws IOException{
    	PrintWriter out = response.getWriter();
    	
    	List<PetUser> list  =pet.findByuid(uid);
    	if(list.size()>0){
    		out.print("1");
    	}
    	else {
			out.print("0");
		}
    	out.flush();
    	out.close();
	}

	//王金格写的下
	//周鹏写的上

	// 查询商品，商品类型，地区
		@RequestMapping("/commodity")
		public String Commodity(Model model,
				@ModelAttribute("keyword") String keyword,
				HttpServletRequest request) {
			// 查询商品分页
			Pager<Commodity> pager = new Pager<Commodity>();
			pager.setPagesize(8L);
			String offsetStr = request.getParameter("pager.offset");
			if (offsetStr != null) {
				pager.setOffset(Long.valueOf(offsetStr));
			}
			// 查询商品
			Pager<Commodity> pm = cc.listAlls(keyword, pager);
			model.addAttribute("pm", pm);
			// 查询商品类型
			List<CommoditTypeTable> lists = ct.listAll();
			model.addAttribute("lists", lists);
			// 查询地区
			List<Area> area = areas.listAll();
			model.addAttribute("area", area);
			return "addproduct";
		}

		// 送货订单跳转路径
		@RequestMapping("/aDelivery")
		public String aDelivery(Model model, String keyword,
				HttpServletRequest request, Integer commodityno) {
			return "Deliver";
		}

		// 添加送货商品
		@RequestMapping("/saveDelivery")
		public String saveDelivery(Model model, HttpServletRequest request,
				HttpSession session, @ModelAttribute("keyword") String keyword,
				@ModelAttribute("dnumber") Integer dnumber, Delivery d,
				@ModelAttribute("commodityno") String commodityno, String userno,
				@ModelAttribute("cprice") String cprice, Commodity ca,
				@ModelAttribute("financialstatementno") String financialstatementno) {
			// 获取购买库存
			cc.updatednumber(d.getDnumber(), d, commodityno);
			Commodity dcommodity = new Commodity();
			dcommodity.setCommodityno(Integer.valueOf(commodityno));
			d.setDcommodity(dcommodity);
			// 获取购买余额
			pet.updateubalance(cprice, ca, userno);
			PetUser dpetuser = new PetUser();
			dpetuser.setUserno(Long.valueOf(userno));
			d.setDpetuser(dpetuser);
			// 添加商品
			pet.addDelivery(d);
			FinancialRecords f = new FinancialRecords();
			PetUser p1 = new PetUser();
			p1.setUserno(Long.valueOf(userno));
			f.setFuser(p1);
			// 添加金额记录
			pet.addFinancialRecords(f, cprice);
			PetUser p = (PetUser) session.getAttribute("petuser");
			List<PetUser> list = pet.loginuser(p);
			session.setAttribute("petuser", list.get(0));
			// 添加总金额
			pet.updateFinancialStatement(cprice, financialstatementno, ca);
			return this.listDelivery(model, session, keyword, request);
		}

		// 查看送货商品订单
		@RequestMapping("/listDelivery")
		public String listDelivery(Model model, HttpSession session,
				@ModelAttribute("keyword") String keyword,
				HttpServletRequest request) {
			// 查询商品订单分页
			PetUser u = (PetUser) session.getAttribute("petuser");

			Pager<Delivery> pager = new Pager<Delivery>();
			pager.setPagesize(5L);
			String offsetStr = request.getParameter("pager.offset");
			if (offsetStr != null) {
				pager.setOffset(Long.valueOf(offsetStr));
			}
			// 查询订单
			Pager<Delivery> pm = pet.listDelivery(u.getUserno(), keyword, pager);
			model.addAttribute("pm", pm);
			return "Deliver";
		}
			//模糊查询
		@RequestMapping("/findBycf")
		public String findBycf(HttpServletRequest request,
		@ModelAttribute("search") String search, Model model) {

		Pager<Commodity> pager = new Pager<Commodity>();
		pager.setPagesize(5L);
		String offsetStr = request.getParameter("pager.offset");
		if (offsetStr != null) {
			pager.setOffset(Long.valueOf(offsetStr));
		}

		Pager<Commodity> pu = cc.findBycf(pager, search);
		model.addAttribute("pm", pu);// movices需要跟jsp页面下面的查询字符所对应

		return "addproduct";
	}
	//周鹏写的下
	//康宁写的上
	/**康宁
	 * 挂号查询
	 * @param userno
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/RegisteredQuery")
	public String registered(Long userno,HttpServletRequest request,Model model){
		
		Pager<RegistrationForm> pager = new Pager<RegistrationForm>();
		pager.setPagesize(5L);
		String offsetStr = request.getParameter("pager.offset");
		if(offsetStr!=null){
			pager.setOffset(Long.valueOf(offsetStr));
		}
		Pager<RegistrationForm> pm= rfs.RegisteredQuery(userno,pager);
		model.addAttribute("pm",pm);
		return "RegisteredQuery";
	}
	//康宁写的下
}