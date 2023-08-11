package com.spring.proj.controller.buy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.proj.dao.buy.BuyDAOMybatis;
import com.spring.proj.domain.basket.BasketVO;
import com.spring.proj.domain.buy.BuyToVO;
import com.spring.proj.domain.buy.BuyVO;
import com.spring.proj.domain.product.ProductVO;
import com.spring.proj.domain.user.UserMemberVO;
import com.spring.proj.service.basket.BasketService;
import com.spring.proj.service.buy.BuyService;
import com.spring.proj.service.product.ProductService;
import com.spring.proj.service.user.UserMemberService;

@Controller
@SessionAttributes("buy")
public class BuyController{
	@Autowired
	ProductService productService;
	
	@Autowired
	BuyService buyService;
	
	@Autowired
	UserMemberService userService;
	
	@Autowired
	private BuyDAOMybatis dao;
	
	@Autowired
	BasketService basketService;
	
	

	
	@RequestMapping(value="/getBuy.sj")
	public String getBuy(ProductVO product, BasketVO basket, BuyToVO buyvo, String um_no, BuyVO buy,UserMemberVO user, Model model,Model model2,Model model3,Model model4,Model model5){
		
		
		
		
		System.out.println("um_no"+um_no);
		
		System.out.println("p_pno = "+product.getP_pno());
		
		user = userService.getService(um_no);
		
		int no = Integer.parseInt(um_no);
		
		
		
		
		
		
		if(product.getP_pno()==null||(product.getP_pno()).equals(null)|| (product.getP_pno()).equals("")) {
			
			System.out.println("p_pno = null");
			System.out.println(no);
		List<BasketVO> list = basketService.getService(no);
		model2.addAttribute("basketList", list);
		System.out.println("==> orderBuy() 호출"+"model"+ model2);
					
			
		}else {
		
		
		System.out.println("p_pno not null");
		
		int p_pno = Integer.parseInt(product.getP_pno());
	
		System.out.println("p_pno="+p_pno);
		
		
		BuyVO vo = buyService.getService(p_pno);
		
		product = productService.getProductService(product.getP_pno());
		
		model.addAttribute("buy", vo);
		model4.addAttribute("product", product);
		model5.addAttribute("basket", basket);
		System.out.println(product);
		System.out.println("1번"+vo);
		}
		
			 
	System.out.println(user);
		
		
		model2.addAttribute("user", user);
		
		
	
		return "buy/getBuy1";
	}

	
	@GetMapping(value="/gotoMain.do")
	public String main() {
		return "toMain.do";
	}
	


}
